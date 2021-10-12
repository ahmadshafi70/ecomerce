<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Cart;

use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products=Product::getAllProduct();
        // return $products;
        return view('backend.product.index')->with('products',$products);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    
    {
        $brand=Brand::get();
        $category=Category::where('is_parent',1)->get();
        // return $category;
        return view('backend.product.create')->with('categories',$category)->with('brands',$brand);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        

        // $this->validate($request,[
        //     'title'=>'string|required',
        //     'summary'=>'string|required',
        //     'description'=>'string|nullable',
        //     'photo'=>'string|required',
        //     'size'=>'nullable',
        //     'stock'=>"required|numeric",
        //     'cat_id'=>'required|exists:categories,id',
        //     'brand_id'=>'nullable|exists:brands,id',
        //     'child_cat_id'=>'nullable|exists:categories,id',
        //     'is_featured'=>'sometimes|in:1',
        //     'status'=>'required|in:active,inactive',
        //     'condition'=>'required|in:default,new,hot',
        //     'price'=>'required|numeric',
        //     'discount'=>'nullable|numeric'
        // ]);

        $data=$request->all();
        if(!empty($request->new_category)){
            
            $new_category=new Category;
            $new_category->title=$request->new_category;
            
            $slug=Str::slug($new_category->title);
            $count=Category::where('slug',$slug)->count();
            if($count>0){
            $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
            }
            $new_category->slug=$slug;
            $new_category->status='active';
                  
            $new_category->save();
            
            $new_category_id=$new_category->id;

        }
        else {
            $new_category_id='';
            $new_category_id=$request->cat_id;
        }
        if(!empty($request->new_brand)){
            
            $new_brand=new Brand;
            $new_brand->title=$request->new_brand;
            
            $slug=Str::slug($new_brand->title);
            $count=Category::where('slug',$slug)->count();
            if($count>0){
            $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
            }
            $new_brand->slug=$slug;
            $new_brand->status='active';
                  
            $new_brand->save();
            
            $new_brand_id=$new_brand->id;

        }
        else {
            $new_brand_id='';
            $new_brand_id=$request->cat_id;
        }

        $slug=Str::slug($request->title);
        $count=Product::where('slug',$slug)->count();
        if($count>0) {
            $slug=$slug.'-'.date('ymdis').'-'.rand(0,999);
        }
        
        $data['slug']=$slug;
        $f_img_path='';                
        if($request->hasfile('file')) {

            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                        
        }

        $data['photo']=$f_img_path?$f_img_path:'';
        $data['cat_id']=$request->cat_id?$request->cat_id:$new_category_id;
        $data['brand_id']=$request->brand_id?$request->brand_id:$new_brand_id;
        $data['is_featured']=$request->input('is_featured',0);
        $size=$request->input('size');
        if($size) {
            $data['size']=implode(',',$size);
        }
        else {
            $data['size']='';
        }
        // return $size;
        // return $data;
        $status=Product::create($data);
        if($status){
            request()->session()->flash('success','Product Successfully added');
        }
        else{
            request()->session()->flash('error','Please try again!!');
        }
        return redirect()->route('product.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        $brand=Brand::get();
        $orders=Cart::where('product_id',$id)->where('order_id','!=','null')->get();
        
        $product=Product::findOrFail($id);

        $category=Category::where('is_parent',1)->get();
        $items=Product::where('id',$id)->get();
        // dd($items,$category,$product,$order,$brand);
        // return $items;
        return view('backend.product.show')->with('product',$product)
                    ->with('brands',$brand)
                    ->with('categories',$category)->with('items',$items)->with('orders',$orders);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $brand=Brand::get();
        $product=Product::findOrFail($id);
        $category=Category::where('is_parent',1)->get();
        $items=Product::where('id',$id)->get();
        // return $items;
        return view('backend.product.edit')->with('product',$product)
                    ->with('brands',$brand)
                    ->with('categories',$category)->with('items',$items);
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
        $product=Product::findOrFail($id);
        $this->validate($request,[
            'title'=>'string|required',
            'summary'=>'string|required',
            'description'=>'string|nullable',
            'size'=>'nullable',
            'stock'=>"required|numeric",
            'cat_id'=>'required|exists:categories,id',
            'child_cat_id'=>'nullable|exists:categories,id',
            'is_featured'=>'sometimes|in:1',
            'brand_id'=>'nullable|exists:brands,id',
            'status'=>'required|in:active,inactive',
            'condition'=>'required|in:default,new,hot',
            'price'=>'required|numeric',
            'discount'=>'nullable|numeric'
        ]);
        $f_img_path='';

        if($request->hasfile('file')) {
            
            $feature_image_name = $request->file('file')->getClientOriginalName();
            
            $feature_image_name=str_replace(' ','-',$feature_image_name);
                    
            $feature_image_path="assets/feature/";

            $request->file('file')->move($feature_image_path,$feature_image_name);  
                        
            $f_img_path=$feature_image_path.$feature_image_name;
                   
        }

        $data=$request->all();

        $product->photo=$f_img_path?$f_img_path:$product->photo;
        $data['is_featured']=$request->input('is_featured',0);
        $size=$request->input('size');

        if($size){
            $data['size']=implode(',',$size);
        }
        else{
            $data['size']='';
        }
        // return $data;
        $status=$product->fill($data)->save();
        if($status){
            request()->session()->flash('success','Product Successfully updated');
        }
        else{
            request()->session()->flash('error','Please try again!!');
        }
        return redirect()->route('product.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product=Product::findOrFail($id);
        $status=$product->delete();
        
        if($status){
            request()->session()->flash('success','Product successfully deleted');
        }
        else{
            request()->session()->flash('error','Error while deleting product');
        }
        return redirect()->route('product.index');
    }
}
