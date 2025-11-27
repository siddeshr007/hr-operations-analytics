# HR Attrition Analysis - BA Report

## 1. Problem Statement

The company is experiencing higher-than-desired employee attrition and wants to understand:

- Which departments and roles are losing people the fastest.
- Which age bands and tenure ranges are at highest risk.
- What actions HR and management can take to reduce attrition.

This analysis uses the IBM HR Analytics Employee Attrition dataset.

---

## 2. Approach

1. Loaded the raw CSV into Excel and saved it as `hr_attrition.xlsx`.
2. Created two helper fields in the data:
   - **AgeBand** - groups employees into `<25`, `25-34`, `35-44`, `45-54`, `55+`.
   - **AttritionFlag** - 1 if `Attrition = "Yes"`, otherwise 0.
3. Built PivotTables to analyze attrition by:
   - Department
   - Job Role
   - AgeBand
   - YearsAtCompany
4. Created an interactive dashboard (`hr_attrition_dashboard.xlsx`) with:
   - KPIs (Total Employees, Attrition Count, Attrition Rate)
   - Charts for department, age band and years at company
   - Slicers for Department, Gender and MaritalStatus.

**Definition: Attrition Rate**

> Attrition Rate = Attrition Count ÷ Total Employees in that segment.

---

## 3. Key Metrics

From the dashboard KPIs:

- **Total employees:** 1,470  
- **Employees who left (attrition = "Yes"):** 237  
- **Overall attrition rate:** ~**16.1%**

This is a relatively high rate and worth deeper investigation.

---

## 4. Insights by Segment

### 4.1 By Department

From the `pivot_dept` table:

- **Sales:** 92 / 446 → **20.6%** attrition (highest)
- **Human Resources:** 12 / 63 → **19.1%**
- **Research & Development:** 133 / 961 → **13.8%**

**Takeaway:**  
Sales and HR are noticeably higher than R&D. Sales in particular looks like a “hot spot” for turnover and may require targeted interventions (compensation, quotas, management style, career path).

---

### 4.2 By Job Role

From `pivot_jobrole`:
------------------------------------------------------------------------------
| Job Role               | Attrition Count| Total Employees | Attrition Rate |
|------------------------|----------------|-----------------|----------------|
| Sales Representative   | 33             | 83              | **39.8%**      |
| Laboratory Technician  | 62             | 259             | **23.9%**      |
| Human Resources        | 12             | 52              | 23.1%          |
| Sales Executive        | 57             | 326             | 17.5%          |
| Research Scientist     | 47             | 292             | 16.1%          |
| Healthcare Representative | 9           | 131             | 6.9%           |
| Manufacturing Director | 10             | 145             | 6.9%           |
| Manager                | 5              | 102             | 4.9%           |
| Research Director      | 2              | 80              | 2.5%           |
------------------------------------------------------------------------------
**Takeaway:**

- **Sales Representative** is the single highest-risk role (~40% attrition).
- **Lab Technicians** and **HR** staff are also significantly above the company average.
- Senior roles (Managers, Directors) are relatively stable.

These roles should be top priority for retention efforts.

---

### 4.3 By Age Band

From `pivot_ageband`:
-----------------------------
| Age Band | Attrition Rate |
|----------|----------------|
| `<25`    | **39.2%**      |
| `25–34`  | 20.2%          |
| `35–44`  | 10.1%          |
| `45–54`  | 10.2%          |
| `55+`    | 15.9%          |
-----------------------------
**Takeaway:**

- Attrition is **highest among employees under 25**.
- Attrition remains elevated in the **25–34** age group, then drops significantly from 35–54.
- There is a moderate uptick again at **55+**, but the main risk is clearly early-career staff.

This suggests early tenure and early career expectations are not being met.

---

### 4.4 By Years at Company

From `pivot_years` and the chart on the dashboard:

- Attrition is **highest in the first few years (roughly 0–3 years)** at the company.
- After ~4–5 years, the number of leavers declines sharply.
- Very long-tenured employees (10+ years) have comparatively low attrition.

**Takeaway:**

Most employees who leave do so within their first few years, often before they become fully embedded in the organization. This is consistent with the age band finding.

---

### 4.5 Slicer-based Views (Department, Gender, Marital Status)

Using slicers on the dashboard, we can:

- Filter by **Department** to see, for example, whether Sales attrition is driven more by one gender or marital status group.
- Quickly compare attrition for **Male vs Female** employees within a given department or role.
- Check whether **Single vs Married** employees are more likely to leave in early tenure.

These interactive cuts allow HR to explore potential equity or demographic patterns before designing interventions.

---

## 5. Recommendations

Based on the analysis above:

### 5.1 Focus on Sales & High-Risk Roles

- Prioritize **Sales Representatives**, **Sales Executives**, **Lab Technicians**, and **HR staff** for deep-dive analysis.
- Conduct focused **pulse surveys** or small focus groups in these roles to understand:
  - Workload and stress levels
  - Pay/commission competitiveness
  - Managerial support and team culture
- Review **compensation structures, targets, and career paths** in Sales.

### 5.2 Improve Early Tenure Experience (0–3 Years)

- Introduce or strengthen:
  - Structured onboarding programs (first 90 days).
  - Buddy/mentorship programs for new hires.
  - Clear development plans within the first 6–12 months.
- Implement **“stay interviews”** at key milestones (e.g., 6 months, 1 year, 2 years) for early-career employees to surface issues before they resign.

### 5.3 Retain Younger Employees (<25 and 25–34)

- For younger employees, focus on:
  - Visible career paths and promotion criteria.
  - Training and skill development opportunities.
  - Rotational programs or internal mobility to keep work interesting.
- Consider whether expectations set during recruitment match the actual job.

### 5.4 Monitor and Address Demographic Patterns

- Use the **Gender** and **MaritalStatus** slicers to check for any groups with systematically higher attrition.
- If any disparities are found, investigate:
  - Work–life balance
  - Flexibility policies
  - Manager behavior or unconscious bias
- Ensure retention initiatives are inclusive and sensitive to different employee needs.

### 5.5 Establish Ongoing Monitoring

- Treat this dashboard as a **live tool**, not a one-off analysis.
- Refresh the data monthly or quarterly and track:
  - Overall attrition rate
  - Attrition in Sales and other high-risk roles
  - Attrition in the `<25` and `0–3 years` segments
- Set specific targets, e.g., “Reduce Sales Representative attrition from ~40% to <25% within 12 months”.

---

## 6. Next Steps

1. Present this dashboard and report to HR leadership and relevant business stakeholders.
2. Agree on a small set of **pilot retention initiatives** (e.g., improved onboarding in Sales, clearer promotion paths, mentoring for early-career staff).
3. Implement pilots, then re-measure attrition after 6–12 months using the same dashboard structure.
4. Scale successful interventions across the organization.
