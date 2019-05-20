package com.example.cabin;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.support.annotation.RequiresApi;
import android.widget.Toast;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class MyService extends Service {
    static String s="";
    static int csmall1=0;
    static int csmall2=0;
    static int csmall3=0;
    static int csmall4=0;

    static int clarge1=0;
    static int clarge2=0;
    static int clarge3=0;
    static int clarge4=0;

    static int cbulb1=0;
    static int cbulb2=0;
    static int cbulb3=0;
    static int cbulb4=0;

    static int cfan1=0;
    static int cfan2=0;
    static int cwac=0;
    static int ccac=0;
    public MyService() {
    }
    @Override
    public void onDestroy() {
        MainActivity.shower=0;
        Toast.makeText(this, "Service stopped by user.", Toast.LENGTH_LONG).show();
    }
    @Override
    public void onStart(Intent intent, int startid) {
        MainActivity.shower=1;
        Toast.makeText(this, "Service started by user.", Toast.LENGTH_LONG).show();
        final FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("message");
        myRef.addValueEventListener(new ValueEventListener() {
            @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN)
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                s=dataSnapshot.getValue(String.class);
                /*
                //yahaan se
                Context context=getApplicationContext();
                NotificationManager nm = (NotificationManager)context.getSystemService(NOTIFICATION_SERVICE);
                Notification.Builder builder = new Notification.Builder(context);
                Intent notificationIntent = new Intent(context, MainActivity.class);
                PendingIntent contentIntent = PendingIntent.getActivity(context,0,notificationIntent,0);

                //set
                builder.setContentIntent(contentIntent);
                builder.setSmallIcon(R.drawable.ic_launcher_foreground);
                builder.setContentText("Contents");
                builder.setContentTitle("title");
                builder.setAutoCancel(true);
                builder.setDefaults(Notification.DEFAULT_ALL);

                Notification notification = builder.build();
                nm.notify((int)System.currentTimeMillis(),notification);
                //yahaan tak
                */

            }
            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }
    @Override
    public IBinder onBind(Intent intent) {

        throw new UnsupportedOperationException("Not yet implemented");
    }
}
