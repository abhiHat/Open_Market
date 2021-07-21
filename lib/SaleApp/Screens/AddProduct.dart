import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:open_market/SaleApp/Models/CategoryModel.dart';
import 'package:open_market/SaleApp/Services/loadCats.dart';
import 'package:open_market/SaleApp/Services/loadSubCats.dart';
import 'package:open_market/SaleApp/Services/selectDate.dart';
import 'package:toast/toast.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {


  TextEditingController  catCtrl = new TextEditingController();
  TextEditingController  subcatCtrl = new TextEditingController();
  TextEditingController  nameCtrl = new TextEditingController();
  TextEditingController  bdateCtrl = new TextEditingController();
  TextEditingController  bpriceCtrl = new TextEditingController();
  TextEditingController  espriceCtrl = new TextEditingController();
  TextEditingController  desctrl = new TextEditingController();

  PickedFile _image;

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera() async {
    PickedFile image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
       _image = image;
     });
  }

  _imgFromGallery() async {
    PickedFile image = await  ImagePicker.platform.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
     setState(() {
       _image = image;
     });
  }

  uploadProduct(File img) async{

    var request = http.MultipartRequest('POST', Uri.parse("http://192.168.43.175:8000/ci/om/public/productsellupload"));

    request.fields['product_name'] = nameCtrl.text;
    request.fields['product_buy_price'] = bpriceCtrl.text;
    request.fields['product_sell_price'] = espriceCtrl.text;
    request.fields['product_cat'] = catId.toString();
    request.fields['product_subcat'] = subcatId.toString();
    request.fields['product_buy_date'] = bdateCtrl.text;
    request.fields['product_desc'] = desctrl.text;
    request.fields['created_at'] = DateTime.now().toString();
    request.fields['user_id'] = '1';
    request.fields['is_saled'] = '${false}';

    request.files.add(
        await http.MultipartFile.fromPath(
        'package', img.path,
    ));
    
    var response = await request.send();
    var respData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(respData);

    if(response.statusCode == 200){
        Toast.show("Product Addedd Successfully", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER, backgroundColor: Colors.green[800], backgroundRadius: 12);
        Navigator.pop(context);
    }

    setState(() {
      isUploading = false;
    });

    print(responseString+" status");

  }

  int catId=0;
  int subcatId=0;

  int catSelectedIndex = -1;
  int scatSelectedIndex = -1;

  bool isUploading = false;
  DateTime sdate;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1980),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1980),
        lastDate: DateTime.now());
    if (picked != null)
      setState(() {
        selectedDate = picked;
        bdateCtrl.text = selectedDate.year.toString()+"/"+selectedDate.month.toString()+'/'+selectedDate.day.toString();
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: Text('Post Your Product'),
        leading: Icon(
          Icons.arrow_back_ios
        ),
      ),
      body: SingleChildScrollView(
        child: isUploading ? Container(child: Center(
          child: CircularProgressIndicator(
          ),
        ),) :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Select Category'),
                  ),
                  FutureBuilder(
                    future: loadCats(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){

                      final orientation = MediaQuery.of(context).orientation;

                      if(snapshot.data == null){
                        return Container(
                          child: Center(
                            child: Text('Loading...'),
                          ),
                        );
                      }else{
                        // ignore: missing_required_param
                        return GridView.builder(
                          padding: EdgeInsets.all(5),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: ( orientation == Orientation.portrait) ? 4 : 5),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){

                           var cId = snapshot.data[index].catId;
                           var catName = snapshot.data[index].catName;
                           var catImage = snapshot.data[index].catImage;
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  catId = cId;
                                  catSelectedIndex = index;
                                });
                              },
                              child: Card(
                                shape: (catSelectedIndex == index)? RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.cyan[900])
                                ):null ,
                                child: Column(
                                  children: <Widget>[
                                    Image(image: NetworkImage(catImage.toString()),width: 50, height: 60,),
                                    Text(catName.toString(), style: TextStyle(fontSize: 11),)
                                  ],
                                ),
                              ),
                            );},
                        );}},
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Select Sub Category'),
                  ),
                  catId != 0 ?  FutureBuilder(
                      future: loadSubCats(catId),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                        final orientation = MediaQuery.of(context).orientation;
                        if(snapshot.data == null){
                          return Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              child: Text('No data found with selected category...'),
                            ),
                          );
                        }else{
                          return GridView.builder(
                            padding: EdgeInsets.all(5),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: ( orientation == Orientation.portrait) ? 4 : 5),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                              var scId = snapshot.data[index].scatId;
                              var scatName = snapshot.data[index].scatName;
                              var scatImage = snapshot.data[index].scatImage;
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    subcatId = scId;
                                    scatSelectedIndex = index;
                                  });
                                },
                                child: Container(
                                  // padding: EdgeInsets.all(5),
                                  // margin: EdgeInsets.all(5),
                                  child: Card(
                                    shape: (scatSelectedIndex == index)? RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.cyan[900])
                                    ):null ,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image(image: NetworkImage(scatImage.toString()),width: 50,height: 50,),
                                        Text(scatName.toString(), style: TextStyle(fontSize: 11),)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ) : Container(),
                 Divider(),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                    ),
                    child: TextField(
                      controller: nameCtrl,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                        hintText: "Enter name of product.."
                        ),
                    ),
                  ),


                  GestureDetector(
                    onTap: (){
                    _selectDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.3),
                      ),

                      child: TextFormField(
                        controller: bdateCtrl,

                        enabled: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Buy date",
                          // labelText: sdate.toString()
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                    ),
                    child: TextField(
                      controller: bpriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter buy price"
                      ),
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                    ),
                    child: TextField(
                      controller: espriceCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter expected sell price"
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.3),
                    ),
                    child: TextField(
                      controller: desctrl,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Describe your product"
                      ),
                      maxLines: 3,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 55,
                      child:
                      _image !=null ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                        Image.file(
                          File(_image.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                      : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){

                      if(_image == null || catId == 0 || subcatId == 0 || nameCtrl == null || bdateCtrl == null || bpriceCtrl == null || espriceCtrl == null || desctrl == null){
                        Toast.show("Please fill all the details", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM, backgroundColor: Colors.red[900]);
                      }else{
                        setState(() {
                          isUploading = true;
                        });
                        uploadProduct(File(_image.path));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 200, left: 10, right: 10),
                      height: 55,
                      // padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.pink[200]
                      ),
                      child: Center(child: Text('Post Product', style: TextStyle(fontSize: 20),)),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
