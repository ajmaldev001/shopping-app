import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/configs/api_constants.dart';
import 'package:shopping_app/configs/color/colors.dart';
import 'package:shopping_app/configs/components/custom_drop_down_widget.dart';
import 'package:shopping_app/configs/components/custom_text_feild_widget.dart';
import 'package:shopping_app/configs/themes/theme_text.dart';
import 'package:shopping_app/view/home/widgets/appbar_title_widget.dart';
import 'package:shopping_app/view/home/widgets/gradient_card_widget.dart';
import 'package:shopping_app/view/home/widgets/shopping_card_widget.dart';
import 'package:shopping_app/view_model/home/products_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var productsViewModel = Provider.of<ProductsViewModel>(context,listen: false);
      productsViewModel.fetchCategoryList(ApiConstants.categoryList);
      productsViewModel.initializeLoading(); 
    });
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/images/menu.png',width: 24,height: 24),
        ),
        title: const AppBarTitle(),
        elevation: 5,
        leadingWidth: 40,
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        shadowColor: AppColor.lightGrey,
      ),
      body: FutureBuilder(
        future: context.read<ProductsViewModel>().fetchShoppingData(ApiConstants.baseUrl),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.black,
                color: AppColor.lightGrey,
              ),
            );
          }
          else if(snapshot.hasError){
            return const Center(child: Text('Something error occurred'),);
          }
          else{
            return Consumer<ProductsViewModel>(
              builder: (context,data,child) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                        child: Column(
                          children: [
                            CustomTextFeildWidget(
                              controller: _searchController,
                              onSuffixIconTapped: () {
                                data.resetPagination(_searchController.text);
                              }, 
                              onChanged: (value) {
                                data.onChangedFilter(value ?? '');
                              }, 
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('Select Category',style: CustomThemeStyles.greyBold24.copyWith(color: AppColor.darkGrey.withOpacity(0.9),fontSize: 18,fontWeight: FontWeight.w800))),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    flex: 3,
                                    child: CustomDropdownButton(
                                      selectedItem: data.selectedCategoryItem, 
                                      onChanged: (value){
                                        if(value!.isEmpty || value == 'Select'){
                                          data.resetPagination('');
                                        }else{
                                          data.updateSelectedCategoryList(value,context);
                                        }
                                      }, 
                                      hintText: 'Search Categories', 
                                      menuHeight: ScreenUtil().screenHeight * 0.3,
                                      items: ['Select', ...data.categoryList],
                                      ),
                                  )
                                ],
                              ),
                            ),

                            const GradientCard(),
                            
                            const SizedBox(height: 8),
                            
                            data.isLoading
                              ? Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: AppColor.lightGrey,
                                    color: AppColor.black
                                  ),
                                ),
                              )
                            : Expanded(
                               child: NotificationListener<ScrollNotification>(
                                onNotification: (ScrollNotification scrollInfo) {
                                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && data.isPaginationActive) { 
                                    data.updatePages();
                                  }
                                  return true;
                                },
                                child: 
                                data.shoppingProductsModel?.products?.isNotEmpty ?? false
                                ? GridView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: data.shoppingProductsModel?.products?.length ?? 0,
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10
                                  ),
                                  itemBuilder: (context,index) {
                                    return ShoppingCard(
                                      imageUrl: data.shoppingProductsModel?.products?.map((e) => e.thumbnail).toList()[index].toString() ?? '', 
                                      itemName: data.shoppingProductsModel?.products?.map((e) => e.title).toList()[index].toString() ?? '', 
                                      descriptiontext: data.shoppingProductsModel?.products?.map((e) => e.description).toList()[index].toString() ?? '', 
                                      price: data.shoppingProductsModel?.products?.map((e) => e.price).toList()[index].toString() ?? '', 
                                      iconLength: data.shoppingProductsModel?.products?.map((e) => e.rating).toList()[index]?.toInt() ?? 0,
                                    );
                                  }
                                )
                                : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(child: Center(child: Text('Oops! Product not found',style: CustomThemeStyles.blackBold16,)))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if(data.isPaginationActive && data.isPaginationLoader)
                     Center(child: CircularProgressIndicator(backgroundColor: AppColor.black,color: AppColor.lightGrey,)),
                  ],
                );
              }
            );
          }
        }))
    );
  }
}

