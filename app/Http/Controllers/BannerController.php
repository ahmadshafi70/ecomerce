<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Str;
class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banner=Banner::orderBy('id','DESC')->paginate(10);
        return view('backend.banner.index')->with('banners',$banner);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.banner.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {     

        // return $request->all();
        $this->validate($request,[
          
            
            'file'=>'required',
            'file1'=>'required',
          
        ]);
        $f_img_path='';
        $mobile_photo='';
        if($request->hasfile('file')) {

            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                        
        }
        if($request->hasfile('file1')) {

            $mobile_image_name = $request->file('file1')->getClientOriginalName();
            
            $mobile_image_name=str_replace(' ','-',$mobile_image_name);
                    
            $mobile_image_path="assets/feature/";

            $request->file('file1')->move($mobile_image_path,$mobile_image_name);  
                        
            $mobile_photo=$mobile_image_path.$mobile_image_name;
                        
        }
        

        $data=$request->all();
        
        $slug=Str::slug($request->title);
        
        $count=Banner::where('slug',$slug)->count();
        
        if($count>0){
            $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
        }
        $data['photo']=$f_img_path?$f_img_path:'';
        $data['mobile_photo']=$mobile_photo?$mobile_photo:'';
        $data['slug']=$slug;

        // return $slug;
        $status=Banner::create($data);
        
        if($status){
            request()->session()->flash('success','Banner successfully added');
        }
        else{
            request()->session()->flash('error','Error occurred while adding banner');
        }
        return redirect()->route('banner.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $banner=Banner::findOrFail($id);
        return view('backend.banner.edit')->with('banner',$banner);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {   
        
        $banner=Banner::findOrFail($id);

        $this->validate($request,[
            
            'description'=>'string|nullable',
            // 'file'=>'required',
            'status'=>'required|in:active,inactive',
        ]);
        
        $f_img_path='';
        $mobile_photo='';
        if($request->hasfile('file')) {
            
            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                        
        }
        if($request->hasfile('file1')) {

            $mobile_image_name = $request->file('file1')->getClientOriginalName();
            
            $mobile_image_name=str_replace(' ','-',$mobile_image_name);
                    
            $mobile_image_path="assets/feature/";

            $request->file('file1')->move($mobile_image_path,$mobile_image_name);  
                        
            $mobile_photo=$mobile_image_path.$mobile_image_name;
                        
        }
        $data=$request->all();
        // $slug=Str::slug($request->title);
        // $count=Banner::where('slug',$slug)->count();
        // if($count>0){
        //     $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
        // }
        // $data['slug']=$slug;
        // return $slug;
        $banner->photo=$f_img_path?$f_img_path:$banner->photo;
        $banner->mobile_photo=$mobile_photo?$mobile_photo:$banner->mobile_photo;
        $status=$banner->fill($data)->save();
        if($status){
            request()->session()->flash('success','Banner successfully updated');
        }
        else{
            request()->session()->flash('error','Error occurred while updating banner');
        }
        return redirect()->route('banner.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $banner=Banner::findOrFail($id);
        $status=$banner->delete();
        if($status){
            request()->session()->flash('success','Banner successfully deleted');
        }
        else{
            request()->session()->flash('error','Error occurred while deleting banner');
        }
        return redirect()->route('banner.index');
    }
}
