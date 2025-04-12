import 'package:flexfund_app/dashboard/dashboard_screens/history/success_screen.dart';
import 'package:flexfund_app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _paymentMethod = 'MPESA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Make Payment'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Enter Amount'),
            _styledTextField(
              controller: _amountController,
              hint: 'KES 0.00',
              keyboardType: TextInputType.number,
              prefixIcon: Icons.attach_money,
            ),
            SizedBox(height: 20),

            _buildSectionTitle('Select Payment Method'),
            SizedBox(height: 20),

            _buildPaymentOptions(),
            SizedBox(height: 20),

            if (_paymentMethod == 'MPESA') ...[
              _buildSectionTitle('Phone Number'),
              _styledTextField(
                controller: _phoneController,
                hint: '07XXXXXXXX',
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_android,
              ),
            ] else ...[
              _buildSectionTitle('Card Details'),
              _styledTextField(
                controller: _cardNumberController,
                hint: 'Card Number',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.credit_card,
              ),
              Row(
                children: [
                  Expanded(
                    child: _styledTextField(
                      controller: _expiryController,
                      hint: 'MM/YY',
                      keyboardType: TextInputType.datetime,
                      prefixIcon: Icons.date_range,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _styledTextField(
                      controller: _cvvController,
                      hint: 'CVV',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      maxLength: 3,
                    ),
                  ),
                ],
              ),
            ],

            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  backgroundColor: FlexFundTheme.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PaymentSuccessScreen(
                      amount: 100,
                      description: 'Food donation',
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text('Confirm Payment', style: FlexFundTheme.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _styledTextField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    bool obscureText = false,
    int? maxLength,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: FlexFundTheme.mediumGray, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: FlexFundTheme.primaryGreen,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          counterText: '',
          hintText: hint,
          prefixIcon: Icon(prefixIcon, color: FlexFundTheme.primaryGreen),

          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [_paymentOptionTile('MPESA'), _paymentOptionTile('Card')],
    );
  }

  Widget _paymentOptionTile(String method) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor:
            _paymentMethod == method
                ? FlexFundTheme.primaryGreen.withValues(alpha: 50)
                : Colors.white,
        leading: Checkbox(
          activeColor: FlexFundTheme.primaryGreen,
          value: _paymentMethod == method,
          onChanged: (_) {
            setState(() => _paymentMethod = method);
          },
        ),
        title: Text(method),
        onTap: () => setState(() => _paymentMethod = method),
      ),
    );
  }
}
