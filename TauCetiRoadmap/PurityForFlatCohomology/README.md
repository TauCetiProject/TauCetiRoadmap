# Roadmap: purity for flat cohomology and the conjectures of Gabber

**Summary.** This roadmap proves purity for flat cohomology after Česnavičius and Scholze: for a
Noetherian local ring `(R, 𝔪)` that is a complete intersection and a commutative finite flat
`R`-group `G`, the fppf cohomology with supports `H^i_𝔪(R, G)` vanishes for `i < dim R`, and for
`i ≤ dim R` when `R` is regular and not a field ([CS24], Theorems 6.2.3 and 6.2.7). It builds fppf
cohomology with supports on the big fppf site, the virtual dimension of a Noetherian local ring
with Gabber's bound on the étale depth and Zariski–Nagata purity in virtual dimension `≥ 3`, the
supported form of the crystalline key formula over perfect schemes, the supports, nilpotent
invariance, excision along finitely generated ideals and fpqc hyperdescent of the flat cohomology of
animated rings (whose construction, deformation triangle, `p`-adic continuity and excision along a
principal ideal it takes from PrismaticCohomologyPartIII), the key formula
`RΓ_Z(A, G) ≅ RΓ_Z(A_inf(A), 𝕄(G))^{V=1}` for perfectoid rings `A`, and purity for perfectoid rings.
From the local theorems it deduces global purity for finite flat coefficients, Moret-Bailly's
purity for torsors and gerbes, Gabber's conjectures on the local Picard group and the local Brauer
group of complete intersections, purity for groups of multiplicative type, and Česnavičius's purity
for the Brauer group of regular schemes ([C19], Theorems 1.1–1.4) with the codimension-one
description of `H²(X, 𝔾_m)` and the residue sequences of discrete valuation rings and regular
integral schemes.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-punctured-spectra-flat-cohomology-with-supports-and-hartogs-extension) | Punctured spectra, flat cohomology with supports and Hartogs extension | `puncturedSpectrum`, `RΓ_Z(X, F)` on the big fppf site, continuity, regular-sequence vanishing, Hartogs |
| [1](#layer-1-virtual-dimension-étale-depth-and-zariskinagata-purity) | Virtual dimension, étale depth and Zariski–Nagata purity | `virtualDimension`, local Lefschetz, Gabber's étale-depth bound, Zariski–Nagata purity for `vdim ≥ 3` |
| [2](#layer-2-the-crystalline-key-formula-over-perfect-schemes) | The crystalline key formula over perfect schemes | `RΓ_Z(S, G) ≅ RΓ_Z(W_n(S), 𝕄(G))^{V=1}` with supports, from the perfect-base Dieudonné triangle |
| [3](#layer-3-flat-cohomology-of-animated-rings) | Flat cohomology of animated rings | supports, nilpotent invariance, consequences of `p`-adic continuity, excision along finitely generated ideals, descent modulo `p` |
| [4](#layer-4-purity-in-positive-characteristic) | Purity in positive characteristic | root extraction, finite flat covers, purity for complete intersections over `𝔽_p` |
| [5](#layer-5-perfectoid-rings-dieudonné-modules-and-the-key-formula) | Perfectoid rings: Dieudonné modules and the key formula | arc descent of both sides, products of valuation rings, the key formula, perfectoid purity |
| [6](#layer-6-purity-for-complete-intersections-and-regular-local-rings) | Purity for complete intersections and regular local rings | [CS24] Theorems 6.2.3, 6.2.4, 6.2.7 |
| [7](#layer-7-global-purity-and-the-conjectures-of-gabber) | Global purity and the conjectures of Gabber | global purity, torsors, local Picard and Brauer conjectures, multiplicative type |
| [8](#layer-8-purity-for-the-brauer-group-and-for-tori-on-regular-schemes) | Purity for the Brauer group and for tori on regular schemes | [C19] Theorems 1.1–1.4, 6.1, 6.2, residue sequences |

```text
Mathlib + Tau Ceti → Layer 0 → Layer 1 ─────────────────────────────────→ Layer 6
                     Layer 0 → Layer 2 → Layer 3 → Layer 4 → Layer 5 → Layer 6 → Layer 7 → Layer 8
SchemeAndStackFoundations, LocalPurity, ModularCurves, EtaleCohomologyFoundations ─→ Layers 0, 1, 7, 8
DerivedDeRhamCohomology, DerivedModuleAlgebra, EnhancedDerivedSheaves ─────────────→ Layers 1, 3, 6
PerfectoidSpaces, PerfectoidQuotients, PerfectoidQuotientsPartII, PrismaticCohomology,
PrismaticCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory ────────────→ Layers 2, 5, 6
LefschetzPencilsAndVanishingCycles, PurityOfBranchLocus ────────────────────────────→ Layers 1, 6, 7
PrismaticCohomologyPartIII, DeformationAndDerivedPatchingAlgebra ───────────────────→ Layers 1–7
ArithmeticGaloisDuality ────────────────────────────────────────────────────────────→ Layer 8
```

The headline theorems stated in `Suggested.lean` are Zariski–Nagata purity in virtual dimension
`≥ 2` and `≥ 3` (`zariskiNagata_full_faithful_connected`, `zariskiNagata_isEquivalence`, §1.8),
Gabber's local Picard conjecture (`localPicard_torsion_eq_one`, §7.6) and the vanishing of the local
Picard group of a regular local ring (`localPicard_subsingleton`, §7.6), with
three classical inputs proved here: Katz's theorem on Frobenius-fixed vectors
(`frobeniusSemilinear_exists_fixed_basis`, §5.6), Auslander's freeness criterion
(`free_of_endomorphisms_iso_pi`, §7.2) and factoriality of regular local rings
(`isRegularLocalRing_uniqueFactorizationMonoid`, §7.4).
The flat-cohomological headline theorems are specified in this README; the module docstring of
`Suggested.lean` names the carrier each of them lacks at the pinned libraries.

## Scope and ownership

**This roadmap owns** the punctured spectrum of a semilocal ring; fppf cohomology with supports on
the big fppf site of a scheme with its local-to-global spectral sequence, excision, finite flat
descent and continuity; the non-Noetherian vanishing and Hartogs lemmas of [CS24] §7.2; Cohen
presentations, the Lean restatement `IsCompleteIntersection` of DeformationAndDerivedPatchingAlgebra
§3.4's absolute local complete intersection (used only for Noetherian local rings), and the virtual
dimension with its numerical independence of the presentation; the local étale duality statements
on excellent regular local rings used for the local Lefschetz theorem; Gabber's bound on the étale
depth; algebraization over punctured spectra and Zariski–Nagata purity in virtual dimension `≥ 3`;
the supported form of the crystalline key formula over perfect schemes ([CS24] (4.1.8.2) and
Corollary 4.1.9); the supports, nilpotent invariance, consequences of `p`-adic continuity, excision
along finitely generated ideals and fpqc hyperdescent of fppf cohomology of animated rings ([CS24]
§§5.2.4–5.2.10, 5.3.7–5.3.8, 5.4.3–5.4.5, 5.5); the positive-characteristic, perfectoid,
complete-intersection and regular purity theorems ([CS24] §§4.1, 4.2, 6); global purity, purity for
torsors and gerbes, factoriality of regular local rings, parafactorial local rings, Gabber's local
Picard and Brauer conjectures, the Brauer comparison of Gabber and de Jong, groups of multiplicative
type over a scheme and purity for them ([CS24] §7); and purity for the Brauer group and for tori
with the codimension-one and residue descriptions ([C19] §§2, 5, 6 and Appendix A).

**Owned elsewhere and consumed here.** Each object has one owner.

- *The punctured spectrum of a local ring, finite étale covers of it, completion and purity for
  regular local rings*: LocalPurity §1.1 (the local punctured spectrum and `PurityHolds`), §1.3
  (`extends_iff_completion_extends`, Stacks 0BLL) and §§2.1–2.2 (`purityHolds_of_isRegularLocalRing`,
  Stacks 0BMA; `finiteEtale_extend_of_purity`, Stacks 0EY7). Here §0.1 adds only the semilocal
  carrier, which agrees with the LocalPurity carrier for a local ring.
- *Depth, Cohen–Macaulay rings, Zariski cohomology with supports and local cohomology, henselian
  pairs and henselization, coherent extension and Hartogs, torsors, stacks and gerbes, the big-site
  sheaves `𝔾_a`, `𝔾_m`, `μ_n`, topology comparisons, Hilbert 90 and the Kummer and Artin–Schreier
  sequences, Gabber's affine proper base change, Azumaya algebras and Brauer groups of schemes,
  Picard groups*: SchemeAndStackFoundations §§0.4, 0.6, 0.12–0.14, 0.17, 0.24, 1.15, 1.18,
  2.1–2.3, 2.7, 2.9–2.11, 2.15, 2.22, 3.4. The supported cohomology of §2.7 there is that of
  abelian sheaves on a ringed space; §0.2 here is its big-fppf-site counterpart and agrees with it
  for quasi-coherent coefficients. Its §2.22 `brauer_regular_injectivity` is the affine Azumaya case of §7.9
  here, which treats `H²(X, 𝔾_m)` of every Noetherian integral regular scheme and the torsion of all
  higher `H^i(X, 𝔾_m)`.
- *Strict henselization and its completion*: ModularCurves Layer 4D.
- *The finite étale Galois category and étale fundamental group of a scheme, étale duality on
  schemes of finite type over a field and on traits*: EtaleCohomologyFoundations §§F.0.2, F.5.
- *Absolute cohomological purity (Gabber)*: LefschetzPencilsAndVanishingCycles §0.10.
- *Auslander–Buchsbaum formula, maximal Cohen–Macaulay modules over regular local rings,
  localization of regular local rings*: PurityOfBranchLocus §0.3.
- *Cohen factorizations, complete-intersection homomorphisms, Avramov's criteria and the additivity
  of the complete-intersection defect*: DerivedDeRhamCohomology §§0.19, 0.21; *Bhatt's flatness
  criterion*: DerivedDeRhamCohomology §1.10.
- *Absolute local complete intersections and their theory* (a surjection of regular local rings has
  kernel generated by part of a regular system of parameters, the regular-ideal condition is
  independent of the regular presentation, complete intersections are Cohen–Macaulay, and the
  flat-local criterion: the target of a flat local homomorphism of Noetherian local rings is a
  complete intersection iff the source and the closed fibre are): DeformationAndDerivedPatchingAlgebra
  §3.4; *the local Grothendieck–Lefschetz theorem for Picard groups* (`Pic(U_R) = 0` for a Noetherian
  local complete intersection `R` of dimension `≥ 4`, [SGA2] XI, Théorème 3.13(ii)):
  DeformationAndDerivedPatchingAlgebra §6.9 `localCI_parafactorial`. §1.1 here defines the Lean
  predicate `IsCompleteIntersection` in the same words, since `Suggested.lean` cannot import another
  roadmap's module, and §7.5 records parafactoriality of such rings as a consequence.
- *The crystalline Dieudonné module over a perfect scheme and the triangle
  `Rε_*G → 𝕄(G) → 𝕄(G)` on the étale site, flat cohomology of animated rings with its deformation
  fibre sequence, the Bégueri resolution, `p`-adic continuity and excision along a principal ideal*
  ([CS24] §4.1.1, Lemmas 4.1.3 and 4.1.6, Propositions 4.1.4 and 4.1.7, Theorems 4.1.8, 5.2.8 and
  5.3.5, Lemma 5.4.2): PrismaticCohomologyPartIII §6.0 (`Prismatic.FlatCohomology.perfectDieudonneComparison`,
  `Prismatic.FlatCohomology.pContinuity`, `Prismatic.FlatCohomology.excision`). Layer 2 here keeps
  only the supported form of the triangle and Layer 3 only the supports, the consequences and the
  extension of excision to finitely generated ideals.
- *The coniveau spectral sequence of a smooth variety over a field* (the Gersten exact couple of
  Bloch–Ogus): MotivesAndAlgebraicCycles §0.5b. §8.4 here is the version with supports in a closed
  subset of an arbitrary finite-dimensional Noetherian scheme ([ILO14] XVIII-A), which the Brauer
  arguments of Layer 8 need and which specialises to that one for `Z = X` smooth.
- *Koszul complexes, derived completion along a principal ideal with bounded torsion, complete
  flatness, the cotangent complex*: DerivedModuleAlgebra §§0.K.1, 0.4, 0.25, 1.5, 1.7.
- *Animated rings and their modules*: EnhancedDerivedSheaves E5:animation.
- *Integral perfectoid rings, Fontaine's `θ`, the prism `(A_inf(A), ker θ)`, André's cover, the
  Cohen presentations of complete regular local rings and the finite flat regular towers*:
  PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17.
- *Ring operations on perfectoid rings and their tilts*: PerfectoidQuotients §§0.1, 0.2, 0.6;
  *tilting of valuation rings, torsion transfer and the towers of [CS24] Lemma 3.1.1*:
  PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q10.1.
- *Arc and `p`-complete arc topologies, arc descent for torsion étale cohomology, the henselian
  completion comparison off `V(I)`, acyclicity of the structure sheaf on perfectoids*:
  PrismaticCohomology §2.0.
- *Prismatic Dieudonné modules of finite locally free groups over perfectoid rings*:
  PrismaticCohomologyPartII (the prismatic Dieudonné contract below).
- *Groups of multiplicative type over a base scheme* are defined in §7.14 only to the extent purity
  needs (the definition, the character sheaf, étale-local diagonalizability, kernels of maps of tori
  and the factorization of multiplication by `m`); their general theory is the subject of
  GroupSchemesOverABase, a roadmap not in the merge order, with whose Layer GS2 the notion of §7.14
  agrees (both reduce over a field to the Tau Ceti carriers).
- *Residue and Witt sequences of complete discretely valued fields with perfect residue field*:
  ArithmeticGaloisDuality §R02.2.4.
- *Raynaud's embedding into abelian schemes, descent of finite locally free groups along
  `p`-completely faithfully flat maps, Dieudonné theory over perfect fields*:
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.1.41, R07.2.8.

**Owned here and to be imported by later roadmaps.** Two roadmaps later in the merge order plan
statements of this roadmap; each is owned here, and each of those roadmaps is to import it from the
section named instead of planning it.

- Supports for the flat cohomology of animated rings, its Postnikov, étale and nilpotent
  consequences, excision along finitely generated ideals, the comparison of a Noetherian local ring
  with its completion, and fpqc hyperdescent with descent modulo `p` (Layer 3): to be imported by
  SchemeAndStackFoundationsPartII (its animated point and support interfaces, finite-ideal excision
  and fpqc hyperdescent).
- The local étale duality statements and the local Lefschetz theorem (§§1.4–1.5): to be imported by
  EtaleDualityAndPerverseSheavesPartII (its local Lefschetz hyperplane theorem).
- The Brauer comparison of Gabber and de Jong for schemes with an ample line bundle (§7.10): to be
  imported by SchemeAndStackFoundationsPartII (its Layer 1 Brauer comparison).

## Conventions

1. Rings are commutative and unital. Schemes are Mathlib's `AlgebraicGeometry.Scheme` in a fixed
   universe `u`. Dimensions are Krull dimensions (`ringKrullDim`). Regular sequences are weakly
   regular in the sense of EGA ([CS24] §1.4): Mathlib's `RingTheory.Sequence.IsWeaklyRegular`, with
   no condition that the final quotient be nonzero.
2. A **Cohen presentation** of a local ring `(R, 𝔪)` is a regular local ring `B` with a
   surjection `B → R̂` onto the `𝔪`-adic completion (Mathlib `AdicCompletion`); for Noetherian `R` one exists by
   Cohen's theorem (DerivedDeRhamCohomology §0.19, Cohen factorizations of `ℤ → R̂`). `R` is a **complete
   intersection** if some Cohen presentation has kernel generated by a regular sequence (Bruns–Herzog
   Definition 2.3.1; the absolute local complete intersection of DeformationAndDerivedPatchingAlgebra
   §3.4, whose regular sequences have nonzero final quotient, which for a presentation of the nonzero
   ring `R̂` is automatic); `μ(I)` is the minimal number of generators,
   Mathlib's `Submodule.spanFinrank`. These notions are defined for every local ring and used only
   for Noetherian ones: every statement about them is made for Noetherian `R`.
3. **Cohomology** is fppf cohomology on the big fppf site (Mathlib `Scheme.fppfTopology`), identified
   with étale cohomology for smooth coefficients and with Zariski cohomology for quasi-coherent
   coefficients (SchemeAndStackFoundations §2.10). `H^i_Z(X, F)` is cohomology with supports in a
   closed `Z ⊂ X`; for a local ring `(R, 𝔪)`, `H^i_𝔪(R, F)` has supports in the closed point and
   `U_R` is the punctured spectrum.
4. `G` denotes a commutative finite locally free group scheme (over a local base: finite flat),
   Tau Ceti's `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` over affine bases; `G^*` is its
   Cartier dual. A class in `H^i(X, T)` is **torsion** if it is killed by a locally constant positive
   integer, equivalently `X = ⊔_{n>0} X_n` into clopens with the class killed by `n` on `X_n`.
5. **Perfectoid** means integral perfectoid (PerfectoidSpaces §P1.24, `IsIntegralPerfectoid`);
   `A_inf(A) = W(A^♭)` with Fontaine's `θ`, `ξ` a generator of `ker θ` chosen compatibly over all
   perfectoid `A`-algebras, and `𝕄(G)` the covariant prismatic Dieudonné module, with `F`
   Frobenius-semilinear, `V` inverse-Frobenius-semilinear, `FV = φ(ξ)`, `VF = ξ`. For perfect
   `𝔽_p`-algebras `ξ = p` and `𝕄` is the crystalline module. `(−)^{V=1}` is the fibre of `V − 1`.
6. **Normalisation witnesses.** `𝕄(ℤ/p^n) = A_inf/p^n` with `F = φ(ξ)·φ`, `V = φ^{-1}`, and
   `𝕄(μ_{p^n}) = A_inf/p^n` with `F = φ`, `V = ξ·φ^{-1}` ([CS24] Example 4.2.2). Over a perfect
   `𝔽_p`-algebra `S`: `𝕄(ℤ/p^n) = W_n(S)` with `F = p·φ`, `V = φ^{-1}`, and `𝕄(μ_{p^n}) = W_n(S)`
   with `F = φ`, `V = p·φ^{-1}` ([CS24] Example 4.1.2; the same normalisation as
   PrismaticCohomologyPartIII §6.0). Interchanging the covariant and contravariant conventions
   interchanges these two lines; the Checks of §2.1 and §5.1 detect it.
7. `Br(X)` is the Brauer group of Azumaya algebras (SchemeAndStackFoundations §2.22,
   `SchemeBrauerGroup`) and `Br′(X) = H²_ét(X, 𝔾_m)_tors` (`CohomologicalBrauer`); they are kept
   distinct until §7.10 identifies them.
8. The residue of a discrete valuation ring on Brauer groups is normalised by the crossed product:
   for an unramified cyclic extension `L/K` of degree `n` with generator `σ` and character
   `χ(σ) = 1/n`, the algebra generated by `L` and `u` with `u a = σ(a) u` and `uⁿ = π` has residue
   `χ` (§8.14).
9. Suggested Lean forms live in the namespace `TauCetiRoadmap.PurityForFlatCohomology`.

## Exact supplier contracts

### From Mathlib

Pinned at `f6090c7095e1e56b3464c1daba5f24631f1290d2`; each declaration was read at the pin.

- `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Scheme.Opens` with its open immersion `ι`, `Spec`:
  the carriers of every scheme here.
- `AlgebraicGeometry.Scheme.fppfTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`): the fppf
  topology on `Scheme.{u}`; `GrothendieckTopology.over` (`Mathlib/CategoryTheory/Sites/Over.lean`)
  restricts it to schemes over a base. `AlgebraicGeometry.Scheme.etaleTopology`,
  `AlgebraicGeometry.Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean`).
  None of them carries cohomology with supports.
- `CategoryTheory.Sheaf.H`, `CategoryTheory.Sheaf.cohomologyPresheaf` and the long exact and
  Mayer–Vietoris sequences (`Mathlib/CategoryTheory/Sites/SheafCohomology/`): sheaf cohomology as
  Ext from the constant sheaf. `cohomologyPresheaf` requires its input sheaf to take values in
  `AddCommGrpCat.{v}`, with `v` the universe of the site's morphisms, together with `HasSheafify` at that
  coefficient universe, which the big fppf site lacks at the pin; its output takes values in
  `AddCommGrpCat.{w′}`, the universe of the Ext groups, a separate parameter.
- `localCohomology` (`Mathlib/Algebra/Homology/LocalCohomology.lean`): local cohomology of modules
  as a colimit of Ext groups; compared with Zariski supports by SchemeAndStackFoundations §2.7.
- `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`): a Noetherian local ring
  with `spanFinrank 𝔪 = ringKrullDim`; `ringKrullDim`; `Submodule.spanFinrank` (zero for
  infinitely generated submodules, used only on ideals of Noetherian rings);
  `IsLocalRing.closedPoint`, `IsLocalRing.maximalIdeal`, `Ring.jacobson`, `PrimeSpectrum.zeroLocus`.
- `RingTheory.Sequence.IsWeaklyRegular`, `Ideal.ofList` (`Mathlib/RingTheory/Regular/RegularSequence.lean`):
  the weakly regular sequences of Convention 1; the stronger `RingTheory.Sequence.IsRegular`, which
  also asks the final quotient to be nonzero, is used nowhere here.
- `AdicCompletion` with its commutative ring structure (`Mathlib/RingTheory/AdicCompletion/Algebra.lean`):
  classical completion, not derived completion.
- `MorphismProperty.Over`, `MorphismProperty.Over.pullback`, `AlgebraicGeometry.IsFinite`,
  `AlgebraicGeometry.Etale`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.LocallyOfFinitePresentation`:
  finite étale schemes over a base and pullback.
- `CategoryTheory.PreGaloisCategory`, `CategoryTheory.PreGaloisCategory.functorToContAction`
  (`Mathlib/CategoryTheory/Galois/Equivalence.lean`): the fundamental theorem of Galois categories.
- `WittVector`, `WittVector.teichmuller`, `PreTilt`, `WittVector.fontaineTheta`, `frobenius`,
  `PerfectRing`, `IsAlgClosed`, `Module.FinitePresentation`, `Module.Free`, `Module.Basis`, `Module.IsReflexive`,
  `IsAzumaya`, `IsDiscreteValuationRing`, `UniqueFactorizationMonoid`, `ValuationRing`,
  `CategoryTheory.Abelian.Ext`, `DerivedCategory`.

### From Tau Ceti

Pinned at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

- `TauCeti.AlgebraicGeometry.LineBundleClass` (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`):
  isomorphism classes of invertible sheaves on a scheme with its `CommGroup` structure; `Pic(U_R)`.
- `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` and
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`): commutative
  group objects in schemes over `Spec S` that are finite, flat and locally of finite presentation,
  and Cartier duality over an affine base.
- `TauCeti.MultiplicativeTypeAffineGroupSchemeCat`, `TauCeti.TorusAffineGroupSchemeCat`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/MultiplicativeType.lean`, `Torus.lean`): groups of
  multiplicative type and tori over a field; §7.14 extends them to a base scheme.
- `TauCeti.HopfAlgebra.pointsFppfSheaf` (`TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean`): the
  points of an affine group as an fppf sheaf on affine schemes over `Spec R`.
- `TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece`
  (`TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean`): the grading induced on the quotient by
  a homogeneous ideal, the degree-`i` piece being the image of the degree-`i` piece; it grades the
  homogeneous coordinate ring of §7.8. The twisting sheaf `𝒪(1)` on `Proj` is not at the pin.
- `TauCeti.IsRegularLocalRing.isDomain` (`TauCeti/RingTheory/RegularLocalRing/Basic.lean`): the instance
  making a regular local ring a domain, so that `UniqueFactorizationMonoid R` is meaningful in §7.4.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.4 `coherent_extension` (a coherent sheaf on an open of a Noetherian scheme is the restriction of a
coherent sheaf on the whole scheme; it does not assert coherence of `j_*F`); §0.6 `coherent_hartogs`,
`reflexive_extension_normal`, `reflexive_extension_of_depth` (for an open `j : U → X` of a locally
Noetherian `X` with `depth 𝒪_{X,x} ≥ 2` at every `x ∉ U`, `j^*` and `j_*` are inverse equivalences between
coherent reflexive modules on `X` and on `U`; in particular `j_*F` is coherent for coherent reflexive `F`); §§0.12–0.13 the henselization of a
pair, `henselization_flat`, `henselization_noetherian`; §0.14 `henselian_finiteEtale_equivalence`;
§0.17 `Module.depth`, `IsLocalRing.depth`, `Ring.IsCohenMacaulay`; §0.24 perfect schemes and
perfection; §1.15 torsors; §1.18 stacks in groupoids and gerbes; §§2.1–2.3 cohomology on sites,
Leray and Čech spectral sequences, torsor classes; §2.7 `cohomologyWithSupport`,
`supports_localization_triangle`, `localCohomology_module_comparison`,
`depth_localCohomology_vanishing`; §2.9 `Ga`, `Gm`, `mu`; §2.10 `quasiCoherent_topology_comparison`,
`smoothGroup_fppf_etale_comparison`; §2.11 `hilbert90`, `fppf_kummer_sequence`,
`artinSchreier_sequence`, `finite_pushforward_exact`; §2.15 `gabber_affine_proper_base_change`,
`etale_galois_comparison`, `etale_cohomology_limits`; §2.22 `SchemeBrauerGroup`,
`CohomologicalBrauer`, `SchemeBrauerGroup.toCohomologicalBrauer`, `azumaya_equivalent_conditions`,
`brauer_regular_injectivity` (affine regular integral `X`), `brauer_henselian_local`; §3.4 Picard
groups. Assumed as stated there.

### From TauCetiRoadmap.LocalPurity

§1.1 the punctured spectrum of a local ring and `PurityHolds`; §1.3 `extends_iff_completion_extends`
(Stacks 0BLL); §2.1 `purityHolds_of_isRegularLocalRing` (Stacks 0BMA); §2.2
`finiteEtale_extend_of_purity` (Stacks 0EY7).

### From TauCetiRoadmap.ModularCurves

Layer 4D: strict henselization of a local ring and of a local ring of a scheme at a geometric
point, its completion, and preservation of regularity and dimension under completion
(`ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff`).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§F.0.2 `VanishingCycles.finiteEtaleGaloisCategory` (the Galois category of finite étale covers of a
connected scheme and its fundamental group); §F.0.4 étale topological invariance (the étale site of
a scheme and of a nil-thickening of it coincide); §F.5 exceptional inverse image and duality on its
stated domains.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

§0.10 absolute cohomological purity (Gabber): for a regular Noetherian scheme `X`, a regular closed
`i : Z → X` of pure codimension `c` and `n` invertible on `X`, `Ri^!(ℤ/n) ≅ ℤ/n(−c)[−2c]` through the
fundamental class. Used locally: `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < 2 dim R` when `R` is regular local and
`ℓ` invertible ([CS24] Theorem 3.1.3).

### From TauCetiRoadmap.PurityOfBranchLocus

§0.3 `auslander_buchsbaum` (Stacks 090V), `IsRegularLocalRing.free_of_isCohenMacaulay` (Stacks
00NT), `IsRegularLocalRing.isRegularLocalRing_localization` (Stacks 0AFS).

### From TauCetiRoadmap.DerivedDeRhamCohomology

§0.19 `DerivedDeRham.cohenFactorization` (existence of Cohen factorizations; applied to
`ℤ_(p) → R̂` it gives an unramified complete regular local ring surjecting onto `R̂`) and the
complete-intersection homomorphisms, with their independence of the Cohen factorization; §0.21
`DerivedDeRham.absoluteCompleteIntersection`; §1.10
`DerivedDeRham.ordinaryFlatnessFromCompleteFlatness` (Bhatt's criterion).

What DerivedDeRhamCohomology must provide (the complete-intersection defect contract): the
complete-intersection defect `dim − vdim` is additive along flat local homomorphisms of Noetherian
local rings (Avramov 1977, Proposition 3.6).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§3.4 absolute local complete intersections: a Noetherian local ring whose completion is the quotient
of a regular local ring by an ideal generated by a regular sequence; a surjection of regular local
rings has kernel generated by a prefix of a regular system of parameters; the regular-ideal
condition is preserved under change of regular local presentation (Stacks 09Q1); complete
intersections are Cohen–Macaulay; and the flat-local criterion: for a flat local homomorphism
`R → S` of Noetherian local rings, `S` is a complete intersection iff `R` and `S/𝔪_R S` are
(Avramov; Stacks 09Q7). Its regular sequences have nonzero final quotient, which for a
presentation of a nonzero local ring agrees with Convention 1. §6.9 `localCI_parafactorial`: for a
Noetherian local complete intersection `A` of dimension `≥ 4`, every line bundle on
`Spec A ∖ {𝔪}` is trivial ([SGA2] XI, Théorème 3.13(ii)), stated there with an explicit regular
presentation of the completion and Tau Ceti's `InvertibleSheaf`. Assumed as stated there.

### From TauCetiRoadmap.PrismaticCohomologyPartIII

§6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`: for a perfect `𝔽_p`-scheme `S` and a
commutative finite locally free `S`-group `G` locally of `p`-power order, the covariant Dieudonné
sheaf `𝕄(G)`, an exact equivalence (with base change along perfect `S`-schemes) onto quasi-coherent
`W(𝒪_S)`-modules, locally finitely presented, killed by a power of `p`, of projective dimension
`≤ 1`, with `F` Frobenius-semilinear and `V` inverse-Frobenius-semilinear, `FV = VF = p`, normalised
as in Convention 6, and the functorial triangle `Rε_*G → 𝕄(G) → 𝕄(G) → (Rε_*G)[1]` on `S_ét` with
middle map `V − 1`, for `ε : S_fppf → S_ét` ([CS24] §4.1.1, Lemma 4.1.3, Proposition 4.1.7,
Theorem 4.1.8). §6.0 also constructs flat cohomology `RΓ_fppf(A, G)` of an animated ring `A` by
sheafification on the fppf site of animated `A`-algebras, the Bégueri resolution
`0 → G → Res_{G^*/R}(𝔾_m) → Q → 0` of a finite locally free `G` by smooth affine commutative
groups, exact on the fppf site of every animated `R`-algebra, the deformation fibre sequence
`RΓ_fppf(A′, G) → RΓ_fppf(A, G) → RHom_R(e^*L_{G/R}, M[1])` for a square-zero extension `A′ ↠ A`
of animated `R`-algebras with ideal `M` and `G` smooth or finite locally free ([CS24] Theorem
5.2.8), `Prismatic.FlatCohomology.pContinuity` (`RΓ(A, G) ≅ Rlim_n RΓ(A/^L p^n, G)` for `G` of
`p`-power order and `π_0(A)` `p`-henselian; [CS24] Theorem 5.3.5) and
`Prismatic.FlatCohomology.excision` (for a map `A → A′` of animated rings and `a ∈ π_0(A)` with
`A/^L a ≅ A′/^L a`, `RΓ_{a=0}(A, G) ≅ RΓ_{a=0}(A′, G)`, equivalently the square of flat cohomology
of `A`, `A′` and their localizations at `a` is cartesian; [CS24] Lemma 5.4.2). Assumed as stated
there.

### From TauCetiRoadmap.DerivedModuleAlgebra

§0.K.1 Koszul complexes and the regular-sequence resolution; §0.4 `Algebra.CotangentComplex`;
§0.25 cotangent obstruction theory; §1.5 derived completion along a principal ideal computed by
the ordinary quotient tower under bounded torsion; §1.7 complete flatness.

### From TauCetiRoadmap.EnhancedDerivedSheaves

E5:animation.1–E5:animation.4: animated rings `AnimAlg_R`, Frobenius on animated `𝔽_p`-algebras,
and modules over animated rings.

### From TauCetiRoadmap.PerfectoidSpaces

§§P1.16–P1.18 Fontaine's `θ` and its principal primitive kernel; §§P1.24–P1.25
`IsIntegralPerfectoid` and its comparison with perfectoid Tate rings; §P3.7
`isPerfectoidField_of_isAlgClosed`; §P4.15.2 the prism `(A_inf(A), ker θ)` of a perfectoid ring;
§P4.15.4 *semiperfectoid-andre-cover* (André's lemma in the form of [BS22] Theorem 7.14); §P7.16a
*regular-finite-flat-residue-tower* and *regular-cohen-presentations*; §P7.17
*regular-finite-flat-perfectoid-tower*.

### From TauCetiRoadmap.PerfectoidQuotients

§0.1 units, reducedness and the characteristic-`p` dictionary; §0.2 naturality of `θ` and
Fontaine generators; §0.6 `integralPerfectoid_pi_iff` (products), `perfectoid_completed_tensor`,
`perfectoid_completed_root_quotient`, `perfectoid_completely_etale_henselization`.

### From TauCetiRoadmap.PerfectoidQuotientsPartII

§Q5.2 tilts and `A_inf` of products; §Q5.4 torsion of a perfectoid ring and of its tilt; §§Q6.3–Q6.7
tilting of valuation rings, localizations and algebraically closed fraction fields ([CS24]
Proposition 2.1.9); §Q7.1 ind-fppf ring maps (filtered colimits of faithfully flat
finitely presented algebras) and §Q7.3 their stability under composition, base change, nonempty
finite products and filtered colimits ([CS24] §2.3.3); §Q10.1 the towers of [CS24] Lemma 3.1.1.

What PerfectoidQuotientsPartII must provide (the regular tower tilt contract): for a perfect field `k` of
characteristic `p` and `R_∞ = W(k)⟦x_1^{1/p^∞}, …, x_d^{1/p^∞}⟧/(p − f)` as in §Q10.1, the tilt of
the `p`-adic completion of `R_∞` is the `f′`-adic completion of
`k⟦(x_1^♭)^{1/p^∞}, …, (x_d^♭)^{1/p^∞}⟧` for some `f′ ∈ (x_1^♭, …, x_d^♭)`, where `x_i^♭` are compatible
`p`-power roots
of `x_i`, and the two rings agree modulo every ideal `((x_1^♭)^{n_1}, …, (x_d^♭)^{n_d})` ([CS24]
proofs of Theorems 3.1.3 and 6.2.7).

### From TauCetiRoadmap.PrismaticCohomology

§2.0: the arc, `arc_p` and formal arc sites; the perfectoid basis of the formal arc site; covers by
that basis and by products of `p`-complete rank-one valuation rings with algebraically closed fraction
fields ([CS24] Lemma 2.2.3, p. 19); arc descent for torsion étale
cohomology; the henselian comparison of torsion étale cohomology of `Spec A ∖ V(I)` and
`Spec Â ∖ V(IÂ)`; the `arc_p` sheaf property of `R ↦ RΓ_ét(Spec R̂_p[1/p], F)`; and acyclicity of
`𝒪` on the perfectoid formal basis, `RΓ_arc(Spf S, 𝒪) ≅ S` ([BS22] Proposition 8.10).

### From TauCetiRoadmap.PrismaticCohomologyPartII

What PrismaticCohomologyPartII must provide (the prismatic Dieudonné contract): for a
perfectoid ring `A` and a generator `ξ` of `ker θ`, the covariant prismatic Dieudonné functor
`G ↦ 𝕄(G) = Ext¹(G^*, 𝒪_Δ)` on the absolute prismatic site of `A` is an exact equivalence,
compatible with base change, from commutative finite locally free `A`-groups of `p`-power order to
finitely presented `p`-power-torsion `A_inf(A)`-modules of projective dimension `≤ 1` with `F`, `V`
satisfying `FV = φ(ξ)` and `VF = ξ`, taking `μ_{p^n}` and `ℤ/p^n` to the modules of Convention 6,
taking `p^n`-torsion of `p`-divisible groups to finite projective `A_inf(A)/p^n`-modules, and agreeing
over perfect `𝔽_p`-algebras with the crystalline classification of Berthelot, Gabber and Lau
([ALB23] Theorem 5.4 of the published version, Theorem 5.1.4 of arXiv v4; the normalisations of [CS24]
§4.2.1 and Example 4.2.2, p. 41; [Lau13] Corollary 6.5).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.1.40 `raynaudAbelianEmbedding` (Zariski-locally, a finite locally free commutative group embeds
into a projective abelian scheme); §R07.1.41 `pCompleteFlatDescent`; §R07.2.8 the Dieudonné
classification over perfect fields, with which PrismaticCohomologyPartIII §6.0's module agrees over
a perfect field after Cartier duality.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.2.4 the residue and Witt sequences of a complete discretely valued field `K` with perfect residue
field `k`: `0 → Br(k) → Br(K) → H^1(k, ℚ/ℤ) → 0` exact and split by a uniformiser, and for `K = k((t))`
and `m` prime to `char k` the split exact sequences
`0 → H^q(k, μ_m^{⊗r}) → H^q(K, μ_m^{⊗r}) → H^{q−1}(k, μ_m^{⊗(r−1)}) → 0`. Used in §8.15 for exactness
only; the sign of the residue is fixed here by Convention 8.

## How to read the build

Layer 0 constructs fppf cohomology with supports and the two commutative-algebra lemmas on regular
sequences that every later vanishing reduces to. Layer 1 is classical: the virtual dimension, the
étale depth bound through absolute purity and local duality, and Zariski–Nagata purity through
algebraization over punctured spectra. Layer 2 turns the perfect-base Dieudonné triangle of
PrismaticCohomologyPartIII into the crystalline key formula with supports for perfect
`𝔽_p`-schemes, and Layer 3 develops flat cohomology of animated rings, from the construction,
deformation triangle, `p`-adic continuity and principal excision of PrismaticCohomologyPartIII, far
enough to pass between a ring and its reductions modulo `p`, its completions and its fpqc covers.
Layer 4 proves purity in
characteristic `p`; Layer 5 proves the key formula and purity for perfectoid rings by `p`-complete arc
descent from products of valuation rings. Layer 6 assembles the main local theorems, Layer 7 their
global consequences and Gabber's conjectures, and Layer 8 Česnavičius's purity for the Brauer
group and for tori. Within a layer each subsection names its target with its hypotheses and source,
lists its API in prose for definitions, and gives discriminating **Checks**; *Needs* lists exactly
what the statement and its route use.

## Layer 0: Punctured spectra, flat cohomology with supports and Hartogs extension

This layer builds the support formalism on the big fppf site and the two lemmas on regular
sequences, valid over arbitrary rings, to which the vanishing statements of Layers 4–8 reduce.

### 0.1 The punctured spectrum of a semilocal ring

Define `puncturedSpectrum R`, for a commutative ring `R`, as the open subscheme of `Spec R`
complementary to the zero locus of the Jacobson radical `J(R)` (Mathlib `Ring.jacobson`). For a
semilocal ring this removes exactly the finitely many closed points ([C19] §1.5, p. 3); for a local
ring `(R, 𝔪)` it is `Spec R ∖ {𝔪}`, the punctured spectrum of LocalPurity §1.1. For a ring that is
not semilocal the definition is still meaningful but is not used.
*Needs:* Mathlib `AlgebraicGeometry.Scheme.Opens`, `PrimeSpectrum.zeroLocus`, `Ring.jacobson`,
`IsLocalRing.closedPoint`; LocalPurity §1.1 (comparison).

API (each a target):
- A prime of `R` lies in `puncturedSpectrum R` iff it does not contain `J(R)`; for semilocal `R`
  iff it is not maximal; for local `R` iff it differs from `IsLocalRing.closedPoint R`, so the
  carrier agrees with that of LocalPurity §1.1.
- For `R` Noetherian, `puncturedSpectrum R` is quasi-compact and its inclusion into `Spec R` is a
  quasi-compact open immersion: `J(R)` is finitely generated, so the complement of `V(J(R))` is a
  finite union of principal opens.
- For `R` nonzero and semilocal, `puncturedSpectrum R` is empty iff `ringKrullDim R = 0`.
- For a finite ring map `R → R′` with `R` semilocal, `R′` is semilocal, its maximal ideals are those
  over maximal ideals of `R`, and `puncturedSpectrum R′` is the preimage of `puncturedSpectrum R`
  (the identity `V_{R′} = U_{R′}` used in [C19] Corollary 2.4).
- For `R` Noetherian local with completion `R̂`, henselization `R^h` or strict henselization
  `R^{sh}`, the punctured spectrum of each is the preimage of `puncturedSpectrum R`.
- For `R` Noetherian local of depth `≥ 2`, restriction `Γ(Spec R, 𝒪) → Γ(puncturedSpectrum R, 𝒪)` is
  bijective (SchemeAndStackFoundations §0.6, `coherent_hartogs`).

**Checks.**
- For a field `K`, `puncturedSpectrum K` is empty, so its Krull dimension is `⊥` (the dimension of the
  empty poset, Mathlib `Order.krullDim_eq_bot`), while `ringKrullDim K = 0`: the two dimensions differ,
  and the dimension-zero characterisation above is about `ringKrullDim K`, not about the empty carrier.
- For a discrete valuation ring `R` with uniformizer `π` and fraction field `K`,
  `puncturedSpectrum R ≅ Spec K` and `Γ(puncturedSpectrum R, 𝒪) = R[1/π] ≠ R`: the depth-two
  hypothesis of Hartogs cannot be dropped. For `ℤ_p` this is `ℚ_p`, for `k⟦t⟧` it is `k((t))`.
- For `R = k⟦x, y⟧`, `puncturedSpectrum R = D(x) ∪ D(y)` is quasi-compact, not affine, and
  `Γ(puncturedSpectrum R, 𝒪) = R`.
- For `R = k × k` (two closed points) `puncturedSpectrum R = ∅`; removing only one closed point
  would leave a copy of `Spec k`, so the semilocal carrier is not the complement of a single point.
- For the zero ring the carrier is empty while `ringKrullDim` is `⊥`; the dimension-zero
  characterisation is stated for nonzero rings.

### 0.2 Flat cohomology with supports

Construct `RΓ_Z(X, F)`, for a scheme `X`, a closed `Z ⊂ X` with open complement
`j : U = X ∖ Z → X` and an abelian sheaf `F` on the big fppf site of `X` (a commutative group scheme
over `X`, or the sheaf `𝒢^a` attached to a quasi-coherent module), as the fibre of restriction
`RΓ_fppf(X, F) → RΓ_fppf(U, F)`, and `H^i_Z(X, F)` as its cohomology; equivalently the right derived
functors of `Γ_Z(X, F) = ker(F(X) → F(U))` on fppf abelian sheaves ([CS24] §1.4 and Lemma 7.1.1,
p. 86). Write `ℋ^j_Z(−, F)` for the étale sheafification on `X_ét` of
`X′ ↦ H^j_{Z ×_X X′}(X′, F)`.
*Needs:* Mathlib `Scheme.fppfTopology`, `GrothendieckTopology.over`, `CategoryTheory.Sheaf.H`;
SchemeAndStackFoundations §§2.1–2.3 (pullback and cohomology on sites, Leray and Čech spectral
sequences), §2.7 (the Zariski support formalism), §2.10 (topology comparisons), §2.15
(`etale_cohomology_limits`); §0.1.

API (each a target):
- The long exact sequence `… → H^i_Z(X, F) → H^i(X, F) → H^i(X ∖ Z, F) → H^{i+1}_Z(X, F) → …`,
  natural in `(X, Z, F)`; and `H^0_Z(X, F) = ker(F(X) → F(X ∖ Z))`.
- Excision: for an open `V ⊃ Z`, `H^i_Z(X, F) ≅ H^i_Z(V, F)`; for an étale `X′ → X` with
  `Z ×_X X′ → Z` an isomorphism of reduced closed subschemes, `H^i_Z(X, F) ≅ H^i_{Z′}(X′, F)`.
- For closed `Z′ ⊂ Z ⊂ X`, the triple sequence
  `H^i_{Z′}(X, F) → H^i_Z(X, F) → H^i_{Z∖Z′}(X ∖ Z′, F) → H^{i+1}_{Z′}(X, F)`.
- The local-to-global spectral sequence `E_2^{ij} = H^i_ét(X, ℋ^j_Z(−, F)) ⇒ H^{i+j}_Z(X, F)`
  ([CS24] Lemma 7.1.1; [BC22] Lemma 2.3.2). The identification of the stalks of `ℋ^j_Z(−, F)` with
  supported cohomology of strict henselizations is the stalk formula of §0.3, which is proved after
  continuity and is not an input of this section.
- Mayer–Vietoris for `X = V_1 ∪ V_2` open: the exact sequence
  `… → H^i(V_1 ∪ V_2, F) → H^i(V_1, F) ⊕ H^i(V_2, F) → H^i(V_1 ∩ V_2, F) → H^{i+1}(V_1 ∪ V_2, F) → …`
  (Mathlib's sheaf-cohomology Mayer–Vietoris sequence specialised to two opens).
- Finite flat descent: for a finite faithfully flat local homomorphism `R → R′` and `G` over `R`,
  `E_1^{s,t} = H^t_{Z_s}(Spec(R′^{⊗_R(s+1)}), G) ⇒ H^{s+t}_𝔪(R, G)`, with `Z_s` the preimage of the
  closed point; the tensor powers are semilocal and `H^t_{Z_s}` splits as a sum over their maximal
  ideals by excision ([CS24] proof of Lemma 4.1.12, p. 40).
- For `F` a smooth commutative group scheme, `H^i_Z(X, F)` agrees with étale cohomology with
  supports; for `𝒢` quasi-coherent it agrees with SchemeAndStackFoundations §2.7's
  `cohomologyWithSupport`, and for `X = Spec A` Noetherian, `Z = V(I)` and `𝒢 = M~` with Mathlib's
  `(localCohomology I i).obj M` (SchemeAndStackFoundations §§2.7, 2.10).
- Nested supports: for closed `Z ⊂ W ⊂ X`, `Rℋ_Z ∘ Rℋ_W ≅ Rℋ_Z` naturally in `F`; in particular, if
  `ℋ^j_W(F) = 0` for `j < d` then `ℋ^j_Z(F) = 0` for `j < d`.

**Checks.**
- `H^i_∅(X, F) = 0` for every `i`, and `H^i_X(X, F) = H^i(X, F)`.
- For a discrete valuation ring `R` with fraction field `K` and the closed point: `H^0_𝔪(R, 𝔾_m) = 0`
  and `H^1_𝔪(R, 𝔾_m) ≅ K^×/R^× ≅ ℤ` through the valuation, since `Pic R = 0`.
- For `A = k[t]` and `I = (t)`: `H^1_{V(I)}(Spec A, 𝔾_a) ≅ k[t, t^{-1}]/k[t]`, the native
  `localCohomology`.
- `H^0_Z(X, F)` is not `F(Z)`: for `X = 𝔸^1_k`, `Z = {0}` and `F = 𝔾_a`, `H^0_Z = 0` while `𝔾_a(Z) = k`.

### 0.3 Continuity of flat cohomology in cofiltered limits

Prove that for a cofiltered limit `X = lim X_λ` of quasi-compact quasi-separated schemes with affine
transition maps and a finitely presented commutative group scheme `G` over `X_0`,
`colim_λ H^i_fppf(X_λ, G) ≅ H^i_fppf(X, G)`; and, for a closed `Z_0 ⊂ X_0` with quasi-compact open
complement, `Z_λ = Z_0 ×_{X_0} X_λ` and `Z = Z_0 ×_{X_0} X`,
`colim_λ H^i_{Z_λ}(X_λ, G) ≅ H^i_Z(X, G)`. The route is SGA 4 VII 5.7 for the fppf site of
finitely presented schemes over `X_0`, whose cohomology agrees with that of the big fppf site for
finitely presented `G`, followed by the five lemma for supports. The fixed support and the quasi-compact complement are hypotheses.
This is the limit formalism for flat cohomology invoked in [CS24] proofs of Corollary 5.6.9, p. 76,
and Theorem 7.1.2, p. 87. The order of proof is: the absolute statement first; then the supported
statement, from the absolute one and the support triangle of §0.2 by the five lemma.

Then prove the **stalk formula**: for a scheme `X`, a closed `Z ⊂ X` whose open complement `U → X` is
quasi-compact, and `F` a finitely presented commutative group scheme over `X` or `𝒢^a` with `𝒢`
quasi-coherent, the stalk of the étale sheaf `ℋ^j_Z(−, F)` of §0.2 at a geometric point `x̄` of `X` is
`H^j_{Z_x̄}(Spec 𝒪^{sh}_{X,x̄}, F)` with `Z_x̄ = Z ×_X Spec 𝒪^{sh}_{X,x̄}` ([C19] proof of Theorem 6.1,
p. 13). Route: `Spec 𝒪^{sh}_{X,x̄}` is the cofiltered limit of the affine étale neighbourhoods
`X′ → X` of `x̄`, with affine transition maps; the stalk is the colimit of `H^j_{Z ×_X X′}(X′, F)` over
these neighbourhoods, and the supported continuity statement identifies that colimit with
`H^j_{Z_x̄}(Spec 𝒪^{sh}_{X,x̄}, F)`.
*Needs:* SchemeAndStackFoundations §0.9 (limits of schemes), §2.15 (`etale_cohomology_limits`); §0.2
(the support triangle and the sheaf `ℋ^j_Z(−, F)`).

**Checks.**
- For `X_λ = Spec k′` over finite separable `k′/k` with limit `Spec k^s` and `G = μ_n`, `n` invertible:
  `H^1(k^s, μ_n) = 0` is the colimit of the groups `k′^×/k′^{×n}`.
- Without quasi-compactness of `X ∖ Z → X` the preimages of `X ∖ Z` in the étale neighbourhoods need
  not form a limit of quasi-compact schemes, and only the colimit statement over neighbourhoods
  remains; the stalk formula therefore carries the quasi-compactness hypothesis.
- For `Z_0 = X_0` the supported statement is the absolute one; for `Z_0 = ∅` both sides vanish.
- The stalk formula with `X = Z = Spec k` for a field `k`, `F = μ_n` with `n` invertible in `k` and the
  geometric point over `k^s`: the stalk of `ℋ^1_X(−, μ_n)` is `H^1(k^s, μ_n) = 0`, the colimit of the
  Kummer groups `k′^×/k′^{×n}` over finite separable `k′/k`, whereas the value `H^1(k, μ_n) = k^×/k^{×n}`
  at `X` itself is nonzero for `k = ℚ`, `n = 2`; a "stalk" taken at `𝒪_{X,x}` instead of `𝒪^{sh}_{X,x̄}`
  would return the nonzero group.

### 0.4 Regular sequences force vanishing of cohomology with supports

Prove: for a commutative ring `A`, an `A`-module `M`, a closed `Z ⊂ Spec A` and a weakly
`M`-regular sequence `a_1, …, a_d ∈ A` each of which vanishes on `Z`, `H^i_Z(Spec A, M~) = 0` for
`i < d`. Consequently, if `0 → P_1 → P_0 → M → 0` with `a_1, …, a_{d+1}` weakly regular on `P_0` and
`P_1`, then `H^i_Z(Spec A, M~) = 0` for `i < d` ([CS24] proof of Proposition 4.1.13, p. 40, and of
Theorem 6.1.2, pp. 82–83). No Noetherian hypothesis.
Route: for `W = V(a_1, …, a_d) ⊃ Z`, the Čech complex of the cover of `Spec A ∖ W` by the `D(a_k)` is
the colimit of the Koszul cochain complexes of `(a_1^n, …, a_d^n)`; powers of a weakly regular
sequence are weakly regular (Stacks 07DV), so these complexes have no cohomology below degree `d`,
giving `ℋ^j_W(M~) = 0` for `j < d`; nested supports (§0.2) pass to `Z` even when `Spec A ∖ Z` is not
quasi-compact. The two-term case follows from the long exact sequence.
*Needs:* §0.2 (including nested supports and the quasi-coherent comparison); DerivedModuleAlgebra
§0.K.1 (Koszul complexes, regular-sequence resolution); Mathlib
`RingTheory.Sequence.IsWeaklyRegular`, `Localization.Away`.

**Checks.**
- For `A = k[x_1, …, x_d]`, `M = A` and `Z` the origin: `H^i_Z = 0` for `i < d`, and `H^d_Z(A) ≠ 0`, so
  the bound is sharp.
- For `A_inf(A₀)` of a perfectoid `A₀` and the sequence `ξ, ã_1, …, ã_d` it gives the vanishing
  `H^i_Z(A_inf(A₀), A_inf(A₀)) = 0` for `i < d + 1` used in §5.10.
- The vanishing hypothesis on `Z` cannot be dropped: for `Z = Spec A` and `d ≥ 1`,
  `H^0_Z(A, A) = A ≠ 0`.

### 0.5 Hartogs extension along closed subsets of large regular depth

Prove, for a scheme `X` and a closed `Z ⊂ X` ([CS24] Lemma 7.2.7, pp. 90–91): (a) if for every
`z ∈ Z` the maximal ideal of `𝒪_{X,z}` contains an `𝒪_{X,z}`-regular element, then
`Y(X) → Y(X ∖ Z)` is injective for every separated `X`-scheme `Y`; (b) if for every `z ∈ Z` it contains
an `𝒪_{X,z}`-regular sequence of length two, then `Y(X) → Y(X ∖ Z)` is bijective for every
`X`-affine `Y`, in particular `Γ(X, 𝒪_X) ≅ Γ(X ∖ Z, 𝒪_X)`. No Noetherian hypothesis; for Noetherian
local rings the hypotheses say depth `≥ 1`, resp. `≥ 2`, along `Z`.
Route: (a) the diagonal of `Y` is closed, so it suffices that no nonzero local function vanishes off
`Z`; a generic point of a maximal counterexample locus contradicts regularity. (b) reduces to
`Y = 𝔸^1_X`; at a generic point `z` of the non-extension locus, the Čech complex of
`𝒪 → 𝒪[1/m_1] ⊕ 𝒪[1/m_2] → 𝒪[1/m_1m_2]` is the colimit of the Koszul complexes of
`(m_1^n, m_2^n)`, whose first homology vanishes (Stacks 0913, 07DV); the Noetherian case is
SchemeAndStackFoundations §0.6 `coherent_hartogs` (EGA IV 5.10.5).
*Needs:* §0.1; SchemeAndStackFoundations §0.6 (`coherent_hartogs`); DerivedModuleAlgebra §0.K.1;
Mathlib `RingTheory.Sequence.IsWeaklyRegular`, `Localization.Away`.

**Checks.**
- For `X = Spec k[x, y]` and `Z` the origin, (b) gives `Γ(X ∖ Z, 𝒪) = k[x, y]`.
- For `Z = V(x) ⊂ 𝔸^2` (no regular sequence of length two at the generic point of `Z`),
  `Γ(𝔸^2 ∖ Z, 𝒪) = k[x^{±1}, y] ≠ k[x, y]`: the length-two hypothesis is necessary.
- Separatedness is needed in (a): the two inclusions of `𝔸^1` into the line with doubled origin
  agree off the origin and differ.

### Examples

For `R = k⟦x, y⟧` and `G = μ_p`, §0.5 gives `Γ(U_R, 𝒪) = R`, so `μ_p(U_R) = μ_p(R)` and the Kummer
sequence (SchemeAndStackFoundations §2.11) embeds `H^1(R, μ_p) = R^×/R^{×p}` into `H^1(U_R, μ_p)`;
the long exact sequence of §0.2 then gives `H^0_𝔪(R, μ_p) = H^1_𝔪(R, μ_p) = 0`, and the vanishing of
`H^2_𝔪(R, μ_p)` is equivalent to surjectivity of `H^1(R, μ_p) → H^1(U_R, μ_p)` together with
injectivity of `H^2(R, μ_p) → H^2(U_R, μ_p)`; the former needs `Pic(U_R)[p] = 0` (§7.6), and surjectivity
alone gives only `H^2_𝔪(R, μ_p) ↪ H^2(R, μ_p)`, a group that can be nonzero (for `k = ℝ` and `p = 2` the
Kummer sequence and `Pic R = 0` identify it with `Br(R)[2] = Br(ℝ)[2] = ℤ/2`). The vanishing itself holds by §6.5. For a discrete valuation ring `R` with fraction field `K` the same
sequence gives `H^0_𝔪 = H^1_𝔪 = 0` and an injection `K^×/(R^× K^{×p}) ≅ ℤ/p ↪ H^2_𝔪(R, μ_p)` through
the valuation modulo `p`, so the bound `i ≤ dim R` of §6.5 is sharp in dimension one.

### Dependencies

Mathlib sites, sheaf cohomology, local cohomology and regular sequences; SchemeAndStackFoundations
§§0.6, 0.9, 2.1–2.3, 2.7, 2.10, 2.15; DerivedModuleAlgebra §0.K.1; LocalPurity §1.1.

## Layer 1: Virtual dimension, étale depth and Zariski–Nagata purity

This layer is classical and uses no perfectoid input. It defines the virtual dimension, proves
Gabber's bound `H^i_𝔪(R, G) = 0` for `i < vdim(R)` and finite étale `G` of invertible order, and
proves Zariski–Nagata purity in virtual dimension `≥ 3` ([CS24] §§3.2–3.3).

### 1.1 Cohen presentations, complete intersections and the virtual dimension

Define `CohenPresentation R`, for a local ring `(R, 𝔪)`: a regular local ring `B` (Mathlib
`IsRegularLocalRing`) in the universe of `R` with a surjective ring map `B → R̂` onto the `𝔪`-adic
completion (Mathlib `AdicCompletion`). Define `IsCompleteIntersection R`: some Cohen presentation
has kernel generated by a weakly regular sequence of `B` (Bruns–Herzog Definition 2.3.1; [CS24]
§1.4). Define `virtualDimension R ∈ ℤ` as the infimum, over Cohen presentations `B → R̂`, of
`μ(𝔪_B) − μ(ker)`, where `μ` is Mathlib's `Submodule.spanFinrank` and `μ(𝔪_B) = dim B` because `B`
is regular; by the independence statement below every presentation gives the same value, which is
Grothendieck's geometric depth ([SGA2] XIV, Proposition 5.2 and Définition 5.3, pp. 198–200; [CS24]
(3.2.1.1), p. 32). The value may be negative. The three definitions make sense for every local
ring and are used only for Noetherian ones; for a non-Noetherian local ring without a Cohen
presentation the infimum is over the empty set and Mathlib's `sInf ∅ = 0` for `ℤ` is a value no
target uses. In the API and Checks below `R` is Noetherian, except in the last Check. The predicate
`IsCompleteIntersection` is the absolute local complete intersection of
DeformationAndDerivedPatchingAlgebra §3.4 in Lean form (Convention 2), and the theory of that
notion (independence of the regular presentation, Cohen–Macaulayness, the flat-local criterion) is
taken from there; what is new here is the integer `virtualDimension` and its behaviour.
*Needs:* Mathlib `IsRegularLocalRing`, `AdicCompletion`, `Submodule.spanFinrank`,
`RingTheory.Sequence.IsWeaklyRegular`, `Ideal.ofList`; DeformationAndDerivedPatchingAlgebra §3.4
(absolute local complete intersections); DerivedDeRhamCohomology §§0.19, 0.21 (Cohen
factorizations and the absolute complete-intersection criterion); PerfectoidSpaces §P7.16a
(*regular-cohen-presentations*); ModularCurves Layer 4D (completion and strict henselization).

API (each a target):
- Every Noetherian local ring has a Cohen presentation, which may be chosen with `B` complete and
  unramified (`p ∉ 𝔪_B²` in mixed characteristic `(0, p)`): apply DerivedDeRhamCohomology §0.19
  `DerivedDeRham.cohenFactorization` to the structure map from `ℤ` localized at the residue
  characteristic.
- Independence: for every Cohen presentation `B → R̂` with kernel `I`,
  `virtualDimension R = dim B − μ(I)` ([SGA2] XIV, Proposition 5.2: a factorisation `B → B′ → R̂` through surjections of
  regular local rings has `ker(B → B′)` generated by part of a regular system of parameters
  (DeformationAndDerivedPatchingAlgebra §3.4), and any two presentations are dominated by a third).
- `virtualDimension R ≤ dim R`, with equality iff `IsCompleteIntersection R` ([SGA2] XIV,
  Proposition 5.4; [CS24] (3.2.1.2)); the "only if" direction uses that every Cohen presentation
  of a complete intersection has kernel generated by a regular sequence
  (DeformationAndDerivedPatchingAlgebra §3.4).
- `virtualDimension R̂ = virtualDimension R` and `virtualDimension R^h = virtualDimension R`; for a
  flat local homomorphism `R → R′` of Noetherian local rings whose closed fibre is a separable field
  extension of the residue field, `virtualDimension R′ = virtualDimension R`, in particular for the
  strict henselization ([SGA2] XIV, Proposition 5.5).
- For `f_1, …, f_r ∈ 𝔪`, `virtualDimension (R/(f_1, …, f_r)) ≥ virtualDimension R − r`.
- A regular local ring is a complete intersection with `virtualDimension R = dim R`; a quotient of a
  regular local ring by one nonzero element of its maximal ideal is a complete intersection.
- `IsCompleteIntersection R` holds iff the structure map from `ℤ` localized at the residue
  characteristic (`ℚ` in residue characteristic `0`) to `R` is complete intersection at `𝔪` in the sense
  of DerivedDeRhamCohomology §0.19: the target `R′` of a Cohen factorization of that map to `R̂` is flat
  over a regular base with regular closed fibre, hence regular, so it is a Cohen presentation, and
  DeformationAndDerivedPatchingAlgebra §3.4 makes the choice of presentation irrelevant.
- Complete intersections are stable under completion, henselization and strict henselization:
  the flat-local criterion of DeformationAndDerivedPatchingAlgebra §3.4 applied to `R → R̂`, `R → R^h`
  and `R → R^{sh}`, whose closed fibres are fields (ModularCurves Layer 4D), together with
  `virtualDimension` and `dim` being unchanged.

**Checks.**
- `virtualDimension k⟦x_1, …, x_n⟧ = n` through the identity presentation; presenting `k⟦x⟧` as
  `k⟦x, y⟧/(y)` gives `2 − 1 = 1` again, so the value does not depend on the presentation.
- `virtualDimension k⟦x, y⟧/(xy) = 1 = dim`: a complete intersection.
- For `R = k⟦x, y⟧/(x, y)²`, `μ((x, y)²) = 3`, so `virtualDimension R = −1` while `dim R = 0`: the
  virtual dimension is not the dimension and can be negative.
- For `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)` the three relations are minimal generators, so
  `virtualDimension R = 4 − 3 = 1` while `dim R = 2`; `R` is not a complete intersection.
- A Cohen presentation needs `B` regular: `k⟦x, y⟧/(xy) → k⟦x, y⟧/(xy)` is surjective but its source
  is not regular, and taking it would give `2 − 0 = 2 ≠ 1`.
- Outside the Noetherian case the predicate carries no information: for a rank-one valuation ring
  with `𝔪 = 𝔪²` the completion `lim R/𝔪ⁿ = R/𝔪` is a field, the presentation `R/𝔪 → R/𝔪` has
  kernel `0`, generated by the empty sequence, so `IsCompleteIntersection R` holds and
  `virtualDimension R = 0` although `R` is not Noetherian; this is why every theorem using these
  notions assumes `IsNoetherianRing R`.

### 1.2 Additivity of the virtual dimension along flat local maps

Prove: for a flat local homomorphism `R → R′` of Noetherian local rings with maximal ideal `𝔪` of `R`,
`vdim(R′) = vdim(R) + vdim(R′/𝔪R′)`; equivalently the complete-intersection defect `dim − vdim` is
additive ([CS24] (3.2.1.3) and the sentence after it, pp. 32–33). Route: dimension is additive along
flat local maps (EGA IV 6.1.2), and Avramov's additivity of the defect (DerivedDeRhamCohomology, the
complete-intersection defect contract). The separable-fibre case is §1.1; the case of
complete-intersection `R` and closed fibre follows from the flat-local criterion of
DeformationAndDerivedPatchingAlgebra §3.4 without Avramov's theorem.
*Needs:* §1.1; DerivedDeRhamCohomology (the complete-intersection defect contract);
DeformationAndDerivedPatchingAlgebra §3.4.

**Checks.**
- For `R → R^{sh}` the fibre is a separable field and the formula reads `vdim(R^{sh}) = vdim(R)`.
- For `k⟦x⟧ → k⟦x, y⟧/(y²)` (flat, fibre `k[y]/(y²)` of virtual dimension `0`) both sides are `1`.
- For a flat map with fibre `k⟦y, z⟧/(y, z)²` (virtual dimension `−1`) the virtual dimension drops by
  one although the dimension is unchanged.

### 1.3 Depth and virtual dimension are incomparable

Prove: (a) a Noetherian local ring that is Cohen–Macaulay and not a complete intersection has
`depth R = dim R > vdim(R)`; (b) every regular local ring `R̃` of dimension `≥ 3` has an ideal `I`
generated by three elements with `pd_{R̃}(R̃/I) = dim R̃` ([Koh72] Theorem A, applied to the residue field,
extending Burch's local theorem), hence, by
the Auslander–Buchsbaum formula, `R = R̃/I` has `depth R = 0` while `vdim(R) ≥ dim R̃ − 3` ([CS24]
Remark 3.2.2, p. 33). So the étale-depth bound of §1.6 is not a consequence of the depth bound for
quasi-coherent coefficients. The three-generated ideals of maximal projective dimension are a target
of this subsection.
*Needs:* §1.1; SchemeAndStackFoundations §0.17 (depth, Cohen–Macaulay); PurityOfBranchLocus §0.3
(`auslander_buchsbaum`).

**Checks.**
- The twisted cubic cone `k⟦x, y, z, w⟧/(xz − y², yw − z², xw − yz)` is Cohen–Macaulay of dimension
  `2`, not a complete intersection, with `vdim = 4 − 3 = 1 < 2 = depth`.
- For a complete intersection depth and virtual dimension both equal the dimension, so (a) is sharp.
- For `R̃ = k⟦x, y, z⟧` the ideal `I = (x², xy, xz)` has `R̃/I` of depth `0` (the class of `x` is
  killed by `𝔪`) and `vdim(R̃/I) = 3 − 3 = 0`: in dimension `3` the bound `vdim ≥ dim R̃ − 3` is not
  strict, so (b) separates the two invariants only for `dim R̃ ≥ 4`.

### 1.4 Local étale duality on excellent regular local rings

Prove, for an excellent regular local ring `(R, 𝔪)` of dimension `d` and a prime `ℓ` invertible in
`R`:
(a) Gabber's affine Lefschetz theorem in the form used: if `R` is strictly henselian and `f ∈ 𝔪`,
then `H^i_ét(Spec R[1/f], ℤ/ℓ) = 0` for `i > d` ([ILO14] XV, Corollaire 1.2.4, as used in [CS24]
(3.2.3.2), p. 33);
(b) the complex `(μ_ℓ^{⊗d})[2d]` on `(Spec R)_ét` is dualizing, normalised by the fundamental class of
absolute purity, its restriction to an open `j : V → Spec R` is `j^*((μ_ℓ^{⊗d})[2d])` and is dualizing
on `V`, and `Rj_* ∘ D ≅ D ∘ j_!` ([ILO14] XVII, Théorème 0.2 of the published version, Théorème 0.9 of
arXiv v1; [ILO14] XVI, Théorème 3.1.1);
(c) local duality: if `R` is strictly henselian, then for a bounded constructible complex `K` of
`ℤ/ℓ`-modules, `H^i_𝔪(R, K)` is Pontryagin dual to the stalk at the closed point of
`H^{−i}(RHom(K, (μ_ℓ^{⊗d})[2d]))` (SGA 5 I, (4.2.2), as used in [CS24] proof of Lemma 3.2.3, p. 33,
which first reduces to strictly henselian `R`).
*Needs:* EtaleCohomologyFoundations §F.5 (exceptional inverse image, biduality and duality on
traits); LefschetzPencilsAndVanishingCycles §0.10 (absolute purity, which normalises (b));
SchemeAndStackFoundations §§0.21, 2.15 (excellence, Gabber's affine proper base change).

**Checks.**
- For `d = 1` (a strictly henselian excellent discrete valuation ring) and `f` a uniformizer,
  `Spec R[1/f]` is the spectrum of a field of `ℓ`-cohomological dimension `1`, so (a) holds, and (b)
  is EtaleCohomologyFoundations §F.5's trait dualizing complex `μ_ℓ[2]`.
- For `d = 0` (a separably closed field) `(μ_ℓ^{⊗0})[0] = ℤ/ℓ` and (c) is linear duality of
  `𝔽_ℓ`-vector spaces.
- The twist and shift in (b) are forced by absolute purity: for `R` strictly henselian,
  `H^{2d}_𝔪(R, μ_ℓ^{⊗d}) ≅ ℤ/ℓ` and `H^i_𝔪(R, ℤ/ℓ) = 0` for `i ≠ 2d`; a shift by `[d]` would put the
  class in the wrong degree.
- Strict henselianity is needed in (c): for the finite field `R = 𝔽_2` (`d = 0`), `ℓ = 3`, `K = ℤ/3` and
  `i = 1`, `H^1_𝔪(R, K) = H^1(𝔽_2, ℤ/3) = Hom(Ẑ, ℤ/3) ≅ ℤ/3`, while `RHom(K, ℤ/3)` is `ℤ/3` in degree `0`,
  so its stalk in degree `−1` is `0`; over the separable closure `𝔽̄_2` both sides are `0`.

### 1.5 The local Lefschetz theorem

Prove: for a regular local ring `(R, 𝔪)`, `f ∈ 𝔪` and a prime `ℓ` invertible in `R`, the map
`H^i_𝔪(R, ℤ/ℓ) → H^i_𝔪(R/(f), ℤ/ℓ)` is bijective for `i < dim R − 1` and injective for
`i = dim R − 1` ([CS24] Lemma 3.2.3, p. 33). Route: with `j : Spec R[1/f] → Spec R`, the claim is
`H^i_𝔪(R, j_!(ℤ/ℓ)) = 0` for `i < dim R`; reduce to `R` strictly henselian by the local-to-global
sequence (§0.2) and to `R` complete by the henselian completion comparison (PrismaticCohomology
§2.0); then §1.4(a) gives `H^i(R[1/f], ℤ/ℓ) = 0` for `i > dim R`, which §1.4(b) turns into the
vanishing of the stalk of `H^i(RHom(j_!ℤ/ℓ, (μ_ℓ^{⊗d})[2d]))` for `i > −d`, and §1.4(c) concludes.
*Needs:* §§0.2, 1.4; PrismaticCohomology §2.0 (henselian completion comparison off `V(I)`);
SchemeAndStackFoundations §2.15 (`gabber_affine_proper_base_change`); ModularCurves Layer 4D
(strict henselization, completion, regularity of the completion).

**Checks.**
- For `R` a discrete valuation ring (`dim R = 1`) and `f` a uniformizer: only injectivity in degree
  `0` is claimed, and `H^0_𝔪(R, ℤ/ℓ) = 0 → H^0(k, ℤ/ℓ) = ℤ/ℓ` is injective; bijectivity fails.
- For `f` a unit, `R/(f) = 0` and the claim says `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < dim R`, implied by
  absolute purity (`i < 2 dim R`).
- The range stops below `dim R`: for `R = k⟦x, y⟧` with `k` separably closed of characteristic
  `≠ ℓ` and `f = x`, both sides vanish in degrees `≤ 1`, while in degree `2 = dim R` the map is
  `0 → H^2_𝔪(k⟦y⟧, ℤ/ℓ) ≅ ℤ/ℓ(−1)`, not surjective.

### 1.6 The étale depth is at least the virtual dimension

Prove: for a Noetherian local ring `(R, 𝔪)` and a commutative finite étale `R`-group `G` whose order
is invertible in `R`, `H^i_𝔪(R, G) = 0` for `i < vdim(R)` ([CS24] Theorem 3.2.4 and proof, pp. 33–34;
the excellent `ℚ`-algebra case is [SGA2] XIV, Théorème 5.6). Route: reduce by §0.2 and the invariance
`vdim(R^{sh}) = vdim(R)` to strictly henselian `R`, then by dévissage to `G = ℤ/ℓ`, and by the
henselian completion comparison to complete `R = R̃/(f_1, …, f_n)` with `f_1, …, f_n` minimal
generators. For `n > 1` put `R_1 = R̃/(f_1, …, f_{n−1})`, `R_2 = R̃/(f_n)`,
`R_{12} = R̃/(f_1 f_n, …, f_{n−1} f_n)`; the sequence `0 → ℤ/ℓ_{R_{12}} → ℤ/ℓ_{R_1} ⊕ ℤ/ℓ_{R_2} → ℤ/ℓ_R → 0`
of étale sheaves on `Spec R̃` (étale sites ignore nilpotents) and `vdim(R_*) ≥ vdim(R) + 1` reduce to
a hypersurface `R̃/(f)`, where absolute purity and §1.5 conclude. The reduction to hypersurfaces works
for every finite étale `G` and is reused in §6.4.
*Needs:* §§0.2, 1.1, 1.5; LefschetzPencilsAndVanishingCycles §0.10; PrismaticCohomology §2.0;
ModularCurves Layer 4D.

**Checks.**
- For `R` regular this gives `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < dim R`, weaker than absolute purity.
- For `R = k⟦x, y⟧/(xy)` (virtual dimension `1`) it gives `H^0_𝔪(R, ℤ/ℓ) = 0`, while
  `H^1_𝔪(R, ℤ/ℓ) ≠ 0` because `U_R` has two connected components: the bound is sharp.
- For the depth-zero rings of §1.3(b) with `vdim ≥ 2`, `H^0_𝔪(R, 𝔾_a) ≠ 0` while
  `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < 2`: the étale depth is not controlled by the depth.

### 1.7 Algebraization over punctured spectra

Prove, for a Noetherian local ring `(A, 𝔪)` with a dualizing complex, `X = Spec A`, `U = X ∖ {𝔪}`, an
ideal `I ⊂ 𝔪` and the `I`-adic formal completion of `U`; this is Stacks Situation 0EHC with `𝔞 = 𝔪`, so
that `V(𝔞) = {𝔪}` has dimension `0`: (a) if `A` is `I`-adically complete and every associated point
`x` of a coherent `𝒪_U`-module `F` has closure `Z(x)` in `X` of dimension `dim Z(x) > cd(A, I) + 1`, then
`colim_V H^0(V, F) ≅ lim_n H^0(U, F/I^n F)` over open `V ⊃ U ∩ V(I)` (Stacks, Lemma 0DXR), and
`cd(A, I)` is at most the number of generators of `I` (Stacks, Lemma 0DX9); (b) if `Spec A` is
equidimensional, `Spec A ∖ V(I)` is Cohen–Macaulay, `I` is generated by `d` elements,
`dim A − dim V(𝔞) = dim A > d + 2`, and `(F_n)` is a coherent formal module on
`(U, I𝒪_U)` whose completed stalks at points of `U ∩ V(I)` are locally free off `V(I)` (for instance
every `F_n` finite locally free over `𝒪_U/I^n`), then `(F_n)` extends to `Spec A` and, if `A` is
`I`-adically complete, algebraizes to a coherent module on `U` (Stacks, Lemma 0EJP). These are the
inputs named in [CS24] proof of Theorem 3.3.1, pp. 34–35.
*Needs:* SchemeAndStackFoundations §§4.7–4.8 (formal spectra, coherent formal modules), §2.7
(local cohomology), §0.17 (depth, Cohen–Macaulay); LocalPurity §1.3 (formal-section comparisons
on punctured spectra).

**Checks.**
- For `I = 𝔪`, `U ∩ V(I) = ∅`: the colimit over opens containing `∅` is `H^0(∅, F) = 0` and every
  `F/𝔪ⁿF` vanishes on `U`, so both sides of (a) are zero.
- For a complete regular local `A` of dimension `4` and `I` generated by one element, (b) applies
  with `d = 1`, since `dim A = 4 > 3`; for dimension `3` it does not (`3 > 3` fails), matching the
  threshold `vdim ≥ 3` of §1.8. Taking `𝔞 = 0` instead would give `dim V(𝔞) = 4` and `4 − 4 > 3`
  false: the closed set `V(𝔞)` must be the closed point, as fixed above.
- The dimension bound in (a) cannot be dropped: for `A = k⟦x, y⟧`, `I = (x)` and `F = 𝒪_U`,
  `cd(A, I) = 1` and the generic point has closure of dimension `2 = cd + 1`, and indeed
  `Σ_n y^{−n²} xⁿ ∈ lim_n Γ(U, 𝒪/xⁿ) = k((y))⟦x⟧` is not the expansion of a function on any open
  neighbourhood of the punctured line `V(x) ∖ {𝔪}`: its `xⁿ`-coefficients have poles of order `n²`.

### 1.8 Zariski–Nagata purity in virtual dimension at least three

Define `finiteEtalePullback f`, for a morphism of schemes `f : Y ⟶ X`, as Mathlib's
`MorphismProperty.Over.pullback` for the morphism property finite and étale, the restriction functor
on finite étale schemes of LocalPurity §1.1.

API (each a target):
- `finiteEtalePullback (𝟙 X)` is isomorphic to the identity functor, and pullback along a composite is
  isomorphic to the composite of the pullbacks.
- For `X = Spec R` with `R` local and `f` the inclusion of `puncturedSpectrum R`, it is the restriction
  functor of LocalPurity §1.1, so `PurityHolds R` is essential surjectivity of `finiteEtalePullback f`.
- It preserves finite coproducts and the empty scheme.

Prove ([CS24] Theorem 3.3.1 and proof, pp. 34–35;
Remark 3.3.2, p. 35): for a Noetherian local ring `(R, 𝔪)`,
(a) `zariskiNagata_full_faithful_connected`: if `vdim(R) ≥ 2`, pullback from finite étale schemes
over `Spec R` to finite étale schemes over `puncturedSpectrum R` is fully faithful and
`puncturedSpectrum R` is connected; then `π_1^ét(U_R) → π_1^ét(Spec R)` is surjective;
(b) `zariskiNagata_isEquivalence`: if `vdim(R) ≥ 3`, this pullback is an equivalence of categories;
then `π_1^ét(U_R) → π_1^ét(Spec R)` is an isomorphism.
No excellence, normality or complete-intersection hypothesis is made.
Route: connectedness follows from full faithfulness applied to `Spec R ⊔ Spec R`; the statements on
`π_1` follow from those on functors by the fundamental theorem of Galois categories ([SGA1] V,
Proposition 6.9 and Corollaire 6.10; EtaleCohomologyFoundations §F.0.2 with Mathlib
`CategoryTheory.PreGaloisCategory.functorToContAction`). Reduce to complete `R` by
LocalPurity §1.3 (`extends_iff_completion_extends` for essential surjectivity; for morphisms, flat
descent of sections of finite étale schemes along `R → R̂`), and write `R = R̃/𝔣` with `R̃` complete
regular and `𝔣 = (f_1, …, f_n)` minimally generated, so `vdim R = dim R̃ − n`. Finite étale schemes
over `R` and over `U_R` are those over the `𝔣`-adic formal completions of `Spec R̃` and `U_{R̃}`
(SchemeAndStackFoundations §0.14, `henselian_finiteEtale_equivalence`). For (a), §1.7(a) algebraizes
morphisms over an open `V ⊃ U_R` whose complement has codimension `≥ 2`, and Hartogs
(SchemeAndStackFoundations §0.6) extends them. For (b), §1.7(b) algebraizes covers over such `V` with
complement of codimension `≥ 3`, and Zariski–Nagata purity for the regular `R̃` (LocalPurity §§2.1–2.2)
extends them.
*Needs:* §§0.1, 1.1, 1.7; LocalPurity §§1.1, 1.3, 2.1, 2.2; SchemeAndStackFoundations §§0.6, 0.14;
EtaleCohomologyFoundations §F.0.2; Mathlib `MorphismProperty.Over.pullback`,
`CategoryTheory.PreGaloisCategory`.

**Checks.**
- For `R` regular of dimension `2`, `vdim = 2` and (a) gives full faithfulness; the equivalence is
  the stronger Zariski–Nagata theorem of LocalPurity §2.1.
- For `R = k⟦x, y⟧/(xy)`, `vdim = 1` and `U_R` is the disjoint union of two punctured lines, so `U_R`
  is disconnected and (a) fails below virtual dimension `2`.
- For the `A_1` singularity `R = ℂ⟦u, v, w⟧/(uw − v²)` (a hypersurface, `vdim = dim = 2`), the quotient
  map from `ℂ⟦x, y⟧` restricts to a connected étale double cover of `U_R`, so
  `π_1^ét(U_R) = ℤ/2 ≠ π_1^ét(Spec R) = 1`: (b) fails at virtual dimension `2`.
- For the complete intersection `R = k⟦x, y, z, w⟧/(xy − zw)` of dimension `3 = vdim`, every finite
  étale cover of `U_R` extends ([SGA2] X, Théorème 3.4(ii)), in agreement with (b).
- For `R = k⟦x, y, z, t⟧/(x², y², xz − yt)`, `vdim = 1 < 2`, so no assertion is made even though
  `dim R = 2`.
- For `f` an isomorphism `finiteEtalePullback f` is an equivalence; for the inclusion of the empty open
  subscheme every finite étale scheme pulls back to the empty one, so the functor is essentially
  surjective but not faithful as soon as `X` has a nonempty finite étale scheme with two distinct
  endomorphisms (for instance `X ⊔ X`).
- For `f : Spec ℂ → Spec ℝ`, `finiteEtalePullback f` sends the connected degree-two cover
  `Spec ℂ → Spec ℝ` to `Spec ℂ ⊔ Spec ℂ`, since `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`: the rank `2` is preserved,
  connectedness is not, and the functor is not full, because there is no map `Spec ℝ → Spec ℂ` over
  `Spec ℝ` (no `ℝ`-algebra map `ℂ → ℝ`) while after pullback there are two maps
  `Spec ℂ → Spec ℂ ⊔ Spec ℂ` over `Spec ℂ`. So pullback along a faithfully flat map need not be an
  equivalence, and the hypotheses of (a) and (b) are about the punctured spectrum, not about flatness.

### Examples

For `R = k⟦x, y, z, w⟧/(xy − zw)`: `vdim(R) = 3`, so §1.8(b) gives that every finite étale cover of the
punctured spectrum of the three-dimensional node extends, although `Pic(U_R) ≅ ℤ` is nonzero (§7.6);
and §1.6 gives `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < 3`. For `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)`, §1.6 gives
only `H^0_𝔪(R, ℤ/ℓ) = 0`.

### Dependencies

§§0.1–0.2; DeformationAndDerivedPatchingAlgebra §3.4; DerivedDeRhamCohomology §§0.19, 0.21 and the
complete-intersection defect contract; PerfectoidSpaces §P7.16a;
ModularCurves Layer 4D; PurityOfBranchLocus §0.3; LefschetzPencilsAndVanishingCycles §0.10;
EtaleCohomologyFoundations §§F.0.2, F.5; PrismaticCohomology §2.0; SchemeAndStackFoundations §§0.6,
0.14, 0.17, 0.21, 2.7, 2.15, 4.7–4.8; LocalPurity §§1.1, 1.3, 2.1, 2.2.

## Layer 2: The crystalline key formula over perfect schemes

Throughout, `S` is a perfect `𝔽_p`-scheme (SchemeAndStackFoundations §0.24) and `G` a commutative
finite locally free `S`-group that is locally on `S` of `p`-power order. The covariant crystalline
Dieudonné module `𝕄(G)`, a quasi-coherent `W(𝒪_S)`-module with a Frobenius-semilinear `F` and an
inverse-Frobenius-semilinear `V`, `FV = VF = p`, locally finitely presented, killed by a power of `p`
and of projective dimension `≤ 1`, with the exactness of `G ↦ 𝕄(G)`, its base change along perfect
`S`-schemes and the normalisations of Convention 6, and the functorial triangle
`Rε_*G → 𝕄(G) → 𝕄(G) → (Rε_*G)[1]` on `S_ét` with middle map `V − 1`, for `ε : S_fppf → S_ét`, are
PrismaticCohomologyPartIII §6.0 (`Prismatic.FlatCohomology.perfectDieudonneComparison`; [CS24]
§4.1.1, Lemma 4.1.3, Propositions 4.1.4 and 4.1.7, Theorem 4.1.8, pp. 36–38, recording Berthelot,
Gabber and Lau, [Lau13] Corollary 6.5). This layer turns that triangle into the key formula with
supports that Layers 4 and 5 use, a perfect-ring variant of Kato–Trihan's formula.

### 2.1 The key formula with supports over perfect schemes

Prove: for `G` killed by `p^n` and a closed `Z ⊂ S`,
`RΓ_Z(S, G) ≅ RΓ_Z(W_n(S), 𝕄(G))^{V=1}`, the fibre of `V − 1` on the Zariski cohomology with supports
of the quasi-coherent `W_n(𝒪_S)`-module `𝕄(G)`, functorially in `S`, `Z` and `G` ([CS24] Theorem 4.1.8,
(4.1.8.2), p. 38). Route: the scheme `W_n(S)` has the underlying space of `S`, so `Z` is a closed subset
of it; apply the supported étale cohomology `RΓ_Z(S_ét, −)` of §0.2 to the triangle of
PrismaticCohomologyPartIII §6.0: `RΓ_Z(S_ét, Rε_*G) = RΓ_Z(S, G)` because `Rε_*` carries the fppf
support triangle of `S` and `S ∖ Z` to the étale one; the étale site of the nil-thickening `W_n(S)`
is that of `S` (EtaleCohomologyFoundations §F.0.4), and for the quasi-coherent `𝕄(G)` on `W_n(S)`
étale and Zariski cohomology with supports agree (SchemeAndStackFoundations §§2.7, 2.10),
compatibly with `V − 1`. Prove the corollary: for a perfect `𝔽_p`-algebra `A` and `G` of `p`-power
order, `H^i(A, G) = 0` for `i ≥ 2` ([CS24] Corollary 4.1.9, pp. 38–39): with `Z = S = Spec A`, the
quasi-coherent cohomology of the affine `W_n(A)` is concentrated in degree `0`, so the fibre of
`V − 1` lives in degrees `0` and `1`.
*Needs:* PrismaticCohomologyPartIII §6.0; §0.2; SchemeAndStackFoundations §§0.24, 2.1–2.3, 2.7, 2.10;
EtaleCohomologyFoundations §F.0.4; Mathlib `WittVector`.

**Checks.**
- For `Z = S = Spec A` and `G = ℤ/p`, the formula is the Artin–Schreier description
  (SchemeAndStackFoundations §2.11): `𝕄(ℤ/p) = A` with `V = φ^{-1}` (Convention 6), so
  `H^0(A, ℤ/p) = {a : φ^{-1}(a) = a} = A^{φ=1}`, `H^1(A, ℤ/p) = A/(φ^{-1} − 1)A = A/(φ − 1)A` (the
  automorphism `φ` carries one subgroup to the other), and `H^{≥2} = 0`; for `A = 𝔽_p` this is
  `𝔽_p`, `𝔽_p`, `0`, and for `A = 𝔽̄_p` it is `𝔽_p`, `0`, `0`.
- For `G = μ_{p^n}` over perfect `A`: `V = p·φ^{-1}` on `W_n(A)` is nilpotent (`V^n = p^n φ^{-n} = 0`),
  so `V − 1` is invertible and `RΓ(A, μ_{p^n}) = 0`, consistent with the Kummer sequence and the
  `p`-divisibility of `A^×` and of `Pic A` for perfect `A`; with the covariant and contravariant
  conventions interchanged this Check and the previous one would swap, and `RΓ(A, ℤ/p)` would wrongly
  vanish for `A = 𝔽_p`.
- For `G = α_p`, `𝕄(α_p) = 𝒪_S` with `F = V = 0`, so `V − 1 = −1` and `RΓ(S, α_p) = 0` for perfect `S`;
  over the non-perfect `𝔽_p[t]` the `α_p`-torsor `s^p = t` is nontrivial, so perfectness of `S` cannot
  be dropped.
- Without passing to `V = 1`: for `A = 𝔽̄_p` and `G = ℤ/p`, `H^0(W(A), 𝕄(G)) = 𝔽̄_p ≠ ℤ/p = G(A)`.
- The corollary needs perfectness: for the imperfect field `𝔽_p(s)`, `H^2(𝔽_p(s), μ_p) = Br(𝔽_p(s))[p]`
  is nonzero.

### Examples

Over `S = Spec 𝔽_p⟦t^{1/p^∞}⟧` and `Z` the closed point, §2.1 with `n = 1` identifies `RΓ_Z(S, ℤ/p)`
with the fibre of `φ^{-1} − 1` on `RΓ_Z(S, 𝒪_S)`; since `t` is regular, `H^0_Z(S, 𝒪_S) = 0` by §0.4, so
`H^0_Z(S, ℤ/p) = 0`, the input to §4.4 in dimension one.

### Dependencies

PrismaticCohomologyPartIII §6.0; SchemeAndStackFoundations §§0.24, 2.1–2.3, 2.7, 2.10, 2.11;
EtaleCohomologyFoundations §F.0.4; §§0.2, 0.4.

## Layer 3: Flat cohomology of animated rings

Flat cohomology `RΓ_fppf(A, G)` of an animated `R`-algebra `A` (cohomology on the fppf site of
animated `A`-algebras, the flat maps with fppf map on `π_0`, [CS24] §§5.2.1–5.2.3), the Bégueri
resolution `0 → G → Res_{G^*/R}(𝔾_m) → Q → 0` of a finite locally free `G` by smooth affine
commutative groups, exact on the fppf site of every animated `R`-algebra ([CS24] (1.4.2) and
(5.2.6.3); [Bég80] 2.2.1), the deformation fibre sequence
`RΓ_fppf(A′, G) → RΓ_fppf(A, G) → RHom_R(e^*L_{G/R}, M[1])` for a square-zero extension `A′ ↠ A`
with ideal `M` and `G` smooth or finite locally free ([CS24] Theorem 5.2.8), `p`-adic continuity
([CS24] Theorem 5.3.5) and excision along a principal ideal ([CS24] Lemma 5.4.2) are
PrismaticCohomologyPartIII §6.0. This layer adds what the purity theorems need beyond them: supports,
the Postnikov, étale and nilpotent consequences, the consequences of `p`-adic continuity, excision
along finitely generated ideals and fpqc hyperdescent ([CS24] §§5.2.4–5.2.10, 5.3.7–5.3.8,
5.4.3–5.4.5, 5.5, pp. 54–70). Animated rings and their modules are EnhancedDerivedSheaves
E5:animation; the cotangent complex is DerivedModuleAlgebra §0.4. Throughout `R` is a ring and `G`
a commutative affine `R`-group.

### 3.1 The deformation sequence of a smooth group on a square-zero thickening

Prove: for `G` smooth commutative over a ring `B` with unit section `e` and a closed immersion
`j : Spec B/J → Spec B` with `J² = 0`, the sequence `0 → Hom_B(e^*Ω^1_{G/B}, J) → G → j_*G → 0` of
sheaves on `(Spec B)_ét` is exact, the first term being the sheaf `𝒢^a` of §0.2 attached to the
quasi-coherent module `Hom_B(e^*Ω^1_{G/B}, J)` ([Čes15] Lemma B.14, as used in [CS24] proof of
Lemma 4.1.11, p. 39). It is the discrete, sheaf-level form of the deformation fibre sequence of
PrismaticCohomologyPartIII §6.0: for smooth `G`, `e^*L_{G/B} = e^*Ω^1_{G/B}` is finite locally free in
degree `0`, so over an étale `B`-algebra `B′` the fibre of `G(B′) → G(B′/JB′)` is
`Hom(e^*Ω^1_{G/B}, JB′)` in degree `0`, and smoothness of `G` makes `G(B′) → G(B′/JB′)` surjective
after an étale cover. The sequence is used in §4.2 for smooth `G` and `J` free of rank one.
*Needs:* PrismaticCohomologyPartIII §6.0 (the deformation fibre sequence); §0.2; DerivedModuleAlgebra
§0.25; SchemeAndStackFoundations §2.10.

**Checks.**
- For `G = 𝔾_m` the kernel is `1 + J ≅ (J, +)` through `1 + x ↦ x`, a homomorphism because `J² = 0`:
  `e^*Ω^1_{𝔾_m/B}` is free of rank one and `Hom(e^*Ω^1, J) = J`.
- For `G = 𝔾_a` the sequence is `0 → J → B → B/J → 0` of quasi-coherent sheaves.
- `J² = 0` is needed for the identification of the kernel: for `B = 𝔽_2[ε]/(ε³)` and `J = (ε)`,
  `(1 + ε)² = 1 + ε² ≠ 1` while `2ε = 0` in `(J, +)`, so `1 + J` and `(J, +)` are not isomorphic through
  `1 + x ↦ x`.
- Smoothness is needed for a sequence in degree `0` alone: for `G = μ_p` over `𝔽_p`,
  `e^*L_{μ_p/𝔽_p}` has cohomology in degrees `−1` and `0` (both `𝔽_p`), so the fibre sequence of
  PrismaticCohomologyPartIII §6.0 has a term in degree `−1`, which the three-term sheaf sequence
  cannot express (compare the derived-reduction Check of §3.2).

### 3.2 Flat cohomology of animated rings with supports

Construct, for an animated `R`-algebra `A`, a closed `Z ⊂ Spec π_0(A)` and its open complement `U`,
the complex `RΓ(U_A, G)` as the derived limit of `RΓ_fppf(A′, G)` over the animated `A`-algebras `A′`
fppf over `A` such that `Spec π_0(A′) → Spec π_0(A)` factors through `U`, and `RΓ_Z(A, G)` as the
fibre of `RΓ_fppf(A, G) → RΓ(U_A, G)` ([CS24] §5.2.5, p. 55); `RΓ(U_A, G)` is not the classical flat
cohomology of the scheme `U`, and for discrete `A` the construction agrees with §0.2. Prove: base
change to `π_0` is an equivalence on étale and on finite étale algebras ([CS24] Proposition 5.2.4,
p. 54); for `G` smooth or finite locally free, `A ↦ RΓ_fppf(A, G)` satisfies fppf hyperdescent and
Postnikov convergence `RΓ_fppf(A, G) ≅ Rlim_n RΓ_fppf(τ_{≤n}A, G)`, and for smooth `G`,
`RΓ_ét(A, G) ≅ RΓ_fppf(A, G)` ([CS24] Theorem 5.2.6, p. 56). The reduction from finite locally free to
smooth `G` is the Bégueri resolution of PrismaticCohomologyPartIII §6.0, exact on the fppf site of
every animated `R`-algebra because `Res_{G^*/R}(𝔾_m) → Q` is fppf.
*Needs:* PrismaticCohomologyPartIII §6.0 (animated flat cohomology and the Bégueri resolution); §0.2;
EnhancedDerivedSheaves E5:animation; SchemeAndStackFoundations §2.10; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual`.

API (each a target):
- Functoriality of `RΓ_Z(A, G)` in `A`, in `G` and in the support; long exact sequences for short
  exact sequences of coefficients and the support triangle `RΓ_Z(A, G) → RΓ(A, G) → RΓ(U_A, G)`.
- For a closed `Z′ ⊂ Z`, the triple sequence of supports, as in §0.2.
- Base change to `π_0` is an equivalence on étale and on finite étale algebras.
- fppf hyperdescent and Postnikov convergence for smooth or finite locally free `G`, and
  `RΓ_ét(A, G) ≅ RΓ_fppf(A, G)` for smooth `G`.

**Checks.**
- For discrete `A` the construction agrees with §0.2.
- The open in the support triangle is animated: for `A = k ⊕ k[1]`, `G = 𝔾_a` and `Z = ∅`, the triangle
  gives `RΓ_∅(A, 𝔾_a) = fib(RΓ(A, 𝔾_a) → RΓ(U_A, 𝔾_a)) = fib(id) = 0`, whereas the classical open
  `Spec k` would give `fib(A → k) = k[1]`, with `H^{−1} = k ≠ 0`.
- For `G = μ_n`, `G^* = ℤ/n` and the Bégueri resolution is `0 → μ_n → Res_{(ℤ/n)/R}(𝔾_m) = 𝔾_m^n → Q → 0`
  with `ζ ↦ (ζ^i)_{i ∈ ℤ/n}`, the map adjoint to the Cartier pairing; the diagonal `ζ ↦ (ζ, …, ζ)` is not
  this map.
- For `A = 𝔽_p ⊕ 𝔽_p[1]` (the derived reduction of `𝔽_p` modulo `p`) the étale site is that of `𝔽_p` by
  Proposition 5.2.4, while the flat cohomology of `μ_p` differs from that of `𝔽_p` in degree zero:
  `H^0(A, μ_p) ≅ Ext¹(e^*L_{μ_p/𝔽_p}, 𝔽_p) = 𝔽_p ≠ 0 = μ_p(𝔽_p)` by the deformation fibre sequence,
  as §3.3 allows.

### 3.3 Nilpotent invariance from the deformation triangle

Prove, from the deformation fibre sequence of PrismaticCohomologyPartIII §6.0, for `G` smooth or
finite locally free, affine and commutative: `H^i_fppf(A, G) → H^i_fppf(π_0 A, G)` is surjective for
all `i` and bijective for `i ≥ 0` (smooth `G`), resp. `i ≥ 1` (finite locally free `G`) ([CS24]
Corollary 5.2.9, p. 57); and for an ideal `I ⊂ R` whose elements are nilpotent,
`H^i(R, G) → H^i(R/I, G)` is surjective for `i ≥ 0` (resp. `i ≥ 1`) and bijective for `i ≥ 1` (resp.
`i ≥ 2`) ([CS24] Corollary 5.2.10, p. 57). Route: `e^*L_{G/R}` is perfect of Tor-amplitude `[−1, 0]`,
and a finite projective module in degree `0` for smooth `G` ([CS24] Proposition 5.1.12, p. 52), so
`RHom_R(e^*L_{G/R}, M[1])` lives in degrees `≤ 1`, resp. `≤ 0`, for connective `M`; the Postnikov
tower `τ_{≤n}A → τ_{≤n−1}A` consists of square-zero extensions, and Postnikov convergence (§3.2) gives
the first statement; for the second, `R/I` is the filtered colimit of `R/I′` over finitely generated
`I′ ⊂ I`, each nilpotent, and a nilpotent ideal is reached by finitely many square-zero steps
`R/I′^{k+1} → R/I′^k`, the Bégueri resolution reducing finite locally free `G` to smooth `G`.
*Needs:* PrismaticCohomologyPartIII §6.0 (the deformation fibre sequence, the Bégueri resolution);
§3.2; DerivedModuleAlgebra §0.4; SchemeAndStackFoundations §0.9 (limits).

**Checks.**
- For `G = 𝔾_m`, `R = k[ε]/(ε²)` and `I = (ε)`: `H^0(R, 𝔾_m) = R^× → k^×` is surjective with kernel
  `1 + kε`, and `H^1` agrees (`Pic = 0` on both), matching smooth `G` in degree `0`.
- For `G = α_p` over `R = 𝔽_p[ε]/(ε²)` and `I = (ε)`: `H^0(R, α_p) = 𝔽_p ε` and
  `H^1(R, α_p) = R/R^p ≅ 𝔽_p ε` map onto `H^0(𝔽_p, α_p) = H^1(𝔽_p, α_p) = 0` without being injective,
  so the finite locally free range starts at `i ≥ 2` for bijectivity.
- For `G = μ_p`, `R = ℤ/p²` and `I = (p)`: `μ_p(ℤ/p²) = 1 + pℤ/p² ≅ ℤ/p` (every `x` with `x^p = 1` is
  `≡ 1 mod p`, and `(1 + pa)^p = 1`) maps onto `μ_p(𝔽_p) = 1` without being injective, so for a finite
  locally free group bijectivity cannot begin before degree `1`, and the `α_p` Check shows it cannot
  begin before degree `2`.
- For `I = 0` all the maps are identities, and for a trivial square-zero extension `A ⊕ M` the fibre
  sequence of PrismaticCohomologyPartIII §6.0 splits, so the surjectivity is realised by a section.

### 3.4 p-adic continuity and its consequences

`p`-adic continuity, `RΓ(A, G) ≅ Rlim_n RΓ(A/^L p^n, G)` for `G` finite locally free of `p`-power order
and an animated `R`-algebra `A` with `π_0(A)` `p`-henselian, is PrismaticCohomologyPartIII §6.0
(`Prismatic.FlatCohomology.pContinuity`; [CS24] Theorem 5.3.5, pp. 59–61). Prove its consequences:
`H^i(A, G) = 0` for `i ≥ 3`, and for `i ≥ 2` when `(π_0(A)/p)_red` is perfect ([CS24] Corollary 5.3.7,
p. 61), in particular `H^{≥2}(A, G) = 0` for perfectoid `A`; and for a map `A → A′` of such animated
`R`-algebras with `A/^L p ≅ A′/^L p` and an open `Spec(π_0(A)[1/p]) ⊂ U ⊂ Spec π_0(A)` with complement
`Z`, `RΓ(U_A, G) ≅ RΓ(U_{A′}, G)` and `RΓ_Z(A, G) ≅ RΓ_Z(A′, G)` ([CS24] Corollary 5.3.8, pp. 61–62).
Route for Corollary 5.3.7: §3.3 reduces to discrete `A`; by §3.3 the maps
`H^i(A/p^n, G) → H^i(A/p^{n−1}, G)` are surjective for `i ≥ 1` and bijective for `i ≥ 2`, so
`p`-adic continuity reduces to an `𝔽_p`-algebra, then §3.3 to a reduced one; if it is perfect, §2.1
concludes; otherwise, by §0.3 assume `A` Noetherian, use the Leray spectral sequence of
`ε : A_fppf → A_ét` (SchemeAndStackFoundations §2.2), `R^{≥2}ε_*G = 0` by the Bégueri resolution and
the fppf–étale comparison for the smooth groups `Res_{G^*/R}(𝔾_m)` and `Q`
(SchemeAndStackFoundations §2.10), and the bound `≤ 1` on the étale `p`-cohomological dimension of an
affine `𝔽_p`-scheme ([SGA4] X, Théorème 5.1, from the Artin–Schreier sequence of
SchemeAndStackFoundations §2.11). Route for Corollary 5.3.8: `π_0` of the `p`-adic completion `Â` is
a square-zero extension of that of `π_0(A)`, so it is `p`-henselian and `A′` may be replaced by `Â`;
for `U = Spec(π_0(A)[1/p])` the invariance of torsion étale cohomology of `Spec(π_0 A)[1/p]` under
`p`-adic completion (PrismaticCohomology §2.0, the `arc_p` sheaf property) and the `π_0`-invariance
of §3.2 give `RΓ(U_A, G) ≅ RΓ(U_{A′}, G)`; for general `U`, work locally on `U` and pass to
`p`-henselizations, which do not change `RΓ_{p=0}` (PrismaticCohomologyPartIII §6.0, excision along
`(p)`), reducing to `U = Spec π_0(A)`, where `p`-adic continuity gives `RΓ(A, G) ≅ RΓ(A′, G)` and the
support triangle of §3.2 the rest.
*Needs:* PrismaticCohomologyPartIII §6.0 (`p`-adic continuity, the Bégueri resolution, excision along
`(p)`); §§0.3, 2.1, 3.2, 3.3; PrismaticCohomology §2.0 (the `arc_p` sheaf
`R ↦ RΓ_ét(Spec R̂_p[1/p], F)` and the henselian completion comparison); SchemeAndStackFoundations
§§2.2, 2.10, 2.11.

**Checks.**
- For the imperfect field `A = 𝔽_p(s)` (`p`-henselian since `p = 0`), `H^2(A, μ_p) = Br(A)[p] ≠ 0`:
  the perfectness hypothesis of the degree-two bound cannot be dropped, while `H^{≥3}(A, μ_p) = 0`.
- For `A = ℤ_p` and `G = μ_{p^n}`: `H^{≥2}(ℤ_p, μ_{p^n}) = 0` since `(ℤ_p/p)_red = 𝔽_p` is perfect,
  consistent with `Br(ℤ_p) = Br(𝔽_p) = 0` and the Kummer sequence; the bound `i ≥ 3` alone would
  leave `H^2` undetermined.
- The `p`-henselian hypothesis of `p`-adic continuity enters Corollary 5.3.8: for `A = ℤ` and odd `p`,
  `H^1(ℤ, μ_p) = ℤ^×/ℤ^{×p} ⊕ Pic(ℤ)[p] = 0`, while `H^1(ℤ_p, μ_p) = ℤ_p^×/ℤ_p^{×p} ≅ ℤ/p`, although
  `ℤ/p ≅ ℤ_p/p`.
- For `A → A′ = Â` the `p`-adic completion of a `p`-henselian `A` and `U = Spec π_0(A)`, Corollary
  5.3.8 is `p`-adic continuity itself; for `U = Spec(π_0(A)[1/p])` it is the completion invariance of
  the generic fibre.

### 3.5 Excision along finitely generated ideals

Excision along a principal ideal, `RΓ_{a=0}(A, G) ≅ RΓ_{a=0}(A′, G)` for `G` commutative finite
locally free, a map `A → A′` of animated `R`-algebras and `a ∈ π_0(A)` with `A/^L a ≅ A′/^L a`, is
PrismaticCohomologyPartIII §6.0 (`Prismatic.FlatCohomology.excision`; [CS24] Lemma 5.4.2, pp. 63–66).
Prove: for a finitely generated ideal `I ⊂ π_0(A)`, the condition `π_0(A)/I ≅ (π_0(A)/I) ⊗^L_A A′`
holds iff `A → A′` is an isomorphism after iterated derived `a_i`-adic completion for generators
`a_1, …, a_r` of `I`, iff `A/^L(a_1^n, …, a_r^n) ≅ A′/^L(a_1^n, …, a_r^n)` for every `n > 0`, so that
it depends only on `I` ([CS24] Lemma 5.4.3, p. 67); and under that condition
`RΓ_I(A, G) ≅ RΓ_I(A′, G)` ([CS24] Theorem 5.4.4, p. 67; announced as Theorem 1.2.1, p. 6); in
particular, for a Noetherian local ring `(R, 𝔪)` and commutative finite flat `G`,
`H^i_𝔪(R, G) ≅ H^i_𝔪(R̂, G)` for every `i` ([CS24] Corollary 5.4.5, p. 68). Route: reduce to `A′` the
iterated derived `a_i`-adic completion of `A`, then by induction to `A′` the derived `a`-adic
completion for one `a ∈ I`; the functorial fibre sequence
`RΓ_I(A, G) → RΓ_{a=0}(A, G) → Rlim_{f ∈ I} RΓ_{a=0}(A[1/f], G)` and its analogue for `A′` reduce to
the principal case for `A → A′` and for its localizations; `R̂` is `R`-flat with
`R/𝔪 ≅ R̂/𝔪R̂`.
*Needs:* PrismaticCohomologyPartIII §6.0 (excision along a principal ideal); §§3.2–3.4;
DerivedModuleAlgebra §1.5 (derived completion along a principal ideal).

**Checks.**
- For `A → A′` the identity the statement is trivial; for `I = π_0(A)` both sides are `0`.
- For `R = ℤ_(p)` and `𝔪 = (p)`: `H^i_𝔪(ℤ_(p), μ_p) ≅ H^i_𝔪(ℤ_p, μ_p)`; in degree `2` both are `ℤ/p`,
  the valuation modulo `p` on `ℚ^×/(ℤ_(p)^× ℚ^{×p})`, resp. `ℚ_p^×/(ℤ_p^× ℚ_p^{×p})`.
- Excision needs the support condition: `ℤ_(p) → ℚ` does not induce an isomorphism modulo `p`
  (`𝔽_p` versus `0`), and indeed `H^2_{(p)}(ℤ_(p), μ_p) ≠ 0 = H^2_{(p)}(ℚ, μ_p)`.
- The condition depends only on `I`, not on the generators: for `I = (x, y) = (x, x + y)` in
  `A = k[x, y]` and `A′ = k⟦x, y⟧`, both generating sets lead to the same iterated derived
  completion `k⟦x, y⟧`, and `H^i_I(k[x, y], G) ≅ H^i_I(k⟦x, y⟧, G)` is Corollary 5.4.5 after
  localization at `(x, y)`.

### 3.6 fpqc hyperdescent and descent modulo p

Prove: for `G` commutative finite locally free, `A ↦ RΓ_fppf(A, G)` satisfies fpqc hyperdescent on
animated `R`-algebras ([CS24] Theorem 5.5.2, pp. 69–70); and for a prime `p`, `G` of `p`-power order and
closed `Z ⊂ Spec(R/pR)`, the functors `A ↦ RΓ(A^{h(p)}, G)` (with `p`-henselization) and
`A ↦ RΓ_Z(A, G)` satisfy hyperdescent for cosimplicial algebras `A → A^•` such that `A/^L p → A^•/^L p` is
an fpqc hypercover ([CS24] Corollary 5.5.3, p. 70).
*Needs:* §§3.2, 3.4, 3.5; PrismaticCohomology §2.0 (descent for étale cohomology of generic fibres
along `p`-completely faithfully flat covers); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.41.

**Checks.**
- For an fppf cover the statement is fppf descent (§3.2).
- For `ℤ_(p) → ℤ_p`, reduction modulo `p` is an isomorphism, so the Čech nerve is an fpqc hypercover
  modulo `p` and Corollary 5.5.3 recovers `RΓ_{V(p)}(ℤ_(p), G) ≅ RΓ_{V(p)}(ℤ_p, G)` of §3.5.
- For a perfectoid `A`, a `p`-completely faithfully flat map of perfectoid rings `A → A′` and `A^•` the
  termwise `p`-adically completed Čech nerve, the terms `A′ ⊗̂_A ⋯ ⊗̂_A A′` are perfectoid
  (PerfectoidQuotients §0.6, `perfectoid_completed_tensor`) and `A/p → A^•/p` is the Čech nerve of the
  fpqc cover `A/p → A′/p`, so Corollary 5.5.3 computes `RΓ_Z(A, G)` from perfectoid terms: the pattern
  used in §6.2. The base must be perfectoid and the tensor powers completed: for
  `ℤ_p → B = ℤ_p[p^{1/p^∞}]^∧` the uncompleted term `B ⊗_{ℤ_p} B` is not `p`-adically complete (the partial sums
  of `Σ_i p^i b_i ⊗ b_i` with `b_i = p^{1/p^i}` are `p`-adically Cauchy without a limit, since every
  element of `B ⊗_{ℤ_p} B` gives a coefficient matrix of finite rank), hence not perfectoid, although
  the descent statement itself holds for it since only the reduction modulo `p` enters.

### Examples

For a perfectoid `A`, §3.4 gives `H^i(A, μ_{p^n}) = 0` for `i ≥ 2` (`A` is `p`-henselian and
`(A/p)_red` is perfect); with the Kummer sequence (SchemeAndStackFoundations §2.11) `Br′(Spec A)[p^n]`
is a quotient of `H^2(A, μ_{p^n}) = 0`, so `Br′(Spec A)[p^∞] = 0`.

### Dependencies

§§0.2, 0.3, 2.1; PrismaticCohomologyPartIII §6.0; EnhancedDerivedSheaves E5:animation;
DerivedModuleAlgebra §§0.4, 0.25, 1.5; PrismaticCohomology §2.0;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.41; PerfectoidQuotients §0.6;
SchemeAndStackFoundations §§0.9, 2.2, 2.10, 2.11.

## Layer 4: Purity in positive characteristic

This layer proves purity for complete complete-intersection `𝔽_p`-algebras with perfect residue field
by passing to perfect root towers ([CS24] Example 4.1.10, Lemmas 4.1.11–4.1.12, Proposition 4.1.13,
pp. 39–40). Its root-extraction and finite-flat-cover lemmas are reused in mixed characteristic.

### 4.1 Vanishing of 𝔾_a, α_p and ℤ/p cohomology below the depth

Prove: for a Noetherian local ring `(R, 𝔪)`, `H^i_𝔪(R, 𝔾_a) = 0` for `i < depth R`; if `R` is an
`𝔽_p`-algebra, also `H^i_𝔪(R, α_p) = 0` and `H^i_𝔪(R, ℤ/p) = 0` for `i < depth R`; for a complete
intersection these vanish for `i < dim R` ([CS24] Example 4.1.10, p. 39). Route: `H^i_𝔪(R, 𝔾_a)` is
local cohomology (§0.2), which vanishes below the depth (SchemeAndStackFoundations §2.7,
`depth_localCohomology_vanishing`); the Frobenius-kernel sequence `0 → α_p → 𝔾_a → 𝔾_a → 0` (fppf
exact) and the Artin–Schreier sequence (SchemeAndStackFoundations §2.11) transfer the bound;
complete intersections are Cohen–Macaulay (DeformationAndDerivedPatchingAlgebra §3.4).
*Needs:* §0.2; SchemeAndStackFoundations §§0.17, 2.7, 2.11; DeformationAndDerivedPatchingAlgebra §3.4; Mathlib `localCohomology`.

**Checks.**
- For `R = 𝔽_p⟦x, y⟧` (depth `2`): `H^0_𝔪 = H^1_𝔪 = 0` for `α_p` and `ℤ/p`.
- For `R = 𝔽_p⟦x⟧/(x²)` (depth `0`), `x ∈ α_p(R)` is killed by `𝔪`, so `H^0_𝔪(R, α_p) ≠ 0`: nothing is
  claimed in degree `0`.
- For `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)`, `xy` is a nonzero element of `α_p(R)` killed by `𝔪`, so
  `H^0_𝔪(R, α_p) ≠ 0`, consistent with `depth R = 0`.

### 4.2 Extracting roots of the equations of a complete intersection

Prove: let `A` be a ring, `f_1, …, f_m ∈ A` an `A`-regular sequence, `B = A/(f_1, …, f_m)`, `G` a
commutative `B`-group scheme that is smooth or finite locally free, `n_1, …, n_m > 0`, `g_i ∈ A` with
`g_i^{n_i} = f_i`, and `B′ = A/(g_1, …, g_m)`; for every ideal `I ⊂ B` containing a `B`-regular sequence
of length `d`, `H^i_I(B, G) → H^i_{IB′}(B′, G)` is injective for `i < d` and bijective for `i < d − 1`
([CS24] Lemma 4.1.11, p. 39; §1.3, pp. 7–8, where the complete-intersection hypothesis enters).
Route: reduce to smooth `G` by the Bégueri resolution (§3.2); for `0 < e_k ≤ n_k` the sequence
`g_1^{e_1}, …, g_m^{e_m}, a_1, …, a_d` is `A`-regular (Stacks 07DV); if `n_1 > 1`, the closed immersion
`Spec A/(g_1^{n_1−1}, f_2, …, f_m) → Spec B` has square-zero ideal free of rank one over
`A/(g_1, f_2, …, f_m)`, so the discrete deformation sequence of §3.1 has kernel a finite projective
module, whose cohomology with supports vanishes below `d` by §0.4; iterate through the powers of
`g_1` and induct on `m`.
*Needs:* §§0.2, 0.4, 3.1, 3.2; Mathlib `RingTheory.Sequence.IsWeaklyRegular` (Convention 1).

**Checks.**
- For `m = 0` (`B = B′`) the statement is the identity.
- In §4.4 it is applied with `A = k⟦t_1^{1/p^∞}, …, t_N^{1/p^∞}⟧` and `n_i = p^j`.
- Regularity is what makes the square-zero ideal free: for `f_1 = x², f_2 = xy` in `k⟦x, y⟧` (not
  regular) and `g_1 = x`, the ideal `xA/(x², xy) ≅ k` is killed by `y` and is not free over
  `A/(x, xy) = k⟦y⟧`.

### 4.3 Passage to a finite flat cover of complete intersections

Prove: let `(R, 𝔪) → (R′, 𝔪′)` be a finite flat local homomorphism of Noetherian local rings that are
complete intersections, `n` an integer and `G` a commutative finite flat `R`-group; if for every finite
nonempty tensor power `R′ ⊗_R ⋯ ⊗_R R′` and every local ring `(A, 𝔮)` of it at a maximal ideal,
`H^i_𝔮(A, G) = 0` for `i < n`, then `H^i_𝔪(R, G) = 0` for `i < n` and `H^n_𝔪(R, G) → H^n_{𝔪′}(R′, G)` is
injective ([CS24] Lemma 4.1.12, p. 40, without its hypothesis `n < dim R`, which the proof does not use
and which its application in the proof of Theorem 6.2.7 violates; see the Notes on the sources under References). Route: each
`A` is flat local over `R` with zero-dimensional complete-intersection closed fibre, hence a complete
intersection of dimension `dim R` (DeformationAndDerivedPatchingAlgebra §3.4); excision splits the
supported cohomology of the semilocal tensor powers over their maximal ideals; the finite flat descent
spectral sequence of §0.2 has `E_1^{s,t} = 0` for `t < n`.
*Needs:* §§0.2, 1.1; DeformationAndDerivedPatchingAlgebra §3.4.

**Checks.**
- For `R′ = R` it is a tautology.
- For `k⟦t⟧ → k⟦t^{1/p}⟧` (finite flat of degree `p`, both regular) the tensor powers are local
  complete intersections of dimension `1`, as used for perfections in §4.4.
- The complete-intersection hypothesis on `R′` is needed to know that the local rings of the tensor
  powers are complete intersections; merely Artinian closed fibres would not suffice.

### 4.4 Purity for flat cohomology of complete intersections in characteristic p

Prove: for a complete Noetherian local `𝔽_p`-algebra `(R, 𝔪)` that is a complete intersection with
perfect residue field `k` and a commutative finite flat `R`-group `G` of `p`-power order,
`H^i_𝔪(R, G) = 0` for `i < dim R` ([CS24] Proposition 4.1.13, p. 40). Route: induct on `i` for all such
`R`; `R ≅ k⟦t_1, …, t_N⟧/(f_1, …, f_m)` with `f` regular (PerfectoidSpaces §P7.16a,
*regular-cohen-presentations*, and DeformationAndDerivedPatchingAlgebra §3.4); §4.3 for the finite flat
covers `k⟦t^{1/p^j}⟧/(f)` and §0.3 pass to `k⟦t^{1/p^∞}⟧/(f)`, which is uncompleted; §4.2 and §0.3 pass
to the perfect `R_∞ = k⟦t^{1/p^∞}⟧/(f^{1/p^∞})`; §2.1 reduces to
`H^i_{(p, t)}(W(R_∞), 𝕄(G)) = 0` for `i < N − m`, and projective dimension `≤ 1` of `𝕄(G)` to
`H^i_{(p, t)}(W(R_∞), W(R_∞)) = 0` for `i < N − m + 1`, given by §0.4 for the regular sequence
`p, a_1, …, a_{N−m}` (Stacks 07DV).
*Needs:* §§0.3, 0.4, 2.1, 4.2, 4.3; PerfectoidSpaces §P7.16a; DeformationAndDerivedPatchingAlgebra
§3.4; Mathlib `WittVector`.

**Checks.**
- For `R = 𝔽_p⟦x, y⟧` and `G = μ_p`: `H^0_𝔪 = H^1_𝔪 = 0`; surjectivity of `H^1(R, μ_p) → H^1(U_R, μ_p)`
  needs `H^2_𝔪 = 0`, which is §6.5.
- For `G = α_p` it recovers §4.1 for complete intersections.
- For the non-complete-intersection `R` of §6.4 the conclusion fails in degree `0`, so the hypothesis
  cannot be weakened to `vdim`.

### Examples

For `R = 𝔽_p⟦x, y, z⟧/(xy − z²)` with `p ≠ 2` (the `A_1` singularity, a two-dimensional complete
intersection) §4.4 gives `H^0_𝔪 = H^1_𝔪 = 0` for every `G` of `p`-power order. Degree `2 = dim R` is out
of range for this non-regular ring: `Γ(U_R, 𝒪) = R` (depth `2`) and `Pic(U_R)[2] = ℤ/2`, so by the Kummer
sequence the cokernel of `H^1(R, μ_2) → H^1(U_R, μ_2)` contains `ℤ/2` and `H^2_𝔪(R, μ_2) ≠ 0` (for the
prime-to-`p` group `μ_2` the relevant bound is §1.6 with `vdim = 2`).

### Dependencies

§§0.2–0.4, 1.1, 2.1, 3.1–3.2; SchemeAndStackFoundations §§0.17, 2.7, 2.11; PerfectoidSpaces §P7.16a;
DeformationAndDerivedPatchingAlgebra §3.4.

## Layer 5: Perfectoid rings: Dieudonné modules and the key formula

This layer proves the key formula `RΓ_Z(A, G) ≅ RΓ_Z(A_inf(A), 𝕄(G))^{V=1}` for perfectoid `A` and its
consequence, purity for perfectoid rings ([CS24] §4.2, §5.5 and §6.1, pp. 41–45, 68–69, 82–83).
Throughout, `A` is perfectoid, `ξ` is fixed compatibly over perfectoid `A`-algebras, `G` is a
commutative finite locally free `A`-group of `p`-power order, and `𝕄` is the prismatic Dieudonné
functor of the prismatic Dieudonné contract (PrismaticCohomologyPartII).

### 5.1 The Dieudonné side

Construct, for a closed `Z ⊂ Spec(A/pA)`, the complex `RΓ_Z(A_inf(A), 𝕄(G))^{V=1}`: the fibre of
`V − 1` on Zariski cohomology with supports `RΓ_Z(A_inf(A), 𝕄(G))`, with `Z` viewed in
`Spec A_inf(A)` through `A_inf(A) → A → A/p`; `V` acts through its `φ^{-1}`-semilinearity, `φ` being an
automorphism of `A_inf(A)` preserving the support ([CS24] (6.1.1.1), p. 82; §4.2.1, p. 41). For perfect
`𝔽_p`-algebras with `ξ = p` it is the complex of §2.1.
*Needs:* PrismaticCohomologyPartII (the prismatic Dieudonné contract); PerfectoidSpaces §P4.15.2 (the
prism `(A_inf(A), ker θ)`); PerfectoidQuotients §0.2 (naturality of `θ`); §0.2 (quasi-coherent
supports); Mathlib `WittVector`.

API (each a target):
- The long exact sequence
  `… → H^i(D) → H^i_Z(A_inf(A), 𝕄(G)) → H^i_Z(A_inf(A), 𝕄(G)) → H^{i+1}(D) → …` with middle map `V − 1`,
  writing `D` for the Dieudonné side.
- Functoriality: a perfectoid `A → A′` with compatible `ξ` and a homomorphism `G_{A′} → G′` give
  `D(A, G, Z) → D(A′, G′, Z_{A′})`; for `Z′ ⊂ Z_{A′}`, extension of supports gives
  `D(A′, G′, Z′) → D(A′, G′, Z_{A′})`; identity, composition and commuting squares hold.
- A short exact sequence `0 → G′ → G → G″ → 0` gives a distinguished triangle of Dieudonné sides.
- For the open complement `U` of `Z` in `Spec A_inf(A)`, the support triangle with `RΓ(U, 𝕄)` computed
  as the derived limit over the principal opens `D(z) ⊂ U`, compatibly with `V − 1` ([CS24]
  (4.2.7.1), p. 43).

**Checks.**
- For `G = 0` or `Z = ∅` the complex is `0`.
- For `A` perfect, `ξ = p`, `G = ℤ/p` and `Z = Spec A`: `𝕄 = A` with `V = φ^{-1}`, so `H^0 = A^{φ=1}` and
  `H^1 = A/(φ − 1)A`, the Artin–Schreier cohomology; for `G = μ_p`, `V = 0` on `A`, so `V − 1` is
  invertible and the complex is `0`, matching `μ_p(A) = 0` and `A^×/A^{×p} = 0` for perfect `A`.
- Without passing to `V = 1`: for `A = 𝔽̄_p` and `G = ℤ/p`, `H^0_Z(W(A), 𝕄(G)) = 𝔽̄_p ≠ ℤ/p`.

### 5.2 Low-degree flat cohomology of a perfectoid ring

Prove: for a perfectoid `ℤ_p`-algebra `A`, `G(A) ≅ 𝕄(G)^{V=1}` and `H^1(A, G) ≅ 𝕄(G)/(V − 1)𝕄(G)`,
functorially in `A` and `G` ([CS24] Proposition 4.2.4, p. 41), and `H^i(A, G) = 0` for `i ≥ 2`
([CS24] Remark 4.2.5, from Corollary 5.3.7). Route: as in the proof of [CS24] Proposition 4.1.4
(p. 37), the perfect-base case that PrismaticCohomologyPartIII §6.0's triangle contains in degrees
`0` and `1`: `G(A) = Hom(ℤ/p^n, G)` and `H^1(A, G) = Ext^1(ℤ/p^n, G)` are computed through the exact
Dieudonné equivalence from the module `𝟙_n = 𝕄(ℤ/p^n)` of Convention 6, a class `m ∈ 𝕄(G)` giving
the extension `𝕄(G) ⊕ 𝟙_n` with `V(0, 1) = (m, 1)` and isomorphic extensions changing `m` by
`(V − 1)𝕄(G)`; the vanishing is §3.4.
*Needs:* §§3.4, 5.1; PrismaticCohomologyPartII (the prismatic Dieudonné contract);
SchemeAndStackFoundations §§2.3, 2.11.

**Checks.**
- For `A` perfect and `G = ℤ/p`: `H^1(A, ℤ/p) = A/(φ − 1)A`.
- For `G = μ_p`: `𝕄(μ_p)/(V − 1)` recovers `H^1(A, μ_p) = A^×/A^{×p}` through the Kummer sequence.
- For `A = 𝒪_C` with `C` algebraically closed, every finite flat torsor has a `C`-point on its generic
  fibre that extends to an `𝒪_C`-point by the valuative criterion, so `H^1(𝒪_C, G) = 0` for every `G`.

### 5.3 p-complete arc hyperdescent of the Dieudonné side

Prove: for a closed `Z ⊂ Spec(A/pA)` and `a ∈ A_inf(A)`, the functors `A′ ↦ 𝕄(G_{A′})[1/a]`,
`A′ ↦ RΓ_Z(A_inf(A′), 𝕄(G_{A′}))` and `A′ ↦ RΓ_Z(A_inf(A′), 𝕄(G_{A′}))^{V=1}` on perfectoid `A`-algebras
satisfy hyperdescent for `p`-complete arc hypercovers with perfectoid terms ([CS24] Lemma 4.2.6 and
Proposition 4.2.7, pp. 42–43). Route: PrismaticCohomology §2.0 gives `RΓ_arc(Spf S, 𝒪) ≅ S` on the
perfectoid basis, hence hyperdescent of `A′ ↦ A′` for hypercovers in the basis (cohomology is computed
by hypercovers); since `ξ` is a nonzerodivisor with `A_inf(A′)/ξ = A′` and `A_inf(A′)` is
`ξ`-adically complete, `A_inf(A′)/ξⁿ` is an iterated extension of copies of `A′`, and passing to the
limit gives hyperdescent of `A′ ↦ A_inf(A′)`. Base change `𝕄(G_{A′}) = 𝕄(G) ⊗ A_inf(A′)` and a two-term
resolution of `𝕄(G)` by finite projective `A_inf(A)`-modules, which stays exact because `𝕄(G)` is
`p`-power torsion and `A_inf(A′)` is `p`-torsion free, give the first functor; the support triangle of
§5.1 the second; fibres of `V − 1` commute with limits.
*Needs:* §5.1; PrismaticCohomology §2.0 (the perfectoid basis of the formal arc site, acyclicity of `𝒪`);
PrismaticCohomologyPartII (the prismatic Dieudonné contract); PerfectoidSpaces §P4.15.2.

**Checks.**
- For `G = ℤ/p` over perfect `A`, the statement is hyperdescent of `A′ ↦ RΓ_Z(A′, 𝒪)` with
  `V = φ^{-1}` on perfect `A`-algebras, a case of the structure-sheaf acyclicity.
- For the cover of `𝒪_C` by a product of rank-one valuation rings with algebraically closed fraction
  fields, it identifies `𝕄(G)` with the equaliser of the `𝕄(G_{∏ V_j})` terms.
- The `p`-torsion-freeness of `A_inf(A′)` is used: for `𝕄(ℤ/p) = A_inf/p` with resolution
  `0 → A_inf → A_inf → A_inf/p → 0` (multiplication by `p`), base change to a ring with `p`-torsion would
  not stay exact; `A_inf(A′) = W(A′^♭)` is `p`-torsion free since `A′^♭` is perfect.

### 5.4 Finitely presented modules over a product of rings

Prove: for rings `(R_i)_{i∈I}` with product `R` and a finitely presented `R`-module `M`,
`M → ∏_i M ⊗_R R_i` is an isomorphism ([CS24] Lemma 4.2.8, p. 43): choose `R^n → R^m → M → 0`; base
change is right exact and products are exact.
*Needs:* Mathlib `Module.FinitePresentation`.

**Checks.**
- For `M = R` it is the identity `R = ∏ R_i`.
- Finite presentation is needed: for `I = ℕ`, `R_i = 𝔽_2` for every `i` and `M = ⊕_i 𝔽_2`, the map
  `M → ∏_i M ⊗_R R_i = ∏_i 𝔽_2` misses `(1, 1, …)`. Infinitely many nonzero factors are needed: with all
  `R_i = 0` the map is `0 → 0`, and with only `R_0 = 𝔽_2` nonzero it is the identity of `𝔽_2`.
- For `M = R/J` with `J = ∏ J_i` finitely generated, it gives `R/J = ∏ R_i/J_i`.

### 5.5 Dieudonné modules over a product of perfectoid rings

Prove: for perfectoid rings `(A_i)_{i∈I}` with product `A` (perfectoid, PerfectoidQuotients §0.6
`integralPerfectoid_pi_iff`), `𝕄(G) → ∏_i 𝕄(G_{A_i})` is an isomorphism over
`A_inf(A) ≅ ∏_i A_inf(A_i)`, compatibly with `F` and `V` for compatible `ξ = (ξ_i)` ([CS24] Proposition
4.2.9, p. 43). Route: Witt vectors and tilts of products are products (PerfectoidQuotientsPartII
§Q5.2), base change of `𝕄`, and §5.4.
*Needs:* §5.4; PerfectoidQuotients §0.6; PerfectoidQuotientsPartII §Q5.2; PrismaticCohomologyPartII (the prismatic Dieudonné contract); Mathlib `WittVector`.

**Checks.**
- For `I` a singleton it is the identity.
- For `G = μ_{p^n}` both sides are `∏ A_inf(A_i)/p^n` with `V = ξ·φ^{-1}`.
- For `I = ∅` both sides are the zero module over the zero ring.

### 5.6 Frobenius-fixed vectors over an algebraically closed field

Prove `frobeniusSemilinear_exists_fixed_basis` (Katz): for an algebraically closed field `K` of
characteristic `p` and a finite-dimensional `K`-vector space `M` with a bijective Frobenius-semilinear
`F`, `M` has a basis of `F`-fixed vectors; equivalently `M^{F=1}` is an `𝔽_p`-space of dimension
`dim_K M` and `M^{F=1} ⊗_{𝔽_p} K → M` is an isomorphism compatible with `F` (an `F`-fixed `K`-combination
of a fixed basis has its coefficients in `𝔽_p`); consequently `V − 1` is
surjective for every bijective `φ^{-1}`-semilinear `V`, and `x ↦ ξ x − x^p` is surjective on `K` for
`ξ ∈ K^×` ([Kat73] Proposition 4.1.1, field case, pp. 142–145; [CS24] proof of Claim 4.2.10.1, p. 45).
Route: in a basis `F(x) = Ax^{(p)}` with `A` invertible; `x ↦ Ax^{(p)} − x` is finite étale of degree
`p^n`, so its kernel has `p^n` points; a minimal-relation argument gives linear independence.
*Needs:* Mathlib `IsAlgClosed`, `frobenius`.

**Checks.**
- For `M = K` with `F = φ`, `M^{F=1} = 𝔽_p`.
- For `M = K` with `F = c·φ`, `c ≠ 0`, `M^{F=1}` is spanned by a root of `x^{p−1} = c^{-1}`.
- Algebraic closedness is needed: for `K = 𝔽_3(t)^{perf}` and `F = t·φ`, a nonzero fixed vector would
  satisfy `x² = 1/t`, impossible since the `t`-adic value group `ℤ[1/3]` does not contain `−1/2`.

### 5.7 Flat cohomology over products of perfectoid valuation rings

Prove: let `(A_i)_{i∈I}` be `p`-adically complete valuation rings of rank `≤ 1` with algebraically closed
fraction fields `K_i`, `A = ∏ A_i`, `K = ∏ K_i`, `a ∈ A`, and `a^♭ ∈ A^♭` compatible `p`-power roots of
`a`. Then `V − 1` is surjective on `𝕄(G)[1/[a^♭]]` for any `ξ`, `H^j(A[1/a], G) = 0` for `j ≥ 1`, and there
is a unique commutative square with rows `G(A) ≅ 𝕄(G)^{V=1}` (§5.2) and
`G(A[1/a]) ≅ (𝕄(G)[1/[a^♭]])^{V=1}` and restriction as columns, which are bijective when `a` is a
nonzerodivisor ([CS24] Proposition 4.2.10 and Claims 4.2.10.1–4.2.10.2, pp. 43–45). Each `A_i` is
perfectoid (perfect if `p = 0` in `A_i`; otherwise `A_i[1/p]` is a complete algebraically closed
nonarchimedean field, perfectoid by PerfectoidSpaces §P3.7, with ring of integers `A_i` by §P1.25), and
a target of this subsection is the structure of `Spec ∏ V_i` for valuation rings `V_i`: its connected
components are the spectra of the ultraproducts `∏_𝒰 V_i`, and if all fraction fields are algebraically
closed, every quasi-compact open has no nonsplit étale covers and its connected components are spectra
of valuation rings with algebraically closed fraction fields ([CS24] Lemma 2.2.4, pp. 19–20).
Route: decompose `I` to assume `a` a nonzerodivisor; the valuative criterion gives `G(A) = G(A[1/a])`
and `H^1(A[1/a], G) = 0`, the Bégueri resolution `H^{≥2} = 0`; embed `G` Zariski-locally into an abelian
scheme `B` (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40), so `G ⊂ B[p^n]`, and reduce by
exactness and the snake lemma to `G = B[p]`, where `𝕄(G)` is finite projective over `A^♭`; surjectivity
of `V − 1` holds over `∏ K_i^♭` by §5.6 (or §5.2 in characteristic `p`) and descends stalkwise on
`Spec A^♭[1/a^♭]` (Claim 4.2.10.2: over a perfect valuation ring `W` with fraction field `L`, finite free
`M` and `φ^{-1}`-semilinear `V`, `x ∈ M_L` with `V(x) − x ∈ M` lies in `M`).
*Needs:* §§3.2, 5.2, 5.5, 5.6; PerfectoidSpaces §§P1.25, P3.7; PerfectoidQuotients §0.6;
PerfectoidQuotientsPartII §§Q6.3–Q6.7 (tilts of valuation rings, algebraically closed fraction
fields); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40; Mathlib `ValuationRing`.

**Checks.**
- For `I` a singleton, `A = 𝒪_C` and `a = p`: `H^j(C, G) = 0` for `j ≥ 1` and `G(𝒪_C) = G(C)`.
- For `G = μ_p` and `a` a nonzerodivisor (every component `a_i ≠ 0`):
  `(𝕄(μ_p)[1/[a^♭]])^{V=1} ≅ μ_p(A[1/a]) = μ_p(K) = ∏ μ_p(K_i)`, with `μ_p(K_i) = ℤ/p` if `K_i` has
  characteristic `0` and `0` if it has characteristic `p`. For `a = 0` the localization is the zero
  module and `A[1/a] = 0`, so both sides are `0`, not `μ_p(K)`: the nonzerodivisor hypothesis of the
  bijectivity clause is needed.
- Algebraic closedness is needed for surjectivity of `V − 1`: over a perfectoid field `C` that is not
  algebraically closed, `H^1(C, ℤ/p)` can be nonzero.
- For `I` infinite, `Spec ∏ V_i` has the Stone–Čech compactification of `I` as its space of components,
  not `I` itself.

### 5.8 p-complete arc hyperdescent of flat cohomology on perfectoids

Prove: for a prime `p`, a perfectoid ring `A`, a commutative finite locally free `A`-group `G` (any
order) and a closed `Z ⊂ Spec(A/pA)`, the functors `A′ ↦ RΓ(A′, G)` and `A′ ↦ RΓ_Z(A′, G)` satisfy
hyperdescent for `p`-complete arc hypercovers whose terms are perfectoid `A`-algebras ([CS24] Theorem
5.5.1, pp. 68–69; announced as Theorem 1.2.3, p. 6). Route: reduce to `Z = Spec(A/p)` using that the
`p`-adic completion of `A[1/a]` is perfectoid (PerfectoidQuotients §0.6,
`perfectoid_completely_etale_henselization`) and excision (§3.5); the generic fibre satisfies the
descent by PrismaticCohomology §2.0; the prime-to-`p` part by arc descent and Gabber's affine proper
base change (SchemeAndStackFoundations §2.15); for `p`-power order use §3.4, pass from `A′/^L pⁿ` to
`A′/^L p` by §3.3 and to `(A′/p)_red`, a perfect `𝔽_p`-algebra (PerfectoidQuotients §0.1), and conclude by
§2.1 and §5.3.
*Needs:* §§2.1, 3.3–3.5, 5.3; PrismaticCohomology §2.0; PerfectoidQuotients §§0.1, 0.6;
SchemeAndStackFoundations §2.15.

**Checks.**
- For `G` étale of order prime to `p` it is arc hyperdescent of étale cohomology on perfectoids.
- For `A = 𝒪_C` and its cover by a product of rank-one valuation rings with algebraically closed
  fraction fields, it computes `RΓ(𝒪_C, G)` from the products, where it is concentrated in degree `0`
  by §5.7.
- The perfectoid hypothesis on the terms is needed for the reduction to `(A′/p)_red`: for
  `A′ = ℤ_p⟨t⟩`, `(A′/p)_red = 𝔽_p[t]` is not perfect and §2.1 does not apply.

### 5.9 The key formula for flat cohomology of perfectoid rings

Prove: for a prime `p`, a perfectoid ring `A`, `G` of `p`-power order and a closed `Z ⊂ Spec(A/pA)`,
`RΓ_Z(A, G) ≅ RΓ_Z(A_inf(A), 𝕄(G))^{V=1}`, functorially in `A`, `G` and `Z` with the same `ξ` over all
perfectoid `A`-algebras ([CS24] Theorem 6.1.1 and (6.1.1.1), p. 82; announced as (1.1.6), p. 4). Route:
assume `A` a `ℤ_p`-algebra and `Z` cut out by finitely many elements; for `A = ∏ A_i` as in §5.7, `Z` is
cut out by one `a | p`, both sides are concentrated in degree `0` by §5.7 and §5.1, and the unique square
of §5.7 identifies them; in general both sides satisfy hyperdescent (§§5.3, 5.8) and such products form
a basis of the `p`-complete arc topology (PrismaticCohomology §2.0, covers by products of valuation rings;
[CS24] Lemma 2.2.3, p. 19).
*Needs:* §§5.1, 5.3, 5.7, 5.8; PrismaticCohomology §2.0; PerfectoidQuotients §0.6.

**Checks.**
- For `A` a perfect `𝔽_p`-algebra and `ξ = p` it is §2.1.
- For `Z = Spec(A/p)` and `G = ℤ/p` over perfect `A` it is the Artin–Schreier description of
  `RΓ(A, ℤ/p)`.
- For mixed-characteristic `A`, `Z = Spec(A/p)` is a support condition and differs from absolute
  cohomology; the support triangle of §5.1 relates them.

### 5.10 Purity for flat cohomology of perfectoid rings

Prove: for a prime `p`, a perfectoid ring `A`, `G` of `p`-power order, a closed `Z ⊂ Spec(A/pA)` and an
`A`-regular sequence `a_1, …, a_d ∈ A` vanishing on `Z`, `H^i_Z(A, G) = 0` for `i < d` ([CS24] Theorem 6.1.2,
pp. 82–83; announced as Theorem 1.1.5, p. 4). Route: by §5.9 it suffices that
`H^i_Z(A_inf(A), 𝕄(G)) = 0` for `i < d`, and by projective dimension `≤ 1` that
`H^i_Z(A_inf(A), A_inf(A)) = 0` for `i < d + 1`; for lifts `ã_k` of `a_k`, `ξ, ã_1, …, ã_d` is
`A_inf(A)`-regular because `ξ` is a nonzerodivisor with quotient `A`, and §0.4 concludes. The decisive
point is that depth `d` along `Z` in `A` becomes depth `d + 1` in `A_inf(A)` through `ξ` ([CS24] §1.1, p. 5).
*Needs:* §§0.4, 5.1, 5.9; PerfectoidSpaces §P4.15.2.

**Checks.**
- For `A` a perfect `𝔽_p`-algebra (`ξ = p`) it is the last step of §4.4.
- For `A` the `p`-adic completion of `W(k)⟦x_1^{1/p^∞}, …, x_d^{1/p^∞}⟧/(p − f)` and `Z` the closed point,
  the regular sequence `x_1, …, x_d` gives `H^i_Z(A, G) = 0` for `i < d`, the input to §6.5.
- For `d = 0` nothing is asserted, and `H^0(𝔽_p, ℤ/p) = ℤ/p ≠ 0` for `A = 𝔽_p`, `Z = Spec 𝔽_p`.

### Examples

For `A = 𝒪_C` and `Z` the closed point (`a_1 = p`, `d = 1`): §5.10 gives `H^0_𝔪(𝒪_C, G) = 0`, i.e.
`G(𝒪_C) → G(C)` is injective. In fact `RΓ_𝔪(𝒪_C, G) = 0`: `G(𝒪_C) = G(C)` by the valuative criterion,
`H^1(𝒪_C, G) = 0` (§5.2), `H^{≥1}(C, G) = 0` over the algebraically closed `C`, and
`H^{≥2}(𝒪_C, G) = 0` (§3.4).

### Dependencies

§§0.2, 0.4, 2.1, 3.2–3.5; PrismaticCohomologyPartII (the prismatic Dieudonné contract);
PrismaticCohomology §2.0; PerfectoidSpaces §§P1.25, P3.7, P4.15.2; PerfectoidQuotients §§0.1, 0.2, 0.6;
PerfectoidQuotientsPartII §§Q5.2, Q6.3–Q6.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40;
SchemeAndStackFoundations §§2.3, 2.11, 2.15.

## Layer 6: Purity for complete intersections and regular local rings

This layer proves the main local theorems of [CS24]: vanishing below the dimension for complete
intersections (Theorem 6.2.3), below the virtual dimension for finite étale coefficients (Theorem
6.2.4), and through the dimension for regular rings that are not fields (Theorem 6.2.7).

### 6.1 Regular sequences survive adic completion under bounded torsion

Prove: for a ring `A`, `a ∈ A` and the `a`-adic completion `Â`, if `a_1, …, a_n` is `A`-regular and every
`A/(a_1, …, a_i)`, `0 ≤ i ≤ n`, has bounded `a^∞`-torsion, then `a_1, …, a_n` is `Â`-regular and
`Â/(a_1, …, a_n) ≅ (A/(a_1, …, a_n))^∧` ([CS24] Lemma 6.2.2, p. 83). Route: bounded torsion makes derived
and classical `a`-adic completion agree on each quotient (DerivedModuleAlgebra §1.5), so the completed
sequences `0 → A_{i−1} → A_{i−1} → A_i → 0` stay exact.
*Needs:* DerivedModuleAlgebra §1.5; Mathlib `AdicCompletion`, `RingTheory.Sequence.IsWeaklyRegular`.

**Checks.**
- For `A` Noetherian every finite module has bounded `a^∞`-torsion, so the lemma applies to every
  regular sequence.
- For `A = ℤ_p[x]`, `a = p` and the sequence `x`: `ℤ_p⟨x⟩/(x) = ℤ_p`.
- Bounded torsion is what makes classical completion exact: the `ℤ_p`-module `ℚ_p/ℤ_p` has unbounded
  `p^∞`-torsion, its classical `p`-adic completion is `0` while its derived completion is `ℤ_p[1]`, and the
  classical completion of `0 → ℤ_p → ℚ_p → ℚ_p/ℤ_p → 0` is `ℤ_p → 0 → 0`, not exact; in §6.2 a fixed
  `p^N` kills all the relevant torsion.

### 6.2 Purity for flat cohomology of local complete intersections

Prove: for a Noetherian local ring `(R, 𝔪)` that is a complete intersection and a commutative finite
flat `R`-group `G`, `H^i_𝔪(R, G) = 0` for `i < dim R` ([CS24] Theorem 6.2.3, pp. 83–84; announced as
Theorem 1.1.1, p. 3). Route: decompose `G` into primary parts; the part of order invertible in `R` is
§1.6, since `vdim R = dim R`; so let `G` have `p`-power order with `p = char(R/𝔪)`. By §3.5 assume `R`
complete, `R ≅ R̃/(f_1, …, f_n)` with `R̃` an unramified complete regular local ring (§1.1) and `f` regular
(DeformationAndDerivedPatchingAlgebra §3.4); argue by induction on `i` for all `R`. The residue tower
(PerfectoidQuotientsPartII §Q10.1(a); PerfectoidSpaces §P7.16a), §4.3, §0.3 and §3.5 reduce to an
algebraically closed residue field; the perfectoid tower `R̃_∞` of §Q10.1(b) (PerfectoidSpaces §P7.17)
in mixed characteristic, and the perfection `k⟦x^{1/p^∞}⟧` in characteristic `p`, with the same
reductions, reduce to `H^i_𝔪(R̃_∞/(f), G) = 0` for `i < dim R`. By §3.4 (Corollary 5.3.8) and §6.1 it
suffices to treat a `p`-torsion-free perfectoid `A`, `p`-completely faithfully flat over `R̃`; such `A`
is `R̃`-flat (DerivedDeRhamCohomology §1.10), so `f` is `A`-regular. André's cover (PerfectoidSpaces
§P4.15.4) gives a `p`-completely faithfully flat perfectoid `A → A′` containing compatible `p`-power
roots of the `f_i`; §3.6 (Corollary 5.5.3), §3.5 and §6.1 give the descent spectral sequence with
completed tensor powers of `A′`, perfectoid by PerfectoidQuotients §0.6 (`perfectoid_completed_tensor`)
([CS24] footnote 25, p. 84). §4.2 and §0.3 reduce to `A/(f^{1/p^∞})`; a fixed `p^N` kills the
`p^∞`-torsion of all `A/(f^{1/p^m}, r_1, …, r_j)` for an `R`-regular sequence `r_1, …, r_{dim R}`
(Stacks 07DV and flatness), so §6.1 keeps `r` regular on the `p`-adic completion of `A/(f^{1/p^∞})`,
which is perfectoid (PerfectoidQuotients §0.6, `perfectoid_completed_root_quotient`); §5.10 and §3.4
conclude.
*Needs:* §§0.3, 1.1, 1.6, 3.4–3.6, 4.2, 4.3, 5.10, 6.1; PerfectoidQuotientsPartII §Q10.1; PerfectoidSpaces
§§P4.15.4, P7.16a, P7.17; PerfectoidQuotients §0.6; DerivedDeRhamCohomology §1.10; DeformationAndDerivedPatchingAlgebra §3.4.

**Checks.**
- For `R` regular local of dimension `2` and `G = μ_p`: `H^0_𝔪 = H^1_𝔪 = 0`, unique extension of sections
  and injectivity on torsors; §6.5 adds `H^2_𝔪 = 0`.
- For `R = W(k)⟦x, y⟧/(p − xy)` (a mixed-characteristic hypersurface of dimension `2`) and `G = ℤ/p` or
  `μ_p`: `H^i_𝔪(R, G) = 0` for `i < 2`.
- For `G = α_p` over `𝔽_p⟦x, y⟧` it agrees with §4.1.
- The complete-intersection hypothesis cannot be relaxed to Cohen–Macaulay (§7.7) nor to the
  virtual dimension (§6.4).

### 6.3 Purity for finite étale coefficients below the virtual dimension

Prove: for a Noetherian local ring `(R, 𝔪)` and a commutative finite étale `R`-group `G`,
`H^i_𝔪(R, G) = 0` for `i < vdim(R)` ([CS24] Theorem 6.2.4, pp. 84–85; announced as Theorem 1.3.1, p. 8).
Route: the reduction of §1.6 works for every finite étale `G` and ends at `G = ℤ/p` on a hypersurface
`R̃/(f)` with `p = char(R/𝔪)`; a hypersurface is a complete intersection with `vdim = dim` (§1.1), and
§6.2 applies.
*Needs:* §§1.1, 1.6, 6.2.

**Checks.**
- For `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)` (`vdim = 1`) it gives `H^0_𝔪(R, ℤ/p) = 0`, although
  `H^0_𝔪(R, α_p) ≠ 0` (§6.4).
- For complete intersections it is the étale case of §6.2.
- For `vdim(R) ≤ 0` nothing is asserted: for `R = k⟦x, y⟧/(x, y)²`, `H^0_𝔪(R, ℤ/p) = ℤ/p` since `U_R = ∅`.

### 6.4 Flat purity fails below the virtual dimension for non-étale coefficients

Prove: for `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)`, `vdim(R) = 1`, and `xy ∈ R` is nonzero, satisfies
`(xy)^p = 0` and is killed by `𝔪`; hence it defines a nonzero element of `H^0_𝔪(R, α_p)`, and §6.2 does not
extend from complete intersections to rings of given virtual dimension for `G = α_p` ([CS24] Remark
6.2.6, p. 85). The computation: `x·xy = y·xy = 0`, `z·xy = y·(xz) = y²t = 0`, `t·xy = x·(yt) = x²z = 0`, and
`xy ≠ 0` by a monomial basis.
*Needs:* §§0.2, 1.1.

**Checks.**
- By §6.3, `H^0_𝔪(R, ℤ/p) = 0` for the same `R`: the failure is specific to non-étale `G`.
- The same element lies in `H^0_𝔪(R, 𝔾_a)`, so `depth R = 0`.
- `xy ≠ 0`: every monomial of an element of `(x², y², xz − yt)` is divisible by `x²`, `y²`, `xz` or `yt`,
  and `xy` is divisible by none of them.

### 6.5 Purity for flat cohomology of regular local rings in degree dim R

Prove: for a regular local ring `(R, 𝔪)` that is not a field and a commutative finite flat `R`-group `G`,
`H^i_𝔪(R, G) = 0` for `i ≤ dim R` ([CS24] Theorem 6.2.7, pp. 85–86; announced in Theorem 1.1.1, p. 3).
Route: §6.2 gives `i < d = dim R`; the prime-to-`p` part is absolute purity
(LefschetzPencilsAndVanishingCycles §0.10); for `p`-power order embed `G` into a truncated `p`-divisible
group (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40, an abelian scheme `B` with `G ⊂ B[pⁿ]`),
reduce by §6.2 for the cokernel and the `p`-adic filtration to `G = B[p]`. Assume `R` complete (§3.5).
At the boundary degree use §4.3 with `n = d`: the local rings of the tensor powers of the finite flat
regular covers are complete intersections of dimension `d`, so §6.2 gives vanishing below `d` on them and
§4.3 gives injectivity `H^d_𝔪(R, G) ↪ H^d(R′, G)`; this permits the residue tower and then the
perfectoid tower (PerfectoidSpaces §§P7.16a, P7.17; the perfection in characteristic `p`), followed by
§3.4 to replace `R_∞` by its perfectoid `p`-adic completion `R̂_∞`, on which `x_1, …, x_d` is regular
(DerivedDeRhamCohomology §1.10). By §5.9 and the estimate of §5.10 in degree `d − 1`,
`H^d_Z(R̂_∞, G) = ker(V − 1 on H^d_Z(A_inf(R̂_∞), 𝕄(G)))`, and since `G = B[p]`, `𝕄(G)` is finite free over
the local tilt `R̂_∞^♭`. By the regular tower tilt contract (PerfectoidQuotientsPartII), `H^d_Z(R̂_∞^♭, R̂_∞^♭)` has `k`-basis the monomials
`(x_1^♭)^{a_1} ⋯ (x_d^♭)^{a_d}` with all `a_i ∈ ℤ[1/p]_{<0}`; `V` is a matrix with coefficients of
nonnegative exponents followed by `φ^{-1}`, which divides each `a_i` by `p`, so the minimal total exponent
strictly increases and `V` has no nonzero fixed vector.
*Needs:* §§3.4, 3.5, 4.3, 5.9, 5.10, 6.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40;
LefschetzPencilsAndVanishingCycles §0.10; PerfectoidSpaces §§P7.16a, P7.17; PerfectoidQuotientsPartII
§Q10.1 and the regular tower tilt contract; DerivedDeRhamCohomology §1.10; PrismaticCohomologyPartII (the prismatic Dieudonné contract).

**Checks.**
- For `R` a discrete valuation ring (`d = 1`) and `G = μ_p`: `H^0_𝔪 = H^1_𝔪 = 0` amounts to
  `μ_p(R) = μ_p(K)` and injectivity of `R^×/R^{×p} → K^×/K^{×p}`, both true because `R` is integrally
  closed; `H^2_𝔪(R, μ_p) ⊇ ℤ/p` (Layer 0 Examples) shows degree `d + 1` is out of range.
- The field case fails: for a field `K` and `G = ℤ/n`, `n > 1`, `U_K = ∅` and
  `H^0_𝔪(K, G) = G(K) = ℤ/n`; for `G = μ_p` in characteristic `p`, `G(K) = 0` but
  `H^1_𝔪(K, μ_p) = K^×/K^{×p} ≠ 0` for `K` imperfect.
- For `R = 𝔽_p⟦x, y⟧` and `G = α_p`: `H^2_𝔪(R, α_p) = ker(φ : H^2_𝔪(R) → H^2_𝔪(R))` (as `H^1_𝔪(R) = 0`), which
  vanishes because Frobenius is flat on the regular `R` (Kunz) and hence injective on local cohomology.
- For the non-regular complete intersection of Layer 4 Examples, `H^2_𝔪(R, μ_2) ≠ 0` at degree
  `dim R = 2`: regularity is needed for the degree `dim R`.

### Examples

For `R = ℤ_p⟦x⟧` (regular of dimension `2`) and `G = μ_p`: §6.5 gives `H^i_𝔪(R, μ_p) = 0` for `i ≤ 2`, so
`H^1(R, μ_p) ≅ H^1(U_R, μ_p)`: every `μ_p`-torsor on the punctured spectrum extends, and with the Kummer
sequence `Pic(U_R)[p] = 0` and `Γ(U_R, 𝒪)^×/p = R^×/p`.

### Dependencies

§§0.3, 1.1, 1.6, 3.4–3.6, 4.2, 4.3, 5.9, 5.10; DerivedModuleAlgebra §1.5; DerivedDeRhamCohomology §1.10; DeformationAndDerivedPatchingAlgebra §3.4; PerfectoidSpaces §§P4.15.4, P7.16a, P7.17;
PerfectoidQuotients §0.6; PerfectoidQuotientsPartII §Q10.1 and the regular tower tilt contract;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.40; LefschetzPencilsAndVanishingCycles §0.10.

## Layer 7: Global purity and the conjectures of Gabber

This layer deduces from Layer 6 global purity for finite flat coefficients, Moret-Bailly's purity for
torsors and gerbes, Gabber's conjectures on the local Picard and Brauer groups of complete
intersections, and purity for groups of multiplicative type ([CS24] §7, pp. 86–93).

### 7.1 Global purity for flat cohomology with finite flat coefficients

Prove: let `X` be a scheme, `G` a commutative finite locally free `X`-group, `d` an integer and `Z ⊂ X` a
closed subset such that `X ∖ Z → X` is quasi-compact and every `𝒪_{X,z}`, `z ∈ Z`, is either a complete
intersection of dimension `≥ d` or regular of dimension `≥ max(d − 1, 1)`; then
`H^i(X, G) → H^i(X ∖ Z, G)` is injective for `i < d` and bijective for `i < d − 1`, equivalently
`H^i_Z(X, G) = 0` for `i < d` ([CS24] Theorem 7.1.2 and proof, pp. 86–87, with the corrected regular
bound; see the Notes on the sources under References). Route: by the local-to-global spectral sequence and quasi-compactness
(§§0.2–0.3) reduce to strictly henselian local `X` with `Z ≠ ∅`; strict henselizations of complete
intersections (regular rings) are complete intersections (regular rings) of the same dimension
(DeformationAndDerivedPatchingAlgebra §3.4; ModularCurves Layer 4D). Noetherian induction on `Z`: at a
generic point `z` of `Z` the Mayer–Vietoris sequence for `U ∪ (X ∖ Z)` and the local theorems §§6.2, 6.5
for `𝒪_{X,z}` shrink `Z`; at `Z = {𝔪}` it is §6.2 or §6.5.
*Needs:* §§0.2, 0.3, 6.2, 6.5; DeformationAndDerivedPatchingAlgebra §3.4;
ModularCurves Layer 4D.

**Checks.**
- For `X = Spec R`, `R` regular local of dimension `2`, `Z` the closed point and `d = 3`:
  `H^i(R, G) → H^i(U_R, G)` is injective for `i < 3` and bijective for `i < 2`.
- For `X = Spec k ⊔ Spec k`, `Z` one point, `d = 1` and `G = ℤ/2`: the uncorrected bound `dim ≥ d − 1 = 0`
  would admit the field `𝒪_{X,z} = k`, and `H^0(X, G) = (ℤ/2)² → H^0(X ∖ Z, G) = ℤ/2` is not injective;
  `max(d − 1, 1)` excludes it.
- For a smooth variety `X` over a field and `Z` of codimension `≥ c ≥ 1`, every `𝒪_{X,z}`, `z ∈ Z`, is
  regular of dimension `≥ c = max(d − 1, 1)` for `d = c + 1`, so `H^i(X, μ_p) ≅ H^i(X ∖ Z, μ_p)` for
  `i < c` and `H^c(X, μ_p) ↪ H^c(X ∖ Z, μ_p)`, also in characteristic `p`. For `c = 2`, a point on a
  smooth surface, this is bijectivity on `H^1` (purity for `μ_p`-torsors, §7.3) and injectivity on
  `H^2`. The bound is sharp at `c = 1`: for `X = 𝔾_m` over an algebraically closed field of
  characteristic `≠ p` and `Z = {1}`, `H^0` is bijective and `H^1(X, μ_p) = ℤ/p · [t]`
  `↪ H^1(X ∖ Z, μ_p) = (ℤ/p)² = ⟨[t], [t − 1]⟩` (Kummer; both Picard groups vanish) is injective but
  not onto.

### 7.2 Auslander's freeness criterion through endomorphisms

Prove `free_of_endomorphisms_iso_pi`: for a regular local ring `R` and a finitely generated reflexive
`R`-module `M` (Mathlib `Module.IsReflexive`) with `Hom_R(M, M) ≅ M^{⊕r}` as `R`-modules for some `r`,
`M` is free ([Aus62] Theorem 1.3, as
invoked in [CS24] proof of Theorem 7.1.3, p. 88). The homological proof of Auslander is part of this
target; the Auslander–Buchsbaum formula alone does not show that the endomorphism condition forces
maximal depth.
*Needs:* PurityOfBranchLocus §0.3 (`auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`);
SchemeAndStackFoundations §0.17; Mathlib `IsRegularLocalRing`, `Module.IsReflexive`, `Module.Free`.

**Checks.**
- For `M = Rⁿ` the hypothesis holds with `r = n`.
- Over the non-regular `A_1` singularity `k⟦x, y, z⟧/(xz − y²)` the ideal `(x, y)` is reflexive of rank
  one and depth `2` but not free; there `Hom(M, M) ≅ R` is not a sum of copies of `M`, so the criterion
  does not apply.
- For a discrete valuation ring every finitely generated reflexive module is free and the criterion is
  automatic; for `M = 0` it holds with any `r`.

### 7.3 Purity for torsors and gerbes under finite locally free groups

Prove: let `X` be a scheme, `G` a finite locally free `X`-group (possibly noncommutative) and `Z ⊂ X` a
closed subset with `j : X ∖ Z → X` quasi-compact and every `𝒪_{X,z}`, `z ∈ Z`, regular of dimension
`≥ 2`; then pullback is an equivalence from `G`-torsors over `X` to `G_{X∖Z}`-torsors over `X ∖ Z`, and for
every `G`-gerbe `𝔅` over `X`, `𝔅(X) → 𝔅(X ∖ Z)` is an equivalence; in particular
`ker(H²(X, G) → H²(X ∖ Z, G))` is trivial ([CS24] Theorem 7.1.3, pp. 87–88, extending [MB85] Lemme 2).
Route: gerbes are étale locally `BG`, which is smooth; Zariski-locally reduce to `X` local Noetherian;
full faithfulness by §0.5(b) (torsors are affine); for essential surjectivity, with `Z` the closed point
of a regular local `X` of dimension `≥ 2` (so `depth 𝒪_X ≥ 2` along `Z`) and `Y` a torsor over `X ∖ Z`,
`𝒪_Y` is finite locally free, hence coherent reflexive, over `X ∖ Z`, so `j_*(𝒪_Y)` is coherent and
reflexive and `j^*`, `j_*` are inverse equivalences on coherent reflexive modules
(SchemeAndStackFoundations §0.6, `reflexive_extension_of_depth`). It is flat by §7.2, because
`Hom(j_*𝒪_Y, j_*𝒪_Y) ≅ (j_*𝒪_Y)^{⊕r}` (both sides reflexive) may be checked over `X ∖ Z`, where `𝒪_G` is
free of rank `r` and the coaction `a : 𝒪_Y → 𝒪_G ⊗ 𝒪_Y` induces `Hom(𝒪_G, 𝒪_Y) ≅ Hom(𝒪_Y, 𝒪_Y)`,
sending `f` to the composite of `(f ⊗ id) ∘ a` with multiplication `𝒪_Y ⊗ 𝒪_Y → 𝒪_Y` ([CS24] proof of
Theorem 7.1.3, p. 88); its source is `𝒪_Y^{⊕r}`.
*Needs:* §§0.1, 0.5, 7.2; SchemeAndStackFoundations §§0.6 (`reflexive_extension_of_depth`), 1.15, 1.18.

**Checks.**
- For `X = Spec R`, `R` regular local of dimension `2` and `G = ℤ/n` with `n` invertible, this is
  Zariski–Nagata purity for `ℤ/n`-torsors.
- For `G = α_p` over `𝔽_p⟦x, y⟧` every `α_p`-torsor on `U_R` extends, consistent with §6.5 in degree `1`.
- Regularity cannot be weakened to normality: the `μ_2`-torsor `ℂ⟦x, y⟧` over the punctured spectrum of
  `ℂ⟦x, y⟧^{μ_2}` does not extend.
- The Hom identification has source `Hom(𝒪_G, 𝒪_Y)`: for the trivial torsor `Y = G = (ℤ/2)_k` over a
  field, `Hom_k(𝒪_G, 𝒪_Y)` and `Hom_k(𝒪_Y, 𝒪_Y)` both have dimension `4`, while `Hom_k(𝒪_G ⊗ 𝒪_Y, 𝒪_Y)` has
  dimension `8`, so no isomorphism with the latter exists.

### 7.4 Regular local rings are factorial

Prove `isRegularLocalRing_uniqueFactorizationMonoid`: a regular local ring is a unique factorization
domain (Mathlib `UniqueFactorizationMonoid`; it is a domain by Tau Ceti `TauCeti.IsRegularLocalRing.isDomain`),
and so is its strict henselization (Auslander–Buchsbaum; [SGA2] XI, Théorème 3.13(i), p. 105). Route: the strict
henselization of a regular local ring is regular (ModularCurves Layer 4D: it is Noetherian, flat with
closed fibre a field, so its dimension and embedding dimension are those of `R`); induct on the
dimension: for `x ∈ 𝔪 ∖ 𝔪²`, `x` is prime, a height-one prime `P` of `R` gives a rank-one projective
module `P[1/x]` over `R[1/x]` (locally principal by induction), which has a finite free resolution
(PurityOfBranchLocus §0.3), hence is stably free of rank one, hence free; Nagata's criterion concludes.
*Needs:* PurityOfBranchLocus §0.3; ModularCurves Layer 4D; SchemeAndStackFoundations §3.4 (Weil
divisors and Picard groups); Mathlib `IsRegularLocalRing`, `UniqueFactorizationMonoid`; Tau Ceti
`TauCeti.IsRegularLocalRing.isDomain`.

**Checks.**
- A discrete valuation ring is factorial.
- `k⟦x, y⟧` is factorial; the `A_1` singularity `k⟦x, y, z⟧/(xz − y²)` is normal but not factorial
  (`xz = y²` is two factorizations), and it is not regular.
- `ℤ_p⟦x⟧` and its strict henselization are factorial.

### 7.5 Parafactorial and geometrically parafactorial local rings

Define a local ring `(R, 𝔪)` to be parafactorial if pullback is an equivalence from invertible sheaves on
`Spec R` to invertible sheaves on `puncturedSpectrum R`; equivalently `Γ(Spec R, 𝒪) → Γ(U_R, 𝒪)` is
bijective and `Pic(U_R)` (Tau Ceti `LineBundleClass`) is trivial. It is geometrically parafactorial if its
strict henselization is parafactorial. A pair `(X, Y)` of a scheme and a closed subset is parafactorial if
for every open `V ⊂ X` restriction of invertible sheaves from `V` to `V ∖ Y` is an equivalence ([EGA44]
Définition 21.13.7, p. 316; [SGA2] XI, Définitions 3.1–3.2, pp. 101–102; [CS24] footnote 26, p. 91).
*Needs:* §0.1; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; SchemeAndStackFoundations §§0.6,
3.4.

API (each a target):
- For `R` Noetherian local, `R` is parafactorial iff `depth R ≥ 2` and `Pic(U_R)` is trivial ([EGA44]
  Proposition 21.13.8).
- A Noetherian parafactorial local ring has dimension `≥ 2` ([EGA44] Exemple 21.13.9(i)).
- A Noetherian local factorial ring of dimension `≥ 2` is parafactorial ([EGA44] Exemple 21.13.9(ii)); with
  §7.4, regular local rings of dimension `≥ 2` are geometrically parafactorial.
- Parafactoriality descends along faithfully flat local maps with zero-dimensional closed fibre, in
  particular from the completion ([EGA44] Corollaire 21.13.6(iii), 21.13.12.1; [SGA2] XI, Lemme 3.6).
- For `X` locally Noetherian, `(X, Y)` is parafactorial iff `𝒪_{X,y}` is parafactorial for every `y ∈ Y`
  ([EGA44] Proposition 21.13.10).
- A Noetherian local complete intersection `R` of dimension `≥ 4` is geometrically parafactorial
  ([SGA2] XI, Théorème 3.13(ii), p. 105): `Pic(U_R) = 0` is DeformationAndDerivedPatchingAlgebra §6.9
  (`localCI_parafactorial`, the local Grothendieck–Lefschetz theorem for Picard groups), `depth R ≥ 2`
  holds because complete intersections are Cohen–Macaulay (DeformationAndDerivedPatchingAlgebra §3.4),
  and the strict henselization `R^{sh}` is again a complete intersection of the same dimension
  (DeformationAndDerivedPatchingAlgebra §3.4, the flat-local criterion applied to `R → R^{sh}`, whose
  closed fibre is a separable field extension; ModularCurves Layer 4D), so the same applies to it.

**Checks.**
- `k⟦x, y⟧` is parafactorial (factorial of dimension `2`).
- A discrete valuation ring is not parafactorial: `Γ(U_R, 𝒪) = K ≠ R`.
- The `A_1` singularity `k⟦x, y, z⟧/(xz − y²)` has depth `2` but `Pic(U_R) = Cl(R) = ℤ/2`, so it is not
  parafactorial.
- The three-dimensional node `k⟦x, y, z, w⟧/(xy − zw)` is a complete intersection with `Pic(U_R) ≠ 0` (the
  ideal `(x, z)`), so the dimension bound `4` of DeformationAndDerivedPatchingAlgebra §6.9 is sharp.
- The four-dimensional hypersurface `k⟦x_1, …, x_5⟧/(x_1x_2 − x_3x_4)` (a cone over a singular quadric)
  is parafactorial although it is singular: `Pic(U_R) = 0` by DeformationAndDerivedPatchingAlgebra §6.9
  and its depth is `4`.

### 7.6 Gabber's conjecture on the local Picard group

Prove `localPicard_torsion_eq_one`: for a Noetherian local ring `(R, 𝔪)` that is a complete intersection
of dimension `≥ 3`, every torsion element of `Pic(puncturedSpectrum R)` (Tau Ceti `LineBundleClass`) is
trivial ([CS24] Theorem 7.2.1 and proof, pp. 88–89; announced as Theorem 1.1.3(a), p. 3; [Gab04b]
Conjecture 3). Prove `localPicard_subsingleton`: for a regular local ring `R` (of any dimension),
`Pic(puncturedSpectrum R)` is trivial (the regular clause of [CS24] Theorem 7.2.1). Together with the
vanishing of `Pic(U_R)` for complete intersections of dimension `≥ 4` (DeformationAndDerivedPatchingAlgebra
§6.9, recorded in §7.5), this is the whole of [CS24] Theorem 7.2.1. Route: for regular `R` a line bundle
on `U_R` extends to a line bundle on `Spec R` by §7.4 (Weil divisors on the factorial `R`, with
`Γ(U_R, 𝒪) = R` when `dim R ≥ 2` by §0.5, and `U_R` empty or the spectrum of a field when `dim R ≤ 1`),
hence is trivial; for the torsion statement, §6.2 (`dim R ≥ 3` gives `H^1_𝔪 = H^2_𝔪 = 0` for `μ_n`) makes
`H^1(R, μ_n) → H^1(U_R, μ_n)` bijective, every class of `Pic(U_R)[n]` lifts to `H^1(U_R, μ_n)` by the
Kummer sequence (SchemeAndStackFoundations §2.11) for some `n ≥ 1`, and its image in `Pic R = 0` vanishes.
*Needs:* §§0.1, 0.5, 1.1, 6.2, 7.4, 7.5; SchemeAndStackFoundations §§2.11, 3.4; Tau Ceti
`TauCeti.AlgebraicGeometry.LineBundleClass`.

**Checks.**
- For the three-dimensional node `k⟦x, y, z, w⟧/(xy − zw)`, `Pic(U_R) ≅ ℤ` (generated by `(x, z)`) is
  torsion free and nonzero: dimension `3` gives only torsion vanishing.
- For `R` regular local of dimension `2`, `Pic(U_R) = 0` although the torsion statement needs dimension
  `≥ 3` in general; for `R` a field or a discrete valuation ring `U_R` is empty or `Spec K` and `Pic(U_R)`
  is trivial, in agreement with the regular clause.
- Dimension-two complete intersections can have torsion: for the local ring `S` at the vertex of the
  affine cone over a smooth plane cubic over `ℂ`, a two-dimensional hypersurface, `Pic(U_S)_tors` is
  infinite ([CS24] Remark 7.2.4).
- The `A_1` singularity `k⟦x, y, z⟧/(xz − y²)` is a complete intersection of dimension `2` with
  `Pic(U_R) = ℤ/2 ≠ 0`: `localPicard_torsion_eq_one` excludes it by `dim R ≥ 3` and
  `localPicard_subsingleton` because it is not regular.

### 7.7 Purity fails for Cohen–Macaulay rings

Prove: for `n ≥ 3` and `R = ℂ⟦x_1, …, x_n⟧^{ℤ/2}` with `ℤ/2` acting by `x_i ↦ −x_i`, `R` is a Cohen–Macaulay
normal local domain of dimension `n`, `ℂ⟦x_1, …, x_n⟧` restricts to a nontrivial `ℤ/2`-torsor over `U_R`,
and its class is a nonzero element of `Pic(U_R)[2]` and gives a nonzero element of `H²_𝔪(R, μ_2)`; hence
§7.6 and §6.2 fail for Cohen–Macaulay rings ([CS24] Remark 7.2.2, p. 89). Route: `R → ℂ⟦x⟧` is the
normalization in a quadratic extension, free of fixed points off the closed point, and a direct summand
(the anti-invariants as complement), so `R` is Cohen–Macaulay; depth `≥ 2` gives `R^× = H^0(U_R, 𝔾_m)`,
units of `R` are squares, so the Kummer sequence identifies `H^1(U_R, μ_2)` with `Pic(U_R)[2]`; since
`H^1(R, μ_2) = R^×/R^{×2} = 0`, the support sequence sends the torsor class injectively into
`H²_𝔪(R, μ_2)`, which violates §6.2's bound `2 < n`.
*Needs:* §§0.1, 0.2, 0.5, 7.6; SchemeAndStackFoundations §§0.17, 2.11.

**Checks.**
- For `n = 3`, `R` is the cone over the Veronese surface: Cohen–Macaulay of dimension `3`, not a complete
  intersection, with `Pic(U_R) ⊃ ℤ/2`.
- `H^1_𝔪(R, μ_2) = 0` here, and the failure is in degree `2`.
- For `n = 2`, `R` is the `A_1` singularity, a complete intersection of dimension `2`, where `Pic(U_R)[2] ≠ 0`
  is allowed by §7.6.

### 7.8 Picard groups of global complete intersections

Prove: for a field `k` and a global complete intersection `X ⊂ ℙⁿ_k` of dimension `≥ 2`,
`(Pic(X)/ℤ·[𝒪(1)])_tors = 0`; if `dim X ≥ 3`, `Pic(X)` is free of rank one, generated by `[𝒪(1)]` ([CS24]
Corollary 7.2.3 and proof, p. 89; [SGA2] XII, Corollaire 3.7, p. 121; Deligne for smooth `X`). Route: the
homogeneous coordinate ring `R = k[x_0, …, x_n]/(f_1, …, f_{n−d})` with `f` a regular sequence of forms
satisfies `R ≅ ⊕_{m≥0} Γ(X, 𝒪(m))`, a line bundle `L` gives the graded module `⊕_m Γ(X, L(m))` restricting to
a line bundle on `U_{R_𝔪}`, compatibly with tensor products, which gives an injection
`Pic(X)/ℤ·[𝒪(1)] → Pic(U_{R_𝔪})`; `R_𝔪` is a complete intersection of dimension `d + 1`, and §7.6 applies.
*Needs:* §7.6; SchemeAndStackFoundations §§0.3, 3.4; Mathlib `AlgebraicGeometry.Proj`; Tau Ceti
`TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece` (the grading of `R` induced from the polynomial ring).

**Checks.**
- A cubic threefold `X ⊂ ℙ⁴` has `Pic(X) = ℤ[𝒪(1)]`.
- The quadric surface `xw − yz = 0` is `ℙ¹ × ℙ¹` with `Pic(X)/ℤ[𝒪(1)] ≅ ℤ`, torsion free but nonzero: the
  torsion restriction cannot be dropped in dimension `2`.
- A smooth plane cubic over an algebraically closed field has infinite `(Pic(X)/ℤ[𝒪(1)])_tors` (its
  prime-to-characteristic torsion points; [CS24] Remark 7.2.4, p. 90, uses an elliptic curve): dimension `≥ 2` is
  needed. Smoothness matters for this Check: for the cuspidal cubic `y²z = x³` over `ℂ`,
  `Pic^0(X) ≅ (ℂ, +)` is torsion free and, as `deg 𝒪(1) = 3`, the torsion subgroup is `ℤ/3`.

### 7.9 Torsion of 𝔾_m-cohomology for schemes with factorial strict henselizations

Prove: let `X` be a Noetherian integral scheme with function field `K`. (a) If every strict henselization
`𝒪^{sh}_{X,x̄}` is factorial, then `H^i_ét(X, 𝔾_m)` is torsion for every `i ≥ 2`. (b) If `X` is regular,
`H²_ét(X, 𝔾_m) → H²_ét(K, 𝔾_m)` is injective, so `H²_ét(X, 𝔾_m)` is torsion ([Gro66] §1, Lemma 1.1,
Proposition 1.4, Lemmas 1.6, 1.9 and Corollary 1.8, pp. 290–293; [CS24] proof of Theorem 7.2.9, p. 93;
[C19] Lemma 3.2, p. 7). Route:
under geometric local factoriality the divisor sequence
`0 → 𝔾_m → g_*𝔾_{m,K} → ⊕_{x∈X^{(1)}} (i_x)_*ℤ → 0` on `X_ét` is exact; positive-degree cohomology of
pushforwards from points is torsion; `H^1(X, (i_x)_*ℤ) = 0` and `R^1 g_*𝔾_m = 0` (Hilbert 90) give the
injection in degree two.
*Needs:* §7.4; SchemeAndStackFoundations §§2.11, 2.15, 2.22; ModularCurves Layer 4D; Mathlib
`UniqueFactorizationMonoid`.

**Checks.**
- For `X = Spec R`, `R` a discrete valuation ring, (b) is the injectivity `Br(R) → Br(K)`.
- For `X = 𝔸²_ℂ`, (b) embeds `H²(X, 𝔾_m)` into `Br(ℂ(x, y))`, a torsion group, as (a) also says.
- For `X = Spec K` a field both parts say `H^i(K, 𝔾_m)` is torsion for `i ≥ 1`.

### 7.10 The Brauer comparison of Gabber and de Jong

Prove: for a scheme `X` with an ample invertible sheaf (EGA II 4.5.3, so `X` is quasi-compact and
separated), in particular for every quasi-compact open subscheme of an affine scheme (Mathlib's
`IsQuasiAffine` includes `CompactSpace`): `Spec R` for every ring `R`, and `puncturedSpectrum R` whenever
it is quasi-compact, for instance for `R` Noetherian (§0.1), the map
`SchemeBrauerGroup.toCohomologicalBrauer : Br(X) → H²(X, 𝔾_m)_tors` of SchemeAndStackFoundations §2.22 is
an isomorphism ([dJ02], Theorem 1.1, after Gabber; [CS24] proof of Theorem 7.2.5, p. 90). Route: de Jong's
twisted sheaves: a torsion class `α` is represented by a `𝔾_m`-gerbe, and an ample line bundle produces a
locally free `α`-twisted sheaf of positive rank, whose endomorphism algebra is an Azumaya algebra of class
`α`.
*Needs:* SchemeAndStackFoundations §§1.18, 2.22, 3.4; §7.9.

**Checks.**
- For `X = Spec K` a field it is the classical identification of `Br(K)` with `H²(K, 𝔾_m)`.
- For `X = Spec R` affine the ample bundle is `𝒪`, recovering Gabber's affine theorem; for
  `X = puncturedSpectrum k⟦x, y, z⟧` (quasi-affine, not affine) the theorem still applies.
- Quasi-compactness of the open is a hypothesis, not a consequence of §0.1: for
  `R = k[x_1, x_2, …]_{(x_1, x_2, …)}` (every finite subset of variables, localised at the maximal ideal
  they generate), `puncturedSpectrum R = ⋃_i D(x_i)` has no finite subcover, since the prime
  `(x_1, …, x_n)R` lies in `D(x_{n+1})` but in none of `D(x_1), …, D(x_n)`; so `puncturedSpectrum R` is
  not quasi-affine in Mathlib's sense and the theorem makes no assertion about it. For `R = k⟦x, y⟧`,
  `puncturedSpectrum R = D(x) ∪ D(y)` is quasi-compact and the theorem applies.
- The comparison is only for torsion classes: on the punctured spectrum of the four-dimensional Segre
  cone of §7.13, `H²(U_R, 𝔾_m)` has nontorsion classes that are not Azumaya.

### 7.11 Vector bundles and Azumaya algebras on punctured regular surfaces

Prove: for a regular local ring `R` of dimension `2`, pullback is an equivalence from vector bundles on
`Spec R` to vector bundles on `U_R`, and from Azumaya algebras on `Spec R` to Azumaya algebras on `U_R`;
hence `Br(R) → Br(U_R)` is bijective; if `R` is strictly henselian, `H²_ét(U_R, 𝔾_m) = 0` ([CS24] proof of
Theorem 7.2.5, p. 90, after [Gro68] Brauer III, 6.1 b); [C19] Theorem 1.3 case (i), p. 2). Route: full
faithfulness by Hartogs (depth `2`); for a vector bundle `E` on `U_R`, `j_*E` is reflexive
(SchemeAndStackFoundations §0.6), hence of depth `2 = dim R`, hence free (PurityOfBranchLocus §0.3,
`IsRegularLocalRing.free_of_isCohenMacaulay`); `j_*A` for an Azumaya `A` is free and Azumaya by
SchemeAndStackFoundations §2.22 `azumaya_equivalent_conditions`; for strictly henselian `R`,
`Br(R) = Br(k) = 0` (`brauer_henselian_local`), `H²(U_R, 𝔾_m)` is torsion (§7.9) and its torsion is
`Br(U_R)` (§7.10).
*Needs:* §§0.1, 7.9, 7.10; SchemeAndStackFoundations §§0.6, 2.22; PurityOfBranchLocus §0.3; Mathlib
`IsAzumaya`.

