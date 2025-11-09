import 'package:flutter/material.dart';

class RoadMapTab extends StatelessWidget {
  const RoadMapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          const Text(
            'Seu Mapa de Carreira',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Guiando você do ensino médio até a universidade',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Recommended Courses Section
          _buildSectionHeader('Cursos Recomendados', Icons.school),
          const SizedBox(height: 16),
          _buildRecommendedCourses(),
          const SizedBox(height: 32),

          // Opportunities Section
          _buildSectionHeader('Oportunidades e Descontos', Icons.local_offer),
          const SizedBox(height: 16),
          _buildOpportunities(),
          const SizedBox(height: 32),

          // Upcoming Events Section
          _buildSectionHeader('Próximos Eventos', Icons.event),
          const SizedBox(height: 16),
          _buildEvents(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEC8206).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFFEC8206)),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedCourses() {
    // TODO: Replace with actual data from API
    final courses = [
      {
        'name': 'Ciência da Computação',
        'university': 'MIT',
        'match': 95,
      },
      {
        'name': 'Engenharia de Software',
        'university': 'Universidade de Stanford',
        'match': 88,
      },
      {
        'name': 'Ciência de Dados',
        'university': 'UC Berkeley',
        'match': 82,
      },
      {
        'name': 'Sistemas de Informação',
        'university': 'Carnegie Mellon',
        'match': 75,
      },
      {
        'name': 'Administração de Empresas',
        'university': 'Universidade de Harvard',
        'match': 68,
      },
    ];

    return Column(
      children: courses.map((course) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildCourseCard(
            name: course['name'] as String,
            university: course['university'] as String,
            matchPercent: course['match'] as int,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCourseCard({
    required String name,
    required String university,
    required int matchPercent,
  }) {
    Color matchColor;
    if (matchPercent >= 80) {
      matchColor = Colors.green;
    } else if (matchPercent >= 60) {
      matchColor = Colors.orange;
    } else {
      matchColor = Colors.grey;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to course details
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Course Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEC8206).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school,
                  color: Color(0xFFEC8206),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),

              // Course Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_city,
                          size: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            university,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Match Percentage
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: matchColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: matchColor, width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: matchColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$matchPercent%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: matchColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpportunities() {
    // TODO: Replace with actual data from API
    final opportunities = [
      {
        'title': 'Universidade de Harvard - Bolsa por Mérito',
        'discount': '50%',
        'description':
            'Bolsa integral para estudantes com desempenho acadêmico excepcional e qualidades de liderança.',
        'universities': ['Universidade de Harvard', 'MIT', 'Universidade de Stanford'],
      },
      {
        'title': 'Programa de Excelência STEM',
        'discount': '30%',
        'description':
            'Programa de bolsas para estudantes que buscam áreas STEM com paixão e conquistas demonstradas em ciência e tecnologia.',
        'universities': [
          'UC Berkeley',
          'Carnegie Mellon',
          'Georgia Tech',
          'Caltech'
        ],
      },
      {
        'title': 'Bolsa para Primeira Geração Universitária',
        'discount': '40%',
        'description':
            'Auxílio financeiro para estudantes de primeira geração universitária para apoiar sua jornada educacional.',
        'universities': ['Universidade de Yale', 'Universidade de Princeton', 'Columbia'],
      },
    ];

    return Column(
      children: opportunities.map((opportunity) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildOpportunityCard(
            title: opportunity['title'] as String,
            discount: opportunity['discount'] as String,
            description: opportunity['description'] as String,
            universities: opportunity['universities'] as List<String>,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOpportunityCard({
    required String title,
    required String discount,
    required String description,
    required List<String> universities,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to opportunity details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and discount
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.local_offer,
                      color: Colors.amber,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Discount Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 1.5),
                    ),
                    child: Text(
                      discount,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),

              // Universities List
              const Text(
                'Aplicável em:',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: universities.map((university) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      university,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEvents() {
    // TODO: Replace with actual data from API
    final events = [
      {
        'title': 'Portas Abertas MIT 2025',
        'type': 'Presencial',
        'location': 'Cambridge, MA',
        'date': '2025-03-15',
      },
      {
        'title': 'Feira de Carreiras Virtual - Tecnologia',
        'type': 'Online',
        'location': 'Evento Virtual',
        'date': '2025-02-20',
      },
      {
        'title': 'Tour pelo Campus Stanford',
        'type': 'Presencial',
        'location': 'Stanford, CA',
        'date': '2025-03-28',
      },
      {
        'title': 'Workshop de Bolsas STEM',
        'type': 'Online',
        'location': 'Evento Virtual',
        'date': '2025-02-10',
      },
      {
        'title': 'Bootcamp de Candidatura Universitária',
        'type': 'Presencial',
        'location': 'São Paulo, SP',
        'date': '2025-04-05',
      },
    ];

    return Column(
      children: events.map((event) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildEventCard(
            title: event['title'] as String,
            type: event['type'] as String,
            location: event['location'] as String,
            date: event['date'] as String,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String type,
    required String location,
    required String date,
  }) {
    final isPresencial = type.toLowerCase() == 'presencial';
    final typeColor = isPresencial ? Colors.blue : Colors.purple;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to event details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and type
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isPresencial ? Icons.place : Icons.computer,
                      color: typeColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Title
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Type Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: typeColor, width: 1.5),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: typeColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Location
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _formatDate(date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
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

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        'Jan',
        'Fev',
        'Mar',
        'Abr',
        'Mai',
        'Jun',
        'Jul',
        'Ago',
        'Set',
        'Out',
        'Nov',
        'Dez'
      ];
      return '${date.day} de ${months[date.month - 1]}, ${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}

