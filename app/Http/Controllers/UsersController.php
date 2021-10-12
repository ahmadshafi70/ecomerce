<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;
class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users=User::orderBy('id','ASC')->paginate(10);
        return view('backend.users.index')->with('users',$users);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.users.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $this->validate($request,
        [
            'name'=>'string|required|max:30',
            'email'=>'string|required|unique:users',
            'password'=>'string|required',
            'role'=>'required|in:admin,user',
            'status'=>'required|in:active,inactive',
            'photo'=>'nullable',
        ]);
        $f_img_path='';
        if($request->hasfile('photo')) {


            $feature_image_name = $request->file('photo')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('photo')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                        
        }
        // dd($request->all());
        $data=$request->all();
        $user= new User;
        $user->name=$request->name;
        $user->email=$request->email;
        $user->password=Hash::make($request->password);
        $user->phone=$request->phone;

        $user->photo=$f_img_path?$f_img_path:'backend/img/avatar.png';
        // dd($data);
        $status=$user->save();
        // dd($status);
        if($status){
            request()->session()->flash('success','Successfully added user');
        }
        else{
            request()->session()->flash('error','Error occurred while adding user');
        }
        return redirect()->route('users.index');

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
        $user=User::findOrFail($id);
        return view('backend.users.edit')->with('user',$user);
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
        $user=User::findOrFail($id);

        $this->validate($request,
        [
            'name'=>'string|required|max:30',
            'email'=>'string|required',
            'role'=>'required|in:admin,user',
            'status'=>'required|in:active,inactive',
            
        ]);
        // dd($request->all());
        $data=$request->all();
        // dd($data);
        $f_img_path='';

        if($request->hasfile('file')) {
            
            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                   
        }
        $user->phone=$request->phone;
        $user->photo=$f_img_path?$f_img_path:$user->photo;
        $status=$user->fill($data)->save();
        if($status){
            request()->session()->flash('success','Successfully updated');
        }
        else{
            request()->session()->flash('error','Error occured while updating');
        }
        return redirect()->route('users.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete=User::findorFail($id);
        $status=$delete->delete();
        if($status){
            request()->session()->flash('success','User Successfully deleted');
        }
        else{
            request()->session()->flash('error','There is an error while deleting users');
        }
        return redirect()->route('users.index');
    }
}
