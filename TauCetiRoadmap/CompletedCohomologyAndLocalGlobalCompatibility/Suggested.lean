import Mathlib

/-!
# Completed cohomology and p-adic local–global compatibility: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. Statements here suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

No headline theorem is statable against the pinned Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The signatures require the following
mathematical objects, whose construction is specified in the README:

* The integral-isomorphism criterion of §0.1 requires the category of O-torsion-free,
  ϖ-adically admissible representations over a complete local noetherian O-algebra,
  rational isomorphism and injectivity on the residual maximal-ideal socles.
* The local correspondence and completion theorems of §§0.2–0.4 require the admissible
  integral and Banach representation categories, Colmez's correspondence, the Montréal
  functor, Galois deformation rings and projective block envelopes. Sections 0.2–0.4
  transport the shared correspondences and comparisons supplied by
  PadicLocalLanglandsForGL2Qp, including its block, Montréal and full Weil–Deligne
  type interfaces. They construct the cohomological coefficient, dual and determinant
  adapters and arithmetic product blocks. The p = 3 envelope and removal comparisons
  and the all-prime absolutely irreducible universal family are supplied by
  PadicLocalLanglandsForGL2Qp §§5.8–5.9, retaining scalar residual endomorphisms and
  both cyclotomic-extension exclusions for the envelope comparisons. Its §§0.1, 0.3–0.5
  supply the shared duality and Banach categories, continuous deformation and type rings,
  affine cycles and multiplicity theory. CompletedCohomologyPartII,
  LocalGaloisDeformationRings and DeformationAndDerivedPatchingAlgebra supply the
  tower, local-condition and patching comparisons on those common foundations.
  The Scholze finiteness theorem of §0.6 requires the Lubin–Tate period torsor and its
  equivariant étale sheaves.
  The definite unitary input of §0.7 specializes the common forms carrier and weighted
  Hecke adapter of AutomorphicFormsOnReductiveGroups §§7.4–7.5, with inverse coefficient
  action and the stated monoid-extension and base-change hypotheses. Its arithmetic
  unitary group, weight/type normalization and completed tower are also required.
* The non-Eisenstein injectivity and regular-representation theorem of §1.4, classical
  comparison and density of §§2.1–2.2, Serre-weight theorem of §2.4 and homological and
  quaternionic comparisons of §§2.6–2.8 require the actual modular, Shimura-curve and
  definite quaternionic towers, their coefficient cohomology and their Hecke actions.
  Section 1.5's integral duality also requires the selected torsion object's divisibility
  and compatible coefficient comparisons; central-character compatibility alone does
  not supply them.
* The Hecke-valued Galois, factorisation and crystalline-density theorems of §§3.2–3.6
  require the arithmetic completed Hecke algebras, their universal representations and
  their classical loci. Residual localization in §3.4 selects the closed residual-idempotent
  summand with its inherited uniformizer-adic topology; it is distinct from ordinary
  maximal-ideal module completion. The Eisenstein comparison of §3.8 also requires
  determinant-fixed pseudo-deformation rings and the quaternionic Hecke quotient.
* Emerton's refined, Banach, mod-p and homological local–global theorems (§§4.4–4.7)
  require those completed towers and local Langlands families, with their coadmissible
  tensor products. The definite quaternionic theorem (§4.9), Pan's block compatibility
  and classicality (§4.11), and Scholze's Shimura-curve comparison (§4.12) additionally
  require the quaternionic Hecke modules, block functors and Scholze's cohomology functor.
* The arbitrary-rank patched-module theorem (§5.1), typed and locally algebraic
  comparisons (§5.2), trianguline component and tangent theorems (§5.2a), Emerton–Paškūnas
  support theorem (§5.3), Tung's odd-prime and dyadic full-support and Breuil–Mézard
  theorems (§§5.4, 5.6), and Pan's nice-prime and residually irreducible theorems
  (§§5.7–5.8) require arithmetic patched modules, universal Galois deformation rings,
  their Hodge-type quotients, and the associated trianguline spaces and cycles.
  The dyadic constructor also requires §3.7's augmented Hecke algebra with the auxiliary
  U-operator, pro-Iwahori level, distinct residual Frobenius roots and chosen residual
  factor. Its type, augmentation and partial-module comparisons retain that factor;
  generic rank one and the normalized cycles refer to this selected summand.
  The quaternionic patched module and one-place partial module (§§5.5–5.5a) also
  require the determinant-varying dyadic ring, its determinant-one fibre and its
  invariant ring, with the free twisting action and determinant torsor supplied by
  GlobalGaloisDeformations. Their completed-homology adapter, finite-free typed and
  partial comparisons, equivariant supports and normalized invariant-ring cycles
  are the constructions of §§5.5–5.5a. The modules also require the pseudo-compact
  representation categories with the inverse central character; their projectivity is stated in those categories, and their finite
  generation is over the indicated patched coefficient group algebra.
  The generic locally analytic Jacquet functor used in §5.2a is supplied by
  OverconvergentAutomorphicForms §0.6; the arithmetic analytic vectors, patched sheaf
  and trianguline comparisons are the constructions required here.
* Promodularity and the Fontaine–Mazur and Kisin consequences (§6.1), Böckle's `R = T`
  (§6.2), the global locally algebraic formula (§6.3) and supercuspidal globalisation
  (§6.4) require the arithmetic Hecke and deformation objects, p-adic Hodge conditions,
  local Langlands correspondence and classical or finite-slope automorphic forms.
  The locally algebraic formula uses the generic Breuil–Schneider/Colmez smooth
  factor, retaining the full reducible principal series at nongeneric crystalline
  parameters, together with the cohomological normalization bridge of §6.3.
  The algebraic type comparison of §2.8 pairs the contragredient type and dual
  lattice with the weight of §2.7; tame determinant compatibility in §3.2 uses
  inflation along the natural quotient between ramification-restricted Galois groups.

Absolute Galois groups, continuous representations, general linear groups, adic
completions, completed group algebras, continuous functions, annihilators and spectra
exist at these pins. They do not supply the arithmetic towers or the local functors
above. Defining those objects requires their mathematical constructions, beyond a few
auxiliary definitions on these carriers. Consequently no headline signatures are given.
-/

namespace TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

end TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility
