import 'package:elm_task/core/view/widgets/custom_list_view_builder.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_bloc.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_event.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_state.dart';
import 'package:elm_task/features/incidents/presentation/widgets/filters_widget.dart';

class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  late IncidentsBloc incidentsBloc;
  var list = <Incident>[];

  @override
  void initState() {
    super.initState();
    incidentsBloc = sl<IncidentsBloc>()..add(GetAllIncidentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => incidentsBloc,
      child: Scaffold(
        appBar: CustomAppBar(title: context.t.incidents),
        floatingActionButton: BlocConsumer<IncidentsBloc, IncidentsState>(
          listener: (context, state) {
            if (state is IncidentsSuccess) {
              list = state.incidentsWrapper.incidents;
            } else if (state is IncidentsCreateError) {
              showFailSnack(message: state.message);
            } else if (state is IncidentsCreateSuccess) {
              showSuccessSnack(message: context.t.success);
            } else if (state is IncidentsStatusChangeError) {
              showFailSnack(message: state.message);
            } else if (state is IncidentsStatusChangeSuccess) {
              Logger().i(state.incident.status);
              showSuccessSnack(message: context.t.success);
            }
          },
          builder: (context, state) {
            return FloatingActionButton(
              child: state is IncidentsCreateLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.add),
              onPressed: () => incidentsBloc.add(CreateIncidentEvent(
                IncidentModel.fromJson({
                  "description": "incident description new",
                  "latitude": 89898989,
                  "longitude": 68888788,
                  "status": 0,
                  "typeId": 24,
                  "priority": null,
                  "issuerId": "af698686-7470-499b-a745-765e89b3c4b4"
                }),
              )),
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SafeArea(
            child: BlocBuilder<IncidentsBloc, IncidentsState>(
              builder: (context, state) {
                if (state is IncidentsLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (state is IncidentsError) {
                  return Text(state.message);
                }
                return CustomListViewBuilder(
                  header: FiltersWidget(),
                  itemCount: list.length,
                  footer: 80.h.heightBox,
                  itemBuilder: (context, index) {
                    final incident = list[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          incident.description,
                          maxLines: 2,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(incident.id.toTitleCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  )),
                        ),
                        trailing: state is IncidentsStatusChangeLoading &&
                                state.id == incident.id
                            ? CircularProgressIndicator()
                            : IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () =>
                                    incidentsBloc.add(ChangeStatusIncidentEvent(
                                  incident.id,
                                  IncidentStatus.completed,
                                )),
                              ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
