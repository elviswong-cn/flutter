package com.elvis.flutter.androidhybrid

import android.os.Bundle
import android.support.v4.app.FragmentTransaction
import android.support.v7.app.AppCompatActivity
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btn_flutter_fragment.setOnClickListener {
            var ts: FragmentTransaction = supportFragmentManager.beginTransaction()
            ts.add(R.id.fy_container, Flutter.createFragment("{method:'Flutter createFragment'}"))
            ts.commit()
        }
        btn_flutter_view.setOnClickListener {
            val flutterView = Flutter.createView(this, lifecycle, "{method:'Flutter createView'}")
            fy_container_view.addView(flutterView)
        }
        btn_flutter_remove.setOnClickListener {
            fy_container.removeAllViews()
            fy_container_view.removeAllViews()
        }
    }
}
