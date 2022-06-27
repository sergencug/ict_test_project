<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Str;

class KayitController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $car_brands=DB::table('car_brands')->where('status','1')->get();
        $service_repair_types=DB::table('service_repair_types')->where('status','1')->distinct('type_name')->get(['type_name']);
        return view('index',compact('car_brands','service_repair_types'));
    }

    public function get_models(Request $request)
    {
        $car_models=DB::table('car_models')->where('brand_id',$request->car_brand)->where('status','1')->get();
        $options="";
        foreach($car_models as $model){
        $options.='<option value="'.$model->model_id.'" >'.$model->model_name.'</option>';
        }
        return $options;
    }

    public function get_place(Request $request)
    {

        $places=DB::table('service_repair_places')->join('service_repair_types','service_repair_types.place_id','service_repair_places.place_id')->where('type_name',$request->repair_type)->where('service_repair_places.status','1')->orderbY('place_name','asc')->get();
        $options="";
        if($request->date){
        $count=999;
        foreach($places as $place){
        $get_count=DB::table('service_history')->where('service_place',$place->place_id)->where('service_date','LIKE','%'.date("Y-m-d",strtotime($request->date)).'%')->count();
        if($get_count<$count){
        $options.='<option selected value="'.$place->place_id.'" >'.$place->place_name.'</option>';
        $count=$get_count;
        }else{
        $options.='<option value="'.$place->place_id.'" >'.$place->place_name.'</option>';
        }

        }
        }else{
        foreach($places as $place){
        $options.='<option value="'.$place->place_id.'" >'.$place->place_name.'</option>';
        } 
        }


        return $options;
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


    $tarih="$request->date $request->repair_hour";
    $tarih=date("Y-m-d H:i:s",strtotime($tarih));
    
    $customer_name=Str::slug($request->customer_name, ' ');
    $customer_check=DB::table('customers')->where('customer_name_en',$customer_name)->first();
    
    if($customer_check){ 
        $customer_id=$customer_check->customer_id;
    }else{
    $insert_customer=DB::table('customers')->insert([
      'customer_name' => $request->customer_name,
      'customer_name_en' => $customer_name,
    ]);
    $customer_id=DB::getPdo()->lastInsertId();
    }

    $service_repair_type=DB::table('service_repair_types')->where('place_id',$request->repair_place)->where('type_name',$request->repair_type)->first();
    if($service_repair_type){ 
        $repair_type=$service_repair_type->type_id;
    }


    $service_check=DB::table('service_repair_places')->where('place_id',$request->repair_place)->first();
    $service_id=$service_check->service_id;

    $check_appointment=DB::table('service_history')->where('service_place',$request->repair_place)->where('service_date',$tarih)->first();
    if($check_appointment)
    {
        return "Bu Tarihte Servis Doludur.";
    }

    $insert=DB::table('service_history')->insert([
      'customer' => $customer_id,
      'service_id' => $service_id,
      'car_brand' => $request->car_brand,
      'car_model' => $request->car_model,
      'service_place' => $request->repair_place,
      'service_type' => $repair_type,
      'service_date' => $tarih
    ]);
    
    if($insert){
    echo "success";
    }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Http\Response
     */
    public function show(Services $services)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Http\Response
     */
    public function edit(Services $services)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Services $services)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Http\Response
     */
    public function destroy(Services $services)
    {
        //
    }
}
