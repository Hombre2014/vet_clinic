CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth date
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255)
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  CONSTRAINT FK_patient_id
  FOREIGN KEY (patient_id) 
  REFERENCES patients(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT FK_medical_history
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT FK_invoice
  FOREIGN KEY(invoice_id)
  REFERENCES invoices(id),
  CONSTRAINT FK_treatment
  FOREIGN KEY(treatment_id)
  REFERENCES treatments(id)
);

CREATE TABLE medical_hist_treatment (
  med_hist_id INT NOT NULL,
  treatm_id INT NOT NULL,
  FOREIGN KEY (med_hist_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatm_id) REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_hist_treatment (med_hist_id);
CREATE INDEX ON medical_hist_treatment (treatm_id);