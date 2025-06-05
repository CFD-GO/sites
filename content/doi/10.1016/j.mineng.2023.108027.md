---
doi: 10.1016/j.mineng.2023.108027
title: 'Processing of micro-CT images of granodiorite rock samples using convolutional
  neural networks (CNN), Part II: Semantic segmentation using a 2.5D CNN'
authors:
- A Roslin
- M Marsh
- B Provencher
- T Mitchell
- I Onederra
- C Leonardi
keywords:
- convolutional neural network
- deep learning
- igneous rocks
- micro-ct
- segmentation
- u-net 2.5d
date: '2023-04-01'
journal: Minerals Engineering
publisher: Elsevier Ltd
scopus_cite: 12
pub_type: Article
auto_content: yes                                  # DELETE THIS TO NOT AUTO GENERATE CONTENT
auto_data: yes                                     # DELETE THIS TO NOT AUTO GENERATE METADATA
mcf: publications
redirect: https://doi.org/10.1016/j.mineng.2023.108027 # DELETE THIS TO NOT REDIRECT
realauthors:
- A Roslin: A. Roslin
- M Marsh: M. Marsh
- B Provencher: B. Provencher
- T Mitchell: T.R. Mitchell
- I Onederra: I.A. Onederra
- C Leonardi: C.R. Leonardi
image: /img/doi/10.1016/j.mineng.2023.108027/firstpage.png
showonlyimage: yes
---


## Abstract
X-ray computed tomography (XCT) is routinely used in geosciences for the purpose of rock characterisation. High-quality micro-CT images are successfully used for fracture characterisation, as well as analysis of grains and pores. In contrast, the use of XCT for mineral identification is uncommon and often ineffective. Implementation of micro-CT imaging techniques for mineral identification is affected by the accuracy and precision of the image segmentation results. Conventional segmentation methods such as thresholding, watershed, and active contouring are user-biased and do not provide the robust distinction between various heavy accessory minerals in granite rocks. Heavy ore minerals such as pyrite, chalcopyrite, molybdenite, and ilmenite are readily recognised in grey-scale micro-CT images because of their high attenuation coefficient, but further differentiation between these minerals using only traditional segmentation methods is challenging. Conversely, deep convolutional neural networks (CNNs) are fully self-trained, and they have demonstrated accurate semantic segmentation results for rock images. However, the application of CNN semantic segmentation for igneous rocks is not well documented. In this research, the U-Net 2.5D CNN was deployed to train the neural network on a combination of high-resolution micro-CT and mineral liberation analysis (MLA) images to identify different accessory mineral regions of interest (ROIs). The image segmentation results were assessed using MLA and SEM data, and the accuracy of segmentation was found to be greater than 97%. The methodology developed in this study can be extended to map the mineralogy of granite samples unseen by the CNN to further validate the robustness of the approach.
