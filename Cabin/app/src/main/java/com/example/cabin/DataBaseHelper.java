package com.example.cabin;

import android.database.Cursor;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase;
import android.content.ContentValues;
import android.content.Context;

import java.sql.SQLInput;


public class DataBaseHelper extends SQLiteOpenHelper {
    public static final String DB_NAME="Student.db";
    public static final String TABLE_NAME="Student_table";
    public static final String COL_1="USER";
    public static final String COL_2="PASS";
    public static final String USERNAME="username";
    public static final String PASSWORD="password";
    public static final String COMP="COMP";
    public static final String STATUS="STATUS";
    public static final String TABLE2="component_table";
    public DataBaseHelper(Context context){
        super(context,DB_NAME,null,1);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        sqLiteDatabase.execSQL("CREATE TABLE "+TABLE_NAME+" (USER TEXT PRIMARY KEY,PASS TEXT )");
        sqLiteDatabase.execSQL("CREATE TABLE "+TABLE2+" (COMP TEXT PRIMARY KEY,STATUS INTEGER )");
        sqLiteDatabase.execSQL("CREATE TABLE FIRST (USER TEXT PRIMARY KEY,PER INTEGER)");

    }
    public void insertData(){
        delete();
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues cv=new ContentValues();
        cv.put(COL_1,USERNAME);
        cv.put(COL_2,PASSWORD);
        db.insert(TABLE_NAME,null,cv);
        String st[]={"small1","small2","small3","small4","large1","large2","large3","large4","bulb1","bulb2","bulb3","bulb4","fan1","fan2","wac","cac"};
        for(String i:st){
            cv.put(i,0);
            db.insert(TABLE2,null,cv);
        }
        cv=new ContentValues();
        cv.put("USER","USER");
        cv.put("PER",0);
        db.insert("FIRST",null,cv);
        db.close();
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int i, int i1) {
        db.execSQL("DROP TABLE IF EXISTS "+TABLE_NAME);
    }
    public boolean loginCheck(String s1,String s2){
        SQLiteDatabase db=this.getReadableDatabase();
        Cursor res=db.rawQuery("SELECT * from "+TABLE_NAME,null);
        ContentValues cv=new ContentValues();
        while(res.moveToNext()) {
            if (res.getString(0).equals(s1) && res.getString(1).equals(s2)) {
                cv.put("USER","USER");
                cv.put("PER",0);
                db.update("FIRST",cv,"USER=?",new String[]{"USER"});
                db.close();
                return true;
            }
        }
        db.close();
        return false;
    }
    public void delete(){
        SQLiteDatabase db=this.getWritableDatabase();
        db.execSQL("CREATE TABLE if not exists "+TABLE_NAME+" (USER TEXT PRIMARY KEY,PASS TEXT )");
        db.execSQL("CREATE TABLE if not exists "+TABLE2+" (COMP TEXT PRIMARY KEY,STATUS INTEGER )");
        db.execSQL("delete from "+TABLE_NAME);
        db.execSQL("delete from "+TABLE2);
    }
    public Cursor getState(){
        SQLiteDatabase db=this.getWritableDatabase();
        Cursor cs=db.rawQuery("select * from "+TABLE2,null);
        return cs;
    }
    public void setButton(String f,int c){
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues cv=new ContentValues();
        cv.put(COMP,f);
        cv.put(STATUS,c);
        db.update(TABLE2,cv,"COMP=?",new String[]{COMP});
        db.close();
    }
    public boolean cnCheck(){
        SQLiteDatabase db=this.getWritableDatabase();
        Cursor cs=db.rawQuery("select * from FIRST ",null);
        while(cs.moveToNext()){
            if (cs.getInt(1)==1){
                db.close(); return true;
            }
        }
        db.close();
        return false;
    }
}