**Checks.**
- For `R = k⟦x, y⟧` every vector bundle on `U_R` is trivial.
- In dimension `3` vector bundles need not extend: on `U_R` for `R = k⟦x, y, z⟧` the syzygy bundle of
  `(x, y, z)` is not free, although `Br(R) ≅ Br(U_R)` still holds (§7.12).
- Regularity is needed: over the `A_1` singularity the reflexive module `(x, y)` restricts to a nontrivial
  line bundle on `U_R`.

### 7.12 Gabber's conjecture on the Brauer group of local complete intersections

Prove: for a Noetherian local ring `(R, 𝔪)` that is either a complete intersection of dimension `≥ 4` or
regular of dimension `≥ 2`, pullback `Br(R) → Br(U_R)` of Azumaya Brauer groups is bijective ([CS24] Theorem
7.2.5 and proof, p. 90; announced as Theorem 1.1.3(b), p. 3; [Gab04b] Conjecture 2). Route: by §7.10,
`Br = H²(−, 𝔾_m)_tors` on `Spec R` and `U_R`; `Pic(R) = Pic(U_R) = 0` (§7.6), so the Kummer sequence gives
`Br(R)[n] ≅ H²(R, μ_n)` and `Br(U_R)[n] ≅ H²(U_R, μ_n)` for `n ≥ 1`; except for regular `R` of dimension
`2`, `H²_𝔪 = H³_𝔪 = 0` for `μ_n` by §6.2 (complete intersections of dimension `≥ 4`) and §6.5 (regular of
dimension `≥ 3`); the remaining case is §7.11.
*Needs:* §§6.2, 6.5, 7.6, 7.10, 7.11; SchemeAndStackFoundations §§2.11, 2.22.

