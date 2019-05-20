package com.example.cabin;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.firebase.analytics.FirebaseAnalytics;

public class MainActivity extends AppCompatActivity {
    EditText e1;
    EditText e2;
    Button b4;
    static int shower=0;
    DataBaseHelper myDB;
    static String USER="username";
    static String PASS="password";
    final static String FILE="cabin_file";
    private FirebaseAnalytics mFirebaseAnalytics;
    Button b1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        final SharedPreferences sp=getSharedPreferences(FILE, Context.MODE_PRIVATE);
        final SharedPreferences.Editor ed=sp.edit();
        if(sp.getBoolean("shower",false)) startActivity(new Intent(this,Main2Activity.class));
        setContentView(R.layout.activity_main);

        mFirebaseAnalytics = FirebaseAnalytics.getInstance(this);
        e1= findViewById(R.id.f1);
        e2= findViewById(R.id.f2);
        b4=findViewById(R.id.b4);
        if(!sp.getBoolean("shower",false)) {
            b4.setBackgroundColor(Color.GREEN);
            b4.setText("LOGIN");
        }
        else{
            b4.setBackgroundColor(Color.RED);
            b4.setText("LOGOUT");
        }
        b4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(!sp.getBoolean("shower",false) && e1.getText().toString().equals(USER) && e2.getText().toString().equals(PASS)){
                    b4.setBackgroundColor(Color.RED);
                    b4.setText("LOGOUT");
                    ed.putBoolean("shower",true);
                    ed.commit();
                    //startService(new Intent(getApplicationContext(),MyService.class));
                    startActivity(new Intent(getApplicationContext(),Main2Activity.class));
                }
                else{
                    b4.setBackgroundColor(Color.GREEN);
                    b4.setText("LOGIN");
                    ed.remove("shower");
                    ed.commit();
                    //stopService(new Intent(getApplicationContext(),MyService.class));
                    //finish();
                }


            }
        });
    }

}
