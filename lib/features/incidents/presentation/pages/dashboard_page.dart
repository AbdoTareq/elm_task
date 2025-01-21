import 'package:elm_task/export.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_bloc.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_event.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_state.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late IncidentsBloc incidentsBloc;
  var list = <IncCount>[];
  List<int> getStatusCounts() {
    return list.map<int>((incident) => incident.count.status).toList();
  }

  @override
  void initState() {
    super.initState();
    incidentsBloc = sl<IncidentsBloc>()..add(GetIncsStatusEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => incidentsBloc,
      child: Scaffold(
        appBar: CustomAppBar(title: context.t.incidents),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SafeArea(
            child: BlocBuilder<IncidentsBloc, IncidentsState>(
              builder: (context, state) {
                if (state is IncsStatusLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (state is IncsStatusError) {
                  return Text(state.message);
                }
                if (state is IncsStatusSuccess) {
                  list = state.incsStatus.incidents;
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        context.t.incidentStatus,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      // Bar Chart
                      Expanded(
                        flex: 2,
                        child: BarChart(
                          BarChartData(
                            barGroups:
                                getStatusCounts().asMap().entries.map((entry) {
                              final index = entry.key;
                              final value = entry.value;
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: value.toDouble(),
                                    color: Colors.blue,
                                    width: 16,
                                  ),
                                ],
                              );
                            }).toList(),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 5,
                                  getTitlesWidget: (value, meta) {
                                    return Text(value.toInt().toString());
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    final index = value.toInt();
                                    if (index < 0 ||
                                        index >= IncidentStatus.values.length) {
                                      return const SizedBox.shrink();
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        IncidentStatus.values[index].name,
                                        style: const TextStyle(fontSize: 8),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Pie Chart
                      Expanded(
                        flex: 2,
                        child: PieChart(
                          PieChartData(
                            sections:
                                getStatusCounts().asMap().entries.map((entry) {
                              final index = entry.key;
                              final value = entry.value;
                              return PieChartSectionData(
                                value: value.toDouble(),
                                title:
                                    "${IncidentStatus.values[index].name}: $value",
                                color: Colors
                                    .primaries[index % Colors.primaries.length],
                                radius: 70,
                                titleStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                ),
                              );
                            }).toList(),
                            sectionsSpace: 2,
                            centerSpaceRadius: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