**Checks.**
- For `R = W(k)⟦x, y, z⟧` (regular of dimension `4`), `Br(U_R) = Br(R) = Br(k)`.
- For a hypersurface `R = k⟦x_1, …, x_5⟧/(f)` of dimension `4`, `Br(R) ≅ Br(U_R)`.
- Dimension-three complete intersections are excluded: §7.13 gives one with `Br(R) = 0` and `Br(U_R)`
  infinite.

### 7.13 Sharpness of the dimension bound for Brauer purity

Prove: for `S` the local ring at the vertex of the affine cone over a smooth plane cubic over `ℂ`, the
three-dimensional strictly henselian complete intersection `R = S^{sh}⟦x, y⟧/(xy)` has `Br(R) = 0` and
`Br(U_R)` infinite; with the Segre embedding of `ℙ¹_ℂ × ℙ¹_ℂ` instead of the cubic, `S` has dimension `3`,
`R` dimension `4`, and `H²(U_R, 𝔾_m)` contains classes not coming from `H²(R, 𝔾_m)`, necessarily
nontorsion by §7.12 ([CS24] Remark 7.2.6, p. 90). Route: `Pic(U_S) → Pic(U_{S^{sh}})` is injective, so
`Pic(U_{S^{sh}})_tors` is infinite while `Pic(U_{S^{sh}⟦t⟧})` is finitely generated ([Bou78] V, Corollaire
4.9); the sequence `0 → 𝔾_m → (i_{x=0})_*𝔾_m ⊕ (i_{y=0})_*𝔾_m → (i_{x=y=0})_*𝔾_m → 0` on `Spec(R)_ét`
([Bou78] IV, Lemme 5.1) gives `#Br(U_R) = ∞`, while `Br(R) = 0` as `R` is strictly henselian.
*Needs:* §§0.1, 7.6, 7.8, 7.12; SchemeAndStackFoundations §§2.11, 2.15, 2.22.

