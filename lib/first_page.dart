import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/groceries/widgets/banner_section.dart';
import 'package:my_app/features/groceries/widgets/product_category_section.dart';
import 'package:my_app/shared/providers.dart';
import 'package:my_app/widgets/bottom_navigation_bar.dart';
import 'package:my_app/widgets/location_search.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiService = ref.read(apiServiceProvider);

    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: LocationSearch()),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(child: BannerSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            // Section 1 – Exclusive Offer
            SliverToBoxAdapter(
              child: ProductCategorySection(
                category: 'fragrances',
                title: 'Exclusive Offer',
                apiService: apiService,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            // Section 2 – Best Selling
            // SliverToBoxAdapter(
            //   child: ProductCategorySection(
            //     category: 'skincare',
            //     title: 'Best Selling',
            //     apiService: apiService,
            //   ),
            // ),

            const SliverToBoxAdapter(child: SizedBox(height: 8)),

            // Section 3 – Groceries
            SliverToBoxAdapter(
              child: ProductCategorySection(
                category: 'laptops',
                title: 'Electronics',
                apiService: apiService,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Optional: Popular Groceries
            // const SliverToBoxAdapter(child: GroceriesSection()),
             SliverToBoxAdapter(
              child: ProductCategorySection(
                category: 'groceries',
                title: 'groceries',
                apiService: apiService,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
