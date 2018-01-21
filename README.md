Proto Summer of Code 2016
# eScore - Knowledge verification protocol
_Protocol for Decentralized Knowledge Verification_

We propose a novel solution to the current practice of vaulted knowledge verification without introducing yet another middleware layer (academic currency). - A trustless data layer is used to prove that somebody acquired knowledge.

## Introduction - Example
_Bill Bates of Macrosoft, a highly sophisticated company, wishes to start a new project for which he requires 2 smart people. As nobody is available in-house he announces that 2 positions are vacant. Eventually, 3 applications arrive and Bill B. passes them on to HR for a recommendation that should be primarily optimized towards talent and secondarily towards cost._

HR reviews the candidates and notices that all three are, by coincidence, triplets separated by birth.

__Candidate 1.: Affluent Alice__  
    a) Degree of most reputable Hogwards University  
__Candidate 2.: Brave Berta__  
    a) Degree of undistinguished Woodlands University  
    b) Certificate in counting  
__Candidate 3.: Curious Cecilia__  
    a) Associates degree of Romanian State University  
    b) Certificate in counting  
    c) Online Diploma in Philosophy  

HR, after thorough consideration, makes the following recommendation.

-------------------------------------------------------------------

### Legacy Scenario:
1. Hire Alice, offer 100k. The degree signals a strong academic accomplishment, any less money would do her injustice (e.g. causing trouble repaying the high student debt likely incurred).
2. Either hire Berta, offer 60k or wait for another strong candidate.
3. If Berta is not available hire Cecilia, offer 40k, but better look for other options as her being on the team may scare off other ivy league candidates.

### eScore Scenario:

HR was able to decrypt the academic achievements of all candidates in high resolution and compare them accordingly:

Hogwards University Degree required the following proof of knowledge with Alice's answers:
>Q1: What is the capital of Sweden? -> Stockholm  
Q2: What is 2+2? -> 4  
Q3: What is the Ultimate Question, and what is its Answer? -> How to make peace in the middle east? Love.

Woodlands University Degree required the following proof of knowledge with Berta’s answers:
>Q1: What is the capital of Sweden? -> Stockholm  
Q2: What is the Ultimate Question, and what is its Answer? -> What is the purpose of life? 42.

Associates degree of Romanian state University required the following proof of knowledge from Cecilia:
>Q1: What is the capital of Sweden? -> Stockholmul

The Certificate in counting required the following proof of knowledge with Berta’s answer:
>Q1: What is 2+2? -> 4  
Ceclilia holding the same certificate answered likewise
Q1: What is 2+2? -> 4

The online diploma in Philosophy required the following proof of knowledge from Cecilia:
>Q1: What is the Ultimate Question, and what is its Answer? -> The Ultimate Question is ‘What is the Ultimate Question, and what is its Answer?’ and its answer is what has just been given.

#### Summary 

| Issuer | ≈ Price | Alice | Berta | Cecilia |
|--------|-------|-------|-------|---------|
| Hogwards | 100 | 2+n | - | - |
| Woodland | 50 | - | 1+n | - |
| Romania State | 40 | - | - | 1 |
| Cert. Counting | 10 | - | 1 | 1 |
| Online | 10 | - | - | n |
| Score | - | 2+n | 2+n | 2+n |
| Cost | - | 100 | 50 | 30 |

Blessed by the wealth of data the HR department makes the following eScore-based hiring recommendation to Bill B.

1. Hire Cecilia, offer 60k. She has all qualifications, speaks Romanian and can reason thoroughly.
2. Hire Berta, offer 40k.
3. If Berta is not available offer Alice an internship and wait for other applications.

__Conclusion:__ The new eScore protocol allows for cost reduction in staffing by up to 50% and potential speed increase while retaining the same knowledge capacity.

## Current Situation 
###Knowledge acquisition
1. Learning: get knowledge (i.e.: University Class)
2. Testing: proof knowledge (i.e.: University Exam)
3. Signaling: display knowledge (i.e.: Degree, Certificate, Diploma, Portfolio)

### Limitations
Testing is limited to specific institutions and only available at high cost (i.e.: attend University). A lot of invaluable knowlege goes unnoticed because it can not be proven/tested. Signaling is very fuzzy/incoherent. While knowledge can be verified by a test, it is hard to decrypt the test into the actual knowledge that it symbolizes.

## Approach
The goal is to provide a proof that an individual provided an answer to specific question under specific conditions.  
The questions must be individually verifiable.  
The Answer must be individually verifiable and refer to the question.

Those we propose a 
- database of questions accessible without UAC. //this could be only a hash of the question.
- database of answers that point to the specific question and to the individual. //this could be a hash of the answer with the public key of the candidate
- database of verifications that insure the question was answered under specific conditions.

### Example: Question, Answer, Verification

