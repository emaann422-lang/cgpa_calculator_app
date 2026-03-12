import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const CUIPortalApp());

// ===== COLOR CONSTANTS =====
class AppColors {
  static const Color bg = Color(0xFF0A0E1A);
  static const Color bgCard = Color(0xFF111827);
  static const Color bgCardLight = Color(0xFF1A2235);
  static const Color cyan = Color(0xFF00D4FF);
  static const Color cyanDark = Color(0xFF0099BB);
  static const Color gold = Color(0xFFFFD700);
  static const Color textPrimary = Color(0xFFEAEEF4);
  static const Color textSecondary = Color(0xFF7A8BA0);
  static const Color success = Color(0xFF00E5A0);
  static const Color warning = Color(0xFFFFAA44);
  static const Color danger = Color(0xFFFF4D6D);
  static const Color border = Color(0xFF1E2D40);
}

// ===== APP ROOT =====
class CUIPortalApp extends StatelessWidget {
  const CUIPortalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CUI CGPA Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Segoe UI',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.cyan,
          secondary: AppColors.gold,
          surface: AppColors.bgCard,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ===== SUBJECT MODEL =====
class Subject {
  String name;
  double mid, sess, finals;
  int credits;
  IconData icon;

  Subject({
    required this.name,
    this.credits = 3,
    this.icon = Icons.book_outlined,
    this.mid = 0,
    this.sess = 0,
    this.finals = 0,
  });

  double get total => mid + sess + finals;

  double get gradePoints {
    double t = total;
    if (t > 100) return 0.0;
    if (t >= 85) return 4.0;
    if (t >= 80) return 3.7;
    if (t >= 75) return 3.3;
    if (t >= 70) return 3.0;
    if (t >= 65) return 2.7;
    if (t >= 61) return 2.3;
    if (t >= 58) return 2.0;
    if (t >= 50) return 1.0;
    return 0.0;
  }

  String get letterGrade {
    double t = total;
    if (t >= 85) return 'A';
    if (t >= 80) return 'A-';
    if (t >= 75) return 'B+';
    if (t >= 70) return 'B';
    if (t >= 65) return 'B-';
    if (t >= 61) return 'C+';
    if (t >= 58) return 'C';
    if (t >= 50) return 'D';
    return 'F';
  }

  Color get gradeColor {
    double t = total;
    if (t >= 75) return AppColors.success;
    if (t >= 58) return AppColors.warning;
    return AppColors.danger;
  }
}

// ===== SEMESTER DATA PROVIDER =====
class SemesterData {
  static Map<int, List<Subject>> get allSemesters => {
    1: [
      Subject(name: 'ICT Fundamentals', credits: 3, icon: Icons.computer_outlined),
      Subject(name: 'Islamic Studies', credits: 2, icon: Icons.menu_book_outlined),
      Subject(name: 'Calculus & Analytical Geo', credits: 3, icon: Icons.functions_outlined),
      Subject(name: 'English Composition', credits: 3, icon: Icons.edit_outlined),
      Subject(name: 'Pak Studies', credits: 2, icon: Icons.flag_outlined),
    ],
    2: [
      Subject(name: 'Programming Fundamentals', credits: 4, icon: Icons.code_outlined),
      Subject(name: 'Discrete Structures', credits: 3, icon: Icons.schema_outlined),
      Subject(name: 'Applied Physics', credits: 3, icon: Icons.bolt_outlined),
      Subject(name: 'Linear Algebra', credits: 3, icon: Icons.grid_on_outlined),
      Subject(name: 'Communication Skills', credits: 2, icon: Icons.record_voice_over_outlined),
    ],
    3: [
      Subject(name: 'Object Oriented Programming', credits: 4, icon: Icons.widgets_outlined),
      Subject(name: 'Data Structures', credits: 4, icon: Icons.account_tree_outlined),
      Subject(name: 'Digital Logic Design', credits: 3, icon: Icons.memory_outlined),
      Subject(name: 'Probability & Statistics', credits: 3, icon: Icons.bar_chart_outlined),
      Subject(name: 'Technical Writing', credits: 2, icon: Icons.description_outlined),
    ],
    4: [
      Subject(name: 'Database Systems', credits: 4, icon: Icons.storage_outlined),
      Subject(name: 'Computer Organization', credits: 3, icon: Icons.developer_board_outlined),
      Subject(name: 'Design & Analysis of Algo', credits: 3, icon: Icons.timeline_outlined),
      Subject(name: 'Operating Systems', credits: 3, icon: Icons.settings_outlined),
      Subject(name: 'Numerical Computing', credits: 3, icon: Icons.calculate_outlined),
    ],
    5: [
      Subject(name: 'Software Engineering', credits: 3, icon: Icons.architecture_outlined),
      Subject(name: 'Computer Networks', credits: 3, icon: Icons.hub_outlined),
      Subject(name: 'Theory of Automata', credits: 3, icon: Icons.device_hub_outlined),
      Subject(name: 'Artificial Intelligence', credits: 3, icon: Icons.psychology_outlined),
      Subject(name: 'Web Engineering', credits: 3, icon: Icons.language_outlined),
    ],
    6: [
      Subject(name: 'Compiler Construction', credits: 3, icon: Icons.build_outlined),
      Subject(name: 'Information Security', credits: 3, icon: Icons.security_outlined),
      Subject(name: 'Human Computer Interaction', credits: 3, icon: Icons.touch_app_outlined),
      Subject(name: 'Mobile App Development', credits: 3, icon: Icons.phone_android_outlined),
      Subject(name: 'Professional Ethics', credits: 2, icon: Icons.gavel_outlined),
    ],
    7: [
      Subject(name: 'Final Year Project I', credits: 3, icon: Icons.rocket_launch_outlined),
      Subject(name: 'Machine Learning', credits: 3, icon: Icons.auto_awesome_outlined),
      Subject(name: 'Distributed Computing', credits: 3, icon: Icons.cloud_outlined),
      Subject(name: 'Elective I', credits: 3, icon: Icons.extension_outlined),
      Subject(name: 'Elective II', credits: 3, icon: Icons.tune_outlined),
    ],
    8: [
      Subject(name: 'Final Year Project II', credits: 6, icon: Icons.emoji_events_outlined),
      Subject(name: 'Elective III', credits: 3, icon: Icons.explore_outlined),
      Subject(name: 'Elective IV', credits: 3, icon: Icons.workspaces_outlined),
      Subject(name: 'Internship / Seminar', credits: 3, icon: Icons.work_outline),
    ],
  };
}

// ===== CGPA STORE (Simple State) =====
class CGPAStore {
  static final Map<int, List<Subject>> _data = {};

  static List<Subject> getSemester(int sem) {
    if (!_data.containsKey(sem)) {
      _data[sem] = SemesterData.allSemesters[sem] ?? [];
    }
    return _data[sem]!;
  }

  static double getSGPA(int sem) {
    final subjects = getSemester(sem);
    double pts = 0;
    int cr = 0;
    for (var s in subjects) {
      if (s.mid > 25 || s.sess > 25 || s.finals > 50) continue;
      pts += s.gradePoints * s.credits;
      cr += s.credits;
    }
    return cr == 0 ? 0.0 : pts / cr;
  }

  static double getCGPA() {
    double totalPts = 0;
    int totalCr = 0;
    for (int i = 1; i <= 8; i++) {
      final subjects = getSemester(i);
      for (var s in subjects) {
        if (s.mid > 25 || s.sess > 25 || s.finals > 50) continue;
        if (s.total == 0) continue;
        totalPts += s.gradePoints * s.credits;
        totalCr += s.credits;
      }
    }
    return totalCr == 0 ? 0.0 : totalPts / totalCr;
  }
}

// ===== SPLASH SCREEN =====
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoCtrl;
  late AnimationController _textCtrl;
  late AnimationController _btnCtrl;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _textOpacity;
  late Animation<double> _btnOpacity;

  @override
  void initState() {
    super.initState();

    _logoCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _textCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _btnCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

    _logoScale = Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut));
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _logoCtrl, curve: const Interval(0, 0.5)));

    _textSlide = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
        CurvedAnimation(parent: _textCtrl, curve: Curves.easeOutCubic));
    _textOpacity = Tween<double>(begin: 0, end: 1).animate(_textCtrl);

    _btnOpacity = Tween<double>(begin: 0, end: 1).animate(_btnCtrl);

    Future.delayed(const Duration(milliseconds: 200), () => _logoCtrl.forward());
    Future.delayed(const Duration(milliseconds: 700), () => _textCtrl.forward());
    Future.delayed(const Duration(milliseconds: 1200), () => _btnCtrl.forward());
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    _btnCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          Positioned(top: -80, right: -80, child: _bgCircle(280, AppColors.cyan.withOpacity(0.04))),
          Positioned(bottom: -100, left: -60, child: _bgCircle(320, AppColors.cyan.withOpacity(0.03))),
          Positioned(top: 200, left: -40, child: _bgCircle(150, AppColors.gold.withOpacity(0.03))),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _logoCtrl,
                      builder: (_, __) => Opacity(
                        opacity: _logoOpacity.value,
                        child: Transform.scale(
                          scale: _logoScale.value,
                          child: _buildLogo(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    AnimatedBuilder(
                      animation: _textCtrl,
                      builder: (_, __) => Opacity(
                        opacity: _textOpacity.value,
                        child: SlideTransition(
                          position: _textSlide,
                          child: _buildHeroText(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    AnimatedBuilder(
                      animation: _btnCtrl,
                      builder: (_, __) => Opacity(
                        opacity: _btnOpacity.value,
                        child: _buildStartButton(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bgCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cyan, AppColors.cyanDark],
        ),
        boxShadow: [
          BoxShadow(color: AppColors.cyan.withOpacity(0.35), blurRadius: 40, spreadRadius: 5),
        ],
      ),
      child: const Center(
        child: Icon(Icons.school_rounded, size: 56, color: Colors.white),
      ),
    );
  }

  Widget _buildHeroText() {
    return Column(
      children: [
        const Text(
          'CUI Grade Master',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'COMSATS University Islamabad\nVehari Campus',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.6,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _chip(Icons.bolt_outlined, 'Live CGPA'),
            _chip(Icons.layers_outlined, '8 Semesters'),
            _chip(Icons.grade_outlined, 'Grade Scale'),
          ],
        ),
      ],
    );
  }

  Widget _chip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgCardLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.cyan),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
              context, _slideRoute(const DashboardScreen())),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.cyan, AppColors.cyanDark],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyan.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Get Started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Track grades, calculate CGPA in real-time',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
      ],
    );
  }
}

