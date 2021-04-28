import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/cubits/time_cubit.dart';
import 'package:lavaloon/ui/widgets/loading_widget.dart';


class TimeDetailsScreen extends StatefulWidget {
  String timeId;
  String projectId;
  String clintId;


  TimeDetailsScreen({this.timeId, this.projectId, this.clintId});

  @override
  _TimeDetailsScreenState createState() => _TimeDetailsScreenState();
}

class _TimeDetailsScreenState extends State<TimeDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fetchTime = context.read<TimeCubit>().getTimeDetails(
        context, widget.timeId);
    final fetchProject = context.read<ProjectsCubit>().projectDetails(
        widget.projectId,context);
    final fetchClient = context.read<ClientCubit>().getClientDetails(
        widget.clintId);
  }

  @override
  Widget build(BuildContext context) {
    final fetchTime = context.watch<TimeCubit>();
    final fetchProject = context.watch<ProjectsCubit>();
    final fetchClient = context.watch<ClientCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Toggl",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white60,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          BlocBuilder<ClientCubit, ClientState>(
            builder: (context, state) {
              if (state is ClientLoading) {
                return LoadingWidget();
              } else if (state is ClientFetched) {

                return Column(
                  children: [
                    Text("project name :${fetchProject.project['data']['name']}"),
                    Text("client name :${fetchClient.client['data']['name']}"),
                    Text("description :${fetchTime.time['data']['description']}"),
                    Text("duration  :${fetchTime.time['data']['duration']} H"),
                    Text("Start  :${fetchTime.time['data']['start'].toString().substring(0,10)}"),
                    Text("Stop  :${fetchTime.time['data']['stop'].toString().substring(0,10)}"),
                    Text("createdAt  :${fetchProject
                        .project['data']['created_at'].toString().substring(0,10)}"),


                  ],
                );
              }
             return Container();
            },
          )
        ],
      ),
    );
  }
}
