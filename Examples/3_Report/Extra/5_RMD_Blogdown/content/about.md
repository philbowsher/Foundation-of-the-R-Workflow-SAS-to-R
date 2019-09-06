---
title: "About"
date: "2016-05-05T21:48:51-07:00"
---

This website is a POC *Immunogenicity Website* in which the R capabilities of various tools/packages are used to three‐tiered testing strategy is deployed here to **assess ADA**---a website fully conceived within a digital environment---instead of a **self-run report** that simply is an outputted html file.

* Client name: XYZ biologics, LLC (Formerly known as ABC Proteins, LLC)
  * XYZ Study No. CA123456
  
Therapeutic proteins have the potential to elicit an immune response
when administered to patients. An important aspect of developing
these medicines is to understand the immunogenicity and to be able
to communicate this information to patients, prescribers, and
regulators.

Anti-drug antibodies (ADA) have been implicated in infusion reactions and anaphylaxis as well as immune complex-mediated disease. ADA have also caused secondary treatment failures (loss of efficacy) and, in rare occasions, more serious thrombocytopenia and pure red cell aplasia. Therefore, ADA are a medical concern in terms of safety and long-term efficacy of the drug and it is critical to evaluate their development in all patients during clinical studies, not just in a symptom-driven manner. With a goal of guiding medical practice, the elucidation of ADA responses and their characteristics relative to clinical consequences is vital [@shankar2014assessment].

ADA comprises neutralizing and non-neutralizing ADA. Other terms that have been used for ADA include anti-therapeutic antibody (ATA), anti-product antibody (APA), or anti-biologic antibody (ABA).

+ Neutralizing ADA (NAb): ADA that inhibits or reduces the pharmacological activity of the biologic drug molecule, as determined by an *in vitro* test or animal-based bioassay method, regardless of its *in vitro* clinical relavence (i.e., whether or not test method results relate to clinical impact in the subject).

+ Non-neutralizing ADA (non-neutralizing antibody, non-
NAb): ADA that binds to the biologic drug molecule but
does not inhibit its pharmacological activity in an in vitro
test or animal-based bioassay method, regardless of its in
vivo clinical relevance (i.e., whether or not test method
results relate to clinical impact in the subject).

ADA three‐tiered testing strategy is deployed here to assess ADA.

## Statistical Analysis

ADA Three‐tiered Testing Strategy

ADA	Positive	Sample: when	ADA	is	detected	in	a	sample,	the	sample	is	considered positive.

Anti-drug antibody (ADA): Biologic drug-reactive antibody, including pre-existing host antibodies that are cross-reactive with the administered biologic drug (baseline ADA).

### About

A brief explanation of the analysis and how this website was developed. The data are simulated example data sets for deploying the three‐tiered testing strategy.

This repository contains 3 data sets in csv format, that are SIMULATED, assuming lognormal distributions. The values in, and structures of the data as well as any potential conclusions or parameter estimates do not correspond to any real experiment. The purpose of the data sets is merely to illustrate possible (or inadequate) data structures and possible application of the various user interfaces and applications for assessing ADA.

### General Reference Texts

## Statistical Analysis

The cut-off values to determine whether a subject has *POSITIVE* or *NEGATIVE* ADA result are the screening cutpoint and confirmatory cutpoint. Please see here for more information:

Recommendations for the validation of immunoassays used for detection of host antibodies against biotechnology products.

https://www.ncbi.nlm.nih.gov/pubmed/18993008

Other documents include:

The quintessence of immunogenicity reporting for biotherapeutics

http://www.nature.com/nbt/journal/v33/n4/full/nbt.3181.html?message-global=remove

Assay Development and Validation for Immunogenicity Testing of Therapeutic Protein Products

https://www.fda.gov/downloads/Drugs/Guidances/UCM192750.pdf

Assessment and Reporting of the Clinical Immunogenicity of Therapeutic Proteins and Peptides – Harmonized Terminology and Tactical Recommendation

https://www.ncbi.nlm.nih.gov/pubmed/24764037

http://www.e-i-p.eu/wp-content/uploads/2013/01/Devanarayan_EIP_Leiden_2009.pdf

Cut points in immunogenicity assays are used to classify future specimens into anti-drug antibody (ADA) positive or negative. Five phenomena may complicate the statistical cut point estimation and are further explained here:

https://www.ncbi.nlm.nih.gov/pubmed/25733352

The goal of this study is to compare immunogenicity of humgensity12345 (new drug) after subcutaneous (SC) administrations in healthy subjects.  ADA levels for humgensity12345 were estimated to evaluate potential difference between the two products in the incidence of human immune responses.

This is a one center, single-blind, randomized, parallel, multiple-dose, safety and immunogenicity study. A total number of one hundred sixty five (164) healthy adult male and female subjects will be enrolled and randomized to 1 of 2 treatments (82 subjects per treatment).

Titer Definition

Smallest distinct dilution in a titration series with a negative response
Response is Sample ECL mean / Diluent Control ECL mean in this case study

In the experiment, samples will undergo the following steps (in order):

#### Tier 1 Screening

If the screening result is *NEGATIVE*, then the result will be recoreded  *NEGATIVE*, otherwise screening *POSITIVE* and continue

#### Tier 2 Confirmatory

If the result is *NEGATIVE*, then the subject will have a confirmatory *NEGATIVE* result, otherwise a *POSITIVE* result with a "titer" value recorded and continue

#### Tier 3 Titer

If the result is *POSITIVE*, with a "titer" value recorded and continue and there will be no more test.

_**Three‐tiered Testing Strategy**_

This document will walk through the steps and procedues for assessing the immune response of a therapeutic protein when administered to patients by identifying positive samples through a three‐tiered testing strategy.

Tiered approach for immunogenicity sample analysis will be outlined. First, the screen assay is used to determine whether samples are positive or negative for the presence of ADA, then followed by a confirmatory analysis utilizing the percent signal inhibition, then further characterization such as ADA titer is reported with positive samples and further drug-neutralizing potential is investigated.

#### Interactive Three Tier immunogenicity Application

Just static pages but you can call a external shiny app with an iframe like this:

```{r}
knitr::include_app("https://beta.rstudioconnect.com/philbowsher/050-kmeans-example/", 
  height = "600px")
  
```

### References

A collection of external references that users might find useful. Where possible, links to the sources are included.

@Book{xie2015,
  title = {Dynamic Documents with {R} and knitr},
  author = {Yihui Xie},
  publisher = {Chapman and Hall/CRC},
  address = {Boca Raton, Florida},
  year = {2015},
  edition = {2nd},
  note = {ISBN 978-1498716963},
  url = {http://yihui.name/knitr/},
}

@article{shankar2014assessment,
  title={Assessment and reporting of the clinical immunogenicity of therapeutic proteins and peptides-harmonized terminology and tactical recommendations},
  author={Shankar, Gopi and Arkin, S and Cocea, L and Devanarayan, V and Kirshner, S and Kromminga, A and Quarmby, V and Richards, S and Schneider, CK and Subramanyam, M and others},
  journal={The AAPS journal},
  volume={16},
  number={4},
  pages={658--673},
  year={2014},
  publisher={Springer}
}
