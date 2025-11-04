# AWS EC2 Security Groups Explained 🔐

**Understand how AWS controls inbound and outbound traffic to your EC2 instances.**  
Visual, practical, and DevOps-ready.

---

## 🧠 Key Concepts

- Security Groups act as **instance-level firewalls**
- Network ACLs act at the **subnet level**
- SGs are **stateful**, NACLs are **stateless**
- Traffic rules control **inbound** (incoming) and **outbound** (outgoing) flows

---

## 📊 Inbound vs Outbound Rules

| Direction | Example | Purpose |
|------------|----------|----------|
| **Inbound** | Allow SSH (port 22) from your IP | Admin access |
| **Outbound** | Allow all | Internet updates |

---

## ⚙️ Best Practices

✅ Use least-privilege rules  
✅ Avoid `0.0.0.0/0` where not required  
✅ Group SGs by role (web, db, bastion)  
✅ Review regularly  

---

## 📈 Diagram

## 📊 1. Inbound & Outbound Traffic Flow
![Inbound & Outbound Traffic Flow](./images/AWS%20EC2%20Security%20Groups%20-%20AWS%20EC2%20Security%20Group%20Inbound%20%26%20Outbound%20Traffic%20Flow%20-%20the%20devops%20tooling.png)
> **Diagram 1:** Visualizing how inbound and outbound rules are applied in AWS Security Groups.  
> Source: [TheDevOpsTooling.com](https://thedevopstooling.com/aws-ec2-security-groups-explained/)

---

## 🧱 2. Security Groups vs Network ACLs
![Security Groups vs NACLs](./images/AWS%20EC2%20Security%20Groups%20-%20AWS%20Security%20Groups%20vs%20NACLs%20Instance%20vs%20Subnet%20Level%20-%20the%20devops%20tooling.png)
> **Diagram 2:** Instance-level (SG) vs Subnet-level (NACL) filtering.

---

## 🧩 3. Security Group Traffic Evaluation
![Traffic Evaluation](./images/AWS%20EC2%20Security%20Groups%20-%20Security%20Group%20Traffic%20Evaluation%20-%20the%20devops%20tooling.png)
> **Diagram 3:** Rule evaluation flow for AWS Security Groups.

---

## 🏗️ 4. Three-Tier Architecture Example
![Layered Security Architecture](./images/AWS%20EC2%20Security%20Groups%20-%20Three-Tier%20AWS%20Architecture%20Security%20Groups%20as%20Layered%20Shields%20-%20the%20devops%20tooling.png)
> **Diagram 4:** Web, App, and DB layer Security Groups in a three-tier AWS design.

---

## 🔗 Reference

Full post: [AWS EC2 Security Groups Explained](https://thedevopstooling.com/aws-ec2-security-groups-explained/)  
More guides at [TheDevOpsTooling.com](https://thedevopstooling.com)

---

### ✍️ Author
**Srikanth Ch** — Senior DevOps Engineer  
Follow for more AWS & DevOps tutorials: [@thedevopstooling](https://github.com/thedevopstooling)