// ===== DASHBOARD SCREEN =====
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double cgpa = CGPAStore.getCGPA();
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildTopBar()),
            SliverToBoxAdapter(child: _buildCGPAHero(cgpa)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Text('Select Semester',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 13, letterSpacing: 1.2)),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (ctx, i) => _buildSemesterCard(ctx, i + 1),
                  childCount: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CUI Grade Master', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w700)),
              Text('Vehari Campus', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bgCardLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(Icons.school_rounded, color: AppColors.cyan, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildCGPAHero(double cgpa) {
    String status = cgpa >= 3.5 ? 'Exceptional' : cgpa >= 3.0 ? 'Very Good' : cgpa >= 2.5 ? 'Good Standing' : cgpa > 0 ? 'Needs Improvement' : 'No Data Yet';
    Color statusColor = cgpa >= 3.0 ? AppColors.success : cgpa >= 2.5 ? AppColors.warning : cgpa > 0 ? AppColors.danger : AppColors.textSecondary;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D1F35), Color(0xFF091525)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cyan.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: AppColors.cyan.withOpacity(0.08), blurRadius: 30, spreadRadius: 2),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(100, 100),
                  painter: _ArcPainter(cgpa / 4.0),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(cgpa.toStringAsFixed(2),
                        style: const TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.w800)),
                    const Text('CGPA', style: TextStyle(color: AppColors.textSecondary, fontSize: 10, letterSpacing: 1.5)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(status, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 10),
                const Text('Cumulative GPA', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('Across all entered semesters', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: cgpa / 4.0,
                    minHeight: 6,
                    backgroundColor: AppColors.bgCardLight,
                    valueColor: AlwaysStoppedAnimation(cgpa >= 3.0 ? AppColors.success : AppColors.warning),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterCard(BuildContext context, int sem) {
    double sgpa = CGPAStore.getSGPA(sem);
    bool hasData = sgpa > 0;
    Color sgpaColor = sgpa >= 3.0 ? AppColors.success : sgpa >= 2.0 ? AppColors.warning : AppColors.textSecondary;
    List<Color> cardGradients = const [
      Color(0xFF0D1F35), Color(0xFF0E1E30),
    ];

    return GestureDetector(
      onTap: () async {
        await Navigator.push(context, _slideRoute(SemesterScreen(semester: sem)));
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: cardGradients),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: hasData ? AppColors.cyan.withOpacity(0.25) : AppColors.border,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.cyan.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.layers_outlined, size: 16, color: AppColors.cyan),
                  ),
                  if (hasData)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sgpaColor,
                        boxShadow: [BoxShadow(color: sgpaColor.withOpacity(0.5), blurRadius: 6)],
                      ),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Semester $sem',
                      style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(
                    hasData ? 'SGPA: ${sgpa.toStringAsFixed(2)}' : 'Tap to enter grades',
                    style: TextStyle(
                      color: hasData ? sgpaColor : AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight: hasData ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== SEMESTER SCREEN =====
class SemesterScreen extends StatefulWidget {
  final int semester;
  const SemesterScreen({Key? key, required this.semester}) : super(key: key);

  @override
  _SemesterScreenState createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  late List<Subject> subjects;

  @override
  void initState() {
    super.initState();
    subjects = CGPAStore.getSemester(widget.semester);
  }

  double get sgpa => CGPAStore.getSGPA(widget.semester);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildSGPABanner(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
                itemCount: subjects.length,
                itemBuilder: (ctx, i) => _buildSubjectCard(subjects[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.bgCardLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 16),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Semester ${widget.semester}',
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w700)),
              const Text('Enter your marks below',
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSGPABanner() {
    double s = sgpa;
    Color color = s >= 3.0 ? AppColors.success : s >= 2.0 ? AppColors.warning : AppColors.textSecondary;
    String label = s >= 3.5 ? 'Outstanding' : s >= 3.0 ? 'Very Good' : s >= 2.5 ? 'Good' : s > 0 ? 'Average' : 'Not Calculated Yet';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.12), color.withOpacity(0.04)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Semester GPA', style: TextStyle(color: AppColors.textSecondary, fontSize: 11, letterSpacing: 1.2)),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
          Text(s.toStringAsFixed(3),
              style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(Subject sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(sub.icon, color: AppColors.cyan, size: 20),
          ),
          title: Text(
            sub.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          subtitle: Row(
            children: [
              Text('${sub.credits} cr', style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
              const SizedBox(width: 10),
              if (sub.total > 0) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: sub.gradeColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(sub.letterGrade,
                      style: TextStyle(color: sub.gradeColor, fontSize: 11, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(width: 6),
                Text('${sub.total.toStringAsFixed(0)}/100',
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 11)),
              ],
            ],
          ),
          trailing: sub.total > 0
              ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.bgCardLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('${sub.gradePoints.toStringAsFixed(1)} pts',
                style: const TextStyle(color: AppColors.cyan, fontSize: 12, fontWeight: FontWeight.w600)),
          )
              : const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary),
          children: [
            _buildMarkRow(sub),
          ],
        ),
      ),
    );
  }

  Widget _buildMarkRow(Subject sub) {
    return Row(
      children: [
        Expanded(child: _marksInput('Mid Exam', 'Max 25', sub.mid, (v) => setState(() => sub.mid = v), sub.mid > 25)),
        const SizedBox(width: 10),
        Expanded(child: _marksInput('Sessional', 'Max 25', sub.sess, (v) => setState(() => sub.sess = v), sub.sess > 25)),
        const SizedBox(width: 10),
        Expanded(child: _marksInput('Final Exam', 'Max 50', sub.finals, (v) => setState(() => sub.finals = v), sub.finals > 50)),
      ],
    );
  }

  Widget _marksInput(String label, String hint, double current, Function(double) onChanged, bool isError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: current == 0 ? '' : current.toStringAsFixed(0),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (v) => onChanged(double.tryParse(v) ?? 0),
          style: TextStyle(color: isError ? AppColors.danger : AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 11),
            filled: true,
            fillColor: isError ? AppColors.danger.withOpacity(0.08) : AppColors.bgCardLight,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: isError ? AppColors.danger : AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: isError ? AppColors.danger : AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: isError ? AppColors.danger : AppColors.cyan),
            ),
          ),
        ),
      ],
    );
  }
}

// ===== CUSTOM ARC PAINTER =====
class _ArcPainter extends CustomPainter {
  final double progress;
  _ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;

    final bgPaint = Paint()
      ..color = AppColors.bgCardLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.cyan, AppColors.success],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.progress != progress;
}

// ===== ROUTE HELPER =====
PageRouteBuilder _slideRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
