


DELETE FROM Test_Drive;
DELETE FROM Sale;
DELETE FROM Inventory;
DELETE FROM Customer;
DELETE FROM Dealer;

-- Section 2: Dealers, Customers, and Transactions

-- Dealer Data
INSERT INTO Dealer (dealer_name, address, city, state, pincode, contact_number, email) VALUES
('Nexa KR Puram', '123 Outer Ring Rd, Mahadevapura', 'Bengaluru', 'Karnataka', '560048', '9876543210', 'nexa.krpuram@maruti.com'),
('Arena Motors Mumbai', '456 Andheri West Link Rd', 'Mumbai', 'Maharashtra', '400053', '9876543211', 'arena.mumbai@maruti.com'),
('Capital Hyundai', '789 GST Road, Guindy', 'Chennai', 'Tamil Nadu', '600032', '9876543212', 'sales@capitalhyundai.in'),
('Trident Hyundai Delhi', '101 Connaught Place', 'New Delhi', 'Delhi', '110001', '9876543213', 'contact@tridentdelhi.com'),
('Prerana Motors Tata', '212 Hosur Road, Electronic City', 'Bengaluru', 'Karnataka', '560100', '9876543214', 'info@preranamotors.com'),
('Concorde Motors Tata Pune', '313 Pune-Satara Road', 'Pune', 'Maharashtra', '411009', '9876543215', 'pune@concordetata.com');

-- Customer Data
INSERT INTO Customer (first_name, last_name, phone_number, email, address, city, pincode) VALUES
('Aarav', 'Sharma', '9988776601', 'aarav.sharma@email.com', '101 MG Road', 'Bengaluru', '560001'),
('Vihaan', 'Verma', '9988776602', 'vihaan.verma@email.com', '202 Park Street', 'Kolkata', '700016'),
('Vivaan', 'Singh', '9988776603', 'vivaan.singh@email.com', '303 Marine Drive', 'Mumbai', '400020'),
('Aditya', 'Kumar', '9988776604', 'aditya.kumar@email.com', '404 Anna Salai', 'Chennai', '600002'),
('Reyansh', 'Patel', '9988776605', 'reyansh.patel@email.com', '505 Ashram Road', 'Ahmedabad', '380009'),
('Ayaan', 'Gupta', '9988776606', 'ayaan.gupta@email.com', '606 Janpath', 'New Delhi', '110001'),
('Arjun', 'Reddy', '9988776607', 'arjun.reddy@email.com', '707 Banjara Hills', 'Hyderabad', '500034'),
('Sai', 'Rao', '9988776608', 'sai.rao@email.com', '808 FC Road', 'Pune', '411004'),
('Ishaan', 'Malhotra', '9988776609', 'ishaan.malhotra@email.com', '909 Koramangala', 'Bengaluru', '560095'),
('Anaya', 'Jain', '9988776610', 'anaya.jain@email.com', '111 Brigade Road', 'Bengaluru', '560025'),
('Saanvi', 'Mishra', '9988776611', 'saanvi.mishra@email.com', '212 Salt Lake', 'Kolkata', '700091'),
('Kiara', 'Chopra', '9988776612', 'kiara.chopra@email.com', '313 Juhu', 'Mumbai', '400049'),
('Diya', 'Mehta', '9988776613', 'diya.mehta@email.com', '414 T Nagar', 'Chennai', '600017'),
('Pari', 'Shah', '9988776614', 'pari.shah@email.com', '515 Satellite', 'Ahmedabad', '380015'),
('Myra', 'Aggarwal', '9988776615', 'myra.aggarwal@email.com', '616 Saket', 'New Delhi', '110017'),
('Aadhya', 'Iyer', '9988776616', 'aadhya.iyer@email.com', '717 Gachibowli', 'Hyderabad', '500032'),
('Anika', 'Naidu', '9988776617', 'anika.naidu@email.com', '818 Hinjewadi', 'Pune', '411057'),
('Riya', 'Kapoor', '9988776618', 'riya.kapoor@email.com', '919 Indiranagar', 'Bengaluru', '560038'),
('Kabir', 'Bose', '9988776619', 'kabir.bose@email.com', '121 Ballygunge', 'Kolkata', '700019'),
('Zoya', 'Khan', '9988776620', 'zoya.khan@email.com', '222 Bandra', 'Mumbai', '400050'),
('Rohan', 'Menon', '9988776621', 'rohan.menon@email.com', '323 Velachery', 'Chennai', '600042'),
('Advik', 'Pillai', '9988776622', 'advik.pillai@email.com', '424 Navrangpura', 'Ahmedabad', '380009'),
('Arnav', 'Joshi', '9988776623', 'arnav.joshi@email.com', '525 Hauz Khas', 'New Delhi', '110016'),
('Aryan', 'Nair', '9988776624', 'aryan.nair@email.com', '626 Jubilee Hills', 'Hyderabad', '500033'),
('Dhruv', 'Kulkarni', '9988776625', 'dhruv.kulkarni@email.com', '727 Kothrud', 'Pune', '411038'),
('Krishna', 'Murthy', '9988776626', 'krishna.murthy@email.com', '828 Jayanagar', 'Bengaluru', '560041'),
('Mohammed', 'Ali', '9988776627', 'mohammed.ali@email.com', '929 Howrah', 'Kolkata', '711101'),
('Ritvik', 'Desai', '9988776628', 'ritvik.desai@email.com', '131 Powai', 'Mumbai', '400076'),
('Shaurya', 'Prakash', '9988776629', 'shaurya.prakash@email.com', '232 Adyar', 'Chennai', '600020'),
('Veer', 'Trivedi', '9988776630', 'veer.trivedi@email.com', '333 Bodakdev', 'Ahmedabad', '380054'),
('Yuvan', 'Chauhan', '9988776631', 'yuvan.chauhan@email.com', '434 Lajpat Nagar', 'New Delhi', '110024'),
('Zara', 'Baig', '9988776632', 'zara.baig@email.com', '535 Madhapur', 'Hyderabad', '500081'),
('Shanaya', 'Das', '9988776633', 'shanaya.das@email.com', '636 Viman Nagar', 'Pune', '411014'),
('Aarohi', 'Pawar', '9988776634', 'aarohi.pawar@email.com', '737 Whitefield', 'Bengaluru', '560066'),
('Ira', 'Ghosh', '9988776635', 'ira.ghosh@email.com', '838 Alipore', 'Kolkata', '700027'),
('Neha', 'Soni', '9988776636', 'neha.soni@email.com', '939 Colaba', 'Mumbai', '400005'),
('Pooja', 'Nadar', '9988776637', 'pooja.nadar@email.com', '141 Mylapore', 'Chennai', '600004'),
('Alia', 'Bhatia', '9988776638', 'alia.bhatia@email.com', '242 Maninagar', 'Ahmedabad', '380008'),
('Ranbir', 'Anand', '9988776639', 'ranbir.anand@email.com', '343 Karol Bagh', 'New Delhi', '110005'),
('Deepika', 'Shetty', '9988776640', 'deepika.shetty@email.com', '444 Kondapur', 'Hyderabad', '500084'),
('Hrithik', 'Patil', '9988776641', 'hrithik.patil@email.com', '545 Baner', 'Pune', '411045'),
('Kareena', 'Rao', '9988776642', 'kareena.rao@email.com', '646 Marathahalli', 'Bengaluru', '560037'),
('Shahid', 'Dutta', '9988776643', 'shahid.dutta@email.com', '747 Park Circus', 'Kolkata', '700017'),
('Priyanka', 'Thakur', '9988776644', 'priyanka.thakur@email.com', '848 Worli', 'Mumbai', '400018'),
('Sameer', 'Sundaram', '9988776645', 'sameer.sundaram@email.com', '949 Besant Nagar', 'Chennai', '600090'),
('Tara', 'Vyas', '9988776646', 'tara.vyas@email.com', '151 Vastrapur', 'Ahmedabad', '380015'),
('Varun', 'Saxena', '9988776647', 'varun.saxena@email.com', '252 Dwarka', 'New Delhi', '110075'),
('Yash', 'Begum', '9988776648', 'yash.begum@email.com', '353 Secunderabad', 'Hyderabad', '500003'),
('Abhinav', 'Chavan', '9988776649', 'abhinav.chavan@email.com', '454 Deccan Gymkhana', 'Pune', '411004'),
('Bhavna', 'Gowda', '9988776650', 'bhavna.gowda@email.com', '555 HSR Layout', 'Bengaluru', '560102'),
('Chetan', 'Sarkar', '9988776651', 'chetan.sarkar@email.com', '656 New Town', 'Kolkata', '700156'),
('Divya', 'Tambe', '9988776652', 'divya.tambe@email.com', '757 Thane', 'Mumbai', '400601'),
('Esha', 'Krishnan', '9988776653', 'esha.krishnan@email.com', '858 Anna Nagar', 'Chennai', '600040'),
('Farhan', 'Pandey', '9988776654', 'farhan.pandey@email.com', '959 Gandhinagar', 'Ahmedabad', '382010'),
('Gauri', 'Rawat', '9988776655', 'gauri.rawat@email.com', '161 Noida', 'New Delhi', '201301'),
('Harsh', 'Hussain', '9988776656', 'harsh.hussain@email.com', '262 Begumpet', 'Hyderabad', '500016'),
('Ishita', 'Shinde', '9988776657', 'ishita.shinde@email.com', '363 Camp', 'Pune', '411001'),
('Jatin', 'Biswas', '9988776658', 'jatin.biswas@email.com', '464 BTM Layout', 'Bengaluru', '560076'),
('Kavya', 'Roy', '9988776659', 'kavya.roy@email.com', '565 Dum Dum', 'Kolkata', '700028'),
('Laksh', 'Yadav', '9988776660', 'laksh.yadav@email.com', '666 Chembur', 'Mumbai', '400071');

-- Section 3: Inventory Data
-- This section now has a much larger and more diverse inventory.
-- VINs are unique 17-character strings.
INSERT INTO Inventory (vin, variant_id, dealer_id, manufacture_date, arrival_date, status, color) VALUES
-- ########## Maruti Suzuki Inventory ##########
-- Brezza
('MSBRZ25AA001ZXIWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi'), 1, '2025-08-01', '2025-08-15', 'In Stock', 'Splendid Silver'),
('MSBRZ25AB002ZXIRD', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi'), 2, '2025-08-02', '2025-08-16', 'In Stock', 'Sizzling Red'),
('MSBRZ25AC003VXIWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'VXI'), 1, '2025-08-03', '2025-08-17', 'In Stock', 'Exuberant Blue'),
('MSBRZ25AD004VXIAT', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'VXI AT'), 2, '2025-08-04', '2025-08-18', 'In Stock', 'Magma Grey'),
-- Swift
('MSSWF25AA001VXIWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'VXI'), 1, '2025-07-20', '2025-08-05', 'In Stock', 'Prime Luster Blue'),
('MSSWF25AB002VXIWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'VXI'), 2, '2025-07-21', '2025-08-06', 'In Stock', 'Magma Grey Metallic'),
('MSSWF25AC003ZXIRD', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi AMT'), 1, '2025-07-22', '2025-08-07', 'In Stock', 'Sizzling Red'),
('MSSWF25AD004ZXIRD', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi AMT'), 2, '2025-07-23', '2025-08-08', 'In Stock', 'Arctic White'),
-- Baleno
('MSBLN25AA001ALBL', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 1, '2025-08-10', '2025-08-25', 'In Stock', 'Nexa Blue'),
('MSBLN25AB002ALGR', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-08-11', '2025-08-26', 'In Stock', 'Grandeur Grey'),
('MSBLN25AC003ZEBL', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Zeta'), 1, '2025-08-12', '2025-08-27', 'In Stock', 'Arctic White'),
('MSBLN25AD004ZEGR', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Zeta'), 2, '2025-08-13', '2025-08-28', 'In Stock', 'Splendid Silver'),

-- ########## Hyundai Inventory ##########
-- Creta
('HYCRT25AA001EXBK', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'E 1.5 MT'), 3, '2025-08-05', '2025-08-20', 'In Stock', 'Abyss Black'),
('HYCRT25AB002EXWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'E 1.5 MT'), 4, '2025-08-06', '2025-08-21', 'In Stock', 'Atlas White'),
('HYCRT25AC003SXTBK', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 3, '2025-08-07', '2025-08-22', 'In Stock', 'Robust Emerald Pearl'),
('HYCRT25AD004SXTWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 4, '2025-08-08', '2025-08-23', 'In Stock', 'Titan Grey'),
-- Venue
('HYVEN25AA001EXSV', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'E 1.2 MT'), 3, '2025-07-15', '2025-07-30', 'In Stock', 'Typhoon Silver'),
('HYVEN25AB002EXBK', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'E 1.2 MT'), 4, '2025-07-16', '2025-07-31', 'In Stock', 'Abyss Black'),
('HYVEN25AC003SXOFR', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'SX(O) Turbo DCT'), 3, '2025-07-17', '2025-08-01', 'In Stock', 'Fiery Red'),
('HYVEN25AD004SXOFR', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'SX(O) Turbo DCT'), 4, '2025-07-18', '2025-08-02', 'In Stock', 'Denim Blue'),

-- ########## Tata Inventory ##########
-- Nexon
('TANEX25AA001SMRPU', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Smart 1.2 Revotron'), 5, '2025-08-15', '2025-09-01', 'In Stock', 'Fearless Purple'),
('TANEX25AB002SMRWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Smart 1.2 Revotron'), 6, '2025-08-16', '2025-09-02', 'In Stock', 'Pristine White'),
('TANEX25AC003FLSDC', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), 5, '2025-08-17', '2025-09-03', 'In Stock', 'Creative Ocean'),
('TANEX25AD004FLSDC', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), 6, '2025-08-18', '2025-09-04', 'In Stock', 'Flame Red'),
-- Harrier
('TAHAR25AA001SMRBK', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Smart 2.0 Kryotec'), 5, '2025-07-25', '2025-08-10', 'In Stock', 'Oberon Black'),
('TAHAR25AB002SMRWH', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Smart 2.0 Kryotec'), 6, '2025-07-26', '2025-08-11', 'In Stock', 'Lunar White'),
('TAHAR25AC003FLSGY', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 5, '2025-07-27', '2025-08-12', 'In Stock', 'Pebble Grey'),
('TAHAR25AD004FLSGN', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 6, '2025-07-28', '2025-08-13', 'In Stock', 'Seaweed Green'),
-- Punch
('TAPUN25AA001ACMBK', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Accomplished 1.2 AMT'), 5, '2025-08-20', '2025-09-05', 'In Stock', 'Tornado Blue'),
('TAPUN25AB002ACMwh', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Accomplished 1.2 AMT'), 6, '2025-08-21', '2025-09-06', 'In Stock', 'Calypso Red'),

-- Inventory to be sold (30 cars)
('SLD1B2C3D4E5F6G701', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-05-01', '2025-05-15', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G702', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-05-02', '2025-05-16', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G703', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), 3, '2025-05-03', '2025-05-17', 'In Stock', 'Starry Night'),
('SLD1B2C3D4E5F6G704', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), 4, '2025-05-04', '2025-05-18', 'In Stock', 'Fiery Red'),
('SLD1B2C3D4E5F6G705', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), 5, '2025-05-05', '2025-05-19', 'In Stock', 'Midnight Plum'),
('SLD1B2C3D4E5F6G706', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), 6, '2025-05-06', '2025-05-20', 'In Stock', 'Creative Ocean'),
('SLD1B2C3D4E5F6G707', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), 1, '2025-05-07', '2025-05-21', 'In Stock', 'All colours'),
('SLD1B2C3D4E5F6G708', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), 2, '2025-05-08', '2025-05-22', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G709', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), 3, '2025-05-09', '2025-05-23', 'In Stock', 'Atlas White with Abyss Black'),
('SLD1B2C3D4E5F6G710', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), 4, '2025-05-10', '2025-05-24', 'In Stock', 'Abyss Black'),
('SLD1B2C3D4E5F6G711', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 5, '2025-05-11', '2025-05-25', 'In Stock', 'Lunar White'),
('SLD1B2C3D4E5F6G712', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Oberon Black'),
('SLD1B2C3D4E5F6G713', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), 1, '2025-05-13', '2025-05-27', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G714', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), 2, '2025-05-14', '2025-05-28', 'In Stock', 'Silve'),
('SLD1B2C3D4E5F6G715', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 3, '2025-05-15', '2025-05-29', 'In Stock', 'Robust Emerald Pearl'),
('SLD1B2C3D4E5F6G716', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), 4, '2025-05-16', '2025-05-30', 'In Stock', 'Abyss Black'),
('SLD1B2C3D4E5F6G717', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), 5, '2025-05-17', '2025-05-31', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G718', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), 6, '2025-05-18', '2025-06-01', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G719', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), 1, '2025-05-19', '2025-06-02', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G720', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Sigma'), 2, '2025-05-20', '2025-06-03', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G721', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Kona Electric' AND cv.variant_name = 'Prime'), 3, '2025-05-21', '2025-06-04', 'In Stock', 'Atlas White'),
('SLD1B2C3D4E5F6G722', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ioniq 5' AND cv.variant_name = 'Launch Edition'), 4, '2025-05-22', '2025-06-05', 'In Stock', 'Ultimate Red'),
('SLD1B2C3D4E5F6G723', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tigor' AND cv.variant_name = 'XZ+ CNG'), 5, '2025-05-23', '2025-06-06', 'In Stock', 'Daytona Grey'),
('SLD1B2C3D4E5F6G724', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Adventure CNG'), 6, '2025-05-24', '2025-06-07', 'In Stock', 'Tornado Blue'),
('SLD1B2C3D4E5F6G725', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Wagon R' AND cv.variant_name = 'VXI'), 1, '2025-05-25', '2025-06-08', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G726', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Delta'), 2, '2025-05-26', '2025-06-09', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G727', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Venue' AND cv.variant_name = 'E 1.2 MT'), 3, '2025-05-27', '2025-06-10', 'In Stock', 'Typhoon Silver'),
('SLD1B2C3D4E5F6G728', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tucson' AND cv.variant_name = 'GLS 2.0 AT'), 4, '2025-05-28', '2025-06-11', 'In Stock', 'Starry Night'),
('SLD1B2C3D4E5F6G729', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Altroz' AND cv.variant_name = 'XE 1.2 Revotron'), 5, '2025-05-29', '2025-06-12', 'In Stock', 'Opera Blue'),
('SLD1B2C3D4E5F6G730', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Smart 2.0 Kryotec'), 6, '2025-05-30', '2025-06-13', 'In Stock', 'Oberon Black');

-- Section 4: Sale Data
-- Creating 30 sale records, linking inventory to customers.
INSERT INTO Sale (vin, customer_id, dealer_id, sale_date, final_on_road_price, payment_mode, salesperson_name) VALUES
('SLD1B2C3D4E5F6G701', 1, 1, '2025-06-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G701'), 'Finance', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G702', 2, 2, '2025-06-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G702'), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G703', 3, 3, '2025-06-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G703'), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G704', 4, 4, '2025-06-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G704'), 'Finance', 'Amit Patel'),
('SLD1B2C3D4E5F6G705', 5, 5, '2025-06-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G705'), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G706', 6, 6, '2025-06-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G706'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G707', 7, 1, '2025-07-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G707'), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G708', 8, 2, '2025-07-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G708'), 'Online', 'Suresh Singh'),
('SLD1B2C3D4E5F6G709', 9, 3, '2025-07-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G709'), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G710', 10, 4, '2025-07-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G710'), 'Cash', 'Amit Patel'),
('SLD1B2C3D4E5F6G711', 11, 5, '2025-07-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G711'), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G712', 12, 6, '2025-07-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G712'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G713', 13, 1, '2025-07-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G713'), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G714', 14, 2, '2025-07-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G714'), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G715', 15, 3, '2025-07-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G715'), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G716', 16, 4, '2025-07-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G716'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G717', 17, 5, '2025-07-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G717'), 'Online', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G718', 18, 6, '2025-07-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G718'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G719', 19, 1, '2025-08-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G719'), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G720', 20, 2, '2025-08-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G720'), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G721', 21, 3, '2025-08-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G721'), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G722', 22, 4, '2025-08-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G722'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G723', 23, 5, '2025-08-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G723'), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G724', 24, 6, '2025-08-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G724'), 'Cash', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G725', 25, 1, '2025-08-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G725'), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G726', 26, 2, '2025-08-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G726'), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G727', 27, 3, '2025-08-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G727'), 'Cash', 'Priya Sharma'),
('SLD1B2C3D4E5F6G728', 28, 4, '2025-08-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G728'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G729', 29, 5, '2025-08-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G729'), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G730', 30, 6, '2025-08-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G730'), 'Online', 'Vikram Rathore');

