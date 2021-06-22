package com.example.tinder;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.embedding.engine.FlutterEngine;
import android.content.Intent;
public class MainActivity extends FlutterActivity {

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);

    //     GeneratedPluginRegistrant.registerWith(this.getFlutterEngine());
    // }

      private  Intent forService;
    // private Intent forService = new Intent(this, DisplayMessageActivity.class);
@Override
public void onCreate( Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
}

}
