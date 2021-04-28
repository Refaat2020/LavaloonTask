
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/ui/widgets/loading_widget.dart';


class SecondStoryInfo extends StatefulWidget {

  String projectId;
  String clintId;


  SecondStoryInfo({ this.projectId, this.clintId});

  @override
  _SecondStoryInfoState createState() => _SecondStoryInfoState();
}

class _SecondStoryInfoState extends State<SecondStoryInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProjectsCubit>().projectDetails(widget.projectId,context);
  }


  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<ProjectsCubit, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectsLoading) {
                return LoadingWidget();
              } else if (state is ProjectsFetched || state is ClientFetched) {
                if (fetchClient.client.isNotEmpty) {
                  return Column(
                    children: [
                      Text("project name :${fetchProject.project['data']['name']}"),
                      Text("client name :${fetchClient.client['data']['name']}"),
                      // Text("description :${fetchTime.time['data']['description']}"),
                      // Text("duration  :${fetchTime.time['data']['duration']} H"),
                      // Text("Start  :${fetchTime.time['data']['start'].toString().substring(0,10)}"),
                      // Text("Stop  :${fetchTime.time['data']['stop'].toString().substring(0,10)}"),
                      Text("createdAt  :${fetchProject
                          .project['data']['created_at'].toString().substring(0,10)}"),


                    ],
                  );
                }
                return Column(
                  children: [
                    Text("project name :${fetchProject.project['data']['name']}"),

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
