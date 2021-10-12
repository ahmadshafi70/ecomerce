<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Settings;
use App\User;
use App\Rules\MatchOldPassword;
use Hash;
use Carbon\Carbon;
use Spatie\Activitylog\Models\Activity;
class AdminController extends Controller
{
    public function index(){
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
        ->where('created_at', '>', Carbon::today()->subDay(6))
        ->groupBy('day_name','day')
        ->orderBy('day')
        ->get();
     $array[] = ['Name', 'Number'];
     foreach($data as $key => $value)
     {
       $array[++$key] = [$value->day_name, $value->count];
     }
    //  return $data;
     return view('backend.index')->with('users', json_encode($array));
    }

    public function profile(){
        $profile=Auth()->user();
        // return $profile;
        return view('backend.users.profile')->with('profile',$profile);
    }

    public function profileUpdate(Request $request,$id){
        // return $request->all();
               $user=User::findOrFail($id);

        $data=$request->all();
        
        $photo='';
        if($request->hasfile('photo')) {
            
            $feature_image_name = $request->file('photo')->getClientOriginalName();
            
            $feature_image_name=str_replace('','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('photo')->move($feature_image_path,$feature_image_name);  
                        
            $photo=$feature_image_path.$feature_image_name;
                        
        }

        $data['photo']=!empty($photo)?$photo:$user->photo;
        $status=$user->fill($data)->save();

        if($status){
            request()->session()->flash('success','Successfully updated your profile');
        }
        else{
            request()->session()->flash('error','Please try again!');
        }
        return redirect()->back();
    }

    public function settings(){
        $data=Settings::first();
        return view('backend.setting')->with('data',$data);
    }

    public function settingsUpdate(Request $request){
        // return $request->all();
        
        // $this->validate($request,[
        //     'short_des'=>'required|string',
        //     'description'=>'required|string',
        //     'file'=>'required',
        //     'fiel1'=>'required',
        //     'address'=>'required|string',
        //     'email'=>'required|email',
        //     'phone'=>'required|string',
        // ]);
        if($request->hasfile('file')) {
                
            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
            $logo=$feature_image_path.$feature_image_name;
                        
        }
        if($request->hasfile('file1')) {
                
            $feature_image_name = $request->file('file1')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file1')->move($feature_image_path,$feature_image_name);  
            $about_image=$feature_image_path.$feature_image_name;
        }
        


        $data=$request->all();

        // dd($logo,$about_image);
        
        // return $data;
        
        $settings=Settings::first();
        
        // return $settings;

        $settings['logo']=!empty($logo)?$logo:$settings->logo;
        
        $settings['photo']=!empty($about_image)!=''?$about_image:$settings->photo;
        
        $status=$settings->fill($data)->save();
        
        if($status){
            request()->session()->flash('success','Setting successfully updated');
        }
        else{
            request()->session()->flash('error','Please try again');
        }
        return redirect()->route('admin');
    }

    public function changePassword(){
        return view('backend.layouts.changePassword');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ]);
   
        User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);
   
        return redirect()->route('admin')->with('success','Password successfully changed');
    }

    // Pie chart
    public function userPieChart(Request $request){
        // dd($request->all());
        $data = User::select(\DB::raw("COUNT(*) as count"), \DB::raw("DAYNAME(created_at) as day_name"), \DB::raw("DAY(created_at) as day"))
        ->where('created_at', '>', Carbon::today()->subDay(6))
        ->groupBy('day_name','day')
        ->orderBy('day')
        ->get();
     $array[] = ['Name', 'Number'];
     foreach($data as $key => $value)
     {
       $array[++$key] = [$value->day_name, $value->count];
     }
    //  return $data;
     return view('backend.index')->with('course', json_encode($array));
    }

    // public function activity(){
    //     return Activity::all();
    //     $activity= Activity::all();
    //     return view('backend.layouts.activity')->with('activities',$activity);
    // }
}