**Checks.**
- The elliptic example has dimension `3`, below the dimension-four threshold of §7.12; the Segre example
  has dimension `4` but only nontorsion non-extendable classes, so neither contradicts §7.12.
- `Pic(U_S)_tors` is infinite for the elliptic cone, matching §7.8's sharpness in dimension `1`.
- `R` is a complete intersection: `S^{sh}⟦x, y⟧` is a complete intersection of dimension `4` and `xy` is a
  nonzerodivisor on it.

### 7.14 Groups of multiplicative type over a scheme

Define, for a scheme `X`, a finite type `X`-group `T` to be of multiplicative type if fppf-locally on `X` it is
isomorphic to the diagonalizable group `D_X(M)` of a finitely generated abelian group `M`, and a torus if
moreover `M` can be taken free; its character sheaf `X^*(T) = ℋom(T, 𝔾_m)` is then an étale-locally constant
sheaf of finitely generated abelian groups, and `T` is étale-locally diagonalizable (SGA 3 IX, 1.1 and
X, 4.5; [CS24] §7.2, p. 91; [C19] §2). Over a field these are Tau Ceti's
`TauCeti.MultiplicativeTypeAffineGroupSchemeCat` and `TauCeti.TorusAffineGroupSchemeCat`.
*Needs:* SchemeAndStackFoundations §§1.18, 2.9, 2.10; Tau Ceti `TauCeti.MultiplicativeTypeAffineGroupSchemeCat`,
`TauCeti.TorusAffineGroupSchemeCat`.

API (each a target):
- Over a field the notion agrees with Tau Ceti's; it is stable under base change, products, kernels and
  quotients of homomorphisms between groups of multiplicative type.
- Every finite type `X`-group of multiplicative type is the kernel of a homomorphism of tori, Zariski
  locally on `X` (SGA 3 IX, 2.11; [CS24] proof of Theorem 7.2.8, p. 92).
- If `m > 0` kills the torsion of `X^*(T)` (after a clopen decomposition), `[m] : T → T` factors as
  `T → S → T` with `S` a torus, `T → S` an fppf epimorphism with kernel `T[m]` (finite locally free).
- Tori are smooth, so their fppf and étale cohomology agree (SchemeAndStackFoundations §2.10).

**Checks.**
- `μ_n = D(ℤ/n)` and `𝔾_m = D(ℤ)` are of multiplicative type; `𝔾_a` over a field is not: it has no
  nontrivial characters, so it would be `D(0)`, the trivial group.
- The norm-one torus of `ℂ/ℝ` over `ℝ` is a torus that is not diagonalizable over `ℝ`, with character
  module `ℤ` with the sign action.
- `α_p` is not of multiplicative type: its Cartier dual is `α_p`, not étale.

### 7.15 Purity for groups of multiplicative type in degrees ≤ 2

Prove: let `X` be a scheme, `T` a finite type `X`-group of multiplicative type and `Z ⊂ X` closed with
`X ∖ Z → X` quasi-compact. (a) If every `𝒪_{X,z}`, `z ∈ Z`, is Noetherian and geometrically parafactorial,
then `H^0(X, T) ≅ H^0(X ∖ Z, T)`, `H^1(X, T) ≅ H^1(X ∖ Z, T)` and `H²(X, T) → H²(X ∖ Z, T)` is injective. (b) If
every `𝒪_{X,z}` is a complete intersection of dimension `≥ 3` (resp. `≥ 4`) or regular of dimension `≥ 2`,
then `H^1(X, T)_tors ≅ H^1(X ∖ Z, T)_tors` (resp. `H²(X, T)_tors ≅ H²(X ∖ Z, T)_tors`), torsion meaning killed by
a locally constant positive function; in particular, for Noetherian `X` with each `𝒪_{X,z}` a complete
intersection of dimension `≥ 4` or regular of dimension `≥ 2`, `H²(X, 𝔾_m)_tors ≅ H²(X ∖ Z, 𝔾_m)_tors` ([CS24]
Theorem 7.2.8, pp. 91–92; announced as Theorem 1.1.4, p. 4; footnotes 26–27). Route: (a) §0.5 gives degrees
`≤ 1` (parafactorial rings have depth `≥ 2`); reduce by §0.2 to strictly local `X` and by §7.14 to `T = 𝔾_m`,
where it says that `j_*L` is a line bundle for every line bundle `L` on `X ∖ Z`, which holds by Noetherian
induction and parafactoriality. (b) injectivity in degree `1` from §0.5(b) applied to `T`-torsors, which are affine: a complete
intersection of dimension `≥ 3` or a regular ring of dimension `≥ 2` has depth `≥ 2`, so a torsor trivial
on `X ∖ Z` has a section that extends ([CS24] Lemma 7.2.7(b)); injectivity in degree `2` from (a), whose
hypothesis holds for complete intersections of dimension `≥ 4` (geometric parafactoriality, §7.5, from
DeformationAndDerivedPatchingAlgebra §6.9) and for regular rings of dimension
`≥ 2` (§§7.4–7.5); (a) is not available in degree `1` for complete intersections of dimension `3`, which
need not be parafactorial (the three-dimensional node has `Pic(U_R) ≅ ℤ`); for surjectivity on a class killed by `n`, choose
`m` as in §7.14, lift through `[n] ∘ q : T → S` with finite locally free kernel `T[mn]`, and extend by §§6.2,
6.5 and Noetherian induction; in the regular dimension-two case use (a) in degree `1` and §7.12 with Kummer
in degree `2`.
*Needs:* §§0.2, 0.5, 6.2, 6.5, 7.4, 7.5, 7.12, 7.14; DeformationAndDerivedPatchingAlgebra §§3.4, 6.9;
ModularCurves Layer 4D.