-- Section 5: Update Inventory Status
-- IMPORTANT: This updates the status of the 30 cars that were just sold.
UPDATE Inventory
SET status = 'Sold'
WHERE vin IN (
    'SLD1B2C3D4E5F6G701', 'SLD1B2C3D4E5F6G702', 'SLD1B2C3D4E5F6G703', 'SLD1B2C3D4E5F6G704', 'SLD1B2C3D4E5F6G705',
    'SLD1B2C3D4E5F6G706', 'SLD1B2C3D4E5F6G707', 'SLD1B2C3D4E5F6G708', 'SLD1B2C3D4E5F6G709', 'SLD1B2C3D4E5F6G710',
    'SLD1B2C3D4E5F6G711', 'SLD1B2C3D4E5F6G712', 'SLD1B2C3D4E5F6G713', 'SLD1B2C3D4E5F6G714', 'SLD1B2C3D4E5F6G715',
    'SLD1B2C3D4E5F6G716', 'SLD1B2C3D4E5F6G717', 'SLD1B2C3D4E5F6G718', 'SLD1B2C3D4E5F6G719', 'SLD1B2C3D4E5F6G720',
    'SLD1B2C3D4E5F6G721', 'SLD1B2C3D4E5F6G722', 'SLD1B2C3D4E5F6G723', 'SLD1B2C3D4E5F6G724', 'SLD1B2C3D4E5F6G725',
    'SLD1B2C3D4E5F6G726', 'SLD1B2C3D4E5F6G727', 'SLD1B2C3D4E5F6G728', 'SLD1B2C3D4E5F6G729', 'SLD1B2C3D4E5F6G730'
);

