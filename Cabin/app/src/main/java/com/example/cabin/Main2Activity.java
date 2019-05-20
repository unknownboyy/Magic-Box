package com.example.cabin;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.Toast;
import android.Manifest;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import static com.example.cabin.MainActivity.FILE;
import static com.example.cabin.MyService.*;

public class Main2Activity extends AppCompatActivity {

    static Button small1;
    static Button small2;
    static Button small3;
    static Button small4;

    static Button bulb1;
    static Button bulb2;
    static Button bulb3;
    static Button bulb4;

    static Button large1;
    static Button large2;
    static Button large3;
    static Button large4;

    static Button wac;
    static Button cac;

    static Button fan1;
    static Button fan2;



    SeekBar sk;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        setContentView(R.layout.activity_main2);
        small1=findViewById(R.id.small1);small1.setBackgroundColor(Color.RED);
        small2=findViewById(R.id.small2);small2.setBackgroundColor(Color.RED);
        small3=findViewById(R.id.small3);small3.setBackgroundColor(Color.RED);
        small4=findViewById(R.id.small4);small4.setBackgroundColor(Color.RED);

        large1=findViewById(R.id.large1);large1.setBackgroundColor(Color.RED);
        large2=findViewById(R.id.large2);large2.setBackgroundColor(Color.RED);
        large3=findViewById(R.id.large3);large3.setBackgroundColor(Color.RED);
        large4=findViewById(R.id.large4);large4.setBackgroundColor(Color.RED);

        bulb1=findViewById(R.id.bulb1);
        bulb2=findViewById(R.id.bulb2);
        bulb3=findViewById(R.id.bulb3);
        bulb4=findViewById(R.id.bulb4);

        fan1=findViewById(R.id.fan1);fan1.setBackgroundColor(Color.RED);
        fan2=findViewById(R.id.fan2);fan2.setBackgroundColor(Color.RED);

        wac=findViewById(R.id.wac);wac.setBackgroundColor(Color.RED);
        cac=findViewById(R.id.cac);cac.setBackgroundColor(Color.RED);

        sk=findViewById(R.id.seekBar);

        final SharedPreferences sp=getSharedPreferences(FILE,Context.MODE_PRIVATE);
        if(sp.getBoolean("csmall1",false))
        {small1.setBackgroundColor(Color.GREEN); csmall1=1; }
        if(sp.getBoolean("csmall2",false))
        {small2.setBackgroundColor(Color.GREEN); csmall2=1;}
        if(sp.getBoolean("csmall3",false))
        {small3.setBackgroundColor(Color.GREEN); csmall3=1;}
        if(sp.getBoolean("csmall4",false))
        {small4.setBackgroundColor(Color.GREEN); csmall4=1;}
        if(sp.getBoolean("clarge1",false))
        {large1.setBackgroundColor(Color.GREEN); clarge1=1;}
        if(sp.getBoolean("clarge2",false)) {
            large2.setBackgroundColor(Color.GREEN); clarge2=1;
        }
        if(sp.getBoolean("clarge3",false)) {
            large3.setBackgroundColor(Color.GREEN); clarge3=1;
        }
        if(sp.getBoolean("clarge4",false)) {
            large4.setBackgroundColor(Color.GREEN); clarge4=1;
        }
        if(sp.getBoolean("cbulb1",false)) {
            bulb1.setBackgroundResource(R.drawable.round_button2); cbulb1=1;
        }
        if(sp.getBoolean("cbulb2",false)) {
            bulb2.setBackgroundResource(R.drawable.round_button2); cbulb2=1;
        }
        if(sp.getBoolean("cbulb3",false)) {
            bulb3.setBackgroundResource(R.drawable.round_button2); cbulb3=1;
        }
        if(sp.getBoolean("cbulb4",false)) {
            bulb4.setBackgroundResource(R.drawable.round_button2); cbulb4=1;
        }
        if(sp.getBoolean("cfan1",false)) {
            fan1.setBackgroundColor(Color.GREEN); cfan1=1;
        }
        if(sp.getBoolean("cfan2",false)) {
            fan2.setBackgroundColor(Color.GREEN); cfan2=1;
        }
        /*
        if(sp.getBoolean("ccac",false)) {
            wac.setBackgroundColor(Color.GREEN); cwac=1;
        }
        if(sp.getBoolean("cwac",false)) {
            cac.setBackgroundColor(Color.GREEN); ccac=1;
        }
        */

