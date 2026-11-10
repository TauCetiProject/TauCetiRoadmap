module

import Mathlib

/-!
# Potential automorphy infrastructure, part II — polarized automorphy lifting and finiteness of deformation rings: target signatures

The roadmap is `README.md`; this file is not the roadmap. It records the roadmap's headline
theorems as target signatures against the pinned Mathlib and Tau Ceti. No headline theorem is
statable at the pinned commits, so this file declares nothing; each headline is listed below with
the carriers it lacks. Mathlib supplies absolute Galois groups
(`Field.absoluteGaloisGroup`), CM fields (`NumberField.IsCMField`), the cyclotomic character and
Krull dimension. It has no automorphic representations of `GL_n(𝔸_F)`, no Galois representations
attached to them, no `𝒢_n`-valued polarized representations and no Galois deformation rings. Every
headline below needs at least one of these carriers.

## Headline theorems and what each lacks

* Minimal, ordinary and fixed potentially crystalline type `R = T` on definite unitary groups
  (§§4.5–4.8). Lacks definite unitary automorphic Hecke modules, polarized global deformation
  rings and component conditions on local lifting rings.
* Generic `R = T` with strong or weak primitivity (§§7.19–7.20). Lacks the polarized ordinary
  deformation rings, their characteristic-polynomial subrings and ordinary Hecke comparison maps.
* Minimal automorphy lifting with adequate residual image (§5.1; Thorne 2012, Theorem 7.1;
  BLGGT14, Theorem 2.3.1). Lacks:
  * regular algebraic conjugate self-dual cuspidal representations and their `l`-adic Galois
    representations (AutomorphicGaloisRepresentationsPartII AG2.0–AG2.6);
  * `𝒢_n`-valued polarized representations and adequate subgroups (ArithmeticGaloisRepresentations
    §§7.4, 7.9);
  * the components of local lifting rings (LocalGaloisDeformationRings).
* Automorphy lifting at `p = 2` with strong residual oddness (§5.3; Thorne 2017, Theorem 5.1).
  Lacks the same carriers, and polarized deformation problems at `p = 2`.
* Ordinary automorphy lifting (§5.5; Geraghty, Theorem 5.3.2; BLGGT14, Theorem 2.4.1). Lacks:
  * `ι`-ordinary automorphic representations (PotentialAutomorphyInfrastructure §3.44);
  * ordinary Galois representations of weight `λ`.
* Finiteness of polarized deformation rings for fixed components and in the ordinary case
  (§§5.6–5.7). Lacks polarized global deformation rings (GlobalGaloisDeformations §§8.1–8.4).
* Potential ordinary automorphy of symplectic residual representations (§6.2; BLGGT14,
  Theorem 3.1.2). Lacks Galois representations of automorphic representations, and the lisse sheaves
  of the Dwork family.
* Ordinary crystalline lifts with prescribed local behaviour (§6.3; BLGGT14, Proposition 3.2.1).
  Lacks:
  * `𝒢_n`-valued polarized representations and their global deformation rings with local
    conditions given by components of local lifting rings (GlobalGaloisDeformations §§8.1–8.4,
    LocalGaloisDeformationRings);
  * ordinary representations of weight `λ` of local Galois groups.
* Potentially diagonalizable automorphy lifting (§6.5; BLGGT14, Theorem 4.2.1). Lacks potentially
  diagonalizable representations, which are defined through components of local lifting rings.
* Residually reducible automorphy lifting and finiteness, with strong and with weak primitivity
  (§§8.7–8.8, 8.17–8.18; Allen–Newton–Thorne, Theorems 6.1–6.2; Thorne 2015, Theorem 7.1). Lacks:
  * pseudodeformation rings of `𝒢_n`-valued Schur residual representations;
  * ordinary Hecke algebras of definite unitary groups.
* Vanishing of adjoint Bloch–Kato Selmer groups of unitary type (§9.7; Newton–Thorne 2023,
  Theorem A). Lacks Bloch–Kato Selmer groups of Galois representations attached to automorphic
  representations. The residue-field conclusion for semistable pseudodeformation rings at an
  automorphic point (§9.8) additionally lacks those constrained pseudodeformation rings.
* The almost minimal integral `R = T` theorem for rigid residual representations (§10.2;
  Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3). Lacks:
  * the étale cohomology of unitary Shimura varieties with integral local systems;
  * universal deformation rings of polarized problems.
* Rigidity and residual irreducibility for almost all primes (§10.3; Liu–Tian–Xiao–Zhang–Zhu,
  Corollary 4.1.2, Proposition 4.2.3 and Theorem 4.2.6). Lacks:
  * the compatible system of `l`-adic representations of an elliptic curve's symmetric powers and
    of a RACSDC automorphic representation;
  * rigidity of a residual `𝒢_N`-valued representation, defined through minimally ramified and
    Fontaine–Laffaille local deformation problems (LocalGaloisDeformationRings §§1.6, 2.20).
* Modularity lifting from polynomially generic local domains (§10.5; Le–Le Hung–Levin–Morra,
  Theorem 9.2.1). Lacks tame inertial types, potentially crystalline representations of fixed type,
  and automorphic representations with prescribed `K`-type.

The generic Serre weight theorem of Le–Le Hung–Levin–Morra (Theorem 9.1.6) and the change-of-weight
form of §10.5 (their Remark 9.2.2(1)) are not headlines of this roadmap: their proof uses change of
weight and level (ModularityAndLanglandsExtensions §2.32), which comes after this roadmap.
-/

namespace TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

end TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII
