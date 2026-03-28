
|NN|	Название события            |	Контекст-источник   |	Домен   |	Попадает в аналитику?   |
|---|-------------------------------|-----------------------|-----------|---------------------------|
|1	| PatientRegistered	            |Пациентский контекст	|Клиники	|Да (обезличенно)
|2	| PatientConsentGiven	        |Пациентский контекст	|Клиники	|Да
|3	| EpisodeStarted	            |Медицинский контекст	|Клиники	|Нет (медданные)
|4	| EpisodeClosed	                |Медицинский контекст	|Клиники	|Нет (медданные)
|5	| StaffMemberHired	            |Персонал	            |Клиники	|Да
|6	| StockLevelChanged	            |Инвентаризация	        |Клиники	|Да
|7	| CreditApplicationSubmitted	|Кредитный контекст	    |Финтех	    |Да
|8	| CreditApplicationApproved	    |Кредитный контекст	    |Финтех	    |Да
|9	| CreditAgreementSigned	        |Кредитный контекст	    |Финтех	    |Да
|10	| TransactionCompleted	        |Платёжный контекст	    |Финтех	    |Да
|11	| InvoiceIssued	                |Финансовый учёт	    |Финтех	    |Да
|12	| PaymentOverdue	            |Кредитный контекст	    |Финтех	    |Да
|13	| AnalysisCompleted	            |Медицинский анализ	    |ИИ	|Нет (медданные)
|14	| AIMetricsCollected	        |Медицинский анализ	    |ИИ	|Да (обезличенно)
|15	| DataMartRefreshed	            |Аналитика	            |Головной офис	|Да
|16	| ReportGenerated	            |Аналитика	            |Головной офис	|Да

# Домен Клиники
## PatientRegistered
Пациент успешно зарегистрирован в системе после прохождения всех проверок (уникальность СНИЛС, валидация возраста, обязательных полей)

```json
{
  "event_id": "evt_pat_123e4567-e89b-12d3-a456-426614174000",
  "event_type": "PatientRegistered",
  "event_version": 1,
  "timestamp": "2024-01-15T10:30:00Z",
  "source_context": "patient_context",
  "source_domain": "clinics",
  "data": {
    "patient_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "full_name": "Иванов Иван Иванович",
    "birth_date": "1985-05-15",
    "snils": "123-456-789 01",
    "contact_info": {
      "phone": "+7 (999) 123-45-67",
      "email": "ivanov@example.com"
    },
    "consent_flags": {
      "credit_processing": true,
      "analytics": true,
      "marketing": false,
      "ai_analysis": true
    },
    "status": "ACTIVE"
  },
  "metadata": {
    "correlation_id": "corr_123",
    "user_id": "operator_456"
  }
}
```

## PatientConsentGiven
Пациент дал согласие на обработку персональных данных для указанных целей (кредитный скоринг, аналитика, ИИ-анализ)

```json
{
  "event_id": "evt_cons_123e4567-e89b-12d3-a456-426614174002",
  "event_type": "PatientConsentGiven",
  "event_version": 1,
  "timestamp": "2024-01-15T10:35:00Z",
  "source_context": "patient_context",
  "source_domain": "clinics",
  "data": {
    "patient_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "consent_type": "credit_processing",
    "valid_from": "2024-01-15T10:35:00Z",
    "valid_to": "2029-01-14T23:59:59Z"
  },
  "metadata": {
    "correlation_id": "corr_123"
  }
}
```

## EpisodeStarted
Начат новый эпизод лечения пациента (госпитализация или амбулаторный приём)

```json
{
  "event_id": "evt_ep_123e4567-e89b-12d3-a456-426614174003",
  "event_type": "EpisodeStarted",
  "event_version": 1,
  "timestamp": "2024-01-20T14:15:00Z",
  "source_context": "medical_context",
  "source_domain": "clinics",
  "data": {
    "episode_id": "ep_123e4567-e89b-12d3-a456-426614174003",
    "patient_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "department": "cardiology",
    "start_date": "2024-01-20T14:15:00Z",
    "status": "ACTIVE",
    "anonymized_metrics": {
      "age_group": "35-45",
      "department_type": "inpatient"
    }
  },
  "metadata": {
    "correlation_id": "corr_124",
    "anonymized": true,
    "medical_data_removed": true
  }
}
```

# Домен Финтех
## CreditApplicationSubmitted
Клиент подал заявку на получение кредита

```json
{
  "event_id": "evt_ca_123e4567-e89b-12d3-a456-426614174004",
  "event_type": "CreditApplicationSubmitted",
  "event_version": 1,
  "timestamp": "2024-01-22T09:00:00Z",
  "source_context": "credit_context",
  "source_domain": "fintech",
  "data": {
    "application_id": "app_123e4567-e89b-12d3-a456-426614174004",
    "customer_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "amount": 500000.00,
    "term_months": 24,
    "purpose": "treatment",
    "status": "PENDING"
  },
  "metadata": {
    "correlation_id": "corr_125"
  }
}
```

## CreditApplicationApproved
Кредитная заявка одобрена после выполнения скоринга

```json
{
  "event_id": "evt_ca_123e4567-e89b-12d3-a456-426614174005",
  "event_type": "CreditApplicationApproved",
  "event_version": 1,
  "timestamp": "2024-01-22T10:30:00Z",
  "source_context": "credit_context",
  "source_domain": "fintech",
  "data": {
    "application_id": "app_123e4567-e89b-12d3-a456-426614174004",
    "customer_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "approved_amount": 450000.00,
    "rate": 12.5,
    "term_months": 24
  },
  "metadata": {
    "correlation_id": "corr_125"
  }
}
```

## CreditAgreementSigned
Кредитный договор подписан клиенто
```json
{
  "event_id": "evt_ca_123e4567-e89b-12d3-a456-426614174006",
  "event_type": "CreditAgreementSigned",
  "event_version": 1,
  "timestamp": "2024-01-23T14:00:00Z",
  "source_context": "credit_context",
  "source_domain": "fintech",
  "data": {
    "agreement_id": "agr_123e4567-e89b-12d3-a456-426614174006",
    "application_id": "app_123e4567-e89b-12d3-a456-426614174004",
    "customer_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "amount": 450000.00,
    "rate": 12.5,
    "monthly_payment": 21250.00,
    "start_date": "2024-02-01T00:00:00Z",
    "end_date": "2026-01-31T23:59:59Z"
  },
  "metadata": {
    "correlation_id": "corr_125"
  }
}
```

## TransactionCompleted
Платёжная транзакция успешно выполнена

```json
{
  "event_id": "evt_tx_123e4567-e89b-12d3-a456-426614174007",
  "event_type": "TransactionCompleted",
  "event_version": 1,
  "timestamp": "2024-01-25T11:00:00Z",
  "source_context": "payment_context",
  "source_domain": "fintech",
  "data": {
    "transaction_id": "tx_123e4567-e89b-12d3-a456-426614174007",
    "from_account": "40702810123456789012",
    "to_account": "40702810987654321098",
    "amount": 21250.00,
    "currency": "RUB",
    "status": "COMPLETED",
    "reference": "credit_payment_agr_123"
  },
  "metadata": {
    "correlation_id": "corr_126"
  }
}
```

# Домен ИИ
## AnalysisCompleted
ИИ-анализ медицинских данных завершён. Не попадает в аналитику

```json
{
  "event_id": "evt_ai_123e4567-e89b-12d3-a456-426614174008",
  "event_type": "AnalysisCompleted",
  "event_version": 1,
  "timestamp": "2024-01-26T09:30:00Z",
  "source_context": "ai_analysis",
  "source_domain": "ai_services",
  "data": {
    "request_id": "req_123e4567-e89b-12d3-a456-426614174008",
    "patient_id": "pat_123e4567-e89b-12d3-a456-426614174001",
    "analysis_type": "xray_chest",
    "findings": "Обнаружено затемнение в верхней доле правого лёгкого",
    "confidence_score": 0.94,
    "recommendations": "Рекомендована консультация пульмонолога",
    "status": "COMPLETED"
  },
  "metadata": {
    "correlation_id": "corr_127",
    "contains_medical_data": true,
    "restricted_domains": ["analytics"]
  }
}
```

## AIMetricsCollected
Собраны обезличенные метрики работы ИИ-сервисов. Попадает в аналитику
```json
{
  "event_id": "evt_aim_123e4567-e89b-12d3-a456-426614174009",
  "event_type": "AIMetricsCollected",
  "event_version": 1,
  "timestamp": "2024-01-26T23:59:59Z",
  "source_context": "ai_analysis",
  "source_domain": "ai_services",
  "data": {
    "period_start": "2024-01-26T00:00:00Z",
    "period_end": "2024-01-26T23:59:59Z",
    "metrics": {
      "total_analyses": 1247,
      "avg_processing_time_ms": 2340,
      "analyses_by_type": {
        "xray": 680,
        "mri": 320,
        "blood_test": 247
      },
      "anomaly_rate": 0.15,
      "service_uptime": 0.999,
      "avg_confidence_score": 0.92
    }
  },
  "metadata": {
    "anonymized": true,
    "contains_medical_data": false
  }
}
```

# Домен Головной офис
## DataMartRefreshed
Витрина данных успешно обновлена актуальными данными

```json
{
  "event_id": "evt_dm_123e4567-e89b-12d3-a456-426614174010",
  "event_type": "DataMartRefreshed",
  "event_version": 1,
  "timestamp": "2024-01-27T01:00:00Z",
  "source_context": "analytics",
  "source_domain": "head_office",
  "data": {
    "mart_name": "patient_mart",
    "domain": "patients",
    "records_updated": 1523,
    "refresh_duration_ms": 45000,
    "status": "SUCCESS",
    "source_events_processed": 1247
  },
  "metadata": {
    "correlation_id": "corr_128"
  }
}
```

## ReportGenerated
Отчёт успешно сформирован и доступен пользователю
```json
{
  "event_id": "evt_rpt_123e4567-e89b-12d3-a456-426614174011",
  "event_type": "ReportGenerated",
  "event_version": 1,
  "timestamp": "2024-01-27T08:00:00Z",
  "source_context": "analytics",
  "source_domain": "head_office",
  "data": {
    "report_id": "rpt_123e4567-e89b-12d3-a456-426614174011",
    "report_name": "Кредитный портфель за январь",
    "report_type": "financial",
    "user_id": "analyst_789",
    "format": "PDF",
    "size_bytes": 245760,
    "generation_duration_ms": 3200
  },
  "metadata": {
    "correlation_id": "corr_129"
  }
}
```

