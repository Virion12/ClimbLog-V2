import 'package:climblog_mobile/Riverpod/trening.riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/predict_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutGenerateDialog extends ConsumerStatefulWidget {
  const WorkoutGenerateDialog({super.key});

  @override
  ConsumerState<WorkoutGenerateDialog> createState() => _WorkoutGenerateDialogState();
}

class _WorkoutGenerateDialogState extends ConsumerState<WorkoutGenerateDialog> {
  String selectedLevel = 'Default';
  String selectedGender = 'Default';
  Set<String> selectedAreas = {'Core strength'};
  bool isLoading = false;
  
  final TextEditingController weightController = TextEditingController(text: '65');
  final TextEditingController heightController = TextEditingController(text: '175');
  final TextEditingController ageController = TextEditingController(text: '29');

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromARGB(255, 196, 33, 55),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> _generatePlan() async {
    setState(() => isLoading = true);
    
    try {
      final predictService = PredictService();
      final plan = await predictService.predict(
        "create training plan for ${selectedGender == "Default" ? "" : selectedGender} "
        "with weight: ${weightController.text}, height: ${heightController.text}, "
        "age: ${ageController.text} and is $selectedLevel climber, with focus on ${selectedAreas.toList()}"
      );
      
      ref.read(generatedPlanProvider.notifier).setPlan(plan);
      
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Błąd podczas generowania planu: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Training Plan Generator',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            
            // Climber level
            const Text('Climber level', style: TextStyle(fontSize: 13, color: Colors.black54)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: selectedLevel,
                isExpanded: true,
                underline: const SizedBox(),
                items: ['Default', 'Beginner', 'Intermediate', 'Advanced']
                    .map((level) => DropdownMenuItem(value: level, child: Text(level)))
                    .toList(),
                onChanged: isLoading ? null : (value) => setState(() => selectedLevel = value!),
              ),
            ),
            const SizedBox(height: 24),
            
            // Gender
            const Text('Gender', style: TextStyle(fontSize: 13, color: Colors.black54)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _MinimalButton(
                    label: 'Default',
                    isSelected: selectedGender == 'Default',
                    onTap: isLoading ? () {} : () => setState(() => selectedGender = 'Default'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _MinimalButton(
                    label: 'Male',
                    isSelected: selectedGender == 'Male',
                    onTap: isLoading ? () {} : () => setState(() => selectedGender = 'Male'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _MinimalButton(
                    label: 'Female',
                    isSelected: selectedGender == 'Female',
                    onTap: isLoading ? () {} : () => setState(() => selectedGender = 'Female'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Focused areas
            const Text('Focused areas', style: TextStyle(fontSize: 13, color: Colors.black54)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _MinimalChip(
                  label: 'Strength',
                  isSelected: selectedAreas.contains('Strength'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Strength') 
                      ? selectedAreas.remove('Strength') 
                      : selectedAreas.add('Strength')),
                ),
                _MinimalChip(
                  label: 'Endurance',
                  isSelected: selectedAreas.contains('Endurance'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Endurance') 
                      ? selectedAreas.remove('Endurance') 
                      : selectedAreas.add('Endurance')),
                ),
                _MinimalChip(
                  label: 'Technique',
                  isSelected: selectedAreas.contains('Technique'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Technique') 
                      ? selectedAreas.remove('Technique') 
                      : selectedAreas.add('Technique')),
                ),
                _MinimalChip(
                  label: 'Core strength',
                  isSelected: selectedAreas.contains('Core strength'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Core strength') 
                      ? selectedAreas.remove('Core strength') 
                      : selectedAreas.add('Core strength')),
                ),
                _MinimalChip(
                  label: 'Finger strength',
                  isSelected: selectedAreas.contains('Finger strength'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Finger strength') 
                      ? selectedAreas.remove('Finger strength') 
                      : selectedAreas.add('Finger strength')),
                ),
                _MinimalChip(
                  label: 'Dynamic',
                  isSelected: selectedAreas.contains('Dynamic'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Dynamic') 
                      ? selectedAreas.remove('Dynamic') 
                      : selectedAreas.add('Dynamic')),
                ),
                _MinimalChip(
                  label: 'Coordination',
                  isSelected: selectedAreas.contains('Coordination'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Coordination') 
                      ? selectedAreas.remove('Coordination') 
                      : selectedAreas.add('Coordination')),
                ),
                _MinimalChip(
                  label: 'Footwork',
                  isSelected: selectedAreas.contains('Footwork'),
                  onTap: isLoading ? () {} : () => setState(() => selectedAreas.contains('Footwork') 
                      ? selectedAreas.remove('Footwork') 
                      : selectedAreas.add('Footwork')),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Inputs
            Row(
              children: [
                Expanded(child: _MinimalInput(label: 'Weight', controller: weightController, enabled: !isLoading)),
                const SizedBox(width: 12),
                Expanded(child: _MinimalInput(label: 'Height', controller: heightController, enabled: !isLoading)),
                const SizedBox(width: 12),
                Expanded(child: _MinimalInput(label: 'Age', controller: ageController, enabled: !isLoading)),
              ],
            ),
            const SizedBox(height: 32),
            
            // Generate buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextButton(
                      onPressed: isLoading ? null : () {
                        Navigator.of(context).pop(false);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: isLoading ? Colors.grey : const Color.fromARGB(255, 196, 33, 55),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Cancel', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextButton(
                      onPressed: isLoading ? null : _generatePlan,
                      style: TextButton.styleFrom(
                        backgroundColor: isLoading ? Colors.grey : const Color(0xFF00a896),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text('Generate plan', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MinimalInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;

  const _MinimalInput({
    required this.label,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.black54)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF00a896)),
            ),
          ),
        ),
      ],
    );
  }
}

class _MinimalButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MinimalButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00a896) : Colors.transparent,
          border: Border.all(color: isSelected ? const Color(0xFF00a896) : Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _MinimalChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MinimalChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00a896) : Colors.transparent,
          border: Border.all(color: isSelected ? const Color(0xFF00a896) : Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}