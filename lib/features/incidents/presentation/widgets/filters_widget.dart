import 'package:elm_task/export.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_bloc.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_event.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () =>
              context.read<IncidentsBloc>().add(GetAllIncidentsEvent()),
          child: Text(
            context.t.all.toTitleCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.date_range),
          onPressed: () async {
            DateTime? date = await showDatePicker(
              context: context,
              helpText: context.t.startDate,
              firstDate: DateTime.now().subtract(const Duration(days: 3000)),
              lastDate: DateTime.now(),
              initialDate: DateTime(2021, 12, 28),
            );
            if (date != null) {
              context.read<IncidentsBloc>().add(GetIncidentsByDateEvent(date));
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.filter_alt_outlined),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return SingleSelectBottomSheet(
                    title: context.t.changeStatus,
                    choices: IncidentStatus.values
                        .map((e) => e.name.toTitleCase())
                        .toList(),
                    onTap: (index) {
                      context.read<IncidentsBloc>().add(
                          GetIncidentsByStatusEvent(
                              IncidentStatus.values[index]));
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}