__Question:__ `"What is 2+2?"`  
Quizzer controlled Address: `1Ji8tqEefy12m8oxZqCV3NpS2PZcNTzuXa`  
Signature: `IEoDHFd3+gCvUnwlSaCrc3FfnDgL7ZGz+8MdpcJqUNnNIX6rk7/5NgcaSpe+XrSyWEFAz2NKikT7/BylA5ddF4E=`

__Answer:__ `"4"`  
Candidate controlled Address: `1Ji8tqEefy12m8oxZqCV3NpS2PZcNTzuXa`  
Signature: `ILyhTGwj6n1a0gehSnu9AvHmWJwXTS9dPn2/Jxe7YZHyaVmJR0V90y/NqoqQojoFL9XtutjlEpqqFXPY0uFquX8=`

__Verification:__ `"What is 2+2?,4"`  
Signed (Question, Answer): `"IEoDHFd3+gCvUnwlSaCrc3FfnDgL7ZGz+8MdpcJqUNnNIX6rk7/5NgcaSpe+XrSyWEFAz2NKikT7/BylA5ddF4E=,ILyhTGwj6n1a0gehSnu9AvHmWJwXTS9dPn2/Jxe7YZHyaVmJR0V90y/NqoqQojoFL9XtutjlEpqqFXPY0uFquX8="`  
Verifier controlled Address: `1BHpRdSvdnDs9Su3oLM5qpCiyJ9cBA8AhJ`  
Signature: `IMFtZViPX4eRMQA9GSEuY5l3Cm4F3BK+HNiFiy9r22XucefNAPe9ih1zccpiudJYQZuU2W4BvywyY1HKB8DnuT0=`

This can be verified at any time with the signatures above.

In order to make this tamper prove we need to store:
- Question, Quizzer controlled Address, Signature
- Answer, Candidate controlled Address, Signature
- Verification, Verifier controlled Address, Signature

>The question and answer should be accessible on general purpose storage, the Signature prevents any tampering. The verification and its signature need to be stored on an immutable medium to remain valid.

#### To be written on the blockchain: 
__Question:__ `IEoDHFd3+gCvUnwlSaCrc3FfnDgL7ZGz+8MdpcJqUNnNIX6rk7/5NgcaSpe+XrSyWEFAz2NKikT7/BylA5ddF4E=`  
__Answer:__ `ILyhTGwj6n1a0gehSnu9AvHmWJwXTS9dPn2/Jxe7YZHyaVmJR0V90y/NqoqQojoFL9XtutjlEpqqFXPY0uFquX8=`  
__Verification:__ `IMFtZViPX4eRMQA9GSEuY5l3Cm4F3BK+HNiFiy9r22XucefNAPe9ih1zccpiudJYQZuU2W4BvywyY1HKB8DnuT0=`

While the question can be recycled and used multiple times, the answers and Verification are unique and need to be recorded for each proof.

## Architecture
* Database 
    - Questions
    - Questions with corresponding Signature
    - Answers with corresponding signature
    - Verifiers identities listed
* Blockchain
    - Verification
* Interface (links questions, answers and verifications)
    - Add questions
    - Add answers
    - Verify candidate

### Problems
Bitcoin's `OP_RETURN` script does not provide enough bandwidth to effectively verify such a huge amount of data. IPFS could be one option. It is probably better to use an identity layer independent of the project (has yet to emerge).
The Questions and Answers could be baked together saving one signature.
What can be done about dishonest behavior? A separate mechanism could be employed if a proof of misconduct is established.

### Methodology
- Candidate
- Quizzer
- Verifier
- Supervisor

### Naming
- BitScore
- E-Score
- eScore
- ScoreCheck
- WeScore

## Usefull Projects
__Simple Proof__  
[BitProof] (https://cointelegraph.com/news/bitproof-17-year-old-entrepreneur-brings-university-diplomas-to-the-blockchain)  
[BlockSign] (https://bitcoinmagazine.com/articles/blocksign-signing-documents-on-the-blockchain-1416508388)  
[ProveBit] (https://github.com/thereal1024/ProveBit)  
[Proof of Existence] (https://proofofexistence.com/)  
[Stampd] (https://stampd.io)  
[Stampery] (https://stampery.com/)  
[Jared Pereira] (https://blog.otlw.co/) https://github.com/otlw/assess

__Digital Assets__  
[Factom] (http://factom.com/)  
[CoinSpark] (http://coinspark.org/)

__Resources__  
[The Case Against Education - George Mason University](https://www.google.pt/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjsx4nvyr_QAhVL82MKHceuCqMQFggbMAA&url=http%3A%2F%2Feconfaculty.gmu.edu%2Fbcaplan%2Fihseduc.ppt&usg=AFQjCNH2kbxpiEigc9mBgd2vrAa3yP1ATA&sig2=mxvHNVVZPIhQMpxXuHZLrA)  
Quick [Presentation] (https://docs.google.com/presentation/d/1W4cLfVhBUqLAVsUmegJU9W2TTI1TI6rsHSRHgElrkiA/pub?start=false&loop=false&delayms=5000)  
[Self-Sovereign-Identiy](https://github.com/ChristopherA/self-sovereign-identity)