        wac.setBackgroundColor(Color.GRAY);
        cac.setBackgroundColor(Color.GRAY);
        wac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(Main2Activity.this, "Feature Not Supported Yet!!!", Toast.LENGTH_SHORT).show();
            }
        });
        cac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(Main2Activity.this, "Feature Not Supported Yet!!!", Toast.LENGTH_SHORT).show();
            }
        });


      //  sk.setProgress(sp.getInt("ctemp",0));

        final FirebaseDatabase database=FirebaseDatabase.getInstance();
        final SharedPreferences.Editor ed=sp.edit();

        /*
        sk.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean b) {
                DatabaseReference myRef=database.getReference("temp");
                myRef.setValue(18+2*i);
                ed.putInt("ctemp",18+2*i);
                ed.commit();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        */

        sk.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean b) {
                Toast.makeText(Main2Activity.this, "Feature Not Supported Yet!!!", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });
        small1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("small1");
                csmall1=(csmall1+1)%2;
                if(csmall1==0) {
                    myRef.setValue(0);
                    ed.remove("csmall1");
                    ed.commit();
                    small1.setBackgroundColor(Color.RED);
                }
                else{
                    myRef.setValue(1);
                    ed.putBoolean("csmall1",true);
                    ed.commit();
                    small1.setBackgroundColor(Color.GREEN);
                }

            }
        });

        small2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("small2");
                csmall2=(csmall2+1)%2;
                if(csmall2==0) {
                    myRef.setValue(0);
                    ed.remove("csmall2");
                    small2.setBackgroundColor(Color.RED);
                }
                else{
                    myRef.setValue(1);
                    ed.putBoolean("csmall2",true);
                    small2.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        small3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("small3");
                csmall3=(csmall3+1)%2;
                if(csmall3==0) {
                    myRef.setValue(0);
                    ed.remove("csmall3");
                    small3.setBackgroundColor(Color.RED);
                }
                else{
                    myRef.setValue(1);
                    ed.putBoolean("csmall3",true);
                    small3.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        small4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("small4");
                csmall4=(csmall4+1)%2;
                if(csmall4==0) {
                    myRef.setValue(0);
                    ed.remove("csmall4");
                    small4.setBackgroundColor(Color.RED);
                }
                else{
                    myRef.setValue(1);
                    ed.putBoolean("csmall4",true);
                    small4.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        large1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("large1");
                clarge1=(clarge1+1)%2;
                if(clarge1==0) {
                    ed.remove("clarge1");
                    large1.setBackgroundColor(Color.RED);myRef.setValue(0);
                }
                else{
                    ed.putBoolean("clarge1",true);
                    myRef.setValue(1);
                    large1.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        large2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("large2");
                clarge2=(clarge2+1)%2;
                if(clarge2==0) {
                    ed.remove("clarge2");
                    large2.setBackgroundColor(Color.RED);myRef.setValue(0);
                }
                else{
                    ed.putBoolean("clarge2",true);
                    myRef.setValue(1);
                    large2.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        large3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("large3");
                clarge3=(clarge3+1)%2;
                if(clarge3==0) {
                    ed.remove("clarge3");
                    large3.setBackgroundColor(Color.RED);myRef.setValue(0);
                }
                else{
                    ed.putBoolean("clarge3",true);
                    myRef.setValue(1);
                    large3.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        large4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("large4");
                clarge4=(clarge4+1)%2;
                if(clarge4==0) {
                    ed.remove("clarge4");
                    large4.setBackgroundColor(Color.RED);myRef.setValue(0);
                }
                else{
                    ed.putBoolean("clarge4",true);
                    myRef.setValue(1);
                    large4.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        bulb1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("bulb1");
                cbulb1=(cbulb1+1)%2;
                if(cbulb1==0) {
                    ed.remove("cbulb1");
                    myRef.setValue(0);
                    bulb1.setBackgroundResource(R.drawable.round_button);
                }
                else{
                    ed.putBoolean("cbulb1",true);
                    myRef.setValue(1);
                    bulb1.setBackgroundResource(R.drawable.round_button2);
                }
                ed.commit();
            }
        });

        bulb2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("bulb2");
                cbulb2=(cbulb2+1)%2;
                if(cbulb2==0) {
                    ed.remove("cbulb2");
                    myRef.setValue(0);
                    bulb2.setBackgroundResource(R.drawable.round_button);
                }
                else{
                    ed.putBoolean("cbulb2",true);
                   // myDB.setButton("bulb2",1);
                    myRef.setValue(1);
                    bulb2.setBackgroundResource(R.drawable.round_button2);
                }
                ed.commit();
            }
        });

        bulb3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("bulb3");
                cbulb3=(cbulb3+1)%2;
                if(cbulb3==0) {
                  ed.remove("cbulb3");
                    myRef.setValue(0);
                    bulb3.setBackgroundResource(R.drawable.round_button);
                }
                else{
                    ed.putBoolean("cbulb3",true);
                   // myDB.setButton("bulb3",1);
                    myRef.setValue(1);
                    bulb3.setBackgroundResource(R.drawable.round_button2);
                }
                ed.commit();
            }
        });

        bulb4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("bulb4");
                cbulb4=(cbulb4+1)%2;
                if(cbulb4==0) {
                   ed.remove("cbulb4");
                    myRef.setValue(0);
                    bulb4.setBackgroundResource(R.drawable.round_button);
                }
                else{
                    ed.putBoolean("cbulb4",true);
                  //  myDB.setButton("bulb4",1);
                    myRef.setValue(1);
                    bulb4.setBackgroundResource(R.drawable.round_button2);
                }
                ed.commit();
            }
        });

        fan1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("fan1");
                cfan1=(cfan1+1)%2;
                if(cfan1==0) {
                   ed.remove("cfan1");
                    myRef.setValue(0);
                    fan1.setBackgroundColor(Color.RED);
                }
                else{
                    ed.putBoolean("cfan1",true);
                   // myDB.setButton("fan1",1);
                    myRef.setValue(1);
                    fan1.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        fan2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("fan2");
                cfan2=(cfan2+1)%2;
                if(cfan2==0) {
                    ed.remove("cfan2");
                    myRef.setValue(0);
                    fan2.setBackgroundColor(Color.RED);
                }
                else{
                    ed.putBoolean("cfan2",true);
                    myRef.setValue(1);
                    fan2.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        /*

        cac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("cac");
                ccac=(ccac+1)%2;
                if(ccac==0) {
                   ed.remove("ccac");
                    myRef.setValue(0);
                    cac.setBackgroundColor(Color.RED);
                }
                else{
                   ed.putBoolean("ccac",true);
                    myRef.setValue(1);
                    cac.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });


        wac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatabaseReference myRef = database.getReference("wac");
                cwac=(cwac+1)%2;
                if(cwac==0) {
                    ed.remove("cwac");
                    myRef.setValue(0);
                    wac.setBackgroundColor(Color.RED);
                }
                else{
                    ed.putBoolean("cwac",true);
                    myRef.setValue(1);
                    wac.setBackgroundColor(Color.GREEN);
                }
                ed.commit();
            }
        });

        */

    }


}

    // Write a message to the database