-- Section 6: Test Drive Data
-- Creating 20 test drive records with varied statuses.
INSERT INTO Test_Drive (customer_id, dealer_id, variant_id, booking_date, drive_date_time, status) VALUES
(31, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), '2025-09-01', '2025-09-05 11:00:00', 'Completed'),
(32, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), '2025-09-02', '2025-09-06 14:00:00', 'Completed'),
(33, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), '2025-09-03', '2025-09-08 10:00:00', 'Completed'),
(34, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), '2025-09-04', '2025-09-09 16:00:00', 'Cancelled'),
(35, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), '2025-09-05', '2025-09-10 12:00:00', 'No Show'),
(36, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), '2025-09-06', '2025-09-11 15:00:00', 'Completed'),
(37, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), '2025-09-07', '2025-09-12 11:30:00', 'Completed'),
(38, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), '2025-09-08', '2025-09-13 13:00:00', 'Scheduled'),
(39, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), '2025-09-09', '2025-09-14 09:00:00', 'Scheduled'),
(40, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), '2025-09-10', '2025-09-16 17:00:00', 'Scheduled'),
(41, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), '2025-09-11', '2025-09-17 10:30:00', 'Scheduled'),
(42, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), '2025-09-12', '2025-09-18 14:30:00', 'Cancelled'),
(43, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), '2025-09-13', '2025-09-19 12:30:00', 'Completed'),
(44, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), '2025-09-14', '2025-09-20 15:30:00', 'No Show'),
(45, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), '2025-09-15', '2025-09-21 11:00:00', 'Scheduled'),
(46, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), '2025-09-16', '2025-09-22 16:30:00', 'Scheduled'),
(47, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), '2025-09-17', '2025-09-23 13:30:00', 'Completed'),
(48, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), '2025-09-18', '2025-09-24 10:00:00', 'Completed'),
(49, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), '2025-09-19', '2025-09-25 14:00:00', 'Scheduled'),
(50, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Kona Electric' AND cv.variant_name = 'Prime'), '2025-09-20', '2025-09-26 12:00:00', 'Scheduled');

-- End of script.-- =================================================================
-- Transactional & Relational Data Population Script
-- Use this script to reset and populate Dealers, Customers, Sales, and Test Drives.
-- It assumes Manufacturer, Car_Model, and Car_Variant tables are already populated.
-- =================================================================

-- =================================================================
-- Section 0: Data Cleanup (Makes the script re-runnable)
-- =================================================================
DELETE FROM Test_Drive;
DELETE FROM Sale;
DELETE FROM Customer;
DELETE FROM Dealer;

-- Reset the autoincrement counters for these tables to ensure IDs start from 1
DELETE FROM sqlite_sequence WHERE name = 'Dealer';
DELETE FROM sqlite_sequence WHERE name = 'Customer';
DELETE FROM sqlite_sequence WHERE name = 'Sale';
DELETE FROM sqlite_sequence WHERE name = 'Test_Drive';

-- =================================================================
-- Section 1: Dealers and Customers
-- =================================================================

-- Dealer Data with explicit IDs to ensure consistency
INSERT INTO Dealer (dealer_id, dealer_name, address, city, state, pincode, contact_number, email) VALUES
(1, 'Nexa KR Puram', '123 Outer Ring Rd, Mahadevapura', 'Bengaluru', 'Karnataka', '560048', '9876543210', 'nexa.krpuram@maruti.com'),
(2, 'Arena Motors Mumbai', '456 Andheri West Link Rd', 'Mumbai', 'Maharashtra', '400053', '9876543211', 'arena.mumbai@maruti.com'),
(3, 'Capital Hyundai', '789 GST Road, Guindy', 'Chennai', 'Tamil Nadu', '600032', '9876543212', 'sales@capitalhyundai.in'),
(4, 'Trident Hyundai Delhi', '101 Connaught Place', 'New Delhi', 'Delhi', '110001', '9876543213', 'contact@tridentdelhi.com'),
(5, 'Prerana Motors Tata', '212 Hosur Road, Electronic City', 'Bengaluru', 'Karnataka', '560100', '9876543214', 'info@preranamotors.com'),
(6, 'Concorde Motors Tata Pune', '313 Pune-Satara Road', 'Pune', 'Maharashtra', '411009', '9876543215', 'pune@concordetata.com');

-- Customer Data
INSERT INTO Customer (first_name, last_name, phone_number, email, address, city, pincode) VALUES
('Aarav', 'Sharma', '9988776601', 'aarav.sharma@email.com', '101 MG Road', 'Bengaluru', '560001'),
('Vihaan', 'Verma', '9988776602', 'vihaan.verma@email.com', '202 Park Street', 'Kolkata', '700016'),
('Vivaan', 'Singh', '9988776603', 'vivaan.singh@email.com', '303 Marine Drive', 'Mumbai', '400020'),
('Aditya', 'Kumar', '9988776604', 'aditya.kumar@email.com', '404 Anna Salai', 'Chennai', '600002'),
('Reyansh', 'Patel', '9988776605', 'reyansh.patel@email.com', '505 Ashram Road', 'Ahmedabad', '380009'),
('Ayaan', 'Gupta', '9988776606', 'ayaan.gupta@email.com', '606 Janpath', 'New Delhi', '110001'),
('Arjun', 'Reddy', '9988776607', 'arjun.reddy@email.com', '707 Banjara Hills', 'Hyderabad', '500034'),
('Sai', 'Rao', '9988776608', 'sai.rao@email.com', '808 FC Road', 'Pune', '411004'),
('Ishaan', 'Malhotra', '9988776609', 'ishaan.malhotra@email.com', '909 Koramangala', 'Bengaluru', '560095'),
('Anaya', 'Jain', '9988776610', 'anaya.jain@email.com', '111 Brigade Road', 'Bengaluru', '560025'),
('Saanvi', 'Mishra', '9988776611', 'saanvi.mishra@email.com', '212 Salt Lake', 'Kolkata', '700091'),
('Kiara', 'Chopra', '9988776612', 'kiara.chopra@email.com', '313 Juhu', 'Mumbai', '400049'),
('Diya', 'Mehta', '9988776613', 'diya.mehta@email.com', '414 T Nagar', 'Chennai', '600017'),
('Pari', 'Shah', '9988776614', 'pari.shah@email.com', '515 Satellite', 'Ahmedabad', '380015'),
('Myra', 'Aggarwal', '9988776615', 'myra.aggarwal@email.com', '616 Saket', 'New Delhi', '110017'),
('Aadhya', 'Iyer', '9988776616', 'aadhya.iyer@email.com', '717 Gachibowli', 'Hyderabad', '500032'),
('Anika', 'Naidu', '9988776617', 'anika.naidu@email.com', '818 Hinjewadi', 'Pune', '411057'),
('Riya', 'Kapoor', '9988776618', 'riya.kapoor@email.com', '919 Indiranagar', 'Bengaluru', '560038'),
('Kabir', 'Bose', '9988776619', 'kabir.bose@email.com', '121 Ballygunge', 'Kolkata', '700019'),
('Zoya', 'Khan', '9988776620', 'zoya.khan@email.com', '222 Bandra', 'Mumbai', '400050'),
('Rohan', 'Menon', '9988776621', 'rohan.menon@email.com', '323 Velachery', 'Chennai', '600042'),
('Advik', 'Pillai', '9988776622', 'advik.pillai@email.com', '424 Navrangpura', 'Ahmedabad', '380009'),
('Arnav', 'Joshi', '9988776623', 'arnav.joshi@email.com', '525 Hauz Khas', 'New Delhi', '110016'),
('Aryan', 'Nair', '9988776624', 'aryan.nair@email.com', '626 Jubilee Hills', 'Hyderabad', '500033'),
('Dhruv', 'Kulkarni', '9988776625', 'dhruv.kulkarni@email.com', '727 Kothrud', 'Pune', '411038'),
('Krishna', 'Murthy', '9988776626', 'krishna.murthy@email.com', '828 Jayanagar', 'Bengaluru', '560041'),
('Mohammed', 'Ali', '9988776627', 'mohammed.ali@email.com', '929 Howrah', 'Kolkata', '711101'),
('Ritvik', 'Desai', '9988776628', 'ritvik.desai@email.com', '131 Powai', 'Mumbai', '400076'),
('Shaurya', 'Prakash', '9988776629', 'shaurya.prakash@email.com', '232 Adyar', 'Chennai', '600020'),
('Veer', 'Trivedi', '9988776630', 'veer.trivedi@email.com', '333 Bodakdev', 'Ahmedabad', '380054'),
('Yuvan', 'Chauhan', '9988776631', 'yuvan.chauhan@email.com', '434 Lajpat Nagar', 'New Delhi', '110024'),
('Zara', 'Baig', '9988776632', 'zara.baig@email.com', '535 Madhapur', 'Hyderabad', '500081'),
('Shanaya', 'Das', '9988776633', 'shanaya.das@email.com', '636 Viman Nagar', 'Pune', '411014'),
('Aarohi', 'Pawar', '9988776634', 'aarohi.pawar@email.com', '737 Whitefield', 'Bengaluru', '560066'),
('Ira', 'Ghosh', '9988776635', 'ira.ghosh@email.com', '838 Alipore', 'Kolkata', '700027'),
('Neha', 'Soni', '9988776636', 'neha.soni@email.com', '939 Colaba', 'Mumbai', '400005'),
('Pooja', 'Nadar', '9988776637', 'pooja.nadar@email.com', '141 Mylapore', 'Chennai', '600004'),
('Alia', 'Bhatia', '9988776638', 'alia.bhatia@email.com', '242 Maninagar', 'Ahmedabad', '380008'),
('Ranbir', 'Anand', '9988776639', 'ranbir.anand@email.com', '343 Karol Bagh', 'New Delhi', '110005'),
('Deepika', 'Shetty', '9988776640', 'deepika.shetty@email.com', '444 Kondapur', 'Hyderabad', '500084'),
('Hrithik', 'Patil', '9988776641', 'hrithik.patil@email.com', '545 Baner', 'Pune', '411045'),
('Kareena', 'Rao', '9988776642', 'kareena.rao@email.com', '646 Marathahalli', 'Bengaluru', '560037'),
('Shahid', 'Dutta', '9988776643', 'shahid.dutta@email.com', '747 Park Circus', 'Kolkata', '700017'),
('Priyanka', 'Thakur', '9988776644', 'priyanka.thakur@email.com', '848 Worli', 'Mumbai', '400018'),
('Sameer', 'Sundaram', '9988776645', 'sameer.sundaram@email.com', '949 Besant Nagar', 'Chennai', '600090'),
('Tara', 'Vyas', '9988776646', 'tara.vyas@email.com', '151 Vastrapur', 'Ahmedabad', '380015'),
('Varun', 'Saxena', '9988776647', 'varun.saxena@email.com', '252 Dwarka', 'New Delhi', '110075'),
('Yash', 'Begum', '9988776648', 'yash.begum@email.com', '353 Secunderabad', 'Hyderabad', '500003'),
('Abhinav', 'Chavan', '9988776649', 'abhinav.chavan@email.com', '454 Deccan Gymkhana', 'Pune', '411004'),
('Bhavna', 'Gowda', '9988776650', 'bhavna.gowda@email.com', '555 HSR Layout', 'Bengaluru', '560102'),
('Chetan', 'Sarkar', '9988776651', 'chetan.sarkar@email.com', '656 New Town', 'Kolkata', '700156'),
('Divya', 'Tambe', '9988776652', 'divya.tambe@email.com', '757 Thane', 'Mumbai', '400601'),
('Esha', 'Krishnan', '9988776653', 'esha.krishnan@email.com', '858 Anna Nagar', 'Chennai', '600040'),
('Farhan', 'Pandey', '9988776654', 'farhan.pandey@email.com', '959 Gandhinagar', 'Ahmedabad', '382010'),
('Gauri', 'Rawat', '9988776655', 'gauri.rawat@email.com', '161 Noida', 'New Delhi', '201301'),
('Harsh', 'Hussain', '9988776656', 'harsh.hussain@email.com', '262 Begumpet', 'Hyderabad', '500016'),
('Ishita', 'Shinde', '9988776657', 'ishita.shinde@email.com', '363 Camp', 'Pune', '411001'),
('Jatin', 'Biswas', '9988776658', 'jatin.biswas@email.com', '464 BTM Layout', 'Bengaluru', '560076'),
('Kavya', 'Roy', '9988776659', 'kavya.roy@email.com', '565 Dum Dum', 'Kolkata', '700028'),
('Laksh', 'Yadav', '9988776660', 'laksh.yadav@email.com', '666 Chembur', 'Mumbai', '400071');


-- =================================================================
-- Section 2: Sale and Test Drive Data
-- =================================================================

-- Sale Data
-- Creating 30 sale records, linking inventory to customers.
-- NOTE: This assumes that the 30 cars with VINs starting 'SLD...' are present in the Inventory table.
INSERT INTO Sale (vin, customer_id, dealer_id, sale_date, final_on_road_price, payment_mode, salesperson_name) VALUES
('SLD1B2C3D4E5F6G701', 1, 1, '2025-06-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G701'), 'Finance', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G702', 2, 2, '2025-06-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G702'), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G703', 3, 3, '2025-06-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G703'), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G704', 4, 4, '2025-06-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G704'), 'Finance', 'Amit Patel'),
('SLD1B2C3D4E5F6G705', 5, 5, '2025-06-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G705'), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G706', 6, 6, '2025-06-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G706'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G707', 7, 1, '2025-07-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G707'), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G708', 8, 2, '2025-07-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G708'), 'Online', 'Suresh Singh'),
('SLD1B2C3D4E5F6G709', 9, 3, '2025-07-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G709'), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G710', 10, 4, '2025-07-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G710'), 'Cash', 'Amit Patel'),
('SLD1B2C3D4E5F6G711', 11, 5, '2025-07-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G711'), 'Cheque', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G712', 12, 6, '2025-07-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G712'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G713', 13, 1, '2025-07-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G713'), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G714', 14, 2, '2025-07-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G714'), 'Cash', 'Suresh Singh'),
('SLD1B2C3D4E5F6G715', 15, 3, '2025-07-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G715'), 'Finance', 'Priya Sharma'),
('SLD1B2C3D4E5F6G716', 16, 4, '2025-07-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G716'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G717', 17, 5, '2025-07-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G717'), 'Online', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G718', 18, 6, '2025-07-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G718'), 'Finance', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G719', 19, 1, '2025-08-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G719'), 'Cash', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G720', 20, 2, '2025-08-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G720'), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G721', 21, 3, '2025-08-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G721'), 'Online', 'Priya Sharma'),
('SLD1B2C3D4E5F6G722', 22, 4, '2025-08-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G722'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G723', 23, 5, '2025-08-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G723'), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G724', 24, 6, '2025-08-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G724'), 'Cash', 'Vikram Rathore'),
('SLD1B2C3D4E5F6G725', 25, 1, '2025-08-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G725'), 'Online', 'Ramesh Kumar'),
('SLD1B2C3D4E5F6G726', 26, 2, '2025-08-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G726'), 'Finance', 'Suresh Singh'),
('SLD1B2C3D4E5F6G727', 27, 3, '2025-08-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G727'), 'Cash', 'Priya Sharma'),
('SLD1B2C3D4E5F6G728', 28, 4, '2025-08-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G728'), 'Cheque', 'Amit Patel'),
('SLD1B2C3D4E5F6G729', 29, 5, '2025-08-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G729'), 'Finance', 'Sunita Gupta'),
('SLD1B2C3D4E5F6G730', 30, 6, '2025-08-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'SLD1B2C3D4E5F6G730'), 'Online', 'Vikram Rathore');

-- Test Drive Data
INSERT INTO Test_Drive (customer_id, dealer_id, variant_id, booking_date, drive_date_time, status) VALUES
(31, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), '2025-09-01', '2025-09-05 11:00:00', 'Completed'),
(32, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), '2025-09-02', '2025-09-06 14:00:00', 'Completed'),
(33, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), '2025-09-03', '2025-09-08 10:00:00', 'Completed'),
(34, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), '2025-09-04', '2025-09-09 16:00:00', 'Cancelled'),
(35, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), '2025-09-05', '2025-09-10 12:00:00', 'No Show'),
(36, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Fearless+ 1.2 Revotron DCT'), '2025-09-06', '2025-09-11 15:00:00', 'Completed'),
(37, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), '2025-09-07', '2025-09-12 11:30:00', 'Completed'),
(38, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), '2025-09-08', '2025-09-13 13:00:00', 'Scheduled'),
(39, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), '2025-09-09', '2025-09-14 09:00:00', 'Scheduled'),
(40, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), '2025-09-10', '2025-09-16 17:00:00', 'Scheduled'),
(41, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), '2025-09-11', '2025-09-17 10:30:00', 'Scheduled'),
(42, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), '2025-09-12', '2025-09-18 14:30:00', 'Cancelled'),
(43, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), '2025-09-13', '2025-09-19 12:30:00', 'Completed'),
(44, 2, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), '2025-09-14', '2025-09-20 15:30:00', 'No Show'),
(45, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), '2025-09-15', '2025-09-21 11:00:00', 'Scheduled'),
(46, 4, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), '2025-09-16', '2025-09-22 16:30:00', 'Scheduled'),
(47, 5, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), '2025-09-17', '2025-09-23 13:30:00', 'Completed'),
(48, 6, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), '2025-09-18', '2025-09-24 10:00:00', 'Completed'),
(49, 1, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), '2025-09-19', '2025-09-25 14:00:00', 'Scheduled'),
(50, 3, (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Kona Electric' AND cv.variant_name = 'Prime'), '2025-09-20', '2025-09-26 12:00:00', 'Scheduled');

-- End of script.

ALTER TABLE Car_Model ADD COLUMN image_url TEXT;


UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Brezza/Maruti-Suzuki-Brezza-Front-Three-Quarter-View.jpg' WHERE model_name = 'Brezza';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Swift/Maruti-Suzuki-Swift-Front-Three-Quarter-View.jpg' WHERE model_name = 'Swift';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Dzire/Maruti-Suzuki-Dzire-Front-Three-Quarter-View.jpg' WHERE model_name = 'Dzire';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Grand-Vitara/Maruti-Suzuki-Grand-Vitara-Front-Three-Quarter-View.jpg' WHERE model_name = 'Grand Vitara';
UPDATE Car_Model SET image_url = 'https://placehold.co/600x400/DD6B20/FFFFFF?text=Fronx' WHERE model_name = 'Fronx'; -- No URL provided, using placeholder
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Baleno/Maruti-Suzuki-Baleno-Front-Three-Quarter-View.jpg' WHERE model_name = 'Baleno';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Ertiga/Maruti-Suzuki-Ertiga-Front-Three-Quarter-View.jpg' WHERE model_name = 'Ertiga';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Wagon-R/Maruti-Suzuki-Wagon-R-Front-Three-Quarter-View.jpg' WHERE model_name = 'Wagon R';
UPDATE Car_Model SET image_url = 'https://placehold.co/600x400/718096/FFFFFF?text=Alto+K10' WHERE model_name = 'Alto K10'; -- No URL provided, using placeholder
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/XL6/Maruti-Suzuki-XL6-Front-Three-Quarter-View.jpg' WHERE model_name = 'XL6';
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/Celerio/Maruti-Suzuki-Celerio-Front-Three-Quarter-View.jpg' WHERE model_name = 'Celerio';
UPDATE Car_Model SET image_url = 'https://placehold.co/600x400/38A169/FFFFFF?text=Ignis' WHERE model_name = 'Ignis'; -- No URL provided, using placeholder
UPDATE Car_Model SET image_url = 'https://images.carwale.com/images/car-images/800x600/Maruti-Suzuki/S-Presso/Maruti-Suzuki-S-Presso-Front-Three-Quarter-View.jpg' WHERE model_name = 'S-Presso';
UPDATE Car_Model SET image_url = 'https://placehold.co/600x400/DD6B20/FFFFFF?text=Invicto' WHERE model_name = 'Invicto'; -- No URL provided, using placeholder
UPDATE Car_Model SET image_url = 'https://placehold.co/600x400/805AD5/FFFFFF?text=Eeco' WHERE model_name = 'Eeco'; -- No URL provided, using placeholder

UPDATE Car_Model
SET image_url = '/images/swift.jpg'
WHERE model_name = 'Swift';

UPDATE Car_Model
SET image_url = '/images/brezza.jpg'
WHERE model_name = 'Brezza';

UPDATE Car_Model
SET image_url = '/images/dzire.jpg'
WHERE model_name = 'Dzire';

UPDATE Car_Model
SET image_url = '/images/baleno.jpg'
WHERE model_name = 'Baleno';

UPDATE Car_Model
SET image_url = '/images/celerio.jpg'
WHERE model_name = 'Celerio';

UPDATE Car_Model
SET image_url = '/images/wagon-r.jpg'
WHERE model_name = 'Wagon R';

UPDATE Car_Model
SET image_url = '/images/s-presso.jpg'
WHERE model_name = 'S-Presso';

UPDATE Car_Model
SET image_url = '/images/ertiga.jpg'
WHERE model_name = 'Ertiga';

UPDATE Car_Model
SET image_url = '/images/xl6.jpg'
WHERE model_name = 'XL6';

UPDATE Car_Model
SET image_url = '/images/grand-vitara.jpg'
WHERE model_name = 'Grand Vitara';

UPDATE Car_Model
SET image_url = '/images/invicto.jpg'
WHERE model_name = 'Invicto';

UPDATE Car_Model
SET image_url = '/images/ignis.jpg'
WHERE model_name = 'Ignis';

UPDATE Car_Model
SET image_url = '/images/alto_k10.jpg'
WHERE model_name = 'Alto K10';

UPDATE Car_Model
SET image_url = '/images/Fronx.jpg'
WHERE model_name = 'Fronx';

UPDATE Car_Model
SET image_url = '/images/eeco.jpg'
WHERE model_name = 'Eeco';

UPDATE Car_Model SET image_url = '/images/grand-i10-nios.jpg' WHERE model_name = 'Grand i10 Nios';
UPDATE Car_Model SET image_url = '/images/exter.jpg' WHERE model_name = 'Exter';
UPDATE Car_Model SET image_url = '/images/i20.jpg' WHERE model_name = 'i20';
UPDATE Car_Model SET image_url = '/images/aura.jpg' WHERE model_name = 'Aura';
UPDATE Car_Model SET image_url = '/images/verna.jpg' WHERE model_name = 'Verna';
UPDATE Car_Model SET image_url = '/images/venue.jpg' WHERE model_name = 'Venue';
UPDATE Car_Model SET image_url = '/images/creta.jpg' WHERE model_name = 'Creta';
UPDATE Car_Model SET image_url = '/images/alcazar.jpg' WHERE model_name = 'Alcazar';
UPDATE Car_Model SET image_url = '/images/tucson.jpg' WHERE model_name = 'Tucson';
UPDATE Car_Model SET image_url = '/images/kona-electric.jpg' WHERE model_name = 'Kona Electric';
UPDATE Car_Model SET image_url = '/images/elantra.jpg' WHERE model_name = 'Elantra';

INSERT INTO Inventory (vin, variant_id, dealer_id, manufacture_date, arrival_date, status, color) VALUES
-- ... (existing diverse in-stock inventory remains here) ...
-- Inventory to be sold (30 cars with re-allocated brands for disparity)
-- Maruti: 15 sales | Tata: 9 sales | Hyundai: 6 sales
('SLD1B2C3D4E5F6G701', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-05-01', '2025-05-15', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G702', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-05-02', '2025-05-16', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G703', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), 1, '2025-05-03', '2025-05-17', 'In Stock', 'Sizzling Red'),
('SLD1B2C3D4E5F6G704', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), 2, '2025-05-04', '2025-05-18', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G705', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), 1, '2025-05-05', '2025-05-19', 'In Stock', 'Oxford Blue'),
('SLD1B2C3D4E5F6G706', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), 2, '2025-05-06', '2025-05-20', 'In Stock', 'Magma Grey'),
('SLD1B2C3D4E5F6G707', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Wagon R' AND cv.variant_name = 'VXI'), 1, '2025-05-07', '2025-05-21', 'In Stock', 'Silky Silver'),
('SLD1B2C3D4E5F6G708', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Sigma'), 2, '2025-05-08', '2025-05-22', 'In Stock', 'Earthen Brown'),
('SLD1B2C3D4E5F6G709', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), 1, '2025-05-09', '2025-05-23', 'In Stock', 'Solid Fire Red'),
('SLD1B2C3D4E5F6G710', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Delta'), 2, '2025-05-10', '2025-05-24', 'In Stock', 'Arctic White'),
('SLD1B2C3D4E5F6G711', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'LXi'), 1, '2025-05-11', '2025-05-25', 'In Stock', 'Splendid Silver'),
('SLD1B2C3D4E5F6G712', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Zeta'), 2, '2025-05-12', '2025-05-26', 'In Stock', 'Nexa Blue'),
('SLD1B2C3D4E5F6G713', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'VXI AMT'), 1, '2025-05-13', '2025-05-27', 'In Stock', 'Sherwood Brown'),
('SLD1B2C3D4E5F6G714', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'VXi'), 2, '2025-05-14', '2025-05-28', 'In Stock', 'Auburn Red'),
('SLD1B2C3D4E5F6G715', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi'), 1, '2025-05-15', '2025-05-29', 'In Stock', 'Metallic Magma Grey'),
('SLD1B2C3D4E5F6G716', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 5, '2025-05-11', '2025-05-25', 'In Stock', 'Lunar White'),
('SLD1B2C3D4E5F6G717', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Oberon Black'),
('SLD1B2C3D4E5F6G718', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), 5, '2025-05-17', '2025-05-31', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G719', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), 6, '2025-05-18', '2025-06-01', 'In Stock', 'Fearless Purple'),
('SLD1B2C3D4E5F6G720', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Adventure CNG'), 5, '2025-05-24', '2025-06-07', 'In Stock', 'Tornado Blue'),
('SLD1B2C3D4E5F6G721', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), 6, '2025-05-05', '2025-05-19', 'In Stock', 'Midnight Plum'),
('SLD1B2C3D4E5F6G722', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Altroz' AND cv.variant_name = 'XE 1.2 Revotron'), 5, '2025-05-29', '2025-06-12', 'In Stock', 'Opera Blue'),
('SLD1B2C3D4E5F6G723', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Smart 2.0 Kryotec'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Ash Grey'),
('SLD1B2C3D4E5F6G724', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Smart 2.0 Kryotec'), 5, '2025-05-30', '2025-06-13', 'In Stock', 'Stellar Frost'),
('SLD1B2C3D4E5F6G725', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), 3, '2025-05-03', '2025-05-17', 'In Stock', 'Starry Night'),
('SLD1B2C3D4E5F6G726', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), 4, '2025-05-04', '2025-05-18', 'In Stock', 'Fiery Red'),
('SLD1B2C3D4E5F6G727', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), 3, '2025-05-09', '2025-05-23', 'In Stock', 'Atlas White'),
('SLD1B2C3D4E5F6G728', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), 4, '2025-05-10', '2025-05-24', 'In Stock', 'Abyss Black'),
('SLD1B2C3D4E5F6G729', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 3, '2025-05-15', '2025-05-29', 'In Stock', 'Robust Emerald Pearl'),
('SLD1B2C3D4E5F6G730', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), 4, '2025-05-16', '2025-05-30', 'In Stock', 'Abyss Black');

INSERT INTO Inventory (vin, variant_id, dealer_id, manufacture_date, arrival_date, status, color) VALUES
-- Inventory to be sold (30 cars with unique, realistic VINs)
-- Maruti: 15 sales | Tata: 9 sales | Hyundai: 6 sales
('MA1B2C3D4E5F6G701', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-05-01', '2025-05-15', 'In Stock', 'Arctic White'),
('MA1B2C3D4E5F6G702', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Alpha'), 2, '2025-05-02', '2025-05-16', 'In Stock', 'Nexa Blue'),
('MA1B2C3D4E5F6G703', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi+ AMT'), 1, '2025-05-03', '2025-05-17', 'In Stock', 'Sizzling Red'),
('MA1B2C3D4E5F6G704', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Alpha+'), 2, '2025-05-04', '2025-05-18', 'In Stock', 'Arctic White'),
('MA1B2C3D4E5F6G705', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'ZXi'), 1, '2025-05-05', '2025-05-19', 'In Stock', 'Oxford Blue'),
('MA1B2C3D4E5F6G706', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'ZXi'), 2, '2025-05-06', '2025-05-20', 'In Stock', 'Magma Grey'),
('MA1B2C3D4E5F6G707', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Wagon R' AND cv.variant_name = 'VXI'), 1, '2025-05-07', '2025-05-21', 'In Stock', 'Silky Silver'),
('MA1B2C3D4E5F6G708', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Fronx' AND cv.variant_name = 'Sigma'), 2, '2025-05-08', '2025-05-22', 'In Stock', 'Earthen Brown'),
('MA1B2C3D4E5F6G709', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'LXI'), 1, '2025-05-09', '2025-05-23', 'In Stock', 'Solid Fire Red'),
('MA1B2C3D4E5F6G710', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Baleno' AND cv.variant_name = 'Delta'), 2, '2025-05-10', '2025-05-24', 'In Stock', 'Arctic White'),
('MA1B2C3D4E5F6G711', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'LXi'), 1, '2025-05-11', '2025-05-25', 'In Stock', 'Splendid Silver'),
('MA1B2C3D4E5F6G712', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand Vitara' AND cv.variant_name = 'Zeta'), 2, '2025-05-12', '2025-05-26', 'In Stock', 'Nexa Blue'),
('MA1B2C3D4E5F6G713', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Dzire' AND cv.variant_name = 'VXI AMT'), 1, '2025-05-13', '2025-05-27', 'In Stock', 'Sherwood Brown'),
('MA1B2C3D4E5F6G714', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Ertiga' AND cv.variant_name = 'VXi'), 2, '2025-05-14', '2025-05-28', 'In Stock', 'Auburn Red'),
('MA1B2C3D4E5F6G715', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Swift' AND cv.variant_name = 'ZXi'), 1, '2025-05-15', '2025-05-29', 'In Stock', 'Metallic Magma Grey'),
('TA1B2C3D4E5F6G816', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Fearless+ AT'), 5, '2025-05-11', '2025-05-25', 'In Stock', 'Lunar White'),
('TA1B2C3D4E5F6G817', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Accomplished+ AT'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Oberon Black'),
('TA1B2C3D4E5F6G818', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon' AND cv.variant_name = 'Pure 1.5 Revotorq'), 5, '2025-05-17', '2025-05-31', 'In Stock', 'Fearless Purple'),
('TA1B2C3D4E5F6G819', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Nexon EV' AND cv.variant_name = 'LR Empowered+'), 6, '2025-05-18', '2025-06-01', 'In Stock', 'Fearless Purple'),
('TA1B2C3D4E5F6G820', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Punch' AND cv.variant_name = 'Adventure CNG'), 5, '2025-05-24', '2025-06-07', 'In Stock', 'Tornado Blue'),
('TA1B2C3D4E5F6G821', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Tiago' AND cv.variant_name = 'XZ+ 1.2 Revotron AMT'), 6, '2025-05-05', '2025-05-19', 'In Stock', 'Midnight Plum'),
('TA1B2C3D4E5F6G822', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Altroz' AND cv.variant_name = 'XE 1.2 Revotron'), 5, '2025-05-29', '2025-06-12', 'In Stock', 'Opera Blue'),
('TA1B2C3D4E5F6G823', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Harrier' AND cv.variant_name = 'Smart 2.0 Kryotec'), 6, '2025-05-12', '2025-05-26', 'In Stock', 'Ash Grey'),
('TA1B2C3D4E5F6G824', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Safari' AND cv.variant_name = 'Smart 2.0 Kryotec'), 5, '2025-05-30', '2025-06-13', 'In Stock', 'Stellar Frost'),
('HY1B2C3D4E5F6G925', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Grand i10 Nios' AND cv.variant_name = 'Asta 1.2 AMT'), 3, '2025-05-03', '2025-05-17', 'In Stock', 'Starry Night'),
('HY1B2C3D4E5F6G926', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'i20' AND cv.variant_name = 'Asta 1.0 Turbo DCT'), 4, '2025-05-04', '2025-05-18', 'In Stock', 'Fiery Red'),
('HY1B2C3D4E5F6G927', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Exter' AND cv.variant_name = 'SX (O) AMT'), 3, '2025-05-09', '2025-05-23', 'In Stock', 'Atlas White'),
('HY1B2C3D4E5F6G928', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Verna' AND cv.variant_name = 'SX+ 1.5 IVT'), 4, '2025-05-10', '2025-05-24', 'In Stock', 'Abyss Black'),
('HY1B2C3D4E5F6G929', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Creta' AND cv.variant_name = 'SX Plus 1.5 Turbo DCT'), 3, '2025-05-15', '2025-05-29', 'In Stock', 'Robust Emerald Pearl'),
('HY1B2C3D4E5F6G930', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), 4, '2025-05-16', '2025-05-30', 'In Stock', 'Abyss Black');

INSERT INTO Inventory (vin, variant_id, dealer_id, manufacture_date, arrival_date, status, color) VALUES
-- ... (Inventory data is correct and unchanged, omitted for brevity) ...
('MA1B2C3D4E5F6G701', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Brezza' AND cv.variant_name = 'ZXi+'), 1, '2025-05-01', '2025-05-15', 'In Stock', 'Arctic White'),
-- ... (rest of inventory data) ...
('HY1B2C3D4E5F6G930', (SELECT cv.variant_id FROM Car_Variant cv JOIN Car_Model cm ON cv.model_id = cm.model_id WHERE cm.model_name = 'Alcazar' AND cv.variant_name = 'Prestige 2.0 AT 7-Seater'), 4, '2025-05-16', '2025-05-30', 'In Stock', 'Abyss Black');


-- Section 4: Sale Data - CORRECTED SYNTAX
INSERT INTO Sale (vin, customer_id, dealer_id, sale_date, final_on_road_price, payment_mode, salesperson_name) VALUES
('MA1B2C3D4E5F6G701', 1, 1, '2025-06-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G701'), 'Finance', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G702', 2, 2, '2025-06-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G702'), 'Cash', 'Suresh Singh'),
('MA1B2C3D4E5F6G703', 3, 1, '2025-06-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G703'), 'Online', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G704', 4, 2, '2025-06-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G704'), 'Finance', 'Suresh Singh'),
('MA1B2C3D4E5F6G705', 5, 1, '2025-06-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G705'), 'Cheque', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G706', 6, 2, '2025-06-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G706'), 'Finance', 'Suresh Singh'),
('MA1B2C3D4E5F6G707', 7, 1, '2025-07-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G707'), 'Cash', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G708', 8, 2, '2025-07-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G708'), 'Online', 'Suresh Singh'),
('MA1B2C3D4E5F6G709', 9, 1, '2025-07-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G709'), 'Finance', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G710', 10, 2, '2025-07-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G710'), 'Cash', 'Suresh Singh'),
('MA1B2C3D4E5F6G711', 11, 1, '2025-07-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G711'), 'Cheque', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G712', 12, 2, '2025-07-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G712'), 'Finance', 'Suresh Singh'),
('MA1B2C3D4E5F6G713', 13, 1, '2025-07-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G713'), 'Online', 'Ramesh Kumar'),
('MA1B2C3D4E5F6G714', 14, 2, '2025-07-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G714'), 'Cash', 'Suresh Singh'),
('MA1B2C3D4E5F6G715', 15, 1, '2025-07-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'MA1B2C3D4E5F6G715'), 'Finance', 'Ramesh Kumar'),
('TA1B2C3D4E5F6G816', 16, 5, '2025-07-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G816'), 'Cheque', 'Sunita Gupta'),
('TA1B2C3D4E5F6G817', 17, 6, '2025-07-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G817'), 'Online', 'Vikram Rathore'),
('TA1B2C3D4E5F6G818', 18, 5, '2025-07-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G818'), 'Finance', 'Sunita Gupta'),
('TA1B2C3D4E5F6G819', 19, 6, '2025-08-01', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G819'), 'Cash', 'Vikram Rathore'),
('TA1B2C3D4E5F6G820', 20, 5, '2025-08-03', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G820'), 'Finance', 'Sunita Gupta'),
('TA1B2C3D4E5F6G821', 21, 6, '2025-08-05', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G821'), 'Online', 'Vikram Rathore'),
('TA1B2C3D4E5F6G822', 22, 5, '2025-08-07', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G822'), 'Cheque', 'Sunita Gupta'),
('TA1B2C3D4E5F6G823', 23, 6, '2025-08-10', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G823'), 'Finance', 'Vikram Rathore'),
('TA1B2C3D4E5F6G824', 24, 5, '2025-08-12', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'TA1B2C3D4E5F6G824'), 'Cash', 'Sunita Gupta'),
('HY1B2C3D4E5F6G925', 25, 3, '2025-08-15', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G925'), 'Online', 'Priya Sharma'),
('HY1B2C3D4E5F6G926', 26, 4, '2025-08-18', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G926'), 'Finance', 'Amit Patel'),
('HY1B2C3D4E5F6G927', 27, 3, '2025-08-20', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G927'), 'Cash', 'Priya Sharma'),
('HY1B2C3D4E5F6G928', 28, 4, '2025-08-22', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G928'), 'Cheque', 'Amit Patel'),
('HY1B2C3D4E5F6G929', 29, 3, '2025-08-25', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G929'), 'Finance', 'Priya Sharma'),
('HY1B2C3D4E5F6G930', 30, 4, '2025-08-28', (SELECT ROUND(cv.ex_showroom_price * 1.18) FROM Car_Variant cv JOIN Inventory i ON cv.variant_id = i.variant_id WHERE i.vin = 'HY1B2C3D4E5F6G930'), 'Online', 'Amit Patel');

-- Section 5: Update Inventory Status
UPDATE Inventory SET status = 'Sold' WHERE vin LIKE 'MA1B2C3D4E5F6G7%' OR vin LIKE 'TA1B2C3D4E5F6G8%' OR vin LIKE 'HY1B2C3D4E5F6G9%';