**Checks.**
- For `X = Spec R`, `R` regular local of dimension `2`, `T = 𝔾_m`: `H²(R, 𝔾_m)_tors ≅ H²(U_R, 𝔾_m)_tors`, that
  is `Br(R) ≅ Br(U_R)`.
- For `T = μ_n` with `n` invertible, (b) in degree `1` is purity for `μ_n`-torsors.
- Geometric parafactoriality is needed in (a): for the `A_1` singularity `Pic(U_R) ≠ 0 = Pic(R)`, so
  `H^1(X, 𝔾_m) → H^1(X ∖ Z, 𝔾_m)` is not surjective.

### 7.16 Purity for groups of multiplicative type in higher degrees

Prove: let `X` be a scheme, `T` a finite type `X`-group of multiplicative type, `d ≥ 3`, and `Z ⊂ X` closed
with `X ∖ Z → X` quasi-compact such that every `𝒪_{X,z}`, `z ∈ Z`, is either a complete intersection of
dimension `≥ d` all of whose strict henselizations are factorial, or regular of dimension `≥ d − 1`; then
`H^i(X, T) → H^i(X ∖ Z, T)` is injective for `i < d` and bijective for `i < d − 1` ([CS24] Theorem 7.2.9,
pp. 92–93; footnote 28). Route: reduce to strictly local `X` and `T = 𝔾_m`; by §7.9(a) all
`H^i_Z(X, 𝔾_m)` are torsion (using §7.15(a) in degrees `≤ 1`), and §7.1 for `μ_n` with the Kummer sequence
kills their `n`-torsion for `i < d`.
*Needs:* §§0.2, 7.1, 7.4, 7.9, 7.14, 7.15; SchemeAndStackFoundations §2.11.

**Checks.**
- For `X` regular and `Z` of codimension `≥ 2` (`d = 3`) it gives bijectivity for `i ≤ 1` and injectivity
  for `i = 2`; for tori §8.6 strengthens this to bijectivity for `i ≤ 2`.
- For `T = μ_n` it is §7.1.
- The factoriality hypothesis is needed: for the three-dimensional node `R = k⟦x, y, z, w⟧/(xy − zw)`
  (a complete intersection that is not factorial), `T = 𝔾_m` and `d = 3`, `H^1(R, 𝔾_m) = 0` while
  `H^1(U_R, 𝔾_m) = Pic(U_R) ≅ ℤ`, so bijectivity in degree `1` fails.

### Examples

For `R = k⟦x_1, …, x_5⟧/(x_1x_2 − x_3x_4 + x_5²)` (a four-dimensional hypersurface): §7.6 gives
`Pic(U_R) = 0`, §7.12 gives `Br(U_R) = Br(R) = Br(k)`, and §7.15(b) gives
`H²(R, 𝔾_m)_tors ≅ H²(U_R, 𝔾_m)_tors`.

### Dependencies

