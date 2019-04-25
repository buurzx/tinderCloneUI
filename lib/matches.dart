import 'package:flutter/widgets.dart';
import './profiles.dart';

class MatchEngine extends ChangeNotifier {
  final List<Match> _matches;
  int _currrentMatchIndex;
  int _nextMatchIndex;

  MatchEngine({
    List<Match> matches,
  }) : _matches = matches {
    _currrentMatchIndex = 0;
    _nextMatchIndex = 1;
  }

  Match get currentMatch => _matches[_currrentMatchIndex];
  Match get nextMatch => _matches[_nextMatchIndex];

  void cycleMatch() {
    if (currentMatch.decision != Decision.indecided) {
      currentMatch.reset();
      _currrentMatchIndex = _nextMatchIndex;
      _nextMatchIndex =
          _nextMatchIndex < _matches.length - 1 ? _nextMatchIndex + 1 : 0;
      notifyListeners();
    }
  }
}

class Match extends ChangeNotifier {
  final Profile profile;
  Decision decision = Decision.indecided;

  Match({this.profile});

  void like() {
    if (decision == Decision.indecided) {
      decision = Decision.like;
      notifyListeners();
    }
  }

  void nope() {
    if (decision == Decision.indecided) {
      decision = Decision.nope;
      notifyListeners();
    }
  }

  void superLike() {
    if (decision == Decision.indecided) {
      decision = Decision.superLike;
      notifyListeners();
    }
  }

  void reset() {
    if (decision != Decision.indecided) {
      decision = Decision.indecided;
      notifyListeners();
    }
  }
}

enum Decision {
  indecided,
  nope,
  like,
  superLike,
}
