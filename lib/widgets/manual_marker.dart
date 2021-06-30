part of 'widgets.dart';

class ManualMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.manualSelection) {
          return _BuildManualMarker();
        }
        return Container();
      },
    );
  }
}

class _BuildManualMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Back button
        Positioned(
          child: FadeInLeft(
            duration: Duration(milliseconds: 200),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    context.read<SearchBloc>().add(OnManualMarkerDeactivated());
                  }),
            ),
          ),
          top: 70,
          left: 20,
        ),
        // Marker
        Center(
          child: Transform.translate(
            offset: Offset(0, -14),
            child: BounceInDown(
              child: Icon(
                Icons.location_on,
                size: 50,
              ),
            ),
          ),
        ),

        // Confirm destination
        Positioned(
            bottom: 50,
            left: 40,
            child: FadeIn(
              child: MaterialButton(
                onPressed: () {},
                minWidth: size.width - 140,
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0,
                splashColor: Colors.transparent,
                highlightElevation: 0,
                color: Colors.black87,
                shape: StadiumBorder(),
              ),
            ))
      ],
    );
  }
}