§§0.1–0.5, 1.1, 6.2, 6.5; DeformationAndDerivedPatchingAlgebra §§3.4, 6.9; PurityOfBranchLocus §0.3;
ModularCurves Layer 4D;
SchemeAndStackFoundations §§0.3, 0.4, 0.6, 0.17, 1.15, 1.18, 2.7, 2.9–2.11, 2.15, 2.22, 3.4;
Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`, `TauCeti.MultiplicativeTypeAffineGroupSchemeCat`,
`TauCeti.TorusAffineGroupSchemeCat`.

## Layer 8: Purity for the Brauer group and for tori on regular schemes

This layer proves Česnavičius's purity for the Brauer group: `H²_ét(U_R, 𝔾_m) = 0` for strictly henselian
regular `R` of dimension `≥ 2`, the global purity statements for tori and for `𝔾_m`, the description of
`H²(X, 𝔾_m)` as an intersection over codimension-one points, and the residue sequences ([C19] §§2, 5, 6
and Appendix A, pp. 3–6, 11–15). The local input is taken from Layers 6–7, along the route of [CS24]
Theorem 1.1.3(b) and its proof of Theorem 7.2.5; [C19]'s own perfectoid route is not used.

### 8.1 Purity for the Brauer group of a punctured strictly henselian regular local ring

Prove: for a strictly henselian regular local ring `R` of dimension `≥ 2`, `H²_ét(U_R, 𝔾_m) = 0` ([C19]
Theorem 5.3 (= Theorem 1.3), p. 12; [CS24] Theorem 1.1.3(b) and the paragraph after it, p. 4). Route:
`H²(U_R, 𝔾_m)` is torsion (§7.9(b), `U_R` regular integral); dimension `2` is §7.11; for `d ≥ 3` and
`n ≥ 1`, the Kummer sequence makes `H²(U_R, μ_n) → H²(U_R, 𝔾_m)[n]` surjective, and in
`H²(R, μ_n) → H²(U_R, μ_n) → H³_𝔪(R, μ_n)` the first group vanishes (`R` strictly henselian:
`H^{≥1}(R, 𝔾_m) = 0` by SchemeAndStackFoundations §2.15, and Kummer) and the last by §6.5 (`3 ≤ d`).
*Needs:* §§0.2, 6.5, 7.9, 7.11; SchemeAndStackFoundations §§2.11, 2.15.

**Checks.**
- For `R = k⟦x, y⟧` with `k` separably closed, `H²(U_R, 𝔾_m) = 0` although `U_R` is not affine.
- For `R = W(k̄)⟦x, y, z⟧` (mixed characteristic, dimension `4`) the `p`-primary part of `H²(U_R, 𝔾_m)`
  vanishes, the case open before [C19].
- Regularity is needed: for the three-dimensional strictly henselian complete intersection of §7.13,
  `Br(U_R)` is infinite.

### 8.2 Finite étale descent for tori on punctured spectra

Prove ([C19] Lemma 2.1, Propositions 2.2–2.3, Corollary 2.4, pp. 3–5; Definition A.1, Lemma A.2, p. 15):
(a) for a finite locally free `S′ → S` and an `S`-affine `S`-group `G`, `X = Res_{S′/S}(G_{S′})/G` is
representable by an `S`-affine scheme, smooth if `G` is, and `Res_{S′/S}(G_{S′}) ≅ G × X` (as groups if `G`
is commutative) when `S′ → S` has a section; (b) for a finite flat map `R → R′` of local rings, an open
`V ⊂ Spec R` and an affine smooth **commutative** `R`-group `G` with `Γ(Spec R, 𝒪) ≅ Γ(V, 𝒪)` and every
`G`-torsor over `R` trivial, `H^1(V, G) → H^1(V_{R′}, G)` is injective; (c) for an `R`-torus `T` split by
`R′`, under the analogous hypotheses on `Res_{R′/R}(T_{R′})/T`-torsors and with `Pic(V_{R′⊗R′}) = 0`,
`H²(V, T) → H²(V_{R′}, T)` is injective (and injective on torsion if instead `Pic(V_{R′⊗R′})` is torsion free
and `Pic(V_{R′})` torsion); (d) a field `k` has dimension `≤ 1` if `H^i(k, G) = 0` for `i ≥ 2` and every
commutative finite étale `G` and, in positive characteristic, `Br(k′) = 0` for every finite separable `k′/k`;
then `H^i(k, T) = 0` for `i ≥ 1` and every `k`-torus `T`; (e) for a henselian regular local ring `R` of
dimension `≥ 2` with residue field of dimension `≤ 1`, a nonzero finite étale `R`-algebra `R′` and an
`R`-torus `T`, `H^1(U_R, T) → H^1(U_{R′}, T)` and `H²(U_R, T) → H²(U_{R′}, T)` are injective. Part (b) is
stated for commutative `G`; see the Notes on the sources under References.
*Needs:* §§0.1, 0.5, 7.6, 7.14; SchemeAndStackFoundations §§1.15, 2.3, 2.11, 2.15; ModularCurves
Layer 4D.

**Checks.**
- For `R′ = R` all maps in (b), (c), (e) are identities.
- Finite fields, `ℂ((t))` and the maximal unramified extension of `ℚ_p` have dimension `≤ 1`; `ℝ` does not
  (`H²(ℝ, ℤ/2) = ℤ/2`).
- In (c), `Pic(V_{R′⊗R′}) = 0` holds in (e) because `R′ ⊗_R R′` is a product of regular local rings of
  dimension `≥ 2` and §7.6 applies to each factor.

### 8.3 Tori on punctured spectra of henselian regular local rings with small residue fields

Prove: for a henselian regular local ring `R` of dimension `≥ 2` whose residue field has dimension `≤ 1`
(§8.2(d)) and an `R`-torus `T`, `H^1_ét(U_R, T) = H²_ét(U_R, T) = 0` ([C19] Theorem 1.4, p. 3; §5.4, p. 13).
Route: §8.2(e) and passage to the colimit over finite étale local `R′` (SchemeAndStackFoundations §2.15,
`etale_cohomology_limits`) reduce to strictly henselian `R`, where `T` is split; then `Pic(U_R) = 0` (§7.6)
and §8.1.
*Needs:* §§7.6, 8.1, 8.2; SchemeAndStackFoundations §2.15.

**Checks.**
- For strictly henselian `R` and `T = 𝔾_m` it is `Pic(U_R) = 0` and §8.1.
- For `R = ℤ_p⟦x⟧` (residue field `𝔽_p` of dimension `1`) and `T = 𝔾_m`: `H²(U_R, 𝔾_m) = 0`.
- The residue-field hypothesis cannot be dropped: for `R = ℝ⟦x, y⟧` and `T` the norm-one torus of `ℂ/ℝ`,
  `H^1(U_R, T) ≅ H^1(R, T) ≅ H^1(ℝ, T) = ℤ/2` by §8.6 and henselian invariance.

### 8.4 The coniveau spectral sequence for cohomology with supports

Prove: for a Noetherian scheme `X` of finite dimension, a closed `Z ⊂ X` and an abelian sheaf `F` on `X_ét`,
there is a convergent spectral sequence
`E_1^{a,b} = ⊕_{z∈Z, dim 𝒪_{X,z}=a} H^{a+b}_z(Spec 𝒪_{X,z}, F) ⇒ H^{a+b}_Z(X, F)`, from the filtration by the
families of closed supports in `Z` of codimension `≥ a` ([ILO14] XVIII-A, Lemma 2.2 and display (2.a),
p. 333 of the arXiv version; [C19] proof of Theorem 6.1, p. 13). Route: filtered colimits of the support
triple sequences of §0.2 over closed `W′ ⊂ W` with `W′` of codimension `≥ a + 1` and `W` of codimension
`≥ a` give an exact couple; excision and localization compute the graded pieces; finite dimension gives
convergence. The set of all points of codimension `≥ a` is never used as a closed support.
*Needs:* §0.2; SchemeAndStackFoundations §§2.1–2.3, 2.15.

**Checks.**
- For `Z = {x}` a closed point it degenerates to `H^i_Z(X, F) = H^i_x(Spec 𝒪_{X,x}, F)` (excision).
- For `X` a Dedekind scheme and `Z = X` it gives the localization sequence relating `H^i(X, F)`,
  `H^i(K, F)` and `⊕_x H^{i+1}_x`.
- On `𝔸¹` the points of codimension one form a dense non-closed set, which is why the filtration is by
  closed supports of bounded codimension rather than by that set.

### 8.5 Vanishing of torus cohomology with supports in degrees ≤ 3

Prove: for a scheme `X`, a closed `Z ⊂ X` with `X ∖ Z → X` quasi-compact and an `X`-torus `T`, if every
`𝒪_{X,z}`, `z ∈ Z`, is regular of dimension `≥ 2`, then `H^q_Z(X, T) = 0` for `q ≤ 3` ([C19] proof of Theorem
6.1, p. 13). Route: the local-to-global sequence and the stalk formula (§§0.2–0.3) and étale-local
splitting of tori reduce to `T = 𝔾_m` on a strictly henselian regular local `X`; §8.4 reduces to `Z` the
closed point; then `H^0(R, 𝔾_m) ≅ H^0(U_R, 𝔾_m)` (§0.5), `H^{>0}(R, 𝔾_m) = 0`, `Pic(U_R) = 0` (§7.6) and
§8.1 give `H^q_𝔪(R, 𝔾_m) = 0` for `q ≤ 3`.
*Needs:* §§0.2, 0.3, 0.5, 7.6, 7.14, 8.1, 8.4; SchemeAndStackFoundations §2.15.

**Checks.**
- For `X = Spec R`, `R` strictly henselian regular of dimension `2` and `Z` the closed point, it is
  equivalent to `Pic(U_R) = 0` and `H²(U_R, 𝔾_m) = 0`.
- Codimension one is excluded: for `Z = V(x) ⊂ 𝔸²`, `H^1_Z(𝔸², 𝔾_m) ≅ ℤ` (the divisor of `x`).
- Degree `4` is not covered: only injectivity on `H³` follows in §8.6.

### 8.6 Purity for tori along regular closed subsets of codimension ≥ 2

Prove: for a scheme `X`, an `X`-torus `T` and a closed `Z ⊂ X` with `X ∖ Z → X` quasi-compact and every
`𝒪_{X,z}`, `z ∈ Z`, regular of dimension `≥ 2`, `H^q_ét(X, T) → H^q_ét(X ∖ Z, T)` is an isomorphism for `q ≤ 2`
and injective for `q = 3` ([C19] Theorem 6.1, p. 13), by §8.5 and the long exact sequence of §0.2.
*Needs:* §§0.2, 8.5.

**Checks.**
- For `T = 𝔾_m` and `q = 1`: `Pic(X) ≅ Pic(X ∖ Z)` for regular `X` and `Z` of codimension `≥ 2`.
- For `X = 𝔸²_ℂ` and `Z = {0}`: `Br′(𝔸²_ℂ ∖ {0}) = Br′(𝔸²_ℂ)`, although `𝔸²_ℂ ∖ {0}` is not affine.
- For `d = 3` it strengthens §7.16 for tori to bijectivity in degree `2`.

### 8.7 Purity for the Brauer group of regular schemes

Prove: for a locally Noetherian scheme `X` and a closed `Z ⊂ X` with every `𝒪_{X,z}`, `z ∈ Z`, regular of
dimension `≥ 2`, `H²_ét(X, 𝔾_m) → H²_ét(X ∖ Z, 𝔾_m)` is an isomorphism and `H³_ét(X, 𝔾_m) → H³_ét(X ∖ Z, 𝔾_m)`
is injective ([C19] Theorem 1.1, p. 1, deduced in §6, p. 13); local Noetherianity makes `X ∖ Z → X`
quasi-compact, and no regularity is assumed off `Z`. This is §8.6 for `T = 𝔾_m`.
*Needs:* §8.6.

**Checks.**
- For `X` regular and `Z` of codimension `≥ 2`, `Br′(X) ≅ Br′(X ∖ Z)`.
- Codimension two is necessary: restriction from `𝔸²_ℂ` to the complement of the coordinate axes is
  not surjective on Brauer groups (§8.18).
- Regularity along `Z` is necessary: for the three-dimensional complete intersection of §7.13, `Br(U_R)`
  is infinite while `Br(R) = 0`.

### 8.8 Generic injectivity of H² for a torus

Define, for a Noetherian integral regular scheme `X` with function field `K` and an `X`-torus `T`: `T` has
generically injective `H²` on `X` if `H²_ét(V, T) → H²_ét(Spec K, T)` is injective for every nonempty open
`V ⊂ X` ([C19] Theorem 6.2, condition (6.2.1), p. 13; Remark 6.3, p. 14).
*Needs:* §7.14; SchemeAndStackFoundations §2.15.

API (each a target):
- It passes to every nonempty open `V ⊂ X`.
- It holds for `T = 𝔾_m` (§7.9(b)).
- It holds for flasque tori (§8.11).
- It holds for `T_1 × T_2` iff it holds for `T_1` and `T_2`.

**Checks.**
- For `T = 𝔾_m^r` it holds by the `𝔾_m` case.
- For `X = Spec K` a field it holds trivially (`V = X`).
- For `X = ℙ¹_ℝ` and `T` the norm-one torus of `ℂ/ℝ` it fails (§8.12).
- For `X′/X` finite étale with `X′` integral and `T = Res_{X′/X}𝔾_m`, it holds through
  `H²(V, T) = H²(V ×_X X′, 𝔾_m)` and the `𝔾_m` case on `X′`.

### 8.9 H² of a torus as an intersection over codimension-one points

Prove: for a Noetherian integral regular scheme `X` with function field `K` and an `X`-torus `T` with
generically injective `H²` (§8.8), `H²_ét(X, T) = ⋂_{x∈X^{(1)}} H²_ét(Spec 𝒪_{X,x}, T)` inside `H²_ét(K, T)`
([C19] Theorem 6.2 and proof, (6.2.2), pp. 13–14). Route: classes extending over nonempty opens `U` and
`V` extend over `U ∪ V` by Mayer–Vietoris (§0.2) and injectivity on `U ∩ V`; a limit argument extends a
class of the intersection over an open containing all height-one points, and §8.6 extends it over the
complement of codimension `≥ 2`.
*Needs:* §§0.2, 0.3, 8.6, 8.8.

**Checks.**
- For `X` a Dedekind scheme it is the description of `H²(X, T)` as classes unramified at every closed point.
- Without generic injectivity it fails: §8.12 gives a nonzero class on `ℙ¹_ℝ` vanishing at the generic
  point.
- For `X = Spec K` a field there are no height-one points and the intersection is all of `H²(K, T)`.

### 8.10 The Brauer group as an intersection over codimension one

Prove: for a Noetherian integral regular scheme `X` with function field `K`,
`H²_ét(X, 𝔾_m) = ⋂_{x∈X^{(1)}} H²_ét(𝒪_{X,x}, 𝔾_m)` inside `H²_ét(K, 𝔾_m)` ([C19] Theorem 1.2 (= Theorem 6.2
for `𝔾_m`), p. 2; Lemma 3.2, p. 7), answering the question of Auslander and Goldman for affine `X`: §8.9 with
§8.8 for `𝔾_m`.
*Needs:* §§8.8, 8.9.

**Checks.**
- For `X = Spec R` regular affine, `Br(R) = ⋂_{ht 𝔭 = 1} Br(R_𝔭)` (Br `=` Br′ on affines, §7.10).
- For `X = 𝔸²_ℂ` the cyclic class of §8.18 is ramified along `x = 0`, so it is not in the intersection; on
  `X = 𝔾_m²` the line `x = 0` is no longer a height-one point and the class lies in `H²(𝔾_m², 𝔾_m)`.
- For `X = Spec ℤ`, `Br(ℤ) = ⋂_p Br(ℤ_(p))` inside `Br(ℚ)`, and this intersection is `0`.

### 8.11 Flasque tori have generically injective H²

Define an `X`-torus `T`, for a Noetherian integral regular `X`, to be flasque if there is a finite étale
Galois cover `X′/X` splitting `T` such that the `Gal(X′/X)`-module `Hom_{X′}(T_{X′}, 𝔾_{m,X′})` has no
nontrivial extension by any permutation module `ℤ[Gal(X′/X)/H]` ([CTS87] §0.5, p. 155, and Definition 1.2,
pp. 157–158; [C19] Remark 6.3, p. 14). Prove: flasque tori have generically injective `H²` ([CTS87] Theorem
2.2(ii), pp. 161–163), and every torus direct factor of `Res_{X″/X}(𝔾_m)` for a finite étale `X″/X` is
flasque (Shapiro's lemma and `H^1(H, ℤ) = 0`).
*Needs:* §§7.14, 8.8; SchemeAndStackFoundations §§2.15, 2.22.

API (each a target):
- Quasi-trivial tori `Res_{X″/X}𝔾_m` and their direct factors are flasque.
- Flasqueness does not depend on the splitting Galois cover chosen.
- Flasque tori have generically injective `H²` on `X`.

**Checks.**
- `𝔾_m` and `Res_{X′/X}𝔾_m` are flasque.
- The norm-one torus of `ℂ/ℝ` has character lattice `ℤ_sign`, and `0 → ℤ_triv → ℤ[ℤ/2] → ℤ_sign → 0` is
  nonsplit, so `Ext¹(ℤ_sign, ℤ_triv) = ℤ/2 ≠ 0`: it is not flasque.
- Testing extensions only by the regular permutation module `ℤ[G]` would wrongly declare that torus
  flasque, since `Ext¹(ℤ_sign, ℤ[G]) = 0`.

### 8.12 Generic injectivity fails for the norm-one torus over ℙ¹_ℝ

Prove: for `X = ℙ¹_ℝ` and `T` the base change of the norm-one torus `0 → T → Res_{ℂ/ℝ}(𝔾_m) → 𝔾_{m,ℝ} → 0`,
`H²_ét(X, T)` contains a nonzero class whose restriction to the generic point vanishes ([C19] Remark 6.3,
display (6.3.3), p. 14). Route: the norm sequence over `𝔾_{m,ℝ} ⊂ ℙ¹_ℝ` is a `T`-torsor whose fibres at real
points sweep out `H^1(ℝ, T) ≅ ℤ/2`, so it is not constant; every `T`-torsor over `𝔸¹_ℝ` is constant ([CTS87]
Lemma 2.4, p. 164); Mayer–Vietoris for the two copies of `𝔸¹` (§0.2) gives the class.
*Needs:* §§0.2, 8.8; SchemeAndStackFoundations §2.15.

**Checks.**
- The class restricts to zero in `H²(ℝ(t), T)`, so §8.9 fails for this `T`.
- `H^1(ℝ, T) = ℝ^×/N(ℂ^×) = ℤ/2` is the source of the non-constancy.
- Over `ℂ` the torus splits and the corresponding class vanishes, as `H^1(𝔸¹_ℂ ∩ 𝔸¹_ℂ, 𝔾_m) = 0`.

### 8.13 Brauer groups of unramified extensions and unramified descent

Prove: (a) for a complete discretely valued field `K` with residue field `k` and maximal unramified extension
`K^{unr}`, `Br(K^{unr})[ℓ^∞] = 0` for every prime `ℓ ≠ char k`, and for `ℓ = char k` when `k` is perfect (Lang:
a complete discretely valued field with algebraically closed residue field is `C_1`; [Poo17] pp. 196–197);
(b) for a discrete valuation ring `𝒪` with fraction field `K` and completion `𝒪̂`, a class
`α ∈ Br(K)[ℓ^∞]` extends to `Br(𝒪)` iff its image in `Br(K̂)` extends to `Br(𝒪̂)`. Route for (b): for `α` killed
by `ℓⁿ`, the Kummer sequences identify `Br(𝒪)[ℓⁿ]` and `Br(K)[ℓⁿ]` with `H²(𝒪, μ_{ℓⁿ})` and `H²(K, μ_{ℓⁿ})`
(`Pic = 0`), `α` extends iff its boundary in `H³_𝔪(𝒪, μ_{ℓⁿ})` vanishes (§0.2; `Br(𝒪) → Br(K)` is injective
by §7.9), and §3.5 identifies `H³_𝔪(𝒪, μ_{ℓⁿ})` with `H³_𝔪(𝒪̂, μ_{ℓⁿ})` compatibly. It is not asserted that
`Br(K) → Br(K̂)` is an isomorphism.
*Needs:* §§0.2, 3.5, 7.9; SchemeAndStackFoundations §§2.11, 2.15, 2.22.

**Checks.**
- For `K = ℚ_p`, `K^{unr}` has residue field `𝔽̄_p` and `Br(K^{unr}) = 0`.
- For `K = k((t))` with `k` separably closed and imperfect, `Br(K^{unr})[p] ≠ 0` (Poonen's Warning 6.8.2), so
  the perfectness hypothesis in (a) cannot be dropped for `ℓ = p`.
- `Br(ℚ) → Br(ℚ_p)` is far from injective, while (b) only compares extendability of a single class.

### 8.14 The residue homomorphism of a discrete valuation ring

Define, for a discrete valuation ring `𝒪` with fraction field `K`, residue field `k` and a prime `ℓ` with
`ℓ ≠ char k`, or `ℓ = char k` and `k` perfect, the residue `∂_𝒪 : Br(K)[ℓ^∞] → H^1(k, ℚ/ℤ)[ℓ^∞]` as the
composite of pullback to `Br(K̂)[ℓ^∞]`, the Hochschild–Serre identification with
`H²(G_k, (K̂^{unr})^×)[ℓ^∞]` (by §8.13(a)), the valuation `H²(G_k, (K̂^{unr})^×) → H²(G_k, ℤ)` and the inverse
of `δ : H^1(k, ℚ/ℤ) ≅ H²(k, ℤ)` ([Poo17] Proposition 6.8.1 and the construction after it, pp. 196–197;
[C19] Remark 6.4, p. 14). The sign is fixed by Convention 8.
*Needs:* §8.13; SchemeAndStackFoundations §§2.15, 2.22; Mathlib `IsDiscreteValuationRing`.

API (each a target):
- `∂_𝒪` agrees with `∂` for the completion and for the henselization.
- For an unramified extension `𝒪 → 𝒪′` with residue extension `k′/k`, `∂_{𝒪′} ∘ res = res ∘ ∂_𝒪`.
- For an unramified cyclic `L/K` of degree `n` with generator `σ`, `χ(σ) = 1/n` and uniformizer `π`, the
  crossed product `(L/K, σ, π)` with `u a = σ(a) u`, `uⁿ = π` has `∂ = χ`.

**Checks.**
- For `𝒪 = ℤ_p`, `∂ : Br(ℚ_p) → H^1(𝔽_p, ℚ/ℤ) ≅ ℚ/ℤ` is an isomorphism; evaluating at arithmetic Frobenius
  gives the local invariant normalised by the crossed product of Convention 8.
- For `𝒪 = ℂ⟦t⟧`, `H^1(ℂ, ℚ/ℤ) = 0` and `Br(ℂ((t))) = 0`, so `∂ = 0`.
- For `𝒪 = k⟦t⟧` with `k` separably closed and imperfect of characteristic `p`, `Br(𝒪) = 0` and
  `H^1(k, ℚ/ℤ) = 0` but `Br(k((t)))[p] ≠ 0`, so no exact `p`-primary residue sequence exists: `ℓ = p` with `k`
  imperfect is excluded.
- `∂` vanishes on the image of `Br(𝒪)`.

### 8.15 The residue sequence of a discrete valuation ring

Prove: under the hypotheses of §8.14, `0 → H²_ét(𝒪, 𝔾_m)[ℓ^∞] → H²_ét(K, 𝔾_m)[ℓ^∞] → H^1_ét(k, ℚ/ℤ)[ℓ^∞]` is
exact ([C19] Remark 6.4, p. 14; [Poo17] Proposition 6.8.1, p. 196; [Gro68] Brauer III, 2.1). Route:
injectivity by §7.9(b); for complete `𝒪`, the valuation sequence `0 → (𝒪^{unr})^× → (K^{unr})^× → ℤ → 0`,
Hochschild–Serre and `Br(𝒪) ≅ Br(k)` (SchemeAndStackFoundations §2.22, `brauer_henselian_local`); in
general §8.13(b). For complete `𝒪` with perfect residue field `k`, exactness at `H²(K, 𝔾_m)` is also the
Witt sequence `0 → Br(k) → Br(K) → H^1(k, ℚ/ℤ) → 0` of ArithmeticGaloisDuality §R02.2.4, in every
characteristic and for every `ℓ` (for `𝒪 = k⟦t⟧` and `ℓ ≠ char k`, its finite-coefficient sequence
with `q = 2`, `r = 1` gives the same after the Kummer sequence); both residues are the valuation map
`H²(G_k, (K^{unr})^×) → H²(G_k, ℤ)` followed by an identification `H²(G_k, ℤ) ≅ H^1(k, ℚ/ℤ)`, so they
differ at most by a sign and have the same kernel, and exactness transfers whatever sign that roadmap
uses. No surjectivity of the residue is asserted.
*Needs:* §§7.9, 8.13, 8.14; SchemeAndStackFoundations §§2.15, 2.22; ArithmeticGaloisDuality §R02.2.4
(complete `𝒪` with perfect `k`).

**Checks.**
- For `𝒪 = ℤ_p`: `0 → 0 → ℚ/ℤ → ℚ/ℤ`, the residue being the local invariant.
- For `𝒪 = ℝ⟦t⟧`: `Br(ℝ⟦t⟧) = ℤ/2 → Br(ℝ((t))) = ℤ/2 ⊕ ℤ/2 → H^1(ℝ, ℚ/ℤ) = ℤ/2` is exact and the residue is
  onto.
- For `𝒪 = ℤ_(p)` the sequence is that of `ℤ_p` on the classes coming from `Br(ℚ)`, by §8.13(b).
- For `𝒪 = 𝔽_q⟦t⟧`, `L = 𝔽_{q^n}((t))` and `π = t`: `Br(𝔽_q) = 0`, so the residue
  `Br(𝔽_q((t))) → H^1(𝔽_q, ℚ/ℤ) = ℚ/ℤ` is injective, under Convention 8 and under the Witt sequence
  of ArithmeticGaloisDuality §R02.2.4 alike. Convention 8 sends the crossed product
  `(L/K, Frob_q, t)` to `χ` with `χ(Frob_q) = 1/n` and `(L/K, Frob_q^{-1}, t)` to `−χ`; these two
  classes are inverse to each other in `Br(K)`, both of order `n`. A residue with the geometric
  normalisation exchanges the two values but has the same kernel, so it passes the exactness Checks
  and fails only this one.

### 8.16 The residue sequence of a regular integral scheme

Prove: for a Noetherian integral regular scheme `X` with function field `K`,
`0 → H²_ét(X, 𝔾_m) → H²_ét(K, 𝔾_m) → ⊕_{x∈X^{(1)}} H^1_ét(k(x), ℚ/ℤ)` is exact after removing the `p`-primary
parts of all three groups for every prime `p` such that some height-one point has an imperfect residue
field of characteristic `p` ([C19] Remark 6.4, (6.4.4), p. 14; [Poo17] Theorem 6.8.3 and Warning 6.8.4,
p. 197). Route: §8.10 and §8.15 at each height-one local ring; a class has nonzero residue at only finitely
many `x`.
*Needs:* §§8.10, 8.14, 8.15.

**Checks.**
- For `X = Spec ℤ`: `0 → Br(ℤ) = 0 → Br(ℚ) → ⊕_p ℚ/ℤ` is exact (the real place is not a point of `Spec ℤ`).
- For a smooth variety over a field of characteristic `0` nothing is excluded.
- For `X = 𝔸²_{𝔽_p}` every `p`-primary part is excluded (§8.17).

### 8.17 Points of height ≥ 2 in characteristic p force imperfect height-one residue fields

Prove: if a Noetherian integral regular scheme `X` has a point `y` of height `≥ 2` with residue characteristic
`p > 0`, then `y` is a specialization of a height-one point `x` of residue characteristic `p` whose residue
field carries a nontrivial discrete valuation and so is imperfect ([C19] footnote 5 to Remark 6.4, p. 14;
EGA II 7.1.7). Route: a height-one prime of `𝒪_{X,y}` containing `p` gives `x`; its closure has dimension
`≥ 1` at `y`, so `k(x)` carries a nontrivial discrete valuation, and a uniformizer is not a `p`-th power.
*Needs:* §8.16; Mathlib `IsDiscreteValuationRing`.

**Checks.**
- For `X = Spec ℤ_p⟦x⟧`, `y` the closed point and `x = (p)`: `k(x) = 𝔽_p((x))` is imperfect.
- For `X` of dimension `1` there is no point of height `≥ 2` and the statement is vacuous.
- For `X = Spec ℤ_p⟦x⟧` the height-one point `(x)` has residue field `ℚ_p` of characteristic `0`, so not every
  height-one point specializing to `y` qualifies; the one containing `p` does.

### 8.18 Removing a divisor changes the Brauer group

Prove: restriction `Br(𝔸²_ℂ) → Br(𝔾_m²)`, from the plane to the complement of the coordinate axes, is not
surjective; hence the codimension `≥ 2` hypothesis of §8.7 cannot be weakened to codimension `1` ([C19] §1,
p. 1, citing [DF84] Remark 3). Route: on `𝔾_m²` with `ζ` a primitive `n`-th root of unity, `n ≥ 2`, the
cyclic algebra with `uⁿ = x`, `vⁿ = y`, `uv = ζvu` is Azumaya; at the discrete valuation ring of `𝔸²_ℂ` at the
generic point of `x = 0` it is the crossed product for the unramified extension adjoining `y^{1/n}`, so §8.14
gives the nonzero Kummer character of `y` in `H^1(ℂ(y), ℤ/n)` as its residue, and by §8.15 the class does not
extend over that local ring, let alone over `𝔸²_ℂ`.
*Needs:* §§8.7, 8.14, 8.15; SchemeAndStackFoundations §2.22.

**Checks.**
- The residue of the displayed algebra along `x = 0` is the Kummer character of `y`, nonzero in
  `ℂ(y)^×/ℂ(y)^{×n}`; the explicit generators fix the sign, and swapping `u` and `v` inverts it.
- Removing only the origin does not change `Br` (§8.7).
- For `n = 1` the algebra is `ℂ[x^{±1}, y^{±1}]` itself, with trivial class.

### Examples

For `X = Spec ℤ_p⟦x⟧` (regular of dimension `2`): §8.7 gives `Br′(U_X) = Br′(X) = Br(𝔽_p) = 0` for the
punctured spectrum, §8.10 describes `Br(ℤ_p⟦x⟧)` inside `Br(Frac ℤ_p⟦x⟧)` by codimension-one conditions, and
§8.16 holds after removing the `p`-primary parts, since the height-one point `(p)` has imperfect residue field
`𝔽_p((x))` (§8.17).

### Dependencies

§§0.1–0.5, 3.5, 6.5, 7.6, 7.9–7.11, 7.14; SchemeAndStackFoundations §§1.15, 2.1–2.3, 2.11, 2.15, 2.22;
ModularCurves Layer 4D; ArithmeticGaloisDuality §R02.2.4.

## Downstream consumers

These roadmaps are later in the merge order; each is to import the sections named from here, which own
them, instead of planning them (see Scope and ownership).

- SchemeAndStackFoundationsPartII is to import fppf cohomology with supports (§0.2), the supports,
  nilpotent invariance, consequences of `p`-adic continuity, excision along finitely generated ideals,
  the completion comparison for Noetherian local rings and fpqc hyperdescent with descent modulo `p`
  of flat cohomology of animated rings (Layer 3), the torsion of `𝔾_m`-cohomology (§7.9) and the
  Brauer comparison of §7.10.
- EtaleDualityAndPerverseSheavesPartII is to import the local duality statements on excellent regular local
  rings and the local Lefschetz theorem (§§1.4–1.5).

## Worked examples

1. **The three-dimensional node.** For `R = k⟦x, y, z, w⟧/(xy − zw)`: `vdim = dim = 3`, so finite étale
   covers of `U_R` extend (§1.8(b)) and `H^i_𝔪(R, G) = 0` for `i < 3` and every commutative finite flat `G`
   (§6.2); `Pic(U_R) ≅ ℤ` is torsion free (§7.6) but nonzero, so `R` is not parafactorial (§7.5), and
   Brauer purity is not asserted (§7.12 needs dimension `≥ 4`).
2. **A non-complete-intersection of virtual dimension one.** For
   `R = 𝔽_p⟦x, y, z, t⟧/(x², y², xz − yt)`: `vdim = 1 < dim = 2`; `H^0_𝔪(R, ℤ/p) = 0` (§6.3) while
   `H^0_𝔪(R, α_p) ≠ 0` (§6.4), and depth is `0` (§4.1).
3. **Regular rings of dimension two.** For `R = ℤ_p⟦x⟧` or `k⟦x, y⟧`: `H^i_𝔪(R, G) = 0` for `i ≤ 2` (§6.5),
   `Pic(U_R) = 0` (§7.6), `Br(U_R) = Br(R)` (§§7.11–7.12), and for `R` strictly henselian
   `H²(U_R, 𝔾_m) = 0` (§8.1).
4. **Perfectoid valuation rings.** For `𝒪_C`: `RΓ_𝔪(𝒪_C, G) = 0` for every `G` (Layer 5 Examples), and the
   low-degree identification (§5.2) identifies `μ_p(𝒪_C) = μ_p(C)` with `(A_inf/p)^{V=1}` for
   `V = ξ·φ^{-1}` (Convention 6).
5. **The global residue sequence over ℤ.** `Br(ℚ) → ⊕_p ℚ/ℤ` is injective (§8.16): the Hamilton quaternions
   over `ℚ` have residue `1/2` at `p = 2` and `0` elsewhere.

## References

- **[CS24]** Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*, Ann. of Math. 199 (2024),
  51–180; arXiv:1912.10932v3.
- **[C19]** Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019), 1461–1486;
  arXiv:1711.06456v4.
- **[SGA2]** A. Grothendieck, *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et
  globaux (SGA 2)*, augmented edition, Documents Mathématiques 4, SMF 2005; arXiv:math/0511279.
- **[SGA1]** A. Grothendieck, *Revêtements étales et groupe fondamental (SGA 1)*, Exposé V; arXiv:math/0206203.
- **[EGA44]** A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique IV*, quatrième partie,
  Publ. Math. IHÉS 32 (1967), §21.13.
- **[STACKS]** The Stacks project authors, *The Stacks project*, tags 07DV, 0913, 09Q1, 09Q7, 0DXR, 0DX9,
  0EHC, 0EJP, 023M.
- **[Poo17]** Bjorn Poonen, *Rational points on varieties*, GSM 186, AMS 2017, §6.8.
- **[BC22]** Alexis Bouthier and Kęstutis Česnavičius, *Torsors on loop groups and the Hitchin fibration*,
  Ann. Sci. ÉNS 55 (2022); arXiv:1908.07480, Lemma 2.3.2.
- **[ILO14]** L. Illusie, Y. Laszlo and F. Orgogozo (eds.), *Travaux de Gabber sur l'uniformisation locale et
  la cohomologie étale des schémas quasi-excellents*, Astérisque 363–364 (2014); arXiv:1207.3648,
  Exposés XV, XVI, XVII, XVIII-A.
- **[Gro66]** A. Grothendieck, *Le groupe de Brauer II: théorie cohomologique*, Séminaire Bourbaki, exposé
  297 (1966), §1.
- **[Gro68]** A. Grothendieck, *Le groupe de Brauer I–III*, in *Dix exposés sur la cohomologie des schémas*,
  North-Holland 1968.
- **[Kat73]** Nicholas M. Katz, *p-adic properties of modular schemes and modular forms*, LNM 350 (1973),
  Proposition 4.1.1.
- **[Aus62]** Maurice Auslander, *On the purity of the branch locus*, Amer. J. Math. 84 (1962), 116–125,
  Theorem 1.3.
- **[Avr77]** Luchezar L. Avramov, *Homology of local flat extensions and complete intersection defects*,
  Math. Ann. 228 (1977), 27–37, Proposition 3.6.
- **[Koh72]** Peter Kohn, *Ideals generated by three elements*, Proc. Amer. Math. Soc. 35 (1972), 55–58,
  Theorem A.
- **[MB85]** Laurent Moret-Bailly, *Un théorème de pureté pour les familles de courbes lisses*, C. R. Acad.
  Sci. Paris Sér. I 300 (1985), 489–492, Lemme 2.
- **[Bou78]** Jean-François Boutot, *Schéma de Picard local*, LNM 632 (1978), IV 5.1, V 4.9.
- **[CTS87]** J.-L. Colliot-Thélène and J.-J. Sansuc, *Principal homogeneous spaces under flasque tori:
  applications*, J. Algebra 106 (1987), 148–205.
- **[DF84]** Frank R. DeMeyer and Timothy J. Ford, *On the Brauer group of surfaces*, J. Algebra 86 (1984),
  259–271, Remark 3.
- **[dJ02]** A. J. de Jong, *A result of Gabber*, preprint (2002).
- **[ALB23]** Johannes Anschütz and Arthur-César Le Bras, *Prismatic Dieudonné theory*, Forum Math. Pi 11
  (2023), e2; arXiv:1907.10525.
- **[Lau13]** Eike Lau, *Smoothness of the truncated display functor*, J. Amer. Math. Soc. 26 (2013), 129–165,
  Corollary 6.5.
- **[Čes15]** Kęstutis Česnavičius, *Topology on cohomology of local fields*, Forum Math. Sigma 3 (2015), e16,
  Lemma B.14.
- **[Bég80]** Lucile Bégueri, *Dualité sur un corps local à corps résiduel algébriquement clos*, Mém. Soc.
  Math. France 4 (1980/81), 2.2.1.
- **[BS22]** Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*, Ann. of Math. 196 (2022),
  1135–1275; arXiv:1905.08229, Proposition 8.10, Theorem 7.14.
- **[Gab04b]** Ofer Gabber, *On purity for the Brauer group*, Oberwolfach Reports 1 (2004), Conjectures 2–3.
- **[EGA2]** A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique II*, Publ. Math. IHÉS 8
  (1961), 4.5.3 and 7.1.7.
- **[EGA42]** A. Grothendieck and J. Dieudonné, *Éléments de géométrie algébrique IV*, seconde partie,
  Publ. Math. IHÉS 24 (1965), 5.10.5 and 6.1.2.
- **[BH]** W. Bruns and J. Herzog, *Cohen–Macaulay rings*, Cambridge 1993, Definition 2.3.1.
- **[SGA3]** M. Demazure and A. Grothendieck (eds.), *Schémas en groupes (SGA 3)*, Exposés IX–X.
- **[SGA4]** M. Artin, A. Grothendieck and J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas
  (SGA 4)*, Exposés V, VII, XVIII.
- **[SGA5]** A. Grothendieck, *Cohomologie ℓ-adique et fonctions L (SGA 5)*, Exposé I.

### Notes on the sources

The following concern the arXiv versions read ([CS24] arXiv:1912.10932v3, [C19] arXiv:1711.06456v4) and
the 2005 edition of [SGA2].

- [CS24] Theorem 7.1.2, p. 87: the regular clause "regular of dimension `≥ d − 1`" admits
  fields when `d = 1`, and then the conclusion fails (`X = Spec k ⊔ Spec k`, `Z` one point); the proof uses
  Theorem 6.2.7, which excludes fields. §7.1 requires dimension `≥ max(d − 1, 1)`.
- [CS24] proof of Theorem 3.3.1(b), p. 35: "`vdim(R_d) ≥ 3`" means `vdim(R) ≥ 3`.
- [CS24] proof of Theorem 6.2.7, p. 85: "`f ∈ (p, x_1, …, x_n)²`" means `(p, x_1, …, x_d)²`.
- [CS24] proofs of Theorems 7.2.1 (p. 89) and 7.2.5 (p. 90): "`n ≥ 0`" means `n ≥ 1`.
- [CS24] Lemma 4.1.12, p. 40: the hypothesis `n < dim R` is not used in the proof, and the proof of
  Theorem 6.2.7 applies the lemma with `n = dim R`; §4.3 states it for every integer `n`.
- [C19] Proposition 2.2, p. 4: for noncommutative `G` the argument shows triviality only of the fibre of
  `H^1(V, G) → H^1(V_{R′}, G)` over the trivial class; both uses (Proposition 2.3, Corollary 2.4) have `G`
  commutative, and §8.2(b) is stated for commutative `G`. This is a gap in the argument, not a
  counterexample.
- [SGA2] XI, Lemme 3.17(e), p. 107: the extra parafactoriality hypothesis is printed for closed points of
  `X` lying in `Y`; the proof applies XI, Théorème 3.12 to the finitely many closed points of `X` outside
  an open `V ⊃ Y`, so it is needed at closed points outside `Y`. In the proof of Théorème 3.13(ii) it
  holds at every closed point of `X`, whose local rings are complete intersections of dimension `≥ 4`
  with fewer equations.
