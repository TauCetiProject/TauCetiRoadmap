module

import Mathlib

/-!
# Galois sections and p-adic period mappings: target signatures

The roadmap is README.md; this file is not the roadmap. It records which headline theorems
can be stated against the pinned Mathlib and Tau Ceti APIs. None of the following headline
theorems is statable at these pins. Their missing carriers require substantive constructions,
rather than a few simple definitions on native carriers.

* README §0.5, Harari–Stix finite-descent/section equivalence (Harari–Stix Theorem 2.1), is not statable: it lacks arithmetic étale fundamental groups, their section classes and the finite-torsor descent construction, including for non-proper separated finite-type schemes.
* README §1.8, Selmer sections localise into the Lawrence–Venkatesh locus (Betts–Stix Theorem 7.1), is not statable: it lacks section classes and relative étale H¹ of polarised abelian-by-finite families, with their actual fibre and Galois structures.
* README §2.1, full faithfulness of D_pH (Betts–Stix Theorem 2.9), is not statable: it lacks de Rham representations and the filtered discrete (φ,N,G_v)-module category.
* README §2.4, automorphism algebraicity and dimension bounds (Betts–Stix Proposition 2.16), is not statable: it lacks the algebraic-unramified (φ,N,G_v)-module category and its algebraic automorphism group functors.
* README §§3.2 and 3.4, conjugate-place and average Hodge–Tate identities (Betts–Stix Proposition 2.19 and Corollary 2.21), are not statable: they lack de Rham Galois representations, their period functors and labelled local filtered realisations.
* README §4.3, horizontal D_pst transport (Betts–Stix Theorem 3.22), is not statable: it lacks rigid closed polydiscs/polyannuli, de Rham pairs and horizontal potentially semistable period realisations.
* README §§4.4–4.5 and 5.3, model-free period control of local representations and symplectic pairs (Betts–Stix Theorem 3.3 and Propositions 3.5, 4.11), are not statable: they lack smooth proper rigid families, their relative cohomology and Gauss–Manin bundles, the p-adic period map and filtered discrete comparisons.
* README §6.8, principal trichotomy (Betts–Stix Proposition 6.7), is not statable: it lacks symplectic Galois pairs, their period realisations and the self-conjugate-place weight interface.
* README §§7.4–7.8, type-(a)/(b) period non-density and finiteness (Betts–Stix Propositions 6.9, 6.15 and Corollaries 6.10, 6.16), are not statable: they lack the actual Lagrangian period domains, filtered discrete retwists and their local-system period maps.
* README §§8.4–8.5, Kodaira–Parshin exclusion of type (c) and auxiliary-family existence (Betts–Stix Proposition 6.20 and Corollary 6.22), are not statable: they lack the Kodaira–Parshin family and its finite étale base fibres as local Galois sets.
* README §9.1, finiteness of the Lawrence–Venkatesh locus at self-conjugate places (Betts–Stix Theorem 6.5), is not statable: it lacks the Lawrence–Venkatesh locus attached to actual polarised abelian-by-finite families and their curve-completion cohomology.
* README §9.3, finiteness of Selmer localisations at self-conjugate places over any number field (Betts–Stix §1.1), is not statable: it lacks arithmetic curve section classes, Selmer sections and their localisation into the actual curve points over completions.
* README §9.4, finiteness of the Selmer-localisation image at every finite place without CM subfields (Betts–Stix Theorem A), is not statable: it lacks arithmetic curve section classes, Selmer sections and their localisation into the actual curve points over completions.
* README §9.5, finiteness of the finite-descent projection at every finite place without CM subfields (Betts–Stix Theorem B), is not statable: it lacks modified adelic points of a curve and its finite étale torsor descent locus.

The Mordell consequence has its owner in MordellLawrenceVenkatesh, Layer LV.11. The roadmap
uses its new locus theorem to give another proof, without adding a second declaration here.
-/

namespace TauCetiRoadmap.GaloisSectionsPadicPeriodMaps

end TauCetiRoadmap.GaloisSectionsPadicPeriodMaps
