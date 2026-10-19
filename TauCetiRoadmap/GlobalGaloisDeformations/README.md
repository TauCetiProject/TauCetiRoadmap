# Roadmap: global Galois deformation rings

**Summary.** This roadmap builds the global functors and complete local rings that classify continuous
lifts of a residual Galois representation `ρ̄ : G → GLₙ(k)`, and the maps between them that
modularity lifting and potential automorphy consume. It uses the generic lifting functors, strict
equivalence, determinant laws and representability of LocalGaloisDeformationRings Layer F; assembles local
deformation problems into global framed rings with a presentation over their local rings and a
lower bound on their dimension; constructs restriction, twisting and change-of-problem maps,
including the formal-torus actions and determinant torsors of the dyadic Khare–Wintenberger method;
turns Taylor–Wiles data into deformation rings with diamond actions and uniform generator counts;
and packages the finite-level ring systems of rank-two patching. Two arbitrary-rank branches close
it: global problems with variable determinant over local coefficient rings `Λ_v` (the setting of
Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne) and polarized problems for
the group `𝒢ₙ` of Clozel–Harris–Taylor, with the enormous-image Taylor–Wiles presentation. Its end
theorems are the presentation and dimension bound of Layer R04.3, the Taylor–Wiles systems of
Layer R04.6 (odd and dyadic), and the presentations of Layers G8 and G7. We want it because every
`R = T` argument in the programme, from Khare–Wintenberger to the potential automorphy theorems
over CM fields, needs exactly these rings with their maps, counts and hypotheses; the arithmetic
modules and the patching itself belong to the roadmaps that use them.

Three distinctions run through the document. A representation, its strict equivalence class and its
polynomial-law determinant are different objects, compared by explicit maps that are isomorphisms
only under residual absolute irreducibility. A framed ring, its trace subring, its torsion-free
quotient and its reduced generic fibre are different rings. And the fixed-determinant, the
variable-determinant and the polarized problems have different adjoint modules, different
centralizers and therefore different frame and generator counts; no formula is transported from
one to another by notation.

| Layer | Title | Headline targets |
| --- | --- | --- |
| R04.3 | Local conditions and global presentations | `TFramedDef`, `R^{□T}_𝒮`, `Rloc`/`locToGlobal`, the relative tangent space, the presentation, the dimension bound |
| R04.4 | Restriction, twists and changes of problem | `resRing`, finiteness of restriction, enlarging `S`, twisting isomorphisms, `DiagGroup`, free quotients, truncated actions, `RdetOnS`/`detMap`, `twistAction`, freeness, the determinant torsor |
| R04.5 | Taylor–Wiles data at auxiliary primes | `TaylorWilesDatum`, image hypotheses, dyadic Kummer disjointness, dyadic generator counts, the `Δ_Q`-structure, the shared selection theorem, auxiliary primes in Gee's setting, generator counts |
| R04.6 | Finite-level deformation data for patching | `KWDeformationData`, the trace subring, factorization through local conditions, `TWSystem`, the numerical coincidence, `DyadicPatchingDatum` |
| G8 | Variable-determinant global problems | `GlobalDeformationProblem`, representability and framing, the presentation, fixed against variable determinant |
| G7 | Polarized problems and arbitrary-rank Taylor–Wiles data | `PolarizedDeformationProblem`, representability, tangent and obstruction spaces, the presentation, rank-`n` Taylor–Wiles places, enormous-image primes, the ACC presentation |

The build uses LocalGaloisDeformationRings Layer F, proceeds through R04.3–R04.6, then G8 and G7:
the fixed-determinant rank-two constructions precede the variable-determinant and polarized branches.

## Scope and ownership

The roadmap owns global deformation types, `T`-framed global rings, the local-to-global map,
the relative tangent identification, presentations and dimension bounds; restriction, enlargement
of the ramification set, twisting, formal diagonalizable groups, free quotients and the dyadic
twisting torsor; Taylor–Wiles data as deformation data with their diamond structures, the shared
Chebotarev selection theorem for Selmer detection and the generator counts at auxiliary levels;
the finite-level ring systems of rank-two patching; and the variable-determinant and polarized
global problems with their arbitrary-rank Taylor–Wiles presentations.

It does not own, and cites instead:

- **Continuous cohomology** (Tau Ceti library at the pins): continuous cocycles, coboundaries and
  first cohomology `TauCeti.ContCohomology.Z1`, `B1`, `H1` in
  `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`. `B1` is the algebraic range
  of the differential; its inclusion in continuous cocycles uses continuity of the action.
- **Profinite generation** (Tau Ceti library). At the pins: `TauCeti.IsTopologicallyFinitelyGenerated`,
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker` (finitely many
  homomorphisms with open kernel to a fixed finite group) and `TauCeti.maximalProPQuotient`; also
  `TauCeti.continuousZModDual`, `TauCeti.finite_continuousZModDual`,
  `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup` (open subgroups of a topologically
  finitely generated profinite group are topologically finitely generated) and
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`. These are the ingredients of
  the characterisation of `Φ_p` in LocalGaloisDeformationRings §F.2.1.
- **Completed group algebras** (Tau Ceti library at the pins):
  `TauCeti.completedGroupAlgebra 𝒪 Γ` and its inverse-limit projections and tautological group map,
  from `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`. The rank-one
  universal-ring comparisons use this carrier and do not define another completed group algebra.
- **Ordinary diagonalizable groups** (Tau Ceti library at the pins):
  `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`,
  `TauCeti.DiagonalizableGroup.pointEquiv` and `pointsMulEquiv` identify the points of
  `Spec 𝒪[a]` with all unit-valued characters of `a`. Target 4.5 keeps the formal completion
  at the identity, whose characters take values in `1 + 𝔪_A`, and its truncation comparison.
- **Tau Ceti roadmaps.** `ClassFieldTheory`, Layer 5 (local Tate duality and the local Euler
  characteristic) and Layer 12 (the global correspondence, used to make the auxiliary twisting group
  finite); `Chebotarev`, Layer 10 (Dirichlet density of a Frobenius class) and 11.3(2) (the
  negligible contribution of primes of residue degree greater than one); `LocalGaloisGroups`, Layer 3
  (topological finite generation of `G_K(p)` for every finite extension `K/ℚ_p`); `ModularCurves`,
  Layer 0C (affine quotients by finite groups and finite locally free group schemes, and their
  torsors); `IntegralHeckeAndGaloisDeterminants`, Layers 0–1 (Chenevier determinants, characteristic
  polynomials, Cayley–Hamilton quotients, henselian reconstruction
  `Determinant.exists_ofMatrix_eq_of_henselian`, and absolutely irreducible coefficient descent
  `coefficient_descent`, CHT Lemma 2.1.10).
- **ArithmeticGaloisRepresentations.** Layer 1 (continuous representations and their integral
  theory); Layer 4 (residual images: `GaloisRep.IsBadDihedral` and the cyclotomic criterion of §4.6,
  the restriction lemmas of §4.7 and `GL2Subgroup.sl2_submodules_charTwo` for nonsolvable dyadic
  images); Layer 5, §5.10 (Carayol's lemma `GaloisRep.carayol_conj_of_trace_eq`: lifts over a
  complete Noetherian local ring with finite residue field and the same absolutely irreducible
  reduction, whose traces agree on a dense subset, are strictly conjugate); Layer 7, §7.2 (the adjoint
  `ContinuousRep.ad`, `adZero`, the trace pairing and the splitting when `n` is invertible, and Schur's
  lemma over a local ring `GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`), §7.4 (the
  group `CHTGroup` `= 𝒢ₙ`, its multiplier and the correspondence between `𝒢ₙ`-valued lifts and CHT
  triples, and polarized representations) and §7.10 (`ResidualImage.IsEnormous`).
- **ArithmeticGaloisDuality.** Layers R02.3–R02.5 and D7 (restricted ramification, Poitou–Tate,
  finiteness of `H¹(G_{F,S}, M)`, the Greenberg–Wiles formula and derived duality); §D8.1
  (*First-order Galois cocycle comparison*, *Trace-zero adjoint duality without division by n*);
  Layer R02.6 (*Local cohomology at a Taylor–Wiles prime*, *The group-theoretic
  input to Taylor–Wiles primes*, *The conditional dual-Selmer killing calculation*,
  *Khare–Wintenberger tangent and relation bounds*, *Odd-prime Taylor–Wiles auxiliary sets*,
  *Dyadic auxiliary primes and the cyclotomic residual*, *Finite-order determinant twists*,
  *Archimedean adjoint dimensions*).
- **SelmerIwasawaCohomology**, Layer 2 (Selmer structures and the Selmer complex as a mapping fibre),
  §2A.3 (*Selmer and deformation tangent comparison*) and §2A.4 (*Determinant tangent fibres*).
- **SchemeAndStackFoundations**, §§4.2–4.4 (Artinian and complete Noetherian coefficient categories,
  small extensions, fibre products, Schlessinger's criteria and hulls), §§0.16, 0.20–0.21
  (catenarity, Nagata rings, excellence and regular completion maps). The completed local products,
  coefficient-extension and dimension adapters and obstruction-compatible minimal presentations are
  supplied by LocalGaloisDeformationRings §§F.0.1–F.0.2.
- **[LocalGaloisDeformationRings](../LocalGaloisDeformationRings/README.md)**:
  Layer F supplies completed coefficient products and minimal relative presentations (§§F.0.1–F.0.2),
  the lifting, module, strict-class and fixed-determinant functors and their comparisons and
  coefficient change (§§F.1.1–F.1.10), Mazur's finiteness condition, continuous universal framed and
  unframed rings, trace generation, determinant comparisons and pseudodeformation rings
  (§§F.2.1–F.2.11), local deformation problems and their invariant ideals (§§F.3.1–F.3.2), and
  inertia-rigid rings (§F.4.12). It also supplies unrestricted local framed rings and the
  condition-specific local quotients. In particular
  Layer 1 (local framed rings, 1.1; archimedean rings, 1.11 and 1.14; fixed-determinant and
  coefficient-change versions, 1.10 and 1.12), Layer 2 (Steinberg lifts, 2.5; fixed inertial types,
  2.9; odd-prime fixed-determinant Taylor–Wiles rings, 2.10; rank-`n` block conditions, 2.16 and 2.23).
  The all-prime rank-two diagonalization and the unrestricted ACC diamond ring are constructed
  here in [the preliminary local construction](#rank-two-taylor-wiles-local) and [8.5](#taylor-wiles-local-diamond).
  The supplier also owns
  layers 3 and 6 (`p`-adic Hodge-type and ordinary conditions in rank `n`, with their dimensions and
  liftability) and Layer 8 (the local conditions of Khare–Wintenberger, 8.2–8.15, and the completed
  tensor product of their rings, 8.17, with nonemptiness, 8.18).

The following statements are used here and owned by the roadmaps named; each is recorded under
the anchor by which other roadmaps cite it.

- <a id="tangent-spaces"></a>**Tangent spaces of the lifting and deformation functors.** For
  `k[ε] = k[X]/(X²)`, `f ↦ (1 + εf)ρ̄` identifies `Z¹(G, ad ρ̄)` with `Lift_ρ̄(k[ε])`, strict
  equivalence changes cocycles by coboundaries so that `Def_ρ̄(k[ε]) ≅ H¹(G, ad ρ̄)`, the stabiliser of
  a framed lift is `1 + ε H⁰(G, ad ρ̄)`, and fixed determinant corresponds to trace-zero cocycles
  modulo the boundary of the trace sequence: ArithmeticGaloisDuality §D8.1, *First-order Galois cocycle
  comparison* and *Trace-zero adjoint duality without division by n*, and
  SelmerIwasawaCohomology §2A.4, *Determinant tangent fibres* (Kisin, Lecture 1,
  Lemma (1.3.1), p. 3; Gee, Exercise 3.11 and Corollary 3.12, p. 13). Applied to `Lift` and `Def`
  of LocalGaloisDeformationRings §§F.1.1, F.1.3, it gives the framed tangent dimension
  `h¹(G, ad ρ̄) + n² − h⁰(G, ad ρ̄)` whenever
  the cohomology is finite-dimensional; that count is used in LocalGaloisDeformationRings
  §§F.2.3, F.2.6 and Layer R04.3 here.
- <a id="taylor-wiles-local-cohomology"></a>**Local cohomology at Taylor–Wiles places.** At a
  rank-two Taylor–Wiles place `v ∤ p` with `Nv ≡ 1 (mod p)`, `p` odd and distinct residual Frobenius
  eigenvalues, `h⁰(G_v, ad⁰) = h⁰(G_v, ad⁰(1)) = 1` and `h¹(G_v, ad⁰) = 2`, while the unramified `H¹`
  is one-dimensional, spanned by the class in the diagonal direction. ArithmeticGaloisDuality R02.6,
  *Local cohomology at a Taylor–Wiles prime* and *Odd-prime Taylor–Wiles auxiliary sets*, supply the
  full and unramified dimensions under their stated global hypotheses. The individual-place
  calculation uses KW final, Lemma 5.4 and its proof, p. 48: after splitting Frobenius, its action on
  `ad⁰` has eigenvalues `α/β, 1, β/α`, with the `1`-eigenspace spanned by `diag(1, −1)`.
  This diagonal class generates the unramified `H¹`; since `Nv ≡ 1 (mod p)`, the cyclotomic twist is
  trivial and the same line gives `h⁰(G_v, ad⁰(1)) = 1`. Characteristic two uses 5.3–5.4 below.
- **Existence of odd-prime Taylor–Wiles sets in the Khare–Wintenberger setting.** For `p` odd, `F`
  totally real and unramified above `p`, `ρ̄` totally odd and absolutely irreducible on
  `G_{F(ζ_p)}`, sets `Q_n` of size `h¹_{L^⊥}(S, (ad⁰)ˇ(1))` with `Nq ≡ 1 (mod pⁿ)`, distinct
  eigenvalues and vanishing new dual Selmer group, with generator count `|Q_n| + |S| − 1`:
  ArithmeticGaloisDuality R02.6, *Odd-prime Taylor–Wiles auxiliary sets* (KW final, Lemmas 5.2(1),
  5.3 and Proposition 5.5, pp. 47–48). Target 5.7 applies it and adds Gee's convention.
- **Existence of dyadic Taylor–Wiles sets.** For `p = 2`, `F` totally real and nonsolvable residual
  image, sets `Q_n` with `|Q_n| = h¹(S, Ad) − 2`, the norm, eigenvalue and splitting conditions, the
  `S`-split dimension formula and `G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` with `t = 2 − |S| + |Q_n|`:
  ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual* (KW final,
  Lemma 5.10, pp. 50–53). Its Kummer-disjointness hypothesis is target 5.3; its ring-theoretic
  counts are target 5.4.
- **Strict conjugacy from traces, scalar centralizers and descent of coefficients.** For lifts with
  absolutely irreducible reduction over a local ring, the image spans `Mₙ(A)` and the centralizer is
  `A`; over a complete Noetherian local ring with finite residue field equal traces on a dense set
  give strict conjugacy; and if all traces lie in a complete Noetherian local subring with the same
  residue field, the lift is strictly conjugate into it: ArithmeticGaloisRepresentations §7.2 and
  §5.10, and `IntegralHeckeAndGaloisDeterminants.coefficient_descent` (Kisin, Lecture 1,
  Theorem (1.4.1), pp. 3–4; Gee, Lemma 3.7, pp. 12–13; CHT, Lemma 2.1.10, pp. 13–15).
  LocalGaloisDeformationRings §F.2.7 supplies the consequence for universal rings.
- **The correspondence between `𝒢ₙ`-valued lifts and CHT triples** (CHT, Lemma 2.1.1, p. 7):
  ArithmeticGaloisRepresentations §7.4. Target 8.1 uses it for polarized deformation problems.

Constructing automorphic forms, Hecke modules and patched complexes, and comparing them with the
rings built here, belongs to GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLifting and
PotentialAutomorphyInfrastructure. Those consumers apply abstract patching to the finite-level inputs.
No `R → T` map, no automorphy lifting theorem and no finiteness of a deformation ring over `𝒪` is
asserted here.

## Conventions

Write `𝒪` for a complete discrete valuation ring with finite residue field `k` of characteristic
`p` (the API also writes `𝔽`), arising as the integers of a finite extension of `ℚ_p` or as
`W(k)`, with maximal ideal `λ`. All ranks `n` are positive. For a profinite group `G` fix a
continuous residual representation `ρ̄ : G → GLₙ(k)`, `k` discrete.

The category `Art_𝒪` consists of Artinian local `𝒪`-algebras with an identified residue field `k`,
and local `𝒪`-algebra maps inducing the identity on it. The category `C_𝒪` consists of complete
Noetherian local `𝒪`-algebras with that identification and the maximal-ideal-adic topology;
completeness includes separatedness. Every residue map `π_A : A ↠ k` is surjective with kernel
`𝔪_A`, and Artinian coefficients carry the discrete topology. An arbitrary ring with a surjection
onto `k` is not an object of either category. Completed tensor products are taken over the stated
coefficient ring, with the local topology and residue identification of
[LocalGaloisDeformationRings §F.0.1](../LocalGaloisDeformationRings/README.md#completed-coefficient-products). A representing ring is
an object of `C_𝒪`;
"pro-represented" refers to the restriction of a functor to `Art_𝒪`.

Write `Γ̂ₙ(A) = ker(GLₙ(A) → GLₙ(k))`. A strict class is an orbit under conjugation by `Γ̂ₙ(A)`.
`ρ̄` is *Schur* if `End_{k[G]}(ρ̄) = k`; absolute irreducibility implies Schur, and the two hypotheses
are not interchangeable in the trace theorems. A lift has continuous matrix entries; over a complete
coefficient ring this is equivalent to a compatible family of continuous lifts over the quotients
`A/𝔪_Aʳ`. A universal deformation is a class; a matrix-valued universal representative is chosen only
where a representative is needed, and statements about it are independent of the choice.

Set `ad ρ̄ = Mₙ(k)` with `g·X = ρ̄(g)Xρ̄(g)⁻¹` and `ad⁰ρ̄ = ker(trace)`, as in
ArithmeticGaloisRepresentations §7.2. Cochains and cohomology are continuous, with differentials
`(d⁰X)(g) = g·X − X` and `(d¹f)(g, h) = g·f(h) − f(gh) + f(g)`. The twist `M(1)` uses the mod `p`
cyclotomic character, and local dual conditions are annihilators under the local Tate pairing. The
self-duality of `ad⁰` and the splitting `ad = k ⊕ ad⁰` require `p ∤ n`. Arbitrary-rank
variable-determinant problems use the full adjoint. When `p ∣ n`, scalar matrices are trace zero;
in particular this occurs in the rank-two dyadic branch. Every dyadic statement keeps its own
module and dual (ArithmeticGaloisDuality §D8.1,
*Trace-zero adjoint duality without division by n*).

A finite ramification set always contains the residual ramification. In the fixed-determinant
presentation of Layer R04.3, `S` consists of finite places, including those above `p`, and the
archimedean places contribute separate sums. Khare–Wintenberger's rank-two convention instead
includes the infinite places in `S` and frames there. The two conventions give different local
rings and different generator counts, and the document never identifies them by notation.

All generator and relation counts and all Euler characteristic identities are first written in
`ℤ`; nonnegativity is proved before a count is used to index variables. Natural-number subtraction
never encodes a dimension formula.

Reciprocity follows the Tau Ceti `ClassFieldTheory` normalisation; where a source uses the opposite
direction the statement says so. Page references are to the editions listed under *References*.

## Exact supplier contracts

### From Mathlib

The library pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

`Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map` and `Matrix.GeneralLinearGroup.det`;
continuity of matrix multiplication and of entrywise maps (`Continuous.matrix_mul`,
`Continuous.matrix_map`); `MulAction.orbitRel` and its quotient; `IsLocalRing`,
`IsLocalRing.maximalIdeal` and `IsLocalRing.ResidueField`; `IsArtinianRing`, `IsNoetherianRing`;
`IsAdicComplete`; `MvPowerSeries` and `PowerSeries`; `Algebra.FormallySmooth`; `DualNumber`;
`OpenSubgroup`, `ProfiniteGrp`, `ContinuousMonoidHom`; module bases, quotients and finite-rank
formulas. A Mathlib carrier is only a carrier: none of the deformation theorems follows from a
carrier's name.

### From Tau Ceti

The library pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are library
contracts; the subsequent roadmap contracts specify the mathematical interfaces consumed from their
named sections.

- `TauCeti.RepresentationTheory.CharacterTwist` supplies `Representation.charTwist` for a monoid
  acting on a module over a commutative semiring: `g` acts by `χ(g) • ρ(g)`. Its API includes
  `Representation.charTwist_one`, `Representation.charTwist_charTwist`,
  `Representation.tprodEquivCharTwist` and, over a field,
  `Representation.isIrreducible_charTwist_iff`. ArithmeticGaloisRepresentations §1.2 supplies
  the continuous-representation packaging. Target 4.4 supplies the comparison with the matrix
  adapter and its compatibility with deformation problems, determinants and representing rings.
- `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` supplies
  `TauCeti.ContCohomology.Z1`, `B1` and `H1`. For a topological monoid acting continuously on a
  topological additive group, `Z1` consists of continuous cocycles, `B1` is the range of the degree-zero
  differential, and `B1_le_Z1` supplies the inclusion required for `H1 = Z1/B1`. Use the quotient
  as an additive group; its pointwise quotient topology is not the intended topology of continuous
  cohomology.
- `TauCeti.Topology.Algebra.Group.Generation` supplies
  `TauCeti.IsTopologicallyFinitelyGenerated`,
  `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup` and
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`. The open-subgroup statement
  assumes a compact topological group; the finite-homomorphism statement assumes a topological group
  with a finite topological generating set and a finite target group, and counts precisely the
  homomorphisms whose kernels are open.
- `TauCeti.Topology.Algebra.Group.Profinite.MaximalProP` supplies
  `TauCeti.maximalProPQuotient`, its continuous surjective quotient map and its universal property
  for continuous maps to pro-`p` groups. `TauCeti.Topology.Algebra.ContinuousZModDual` supplies
  `TauCeti.continuousZModDual p G`, the additive form of continuous characters
  `G → Multiplicative (ZMod p)`, with its `ZMod p`-module structure.
- `TauCeti.Topology.Algebra.Group.Profinite.DualRank` supplies
  `TauCeti.finite_continuousZModDual`: for prime `p`, the continuous dual of a topologically finitely
  generated topological group is finite-dimensional. `TauCeti.Topology.Algebra.Group.Profinite.Rank`
  supplies `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`, the Schreier bound for an open
  subgroup of a compact topologically finitely generated group.
  `TauCeti.Topology.Algebra.Group.Profinite.ProP.DualRank` supplies
  `TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`: for a compact totally
  disconnected pro-`p` topological group and prime `p`, generator rank equals continuous dual rank
  as a cardinal, without a finite-generation hypothesis.
- `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic` supplies
  `TauCeti.DiagonalizableGroup.pointEquiv` and `TauCeti.DiagonalizableGroup.pointsMulEquiv`.
  For a commutative base ring and an abelian character group `a`, they identify algebra maps
  `𝒪[a] → A` with all characters `a → Aˣ`, and identify convolution with pointwise multiplication.
  The identity-completed character functor of §4.5 is a further target.
- `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` supplies
  `TauCeti.completedGroupAlgebra 𝒪 Γ`, the inverse limit of `𝒪[Γ/U]` over open normal subgroups,
  with its projections `proj`, their determining property `ext`, and the tautological group map
  `of`. For profinite `Γ` and compact adic `𝒪`, use its inverse-limit topology. This is the carrier
  denoted `𝒪⟦Γ⟧`; the universal character property is the deformation-theoretic target of
  LocalGaloisDeformationRings §F.2.4.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Layer 0: degree-`n` multiplicative polynomial laws on `A[G]`, Chenevier determinants and their
characteristic coefficients. Layer 1: the Cayley–Hamilton ideal and quotient,
`Determinant.exists_ofMatrix_eq_of_henselian` (over a henselian local ring, a determinant whose
reduction is that of an absolutely irreducible representation is the determinant of a representation
`A[G] → M_d(A)`, unique up to conjugation; its proof passes through the Cayley–Hamilton quotient) and
`coefficient_descent`. Continuous determinant deformation functors and their comparison
with representation deformations are supplied by LocalGaloisDeformationRings
§§F.1.9–F.1.10, F.2.8.

### From TauCetiRoadmap.ClassFieldTheory, Chebotarev, LocalGaloisGroups and ModularCurves

ClassFieldTheory Layer 5 also supplies `finite_H`: for a characteristic-zero nonarchimedean local
field and any finite smooth discrete Galois module, cohomology in degrees zero through two is finite. In particular it
applies to the trivial module `𝔽_p`, including residue characteristic different from `p`, and to
every finite extension of the local field. The selection theorem 5.7 uses Chebotarev's density theorem
and its discard of primes of higher residue degree; it does not develop a second density theory.
Target 4.6 completes the affine quotients of `ModularCurves` 0C at the given local points; the
quotient construction itself is not rebuilt.

### From ArithmeticGaloisRepresentations, ArithmeticGaloisDuality and SelmerIwasawaCohomology

The declarations and targets listed under *Scope and ownership*, with these contracts:
continuous representations of profinite groups on finite free modules over topological coefficient
rings with their adjoints; the finite residual-image classification and the detecting elements used
in prime selection, in the source-specific forms stated in 5.2; arithmetic finiteness, local and
global duality, the Greenberg–Wiles formula, the framed and modified Selmer complexes of
SelmerIwasawaCohomology §§2A.3–2A.4 with their exact differential and sign conventions,
Euler characteristics, and the residual-image
cohomology vanishing used in prime selection. The framed complexes are mapping fibres in the sense
of SelmerIwasawaCohomology §2.21, *Selmer complex as a mapping fibre*; the kernel Selmer group
is its §2.2, *Compact and rational Selmer kernel*.

### From SchemeAndStackFoundations

[SchemeAndStackFoundations §4.2](../SchemeAndStackFoundations/README.md#42-the-artinian-coefficient-category)
constructs `ArtinLocalAlg 𝒪 k` and `CompleteLocalAlg 𝒪 k`, used here as `Art_𝒪` and `C_𝒪`, with
local residue preserving morphisms, small extensions and fibre products.
Its [§§4.3–4.4](../SchemeAndStackFoundations/README.md#44-versality-hulls-and-schlessingers-theorem)
supply the set-valued Schlessinger criteria, hulls and pro-representability in the classical
coefficient case (`𝒪` complete Noetherian local with residue `k`). Its §§0.16, 0.20 and
[0.21](../SchemeAndStackFoundations/README.md#021-regular-maps-g-rings-j-2-rings-excellent-rings-and-schemes)
supply catenarity, Nagata rings, excellence of complete Noetherian local rings and regularity of their completion maps,
with preservation of reducedness and normality. LocalGaloisDeformationRings §§F.0.1–F.0.2
supply the coefficient-product adapters and obstruction-compatible minimal presentations.

### From LocalGaloisDeformationRings

Layer F supplies the generic deformation foundations at §§F.0.1–F.0.2, F.1.1–F.1.10,
F.2.1–F.2.11, F.3.1–F.3.2 and F.4.12. For the common complete-local coproduct, relative presentation
algebra and continuous framed matrix ring, Layer F in turn uses
[DeformationAndDerivedPatchingAlgebra](../DeformationAndDerivedPatchingAlgebra/README.md),
§1.12 and §§2.1–2.7. The coefficient products use the local topology and residue
identifications of §F.0.1; §F.0.2 gives the conditional obstruction-compatible minimal
presentation; §§F.2.3–F.2.4 give continuous framed representability; and §F.4.12 gives the
finite-inertia model used in R04.6. Layers 1–3 and 6 and §§8.2–8.15, 8.17–8.18 supply the local
rings named under *Scope and ownership*, with their tangent spaces, dimensions, nonemptiness and
liftability. Both roadmaps use the same local-condition and framing conventions; this roadmap
supplies their global assembly and restriction maps. General fixed-type quotients are
LocalGaloisDeformationRings §2.9. The arithmetic hypotheses and local choices of each cited local
target remain part of its input.

## How to read the build

LocalGaloisDeformationRings Layer F supplies the coefficient algebra, deformation functors,
representability under `Φ_p`, ring comparisons and local-condition interface. Layer R04.3 builds
the global `T`-framed rings with their map from the local rings, identifies the relative tangent
space with the framed Selmer group and deduces the presentation and dimension bound. Layer R04.4
builds the maps between such rings: restriction, enlargement of `S`, twisting, and the formal-group
machinery of the dyadic method. Layer R04.5 turns Taylor–Wiles data into augmented deformation
problems with diamond actions and counts; the cohomological existence of auxiliary primes is
supplied by ArithmeticGaloisDuality R02.6, and the selection theorem used in arbitrary rank is
proved here. Layer R04.6 assembles the finite-level ring systems of Khare–Wintenberger patching
for odd `p` and for `p = 2`. Layer G8 gives the variable-determinant rings of ACC, which Layer G7
uses for its Taylor–Wiles presentation alongside the polarized branch. The unrestricted
simultaneous framed quotient is supplied by LocalGaloisDeformationRings §F.2.6.
Define the finite group `G_V` before 4.8. In R04.5 build the preliminary rank-two local
construction, then 5.2, 5.3, 5.1 and 5.4; the remaining targets follow in order. In R04.6 build 6.1–6.4, then 6.6, then 6.5, so the dyadic source
exists before its dimension is computed.

`README.md` is normative. `Suggested.lean`, in the namespace
`TauCetiRoadmap.GlobalGaloisDeformations`, records the light definitions whose carriers exist at the
pinned Mathlib and Tau Ceti (twisting matrix homomorphisms and the scalar frame cokernel),
a few theorem signatures statable against them, and discriminating `example`s. A `*Lean:*` line
identifies the local prototypes or the supplier prototypes named there. Proved examples test
matrix twisting and the scalar frame cokernel; the other Checks are README specifications. Global types,
Taylor–Wiles data and the patching systems use the coefficient categories and arithmetic suppliers
above. Generic lifts, strict conjugation and strict classes, coefficient pushforward, restriction,
the Schur predicate, `Φ_p`, framed lifts and their unrestricted quotient are supplied by
LocalGaloisDeformationRings Layer F.

## Layer R04.3: Local conditions and global presentations

This layer assembles local deformation problems into a global framed functor. The map from the local
tensor ring is characterised by the invariant framed restrictions of LocalGaloisDeformationRings
§F.1.6. The framed Selmer complex of SelmerIwasawaCohomology §§2A.3–2A.4 gives the relative tangent space and the obstruction bound; its scalar
degree-zero term fixes the frame count.

<a id="global-deformation-type"></a>

### 3.3 Global deformation data and `T`-framed deformations

**Definition.** Take a number field `F`, a finite set `S` of places containing those above `p` and
the residual ramification, a continuous absolutely irreducible `ρ̄ : G_{F,S} → GLₙ(k)`, a determinant
lift `χ`, local problems `D_v` for `v ∈ S` and `T ⊆ S`. A type-`𝒮` `T`-framed deformation over `A` is a
tuple `(ρ, (α_v)_{v∈T})` with `det ρ = χ_A`, `ρ|_{G_v} ∈ D_v` and `α_v ∈ Γ̂ₙ(A)`, modulo
`(ρ, α_v) ↦ (βρβ⁻¹, βα_v)`. Its framed local representative is `α_v⁻¹ ρ|_{G_v} α_v`; this invariant
representative, not an arbitrarily chosen global matrix, defines the local restriction map. Schur
suffices for the representability mechanism; the arithmetic statements use absolute irreducibility
(Gee, §§3.20–3.21, p. 15; KW ESI, §4.1, p. 29).

The API:

- `DeformationType`: `𝒮 = (S, {D_v}_{v∈S}, χ)`.
- `TFramedDef`: `T`-framed deformations of type `𝒮` as a functor on `C_𝒪`.
- `TFramedDef.localLift`: the well-defined framed local lift `α_v⁻¹ρ|_{G_v}α_v` for `v ∈ T`.
- `TFramedDef.forgetFraming`: the map to unframed deformations of type `𝒮`.

*Needs:* [LocalGaloisDeformationRings §F.3.1](../LocalGaloisDeformationRings/README.md#local-deformation-problem); [LocalGaloisDeformationRings §F.1.6](../LocalGaloisDeformationRings/README.md#restriction-of-deformations);
[LocalGaloisDeformationRings §F.1.7](../LocalGaloisDeformationRings/README.md#fixed-determinant-functors); [LocalGaloisDeformationRings §F.1.3](../LocalGaloisDeformationRings/README.md#strict-deformation-functor).

*Lean:* LocalGaloisDeformationRings §F.2.6 supplies `TFramedLift`, its simultaneous strict
conjugation action, `TFramedLift.localLift`, `TFramedLift.localLift_smul` and
`UnrestrictedTFramedDef`. This quotient imposes neither local problems, nor ramification,
nor determinant; the type conditions here are imposed on that quotient to define `TFramedDef`.

**Checks.**

- **tframed_empty_T.** for `T = ∅` the functor is the unframed deformation functor of type `𝒮`.
- **tframed_residue.** the functor is a point on `k`.
- **tframed_localLift_invariant.** `localLift` is constant on equivalence classes; the unframed
  matrix restriction `ρ|_{G_v}` changes by conjugation. Its unframed strict class is invariant.

<a id="global-framed-ring"></a>

### 3.4 Representability of global deformations of type `𝒮`

**Theorem.** The `T`-framed type-`𝒮` functor is represented on `C_𝒪` by a ring `R^{□T}_𝒮` with a
universal framed class, using the local ideals of LocalGaloisDeformationRings §F.3.2, fixed-determinant
representability (§F.2.9) and `Φ_p(G_{F,S})` (§F.2.2). For `T = ∅` write `R^univ_𝒮`. Whenever a
matrix-valued universal object is used,
the chosen representative and frames are named; the invariant universal framed class does not depend
on them (Gee, Lemma 3.22, p. 15).

*Needs:* [3.3](#global-deformation-type); [LocalGaloisDeformationRings §F.3.2](../LocalGaloisDeformationRings/README.md#deformation-problem-ideal);
[LocalGaloisDeformationRings §F.2.5](../LocalGaloisDeformationRings/README.md#universal-deformation-ring); [LocalGaloisDeformationRings §F.2.9](../LocalGaloisDeformationRings/README.md#fixed-determinant-rings); [LocalGaloisDeformationRings §F.2.2](../LocalGaloisDeformationRings/README.md#phi-p-global);
[LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4.

**Checks.**

- **globalRing_unrestricted.** with every `D_v` unrestricted and `T = ∅`, `R^univ_𝒮` is the
  fixed-determinant universal deformation ring of `ρ̄` on `G_{F,S}`.
- **globalRing_framed_vars.** for nonempty `T`, `R^{□T}_𝒮 ≅ R^univ_𝒮⟦y₁, …, y_{n²|T|−1}⟧`
  (LocalGaloisDeformationRings §F.2.6).
- **globalRing_empty_condition.** if some `D_v` contains no lift over any characteristic-zero ring, the
  global ring may still be nonzero (it can have torsion points); representability does not assert a
  characteristic-zero point.

<a id="local-to-global-map"></a>

### 3.5 The map from local rings to the global framed ring

**Construction.** For each `v ∈ T` use the pulled-back problem `D_v^χ` of LocalGaloisDeformationRings §F.3.2 and impose the
image ideal `I_v^χ` in the local framed determinant-`χ` ring.
Form `R^loc_{𝒮,T} = ⊗̂_{v∈T}(R^□_{ρ̄|G_v,χ}/I_v^χ)` over `𝒪`. The universal framed local representatives
classify compatible maps from the factors to `R^{□T}_𝒮`, hence a tautological local-to-global
`𝒪`-algebra map. Check the characterizing restriction formula and compatibility with enlarging `T`.
The empty tensor product is `𝒪`. The local rings and their condition quotients are supplied by
LocalGaloisDeformationRings (Gee, §3.23, p. 15; KW ESI, §4.1, p. 29).

The API:

- `Rloc`: `R^loc_{𝒮,T}` as a completed tensor product.
- `locToGlobal`: `R^loc_{𝒮,T} →ₐ[𝒪] R^{□T}_𝒮`.
- `locToGlobal_apply`: it classifies the framed local lifts `α_v⁻¹ρ^{□T}|_{G_v}α_v`.
- `locToGlobal_mono_T`: compatibility with enlarging `T`.

*Needs:* [3.4](#global-framed-ring); [LocalGaloisDeformationRings §F.3.2](../LocalGaloisDeformationRings/README.md#deformation-problem-ideal);
[LocalGaloisDeformationRings §F.1.6](../LocalGaloisDeformationRings/README.md#restriction-of-deformations); LocalGaloisDeformationRings 1.1 and 1.10;
[LocalGaloisDeformationRings §F.0.1](../LocalGaloisDeformationRings/README.md#completed-coefficient-products).

**Checks.**

- **rloc_empty.** `R^loc_{𝒮,∅} = 𝒪`.
- **locToGlobal_forget.** forgetting the frames gives a natural transformation from the framed
  global functor to the unframed global functor, hence a ring map `R^univ_𝒮 → R^{□T}_𝒮`. The
  strict class of `α_v⁻¹ρ|_{G_v}α_v` agrees with that of the underlying restriction. A ring map
  in the reverse direction requires a choice of universal frames.
- **rloc_wrong_restriction.** using `ρ^{□T}|_{G_v}` without `α_v` does not give an invariant
  matrix-valued local lift on global classes, so it cannot canonically classify a map from the
  local framed ring. Restriction to local unframed classes is still well defined.

<a id="relative-tangent-space"></a>

### 3.6 The relative tangent space is an adjoint Selmer group

**Theorem.** For the fixed-determinant global data of 3.3, identify the dual of the relative
cotangent space `𝔪_{R^{□T}}/(𝔪_{R^{□T}}², λ, 𝔪_{R^loc}R^{□T})` with `H¹` of the framed mapping
fibre of SelmerIwasawaCohomology §§2A.3–2A.4, using ArithmeticGaloisDuality R02.5/D8.1,
with the terms below and the pulled-back conditions of
LocalGaloisDeformationRings §F.3.2. This first-order identification does not require `p > 2` or
`p ∤ n`. Degree zero uses the full
adjoint; positive global degrees use trace zero; local degree zero consists only of the full-adjoint
framing terms at `T`. The ordinary dual-Selmer interpretation and numerical formula below require
separate arithmetic hypotheses. For `T = ∅`, `H⁰_rel = k` in the Schur case and
`H¹_rel = H¹_{L^χ}(G, ad⁰)/im δ_G`; when `p ∤ n`, the trace boundary vanishes and this is the ordinary
fixed-determinant Selmer group (Gee, Proposition 3.24(1), p. 18, with the complexes and differential
of §3.23, pp. 16–18; KW ESI, §4.1, Lemma 4.3, p. 31; SelmerIwasawaCohomology §2A.4,
*Determinant tangent fibres*).

Write `M = ad ρ̄` and `M₀ = ad⁰ρ̄`. The complexes are:

| Degree | Global terms | Local terms |
| --- | --- | --- |
| 0 | `C⁰(G, M)` | `⊕_{v∈T} C⁰(G_v, M)` |
| 1 | `C¹(G, M₀)` | `⊕_{v∈T} C¹(G_v, M₀) ⊕ ⊕_{v∈S∖T} C¹(G_v, M₀)/L̃_v^χ` |
| `i ≥ 2` | `Cⁱ(G, M₀)` | `⊕_{v∈S} Cⁱ(G_v, M₀)` |

Negative degrees vanish. Here `L̃_v^χ` and `L_v^χ` are the spaces of LocalGaloisDeformationRings
§F.3.2. Elements of `L̃_v^χ` are cocycles, so the local quotient differential is well defined. Full-adjoint coboundaries lie in
`L̃_v^χ`, so restriction is a chain map also at `v ∉ T`, where the degree-zero local term is zero.
The relative complex is
`C_relⁱ = C_globⁱ ⊕ C_loc^{i−1}` with `d(φ, ψ) = (dφ, res φ − dψ)`, that is `Cone(res)[−1]`. Its exact
sequence begins with the scalar boundary `H⁰(G, M) → ⊕_T H⁰(G_v, M)`, injective for nonempty `T` and
Schur `ρ̄`, so then `H⁰_rel = 0`.

For the arithmetic comparison assume `p > 2`, `p ∤ n`, `S` a finite set of finite places
containing those above `p`, `T ⊆ S` containing all those places, and `ρ̄` Schur. In particular `T` is nonempty. The ordinary
and modified comparison of SelmerIwasawaCohomology §§2.21, 2A.3–2A.4 gives
`(H²_rel)ˇ ≅ H¹_dual`, `(H³_rel)ˇ ≅ H⁰(G, M₀(1))` and vanishing above degree three, where

```text
H¹_dual = ker( H¹(G, M₀ˇ(1)) → ⊕_{v∈S∖T} H¹(G_v, M₀ˇ(1))/(L_v^χ)^⊥ ),
```

the dimension formula, with all counts in `ℤ`, is

```text
h¹_rel = |T| − 1 − Σ_{v|∞} h⁰(G_v, M₀) + Σ_{v∈S∖T} (dim L_v^χ − h⁰(G_v, M₀)) + dim H¹_dual − h⁰(G, M₀(1)).
```

*Needs:* [3.4](#global-framed-ring); [3.5](#local-to-global-map);
[tangent spaces](#tangent-spaces); ArithmeticGaloisDuality R02.4, R02.5, R02.6 and D8.1;
SelmerIwasawaCohomology §2A.3 (*Selmer and deformation tangent comparison*), §2A.4
(*Determinant tangent fibres*) and Layer 2.

*Lean:* `scalarFrameCokernel` and `scalarFrameCokernel_finrank` give the rank-one scalar
frame count for every nonempty framing set, with the identity in `ℤ`. Two proved `example`s
exhibit the surviving direction for two frames and the zero cokernel for no frames.

**Checks.**

- **scalar_boundary_two_frames.** in rank one with two framings the scalar boundary has cokernel
  `k²/diag(k)` of dimension one; with one framing the cokernel is zero; with no framings all scalars
  remain in `H⁰`. A complex using trace-zero adjoints in degree zero would lose these terms, and in
  rank one would have no degree-zero terms at all.
- **relTangent_sign.** for the identity map between two-term complexes `k → k` with identity
  differentials, the mapping fibre has `d⁰(x) = (x, x)` and `d¹(a, b) = a − b`. Over `𝔽₃`,
  `d¹d⁰(1) = 0`; replacing the minus sign by a plus gives `2 ≠ 0`.
- **relTangent_count_rank_one.** for `n = 1`, `M₀ = 0`, so `h¹_rel = |T| − 1` for nonempty `T`, the
  scalar frame directions only.
- **relTangent_T_empty.** for `T = ∅` the constant `|T| − 1 = −1` would be wrong; the correct statement
  is `H⁰_rel = k` and, for `p ∤ n`, `H¹_rel = H¹_{L^χ}(G, M₀)`; otherwise retain `im δ_G`.
- **relTangent_dyadic_odd_rank.** at `p = 2`, `n = 3`, the condition `p ∤ n` holds but the odd-prime
  arithmetic comparison does not apply; `tr(I₃) = 1`, so the scalar subspace is not trace zero.
  For trivial real action on `M₃(𝔽₂)`, the trace-zero space has dimension eight and positive-degree
  `C₂` cohomology is nonzero: both maps in the
  periodic resolution are zero. Its trace splitting does not remove the real Tate terms.

<a id="local-to-global-presentation"></a>

### 3.7 Presentation of the global ring over the local rings

**Theorem.** With `g = dim_k H¹_rel` relative tangent generators there is a surjection
`R^loc_{𝒮,T}⟦x₁, …, x_g⟧ ↠ R^{□T}_𝒮` inducing the tangent isomorphism. For its kernel `J` and the
source maximal ideal `𝔪`, assume `T = S` or that every pulled-back problem `D_v^χ` outside `T`
is liftable; then `dim_k J/𝔪J ≤ dim_k H²_rel`. Under the arithmetic hypotheses of 3.6
(`p > 2`, `p ∤ n`, finite-place `S`, `T` containing the places above `p`, and Schur `ρ̄`), this is the
dimension of its ordinary dual Selmer kernel with conditions `(L_v^χ)^⊥`. The extra hypothesis
supplies local lifts across each small extension; the
tangent-generator surjection does not need it. In the rank-two dyadic version use the full-adjoint
and dual conventions of Khare–Wintenberger instead of the odd-`p` trace splitting (KW ESI, §4.1,
Lemma 4.5 and its proof, pp. 32–33; Gee, Proposition 3.24(2), p. 18; KW final, §4.2, Lemma 4.6,
pp. 43–45; CHT, Corollary 2.2.12, p. 25).

*Proof sketch.* Construct the obstruction here. For an Artinian small extension `A′ ↠ A`
with kernel `I`, choose continuous set-theoretic determinant-preserving lifts of the global
matrices, using smoothness of `SLₙ`, and lifts of the frames. The local base map prescribes
local lifts at `T`; liftability supplies lifts in `D_v^χ` outside `T`. The global
multiplicativity defect is a trace-zero two-cocycle; differences from the chosen local lifts
are one-cochains. With the differential of 3.6 they give a class in `H²_rel ⊗_k I`, using
local cochains modulo `L̃_v^χ` outside `T`. Changes of matrices, frames and permitted local
lifts change it by a relative coboundary. Its vanishing is equivalent to a global lift with
the prescribed framed restrictions and permitted local conditions. Prove naturality under
maps of extensions and additivity in kernels, including kernels of arbitrary finite dimension.

The Galois applications supply the naturality, additivity and lift-detection compatibilities
required by LocalGaloisDeformationRings §F.0.2 from these continuous cocycle obstructions,
using the complexes and duality suppliers (Gee, Lemma 3.13 and Corollary 3.14, pp. 13–14;
KW ESI, Lemma 4.5 and proof, pp. 32–33; CHT, Corollary 2.2.12, p. 25).

Apply this construction to Artinian quotients of the universal minimal presentation. For
`u : J/𝔪J → k`, push out its square-zero relation extension and take the obstruction class.
This gives a linear map `(J/𝔪J)ˇ → H²_rel`. If a nonzero `u` had zero obstruction, a compatible
global lift would split that nonzero extension; minimality makes its relative tangent map an
isomorphism, contradicting the existence of the section. Thus the map is injective.
[LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations) supplies the algebraic passage and
SelmerIwasawaCohomology §§2A.3–2A.4 supplies cohomological comparison and ArithmeticGaloisDuality
the product formula, not this construction. For polarized lifts in 8.3 use the same construction with the CHT group and its
fixed-multiplier adjoint (KW final, Lemma 4.6 and proof, pp. 43–45; CHT, Lemma 2.2.11 and
Corollary 2.2.12, pp. 24–25).

*Needs:* [3.6](#relative-tangent-space); [3.5](#local-to-global-map); ArithmeticGaloisDuality R02.4,
R02.6 and D8.1; SelmerIwasawaCohomology §§2A.3–2A.4; [LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4.

**Checks.**

- **presentation_rank_one.** for `n = 1` with fixed determinant and unrestricted local conditions,
  every lift is `χ_A`, so each local ring
  is `𝒪`, `R^loc = 𝒪`, and for `T = S` nonempty `R^{□T}_𝒮 = 𝒪⟦x₁, …, x_{|T|−1}⟧` (frames modulo the
  common scalar): the presentation has `g = |T| − 1` generators and no relations, matching 3.6.
- **presentation_needs_liftability.** a problem represented by `𝒪⟦x⟧/(x²)` is not liftable: the point
  `x ↦ t` over `k[t]/(t²)` has no lift to `k[t]/(t³)`, since `(t + at²)² = t² ≠ 0` there. For such a
  pulled-back problem outside `T` the relation bound by the dual Selmer dimension is not available,
  so the
  hypothesis "`T = S` or `D_v^χ` liftable outside `T`" is retained.
- **presentation_obstruction_square.** in the unrestricted variable-determinant rank-one
  character model of the obstruction construction for `C₃` over
  `𝒪 = ℤ₃`, `R = 𝒪⟦x⟧/((1+x)³−1)` has one minimal relation. The character sending a
  generator to `1+t` over `𝔽₃[t]/(t³)` cannot lift to `𝔽₃[t]/(t⁴)`: every lift has cube
  `1+t³ ≠ 1`. Its multiplicativity-defect class is nonzero and detects that relation.
- **presentation_dyadic_conventions.** at `p = 2` the trace-zero module contains the scalars, and a
  count using `ad⁰` with the odd-`p` dual would be off by the boundary term `δ_2 = 1` of
  ArithmeticGaloisDuality's Khare–Wintenberger count.

<a id="global-dimension-lower-bound"></a>

### 3.8 Lower bound for the dimension of global deformation rings

**Theorem.** With the odd-`p` finite-place convention and `T = S`, and with `p > 2` and `p ∤ n`,

```text
dim R^univ_𝒮 ≥ 1 + Σ_{v∈S} (dim(R^□_{ρ̄|G_v,χ}/I_v^χ) − n²) − Σ_{v|∞} h⁰(G_v, ad⁰ρ̄) − h⁰(G_{F,S}, ad⁰ρ̄(1)).
```

Local Krull dimensions are supplied by LocalGaloisDeformationRings. In the Khare–Wintenberger
rank-two totally real odd setting, include the archimedean local rings in `S`: the local relative
dimensions are `3` away from `p` and infinity, `3 + [F_v : ℚ_p]` at `p`, and `2` at infinity, giving
`dim R̄^ψ_S ≥ 1`. This is a lower bound; a characteristic-zero point also requires the finiteness
supplied by its modularity consumer (Gee, Proposition 3.24(3), p. 18; KW ESI, §4.1, Proposition 4.4,
p. 32; KW final, §4.2, Proposition 4.5, p. 42, and Corollary 4.7, p. 45).

*Needs:* [3.7](#local-to-global-presentation); [3.6](#relative-tangent-space);
[LocalGaloisDeformationRings §F.2.6](../LocalGaloisDeformationRings/README.md#framed-unframed-comparison); ArithmeticGaloisDuality R02.6 (*Archimedean adjoint
dimensions*); LocalGaloisDeformationRings 1.1, 1.11, 8.17.

**Checks.**

- **dimBound_KW_Q.** for `F = ℚ` and `S = {p, ∞}` in the Khare–Wintenberger setting, the local relative
  dimensions `4 = 3 + [ℚ_p : ℚ_p]` and `2` sum to `6 = 3|S|`, so the local tensor ring has dimension `7`;
  the framed global ring needs `h + |S| − 1 = h + 1` generators and at most `h` relations, so its
  dimension is at least `8`, and removing the `4|S| − 1 = 7` framing variables gives
  `dim R̄^ψ_S ≥ 1`.
- **dimBound_integer_first.** the bound is an inequality in `ℤ`; for small local dimensions the right
  side can be negative, and natural-number subtraction would silently give a false bound.
- **dimBound_not_finite.** the bound `≥ 1` does not imply that `R^univ_𝒮` is finite over `𝒪`; finiteness is
  a theorem of the consumer.

### Examples

- Rank one: `M₀ = 0`, the framed complex reduces to the scalar frames, and the relative tangent space
  has dimension `|T| − 1` for nonempty `T`; with `T = ∅` the full scalar `H⁰ = k` survives.
- The upper-triangular condition over `𝔽₃[ε]` in LocalGaloisDeformationRings §F.3.1 is the basic example of a condition that is not
  a deformation problem; the Borel-ordinary conditions of LocalGaloisDeformationRings are made
  stable by quantifying over all flags.

### Dependencies

LocalGaloisDeformationRings §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2; ArithmeticGaloisDuality R02.4–R02.6 and D8.1; SelmerIwasawaCohomology Layer 2 and §§2A.3–2A.4;
LocalGaloisDeformationRings §§F.0.1–F.0.2; SchemeAndStackFoundations §§4.2–4.4;
LocalGaloisDeformationRings 1.1, 1.10, 1.11, 8.17.

## Layer R04.4: Restriction, twists and changes of problem

This layer builds the functorial ring maps and their separate algebraic properties. Restriction is
finite under its hypothesis; imposing additional equations is a quotient. Twisting supplies formal
group actions and, in the dyadic setting, a determinant map, a free torus action and a finite flat
torsor.

<a id="restriction-ring-map"></a>

### 4.1 Restriction to a finite extension as a ring map

**Construction.** For `F′/F` finite and `S′` the places above `S`, restriction defines a
contravariant local ring map `R^□_{ρ̄|G_{F′,S′}} → R^□_ρ̄`, and similarly with fixed determinant. On
unframed rings require absolute irreducibility after restriction. If each local problem over `F′`
contains the restrictions of the lifts allowed by the corresponding problem over `F`, the map
descends to the condition quotients. The map classifies the restricted universal lift, and
compositions of restrictions give compositions of ring maps in the opposite order (Gee, §3.25,
p. 18; KW final, §10.1, proof of Theorem 10.1, p. 91).

The API:

- `resRing`: the framed restriction map `R^□_{ρ̄|H} → R^□_ρ̄` for a continuous `H → G`.
- `resRingUnframed`: the unframed restriction map, for absolutely irreducible `ρ̄|H`.
- `resRing_classifies`: `resRing` classifies the restriction of the universal lift.
- `resRing_comp`: restriction along a composite is the composite of the maps.

*Needs:* [LocalGaloisDeformationRings §F.2.3](../LocalGaloisDeformationRings/README.md#universal-lifting-ring); [LocalGaloisDeformationRings §F.2.5](../LocalGaloisDeformationRings/README.md#universal-deformation-ring);
[LocalGaloisDeformationRings §F.1.6](../LocalGaloisDeformationRings/README.md#restriction-of-deformations); [3.3](#global-deformation-type).

**Checks.**

- **resRing_id.** restriction along the identity is the identity map.
- **resRing_comp_apply.** for `H′ → H → G`, `resRing_{H′→G} = resRing_{H→G} ∘ resRing_{H′→H}`; the
  covariant order would not typecheck.
- **resRing_not_flat.** for `p` odd let `G = ℤ_p ⋊ {±1}` with the inversion action, `H = ℤ_p`, `n = 1`
  and `ρ̄ = 1`. A lift is a character with values in the pro-`p` group `1 + 𝔪_A`; it kills the
  commutators `x⁻²` of `ℤ_p`, hence all of `ℤ_p`, and it is trivial on the involution because `p` is odd.
  So `R^□_{ρ̄,G} = 𝒪`, while `R^□_{ρ̄|H} = 𝒪⟦Y⟧`, and the restriction map is `𝒪⟦Y⟧ → 𝒪`, `Y ↦ 0`, finite
  but not flat.

<a id="restriction-finiteness"></a>

### 4.2 Finiteness of restriction maps

**Theorem.** Let `Γ` satisfy `Φ_p`, let `Σ ≤ Γ` be open and assume `ρ̄|Σ` absolutely irreducible. Then
the unframed restriction map `R^univ_{ρ̄|Σ} → R^univ_ρ̄` makes its target a finite module over its
source. This applies to restriction to finite extensions of number fields. Finiteness is the
conclusion; no flatness or injectivity is part of it (Gee, Proposition 3.26, p. 18; BLGGT,
Lemma 1.2.3(1) and its proof, pp. 16–17).

*Proof sketch.* Put `B = R^univ_ρ̄/𝔪_Σ R^univ_ρ̄`. Its universal representation restricts on `Σ`
to a conjugate of the constant residual representation. Its kernel therefore contains the open
subgroup `ker(ρ̄|Σ)` and its normal core, so it factors through a finite group `Q`. Put `m = |Q|`.
Each image matrix satisfies `Mᵐ = 1`. For fixed `n,m` its trace is annihilated by a power of the
monic polynomial whose roots are sums of `n` `m`-th roots of unity: this follows by applying the
relation to the finite-type universal matrix algebra and then its reduced quotient. Thus each
of the finitely many traces is integral over `k`. They topologically generate `B` by LocalGaloisDeformationRings §F.2.7, so the
finite-dimensional algebra they generate is already closed and equals `B`. Complete Nakayama
now gives module finiteness, as in BLGGT Lemma 1.2.3.

*Needs:* [4.1](#restriction-ring-map); [LocalGaloisDeformationRings §F.2.7](../LocalGaloisDeformationRings/README.md#carayol-trace-theorem);
[LocalGaloisDeformationRings §F.2.5](../LocalGaloisDeformationRings/README.md#universal-deformation-ring).

**Checks.**

- **resFinite_index_one.** for `Σ = Γ` the map is the identity.
- **resFinite_not_flat.** the **resRing_not_flat** example of 4.1 is finite and not flat, so flatness is
  not part of the conclusion.
- **resFinite_needs_absIrred.** for `ρ̄ = Ind_Σ^Γ θ` with `θ ≠ θ^c`, the restriction `θ ⊕ θ^c` is
  not Schur, so LocalGaloisDeformationRings §F.2.5 does not supply its unframed ring. This alone does not prove failure of
  representability. The trivial rank-two representation of `Γ = Σ = ℤ_p` in LocalGaloisDeformationRings §F.2.5 gives an
  explicit failure, showing why a source ring cannot be assumed without a representability
  hypothesis.

<a id="enlarging-ramification"></a>

### 4.3 Enlarging the ramification set gives closed immersions

**Theorem.** If `S ⊆ S′` and `ρ̄` is unramified outside `S`, identify lifts on `G_{F,S}` with lifts on
`G_{F,S′}` trivial on the inertia groups at `S′ ∖ S`. The induced maps `R^□_{S′} ↠ R^□_S` and, in the
absolutely irreducible case, `R_{S′} ↠ R_S` are surjective, with closed kernel generated by the
entries of `ρ^univ(σ) − 1` for `σ` in the new inertia groups. The fixed-determinant and
local-condition versions hold. Surjectivity of the ring map is injectivity of the map of functors,
detected on tangent spaces for complete local coefficient objects (KW final, §2.1, p. 6;
Proposition 5.11, p. 53).

*Needs:* [LocalGaloisDeformationRings §F.2.3](../LocalGaloisDeformationRings/README.md#universal-lifting-ring); [LocalGaloisDeformationRings §F.2.5](../LocalGaloisDeformationRings/README.md#universal-deformation-ring);
[tangent spaces](#tangent-spaces).

**Checks.**

- **enlarge_trivial.** for `S′ = S` the map is the identity.
- **enlarge_rank_one.** for `n = 1`, `R_{S′} = 𝒪⟦G^{ab,(p)}_{F,S′}⟧ ↠ 𝒪⟦G^{ab,(p)}_{F,S}⟧`, the map of completed
  group rings of the surjection of Galois groups.
- **enlarge_direction.** the map goes from the larger set to the smaller; a map `R_S → R_{S′}` would
  classify extending lifts, which is not defined.

<a id="change-of-determinant"></a>

### 4.4 Twisting isomorphisms and change of determinant

**Theorem.** Twisting by a continuous character `μ : G → 𝒪ˣ` identifies the framed lifting rings for
`ρ̄` and `μ̄ ⊗ ρ̄`, and the unframed rings when they exist. It sends determinant `χ` to `μⁿχ` and
transports `D_v` to `μ|G_v ⊗ D_v`. A residually trivial `μ` with `μⁿ = χ′χ⁻¹` gives an isomorphism
between the corresponding fixed-determinant rings. For rank two and `p` odd there is a unique such
square root among residually trivial characters. For `p = 2` a root need not exist, and the
obstruction is retained; the existence of roots after a soluble totally real base change is
ArithmeticGaloisDuality R02.6, *Finite-order determinant twists*, and its use belongs to
GL2ModularityLifting (KW final, Lemma 7.10 and its proof, p. 69; BLGGT, Lemma 1.2.3(2), p. 16).

On the standard module `Fin n → A`, transport the matrix homomorphism through
`Matrix.GeneralLinearGroup.toLin` and the inclusion of linear automorphisms into endomorphisms.
The representation associated to `twist n μ ρ` equals `Representation.charTwist μ` of the
representation associated to `ρ` (`twist_charTwist`; Tau Ceti
`Representation.charTwist_apply`, `TauCeti.RepresentationTheory.CharacterTwist`). Generic module
twisting uses that library API; continuous twists use ArithmeticGaloisRepresentations §1.2.
The matrix comparison, deformation compatibility, determinant changes and induced maps of
deformation rings belong here.

*Needs:* [LocalGaloisDeformationRings §F.2.9](../LocalGaloisDeformationRings/README.md#fixed-determinant-rings); [LocalGaloisDeformationRings §F.1.7](../LocalGaloisDeformationRings/README.md#fixed-determinant-functors);
[LocalGaloisDeformationRings §F.3.1](../LocalGaloisDeformationRings/README.md#local-deformation-problem); ArithmeticGaloisDuality R02.6;
Tau Ceti `TauCeti.RepresentationTheory.CharacterTwist`; ArithmeticGaloisRepresentations §1.2.

*Lean:* `twist`, `twist_bijective` and `det_twist` give the matrix twisting bijection and its
determinant formula in every rank. `twist_apply`, `twist_charTwist`, `twist_continuous` and
`twist_reduce` give the matrix, module, continuity and reduction compatibilities; the proved
trivial-character `example` tests the identity twist.

**Checks.**

- **twist_trivial.** twisting by the trivial character is the identity.
- **twist_standard_action.** for every `v ∈ Aⁿ`, the matrix twist acts as
  `(μ(g) • ρ(g))v = μ(g) • (ρ(g)v)`, the action of `Representation.charTwist`, in every rank.
- **twist_det.** for `2 × 2` matrices `det(c • M) = c² det M`, so twisting by `μ` multiplies determinants
  by `μ²` in rank two.
- **twist_no_root_p2.** at `p = 2`, a square root of a character `μ` of order `2` has order `4`, so it
  needs values in `μ₄`; if `𝒪` does not contain `μ₄` there is no root with values in `𝒪ˣ`, and even
  when it does, a global root may fail to exist. A statement asserting roots at `p = 2` would fail.

<a id="diagonalizable-groups"></a>

### 4.5 Diagonalizable groups on complete local algebras

**Definition.** For a finitely generated abelian group `a` with `p`-primary torsion, the formal
diagonalizable group is `D̂(a)(A) = Hom(a, 1 + 𝔪_A)`, represented by the completion of `𝒪[a]` at the
identity of the special fibre. The free lattice `ℤᵗ` gives the formal torus `T = Ĝ_mᵗ`, and
`a = (ℤ/pᵐ)ᵗ` gives its `pᵐ`-torsion. Prove that `T[pᵐ] → T` is an isomorphism on coefficients
truncated modulo `𝔪_A^{m+1}`, because `(1 + X)^{pᵐ} − 1 ∈ (p, X)^{m+1}`. Prime-to-`p` torsion of `a`
contributes no points with values in `1 + 𝔪_A` (KW final, §2.5, p. 12; §2.6, Proposition 2.8 and its
proof, p. 14).

The API:

- `DiagGroup`: `a*` as a group functor on complete local `𝒪`-algebras, with its representing algebra.
- `DiagGroup.points`: `a*(A) ≃ Hom(a, 1 + 𝔪_A)`.
- `DiagGroup.torus`: the formal torus `Ĝ_mᵗ = (ℤᵗ)*`.
- `DiagGroup.truncation_iso`: `T[pᵐ] → T` is an isomorphism after truncation at level `m + 1`.

*Needs:* [LocalGaloisDeformationRings §F.2.3](../LocalGaloisDeformationRings/README.md#universal-lifting-ring); Tau Ceti
`TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`, `DiagonalizableGroup.pointsMulEquiv`
for the ordinary character functor before completion at the identity.

**Checks.**

- **diagGroup_int_points.** `(ℤ)*(A) = 1 + 𝔪_A`.
- **one_add_X_sq_sub_one_mem.** `(1 + X)² − 1 ∈ (2, X)²` in `ℤ[X]`, the case `p = 2`, `m = 1` of the
  truncation isomorphism.
- **diagGroup_prime_to_p_trivial.** for `a = ℤ/ℓ` with `ℓ ≠ p`, `Hom(a, 1 + 𝔪_A)` is trivial for Artinian
  `A`, since `1 + 𝔪_A` is a `p`-group; this is why prime-to-`p` torsion is excluded.

*Lean:* `diagonalizable_truncation_relation` states
`(1 + X)^{pᵐ} − 1 ∈ (p, X)^{m+1}` in `ℤ[X]` for every prime `p` and `m ≥ 0`.

<a id="free-action-quotient"></a>

### 4.6 Quotients by free actions

**Theorem.** Let a representable formally smooth group functor `𝒢` act freely on a complete local
affine functor `X = Sp A`, freeness meaning that `(g, x) ↦ (x, gx)` is a closed immersion. Then the
orbit functor is represented by the coaction invariants `A^𝒢`, `X → Sp A^𝒢` is formally smooth, and
`X` is a trivial `𝒢`-torsor after choosing a local section; its tangent space is `t_X/t_𝒢` and
`dim A = dim A^𝒢 + d`, where `d = dim_k Lie(𝒢)` is the relative dimension over `𝒪`. For a possibly finite formal diagonalizable group construct the invariant
quotient and its torsor, compatibly with quotienting the character group in stages. The finite
locally free affine quotient is `ModularCurves` Layer 0C; completion, the smooth part and the passage
through the torsion and free filtration are the constructions here (KW final, §2.4, p. 10;
Proposition 2.5 and its proof, pp. 11–12; Proposition 2.6, pp. 12–13).

*Needs:* [4.5](#diagonalizable-groups); [LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4;
`ModularCurves` Layer 0C.

**Checks.**

- **freeQuot_trivial_group.** for the trivial group the quotient is `X` itself.
- **freeQuot_torus_on_itself.** `Ĝ_mᵗ` acting on itself by translation has quotient a point and
  `A = 𝒪⟦x₁, …, x_t⟧`, `A^𝒢 = 𝒪` and relative dimension `d = t`, so the Krull dimensions
  satisfy `t + 1 = 1 + t`. Adding the Krull dimension `t + 1` of the group's coordinate ring
  instead would count the base dimension twice.
- **freeQuot_not_free.** `μ_p = D̂(ℤ/p)` acting on `Sp 𝒪⟦x⟧` with `x` of weight one fixes the origin;
  the invariants `𝒪⟦x^p⟧` exist, but `𝒪⟦x⟧` is not a `μ_p`-torsor over them, so freeness is needed.

<a id="truncated-actions"></a>

### 4.7 Free actions assembled from truncated actions

**Theorem.** For `m ≥ 1`, use coefficient rings with `𝔪_Aᵐ = 0` and truncate products and group axioms
at that level. Let `A_m` be such truncated coefficient rings, with compatible surjections
`A_{m+1} → A_m`, and assume there is one `C ∈ C_𝒪` with compatible surjections `C ↠ A_m`.
Then `A_∞ = lim A_m` is a Noetherian coefficient object. Given compatible action chunks of a
representable group on the `Sp A_m`, there is a unique limiting action on `Sp A_∞`, free if
each chunk is free. The common Noetherian source is part of the hypotheses, rather than a
consequence of an arbitrary inverse system. The truncation isomorphisms of 4.5 give chunks of `Ĝ_mᵗ` from actions of its
sufficiently deep `p`-power torsion. This is the passage used for the dyadic patched limit; no
untruncated torus action on a finite-level fixed-determinant ring is inferred (KW final, §2.6,
Proposition 2.7 and its proof, pp. 13–14; proof of Proposition 9.3, pp. 86–87).

*Needs:* [4.5](#diagonalizable-groups); [4.6](#free-action-quotient).

**Checks.**

- **chunks_constant_system.** a complete coefficient algebra `A` with a genuine action gives
  compatible chunks on `A/𝔪_A^m`; their limit recovers the action on `A`.
- **chunks_need_compatibility.** on `𝔽₃[x]/(x²)` the involution `x ↦ −x` reduces to itself. It cannot
  be the reduction of a specified identity action at the next level: the value on `x` would be
  both `x` and `−x`, which differ. Compatibility is essential.
- **chunks_not_untruncated.** in 4.11 take `X′ = T = Ĝ_m` with translation and `d(t) = t²`.
  The fixed-determinant fibre is `T[2]`, preserved by `T[2]`; a general element of `T` moves it
  to another determinant fibre. Thus chunks do not give an unrestricted torus action on that
  fixed-determinant fibre. In rank two the preserving subgroup is `T[2]`, independently of the
  deeper `2`-power torsion used to approximate the torus.

For disjoint finite sets `S` and `V` with `S` containing the places above `p` and infinity,
define `G_V` as the Galois group of the maximal abelian pro-`p` extension unramified outside
`V` and split at `S`. Since `V` avoids `p`, its ramification is tame, with bounded local
`p`-primary inertia; the finite ray class group gives a finite abelian `p`-group
(ClassFieldTheory Layer 12; KW final, §5.1, p. 46).

<a id="determinant-fixed-on-S"></a>

### 4.8 Rings with determinant fixed only on `S`, and the determinant map

**Construction.** For the rank-two Khare–Wintenberger data take disjoint finite sets `S` and `V`,
with `S` containing the places above `p`, infinity and residual ramification. Use the finite
auxiliary group `G_V` defined above. Let `R^□_{S∪V}` classify `S`-framed lifts
with `det ρ|D_v = ψχ_p|D_v` for `v ∈ S`, and let `R^{□,ψ}_{S∪V}` impose that determinant globally. Both
are algebras over the same local fixed-determinant tensor product at `S`; base change to its
local-condition quotient gives the barred rings. Define `d(ρ) = det ρ/(ψχ_p)`, a character of `G_V`.
The globally fixed-determinant subfunctor is `d⁻¹(1)`, and `d(χ ⊗ ρ) = χ²d(ρ)`. The unframed trace
subrings have simultaneous framing extensions in `4|S| − 1` variables when `S` is nonempty (KW final,
§4.1.1, pp. 37–38; proof of Proposition 9.3, p. 86).

The API:

- `RdetOnS`: the framed ring with determinant fixed only at the places of `S`.
- `detMap`: `d : Sp R^□_{S∪V} → G*_V`.
- `detMap_twist`: `d(χ ⊗ ρ) = χ² d(ρ)`.
- `fixedDet_eq_fiber`: `Sp R^{□,ψ}_{S∪V} = d⁻¹(1)`.

*Needs:* [3.3](#global-deformation-type); [3.5](#local-to-global-map);
[4.5](#diagonalizable-groups); [LocalGaloisDeformationRings §F.2.9](../LocalGaloisDeformationRings/README.md#fixed-determinant-rings).

**Checks.**

- **detMap_trivial_group.** if `G_V = 1`, the two rings coincide.
- **fixedDet_cyclic_four.** in a diagonal character model for `G_V = C₄` over `ℤ₂`, the
  determinant-on-`S` ring is `A = ℤ₂⟦x,y⟧/((1+x)⁴−1,(1+y)⁴−1)`, with
  `d = (1+x)(1+y)`. The globally fixed fibre adds `x+y+xy=0`, giving
  `ℤ₂⟦x⟧/((1+x)⁴−1)`. The point `(1+x,1+y)=(i,1)` over `ℤ₂[i]` belongs only to the
  first ring; `(i,−i)` belongs to the fixed fibre.
- **twisting_infinite_V.** for `F=ℚ`, `p=2`, `S={2,∞}` and all primes `ℓ≡1 (mod 8)`
  in `V`, the independent fields `ℚ(√ℓ)` split at `S` and give an infinite quotient.
  The finite-group construction requires finite `V`.
- **twist_map_not_injective_p2.** on coefficients admitting a nontrivial `2`-torsion character `η`, the
  pairs `(x, χ)` and `(η ⊗ x, ηχ)` have the same twisted image; this is tested on an Artinian
  coefficient object, since `𝒪`-points alone need not detect the whole finite group scheme.

<a id="twisting-action"></a>

### 4.9 The action of twisting characters

**Construction.** In rank two use the disjoint finite sets `S`, `V` and the finite group `G_V`
defined before 4.8. Its formal diagonalizable dual acts on
the globally framed problem with determinant fixed on `S` by `ρ ↦ χ ⊗ ρ`, preserving the local data and
frames at `S`. Obtain the induced ring automorphisms and their formula on the universal
representation, their commutation with changes of frame, and their descent to local-condition
quotients and trace subrings. The determinant changes by `χ²`; at `p = 2` only the subgroup dual to
`G_V/2G_V` preserves the globally fixed determinant (KW final, §5.1, p. 46).

The API:

- `twistAction`: the action of `G*_V` on the framed functor with determinant fixed on `S`.
- `twistAut`: `a_χ` for `χ : G_V → 𝒪ˣ` residually trivial.
- `twistAut_univ`: `a_χ ∘ ρ^univ = χ ⊗ ρ^univ`.
- `twistAction_comm_frame`: twisting commutes with the frame action.
- `twistAction_det`: `det(χ ⊗ ρ) = χ² det ρ`; for `χ² = 1` the determinant is preserved.

*Needs:* [4.5](#diagonalizable-groups); [4.8](#determinant-fixed-on-S);
[3.3](#global-deformation-type); [LocalGaloisDeformationRings §F.2.6](../LocalGaloisDeformationRings/README.md#framed-unframed-comparison); `ClassFieldTheory` Layer 12.

*Lean:* `twist`, `twist_apply`, `trace_twist` and `det_twist` give the matrix, trace and
determinant formulas, with the rank-two determinant change obtained by taking `n = 2`.

**Checks.**

- **twistAction_one.** the trivial character acts as the identity.
- **twist_det.** for `2 × 2` matrices `det(c • M) = c² det M`.
- **twist_not_fixed_det_odd.** for `p` odd and `χ ≠ 1` residually trivial, `χ²≠ 1`, so `χ ⊗ −` does not
  preserve the fixed-determinant locus.

<a id="twist-action-free"></a>

### 4.10 Freeness of dyadic twisting and its stabilisers

**Theorem.** Assume `p = 2` and nonsolvable residual rank-two image. A residually trivial character
`χ` of `G_V` fixing a strict deformation class, over any coefficient object, is trivial. Hence the
action is free on the determinant-on-`S` framed functor, on the globally fixed-determinant functor
for its `2`-torsion twisting subgroup, and on their unframed and local-condition versions. The
nonsolvable-image hypothesis cannot be dropped: induced representations have self-twists (KW final,
§5.2, Lemma 5.1 and its proof, pp. 46–47).

*Proof sketch.* If `χ ⊗ ρ` is strictly conjugate to `ρ`, comparing traces gives
`(χ(g) − 1) tr ρ(g) = 0` for all `g`; apply the residual trace argument of KW Lemma 5.1 to every
nonzero character direction, using the nonsolvability of the residual image.

*Needs:* [4.9](#twisting-action); [4.6](#free-action-quotient); [LocalGaloisDeformationRings §F.1.3](../LocalGaloisDeformationRings/README.md#strict-deformation-functor);
ArithmeticGaloisRepresentations Layer 4.

**Checks.**

- **twistFree_A5.** take `G=SL₂(𝔽₄)×C₂`, residual image `SL₂(𝔽₄)≅A₅`, and
  the constant lift over `A=𝔽₄[ε]` trivial on the second factor. The first factor is
  perfect: for `ω²+ω+1=0`, upper unipotents with entries `1,ω` and their lower counterparts
  generate it,
  and diagonal conjugation puts them in its commutator subgroup. Hence a residually
  trivial character is determined by `χ(z)=1+εa` on the second factor. Since `ρ(z)=1`,
  its twist can be strictly conjugate to `ρ` only if `(1+εa)I=I`, forcing `a=0`.
  Nonzero `a` give actual allowed order-two twists, but none stabilizes this class.
- **twistFree_dihedral_fails.** over characteristic-zero dyadic `𝒪`, let `ρ = Ind θ` from an
  index-two subgroup `H`, with its nontrivial quadratic character `ε_H` factoring through the
  allowed twisting quotient `G_V`. Conjugation by `diag(1, −1)` fixes the diagonal image of `H`
  and negates the antidiagonal image of `G ∖ H`. Since `−1 ≡ 1` in residue characteristic two,
  this conjugator is strict and `ε_H` is residually trivial, while `ε_H ≠ 1`. Thus this is an
  actual stabilizer of the specified strict-class action. Over odd residue characteristic the
  same conjugator is not strict, so that version would not be a counterexample.
- **twistFree_trace_unit.** in `𝔽₄[ε]`, take `U=[[1,1],[0,1]]` and
  `L=[[1,0],[ω,1]]` with `ω²+ω+1=0`. Their product has trace `ω`, a unit.
  Twisting its matrix by `1+εa` preserves this trace only if `a=0`; a nonzero
  first-order character value cannot stabilize a class at this detecting element.

<a id="determinant-twist-torsor"></a>

### 4.11 The determinant torsor for dyadic twisting

**Theorem.** Let the formal torus `T = Ĝ_m^γ` act freely on `X′ = Sp R′` and let `d : X′ → T` satisfy
`d(λx) = λ²d(x)`. Put `X = d⁻¹(1) = Sp R`. Then `X′ → Sp (R′)^T` is formally smooth of relative
dimension `γ` and `X → Sp (R′)^T` is a torsor for `T[2]`. In the dyadic setting squaring on a formal
torus is finite flat of degree `2^γ`, so `R` is finite flat of that degree over `(R′)^T` and
`dim R = dim (R′)^T = dim R′ − γ`. The torus hypothesis is part of the theorem: a finite diagonalizable
group does not have the same squaring interface (KW final, proof of Proposition 9.3, Lemma 9.4 and its
proof, p. 87).

*Needs:* [4.6](#free-action-quotient); [4.8](#determinant-fixed-on-S);
[4.10](#twist-action-free); [4.7](#truncated-actions).

**Checks.**

- **torsor_gamma_zero.** for `γ = 0` the torus is trivial and `R = R′`.
- **torsor_square_degree.** squaring on `Ĝ_m` is `1 + x ↦ (1 + x)²`, finite flat of degree `2` over
  `𝒪⟦y⟧` with `y = 2x + x²`.
- **torsor_odd_p.** for `p` odd squaring is an automorphism of `Ĝ_m`, the torsor is trivial and
  `R ≅ (R′)^T`; the degree `2^γ` is special to `p = 2`.

### Examples

- The **resRing_not_flat** (4.1) and **resFinite_not_flat** (4.2) examples give a finite, non-flat restriction map.
- For `γ = 1` the dyadic determinant fibre is the double cover `1 + x ↦ (1 + x)²` of `Ĝ_m`, the basic
  instance of 4.11.

### Dependencies

Layer R04.3; LocalGaloisDeformationRings §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2; [LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§0.16, 0.20–0.21; `ModularCurves` Layer 0C;
`ClassFieldTheory` Layer 12; ArithmeticGaloisRepresentations Layer 4; ArithmeticGaloisDuality R02.6.

## Layer R04.5: Taylor–Wiles data at auxiliary primes

This layer turns auxiliary primes into deformation data: augmented deformation problems, their
diamond-group structure and their generator counts. The cohomological existence of auxiliary sets in
the Khare–Wintenberger settings (odd `p` and `p = 2`) and the local cohomology at a Taylor–Wiles place
are ArithmeticGaloisDuality R02.6 (see *Scope and ownership*). This layer adds the Kummer
disjointness that the dyadic construction takes as a hypothesis, the ring-theoretic consequences of
the dyadic sets, the conditional selection theorem used in arbitrary rank, and the auxiliary sets of
Gee's convention. Odd and dyadic constructions use different adjoints and leave different numerical
remainders.

Before choosing rank-two auxiliary primes, replace `(𝒪,k,ρ̄)` by a finite unramified
coefficient extension whose residue field contains the eigenvalues of every residual image
element. The image is finite, so one finite residue extension suffices. Apply LocalGaloisDeformationRings §§F.1.8, F.2.10
to representations, determinant lifts and local conditions, retaining the hypotheses of
each local condition. Cohomology dimensions are measured over the new residue field and
are unchanged by scalar extension. All rings and data in 5.1–6.6 use these coefficients
(Gee, §5.5, p. 33).

<a id="rank-two-taylor-wiles-local"></a>

**Rank-two local diagonalization at Taylor–Wiles places.** For every prime `p`, let `v ∤ p`,
`Nv ≡ 1 (mod p)` and let the unramified rank-two residual representation have two distinct
`k`-rational Frobenius eigenvalues, with one selected. Starting from the unrestricted framed
local ring of LocalGaloisDeformationRings 1.1, construct the coefficient-natural Hensel
projectors and the two labelled character deformations. Wild inertia has trivial image in
its pro-`p` reduction kernel. The tame relation `φtφ⁻¹=t^{Nv}`, together with distinct
residual eigenvalues and `Nv ≡ 1 (mod p)`, eliminates the off-diagonal inertia entries;
each labelled summand is therefore a character. The characters are unique, although the
basis identifying the summands with `A²` is not. Impose the globally fixed unramified
determinant: their inertia characters become inverse. The selected character gives
`𝒪[Δ_v] → R^{□,ψ}_v`, formally smooth of relative dimension three, where `Δ_v` is the
maximal `p`-power quotient of `k(v)ˣ`. Its augmentation quotient is the unramified
fixed-determinant ring. This construction requires no auxiliary-prime datum and uses
no division by two (KW final, §5.6, Proposition 5.11, p. 53; ACC published, §6.2.18,
Lemma 6.2.19 and the following paragraph, pp. 1038–1039).

*Needs:* LocalGaloisDeformationRings 1.1 and 1.10; [LocalGaloisDeformationRings §F.1.7](../LocalGaloisDeformationRings/README.md#fixed-determinant-functors);
ClassFieldTheory Layer 7; [LocalGaloisDeformationRings §F.0.1](../LocalGaloisDeformationRings/README.md#completed-coefficient-products).

**Checks.**

- **local_TW_dyadic.** For `p=2`, `k=𝔽₄` and `Nv=7`, Frobenius eigenvalues `ω,ω²`
  with `ω³=1`, `ω≠1`, are distinct. Over `k[ε]` the inertia matrix `(1+ε)I`
  has determinant one and satisfies the tame relation. It has a nonzero ramified
  direction despite equal inverse inertia characters.
- **local_TW_odd.** For `p=5`, `Nv=11`, Frobenius `diag(1,−1)` and inertia
  `diag(1+ε,1−ε)` satisfy the tame relation and determinant-one constraint; both
  labelled characters are ramified, so an unramified complementary block excludes this lift.
- **local_TW_repeated_fails.** Over `𝔽₅[ε]`, scalar Frobenius and inertia
  `I+εE₁₂` at `Nv=11` satisfy the tame relation but cannot be diagonalized:
  its nonzero first-order nilpotent matrix is not similar to a diagonal matrix.
  Distinct residual eigenvalues are essential.

<a id="taylor-wiles-datum"></a>

### 5.1 Taylor–Wiles data

**Definition.** In rank two, a level-`N` datum (`N ≥ 1`) is a finite set `Q` of places disjoint from `S`
with a selected eigenvalue `α_v` at each `v ∈ Q`, such that `v ∤ p`, `Nv ≡ 1 (mod pᴺ)`, `ρ̄` is
unramified at `v` and `ρ̄(Frob_v)` has two distinct eigenvalues in `k`, one of which is `α_v`. Put
`Δ_v` for the maximal `p`-power quotient of `k(v)ˣ` and `Δ_Q = ∏_{v∈Q} Δ_v`. The augmented problem
`𝒮_Q` allows unrestricted ramification at `Q`, with local tangent condition `H¹` and dual condition
zero. Construct the quotient `Δ_Q/pᴺΔ_Q ≅ (ℤ/pᴺ)^{|Q|}`. In the dyadic construction also impose the
splitting condition in the Kummer extension of 5.3. A congruence condition alone does not select an
eigenline (Gee, §5.6, p. 33; KW final, Lemma 5.3, p. 47).

The API:

- `TaylorWilesDatum`: `(Q, (α_v)_{v∈Q})` with `Nv ≡ 1 (mod pᴺ)` and distinct Frobenius eigenvalues.
- `TaylorWilesDatum.delta`: `Δ_Q = ∏_{v∈Q} (k(v)ˣ)_p`.
- `TaylorWilesDatum.deformationType`: `𝒮_Q`, with no condition at the places of `Q`.
- `TaylorWilesDatum.delta_quotient`: `Δ_Q/pᴺ ≅ (ℤ/pᴺ)^{#Q}`.

*Needs:* [3.3](#global-deformation-type); [5.3](#dyadic-linear-disjointness) in the dyadic
case; [rank-two local diagonalization](#rank-two-taylor-wiles-local).

**Checks.**

- **twDatum_empty.** the empty set is a datum of every level, with `Δ_∅ = 1`.
- **twDatum_split_iff.** for `v ∤ p`, `Nv ≡ 1 (mod pᴺ)` if and only if `v` splits completely in
  `F(ζ_{pᴺ})`.
- **twDatum_residue_extension.** at `p=3`, `k=𝔽₃` and `det ρ̄=χ̄₃`, an admissible
  Frobenius has determinant one. The only distinct pair in `𝔽₃ˣ` is `(1,−1)`,
  whose product is `−1`, so rational distinct eigenvalues are impossible.
  The determinant-one matrix `[[0,−1],[1,0]]` has characteristic polynomial `X²+1`;
  over `𝔽₉` its roots `i,−i` are distinct and have product one.
- **twDatum_scalar_excluded.** if `ρ̄(Frob_v)` is scalar, `v` is not a Taylor–Wiles place: `ad⁰ρ̄(Frob_v)`
  has only the eigenvalue `1`. There are many eigenlines in the original two-dimensional space,
  but none is distinguished by a choice between distinct eigenvalues, as the datum requires.

<a id="image-hypotheses"></a>

### 5.2 The residual image hypotheses used to choose primes

**Definitions.** Keep three rank-two hypotheses separate: (1) absolute irreducibility of
`ρ̄|G_{F(ζ_p)}`, equivalently `ρ̄` absolutely irreducible and not bad dihedral in the sense of
`GaloisRep.IsBadDihedral` (ArithmeticGaloisRepresentations §4.6, with its cyclotomic criterion);
(2) the strong condition `SL₂(𝔽_p) ⊆ ρ̄(G_F)` of Gee's `p ≥ 5` argument, with `p` unramified in `F`;
(3) nonsolvability of the image, for the dyadic Khare–Wintenberger argument. Their finite-image
content, submodule calculations and detecting elements come from ArithmeticGaloisRepresentations
Layer 4 (§4.6, §4.7 and `GL2Subgroup.sl2_submodules_charTwo`). Enormous image
(`ResidualImage.IsEnormous`, §7.10) and adequacy are different higher-rank conditions and are not
substituted here. Hypothesis (1) admits induced representations with a reducible adjoint, so its
detector must work constituent by constituent: the `S₃` representation over `𝔽₅` attached to the
splitting field of `X³ − 2` over `ℚ` has a proper invariant sign line in `ad⁰` despite residual absolute
irreducibility; its quadratic subfield `ℚ(√−3)` is disjoint from `ℚ(ζ₅)`, so it stays absolutely
irreducible on the cyclotomic subgroup (KW final, §4, p. 37; Gee, Theorem 5.2, p. 29).

The API:

- `IsCyclotomicAbsIrred`: `ρ̄|G_{F(ζ_p)}` is absolutely irreducible.
- `HasBigImage`: `ρ̄(G_F) ⊇ SL₂(𝔽_p)`.
- `HasNonsolvableImage`: `ρ̄(G_F)` is not solvable.

*Needs:* ArithmeticGaloisRepresentations Layer 4; [LocalGaloisDeformationRings §F.1.3](../LocalGaloisDeformationRings/README.md#strict-deformation-functor).

**Checks.**

- **sl2F4_not_solvable.** `SL₂(𝔽₄) ≅ A₅` is not solvable, so hypothesis (3) holds for surjective dyadic
  `ρ̄ : G_F → GL₂(𝔽₄)`.
- **dihedral_not_cyclotomic_irred.** for odd `p`, if `K = F(√p*)` is a proper quadratic subfield of
  `F(ζ_p)` and `θ` is a character of `G_K` with `θ ≠ θᶜ`, then `Ind_{G_K}^{G_F} θ` is absolutely irreducible
  but splits on `G_{F(ζ_p)}`, so it fails (1).
- **cyclotomic_irred_p2_trivial.** for `p = 2`, `F(ζ₂) = F`, so (1) is plain absolute irreducibility.
- **allowed_dihedral_adjoint_sign_line.** over `𝔽₅` the standard `S₃` representation satisfies (1) in the
  stated `ℚ` example, while `k·J ⊊ ad⁰` is a nonzero invariant sign line: `J ≠ 0`, `tr J = 0`, the
  three-cycle fixes `J` and the transposition negates it, `diag(1, −1) ∉ k·J`, and `1, C, S, CS` span
  `M₂(𝔽₅)` (determinant of the flattened basis nonzero).
- **bigImage_SL2_index.** `SL₂(𝔽₅)` has order `120` and index `4 = |𝔽₅ˣ|` in `GL₂(𝔽₅)`.
  Both groups pass `HasBigImage`; a subgroup of `GL₂(𝔽₅)` whose index does not divide `4` cannot.
- **bigImage_Borel_fails.** The upper triangular subgroup fails `HasBigImage`:
  `[[1,0],[1,1]]` has determinant one and is not upper triangular.
- **bigImage_S3_fails.** The subgroup generated by `C,S` of LocalGaloisDeformationRings §F.1.5 has order six,
  whereas `SL₂(𝔽₅)` has order 120, so the allowed cyclotomically irreducible `S₃`
  example fails `HasBigImage`.

<a id="dyadic-linear-disjointness"></a>

### 5.3 Linear disjointness for dyadic auxiliary primes

**Theorem.** Let `p = 2`, `F` totally real and `ρ̄` with nonsolvable image. Write `M_n = ℚ(μ_{2ⁿ})`,
`M_n⁺ = ℚ(x_n)` with `x_n = (ε_n + ε_n⁻¹)/2`, and `y_n = (x_n + 1)/2 = x_{n+1}²`. Let `n₀ ≥ 2` be maximal
with `M_{n₀}⁺ ⊆ F`. For `n > n₀`, put `F_n = F(μ_{2ⁿ})` and let `F̃_n` be the Kummer extension of `F_n` generated by a
`2ⁿ`-th root of `y_{n₀}`: define its Kummer class
`κ_n ∈ H¹(G_{F,S}, μ_{2ⁿ})` and put `F̃_n = F_n(y_{n₀}^{1/2ⁿ})`. Prove the successive
`2`-power radical degree lemma (KW 5.7),
the degree-eight dihedral extension (KW 5.8) and the cyclic degree `2^{n−1}` with its quadratic
subextension (KW 5.9). The Kummer class is unramified outside `S` and has order divisible by `2^{n−1}`.
If `K` is the field cut out by `ad ρ̄` and `L` is the splitting field over `K` of the image of
`H¹(G_{F,S}, ad ρ̄)`, then `L(μ_{2ⁿ})` and `F̃_n` are linearly disjoint over `F_n` for `n > n₀`. Track the
recursion `R_n(X) = R_{n−1}(2X² − 1)` to control ramification. This is the disjointness that
ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual*, takes as a
hypothesis (KW final, §5.5.1, Proposition 5.6 and Lemmas 5.7–5.9, pp. 48–50).

*Needs:* [5.2](#image-hypotheses); ArithmeticGaloisRepresentations Layer 4.

**Checks.**

- **chebyshev_four.** with `R₃ = 2X² − 1`, `R₄(X) = R₃(2X² − 1) = 8X⁴ − 8X² + 1` (the Chebyshev polynomial
  `T₄`), so `R₄(0) = 1`.
- **kummer_root_exponent.** for `F=ℚ`, `n₀=2`, `n=3` and `y₂=1/2`,
  adjoining `(1/2)^{1/8}` to `ℚ(ζ₈)` has degree four. Adjoining `(1/2)^{1/4}`
  has only degree two: its square `(1/2)^{1/2} = 1/√2` already lies in `ℚ(ζ₈)`. The degree
  `2^{n−1}` describes the extension, not the exponent of the chosen root.
- **n0_rational.** for `F = ℚ`, `M₂⁺ = ℚ` and `M₃⁺ = ℚ(√2) ⊄ ℚ`, so `n₀ = 2`.
- **y_relation.** for `n = 2`, `x₂ = cos(π/2) = 0` and `y₂ = 1/2 = x₃²` with `x₃ = cos(π/4) = √2/2`; a
  definition `y_n = x_n²` would give `0` and no Kummer extension.

<a id="dyadic-taylor-wiles-primes"></a>

### 5.4 Dyadic Taylor–Wiles sets and their generator counts

**Theorem.** Let `F` be totally real, `p = 2`, `ρ̄` with nonsolvable image and `S` containing the
infinite places, the places above `2` and the ramification. For `n > n₀` take the set `Q_n` of
ArithmeticGaloisDuality R02.6, *Dyadic auxiliary primes and the cyclotomic residual*, using 5.3 for its
disjointness hypothesis. With `Ad = ad ρ̄`, `Z ⊆ Ad` the scalars and `D_v` the decomposition groups, that
target gives: (1) `|Q_n| = h¹(S, Ad) − 2`, independent of `n`; (2) `Nv ≡ 1 (mod 2ⁿ)` and distinct
residual Frobenius eigenvalues at `v ∈ Q_n`; (3) each `v ∈ Q_n` splits in `F̃_n`, with
`h⁰(D_v, Ad) = 2` and `h¹_{Q_n-split}(S, Ad) = 2`; (4) `h¹_{S-split}(Q_n, Ad) = 2 − Σ_{v∈S} h⁰(D_v, Ad) + 2|Q_n|`;
(6) `G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` for the auxiliary abelian `2`-extension group `G_n`; (7)
`t = 2 − |S| + |Q_n|`. Prove the ring statements:

- (5) `R^□_{S∪Q_n}`, with determinant imposed only on `S`, is topologically generated by
  `2|Q_n| + 1` elements over the fixed-determinant local tensor ring at `S`;
- (8) `(h¹_{S-split}(Q_n, Ad) − t) + (Σ_{v∈S} h⁰(D_v, Ad) − h⁰(G_F, Ad)) = |Q_n| + |S| − 1`.

The full-adjoint and trace-kernel relationship in characteristic two stays explicit throughout; the
residual of dimension two is accounted for by the auxiliary twisting group of 4.9 and its quotient
(KW final, §5.5.2, Lemma 5.10 and its proof, pp. 50–53, with (5) in Lemma 5.10(e),
p. 50, and (8) in Lemma 5.10(h), p. 51).

*Proof sketch.* The relative tangent space of the determinant-on-`S` problem (3.6 with the full
adjoint and frames at `S`) has dimension `h¹_{S-split}(Q_n, Ad) + Σ_{v∈S} h⁰(D_v, Ad) − h⁰(G_F, Ad)`; by
(4) and `h⁰(G_F, Ad) = 1` (the scalars, `ρ̄` being absolutely irreducible) this is `2|Q_n| + 1`, which
is (5). Substituting (4) and (7) gives (8) as an identity in `ℤ`.

*Needs:* [5.1](#taylor-wiles-datum); [5.3](#dyadic-linear-disjointness);
[5.2](#image-hypotheses); [4.8](#determinant-fixed-on-S); [4.9](#twisting-action);
[3.6](#relative-tangent-space); ArithmeticGaloisDuality R02.6; `Chebotarev` Layer 10 and 11.3(2).

**Checks.**

- **dyadic_count_identity.** (8) holds identically in `ℤ` after substituting (4) and (7); a version using
  natural-number subtraction for `t = 2 − |S| + |Q_n|` would fail when `|S| > 2 + |Q_n|`.
  At `|S| = 3`, `|Q_n| = 0`, it truncates `t` to `0` and gives `0 + 11 + 0 − 9 = 2 ≠ 1`.
- **dyadic_scalars_traceless.** in characteristic two `tr(1) = 0` in `M₂`, so `Z ⊆ Ad⁰` and `Ad⁰/Z` is
  two-dimensional; the odd-`p` decomposition `Ad = Z ⊕ Ad⁰` is unavailable.
- **dyadic_residual_two.** the count subtracts two because the classes inflated from `Gal(F_n/F)` vanish at
  every `v` with `Nv ≡ 1 (mod 2ⁿ)`; a construction asserting that the whole dual Selmer group is killed
  would be false.

<a id="taylor-wiles-inertia-action"></a>

### 5.5 Inertia at Taylor–Wiles places and the `Δ_Q`-module structure

**Construction.** Apply the [rank-two local diagonalization](#rank-two-taylor-wiles-local),
valid for every prime `p`, with the selected `α_v` at each `v ∈ Q_N`. For globally fixed
unramified determinant the two characters have inverse inertia restrictions, and the selected
one factors through `Δ_v`. Construct
the `𝒪[Δ_Q]`-algebra structure on the framed and the trace rings. Quotienting by the augmentation
ideal recovers the problem without `Q`. In the dyadic case, for the fixed-determinant twisting
automorphism `a_χ` and a diamond element `δ`, prove `a_χ ∘ δ = χ(δ)·(δ ∘ a_χ)`. The global augmentation
statement uses the inertia quotient of 4.3 (KW final, §5.6, Proposition 5.11 and Lemma 5.12, p. 53).

*Needs:* [5.1](#taylor-wiles-datum); [rank-two local diagonalization](#rank-two-taylor-wiles-local);
[4.3](#enlarging-ramification); [4.9](#twisting-action).

**Checks.**

- **delta_empty.** for `Q = ∅`, `𝒪[Δ_∅] = 𝒪` and the structure map is the unit.
- **augmentation_quotient.** the quotient by the augmentation ideal of `𝒪[Δ_Q]` is the ring of `𝒮` without
  `Q`, because a lift unramified at `Q` has trivial inertia characters.
- **eigenline_selects_character.** with `Frob_v = diag(α, β)`, conjugation acts on `E₁₂` by `α/β ≠ 1`, so
  the two characters are distinguished by the selected eigenvalue; without the selection the
  `Δ_v`-action is defined only up to inversion.

<a id="chebotarev-selmer-selection"></a>

### 5.6 Shared Chebotarev selection for Selmer detection

**Theorem.** Let `H` be a finite-dimensional `k`-space of continuous global cohomology classes with
linear localization maps `loc_v` at admissible unramified places. Suppose that each nonzero class has a
detecting conjugacy class in a finite Galois quotient: every prime in that class, outside a specified
finite exceptional set, is admissible and has nonzero localization. Suppose also that there is a
nonempty admissible conjugacy class for padding, even when `H = 0`. Then for any finite avoidance set
`B` and any `q ≥ dim H` there are exactly `q` distinct admissible primes outside `B` with injective joint
localization, and they can all be taken of residue degree one over `ℚ`. Congruences and ordered
eigenvalues are encoded in the finite quotient. Each application supplies conjugacy invariance,
independence of coboundaries, the detection property and the interpretation of the joint kernel as
the new dual Selmer group; the ramified primes of auxiliary fields are put in `B`. For `q = dim H` the
conclusion is the input of ArithmeticGaloisDuality R02.6, *The conditional dual-Selmer killing
calculation* (ACC published, Lemma 6.2.32, proof, printed pp. 1045–1046, PDF pp. 149–150).

*Proof sketch.* Induct on the dimension of the current joint kernel: choose a nonzero class in it and a
prime in its detecting class outside `B` and the primes already chosen (Chebotarev density, `Chebotarev`
Layer 10, with the higher-degree discard of 11.3(2) for residue degree one); the kernel drops. Then
pad with primes from the padding class.

*Needs:* ArithmeticGaloisDuality R02.6; `Chebotarev` Layer 10 and 11.3(2).

**Checks.**

- **selection_H_zero.** for `H = 0` the theorem still produces exactly `q` primes, from the padding class;
  without the padding hypothesis it could not.
- **selection_independent_coordinates.** two coordinate localizations on `(ℤ/3)²` have zero joint kernel.
- **selection_repeated_fails.** repeating one localization twice cannot kill a two-dimensional `H`; the
  induction must choose a prime detecting a class in the current kernel.

<a id="odd-taylor-wiles-primes"></a>

### 5.7 Existence of Taylor–Wiles primes for odd `p`

**Theorem.** For `p > 2` there are two settings. Under the Khare–Wintenberger hypotheses (`F` totally
real and unramified above `p`, `ρ̄` totally odd with (1) of 5.2, the local conditions of KW §4.1.4) the
auxiliary sets are ArithmeticGaloisDuality R02.6, *Odd-prime Taylor–Wiles auxiliary sets*, of size
`h¹_{L^⊥}(S, (ad⁰)ˇ(1))`; at `p = 3` that target uses KW Lemmas 5.2(1) and 5.3, and Taylor's argument
assuming `l > 3` is not a justification there. Under Gee's hypotheses (`p ≥ 5`, `F` totally real with
`p` unramified, `ρ̄` odd with (2) of 5.2, `T` the finite ramification set containing the places above
`p`), put `r = max(h¹(G_{F,T}, (ad⁰ρ̄)(1)), 1 + [F : ℚ] − |T|)`. For every `N ≥ 1` there is a set `Q_N` with
`Q_N ∩ T = ∅`, distinct residual Frobenius eigenvalues at each `v ∈ Q_N`, `#k(v) ≡ 1 (mod pᴺ)`,
`|Q_N| = r`, and vanishing `H¹_{Q_N}(G_{F,T}, (ad⁰ρ̄)(1))` (KW final, Lemma 5.3 and its proof, pp. 47–48,
and Lemma 5.2(1), p. 47; Gee, Proposition 5.10 and its proof, pp. 38–39; Taylor, Lemma 2.5 and its
proof, printed pp. 749–750).

*Proof sketch* (Gee's setting). Put `E = F^{ker ad ρ̄}(ζ_{pᴺ})`. The image of `ad ρ̄` is `PGL₂` or `PSL₂` of a
finite field (ArithmeticGaloisRepresentations Layer 4, from `SL₂(𝔽_p) ⊆ ρ̄(G_F)`), so `ζ_p` is not in
`F^{ker ad ρ̄}` when `p ≥ 5` is unramified in `F`, and inflation–restriction gives
`H¹(Gal(E/F), (ad⁰ρ̄)(1)) = 0` (ArithmeticGaloisDuality R02.2). Hence each nonzero class restricts
nontrivially to `G_E`, and a detecting conjugacy class exists with distinct eigenvalues and trivial
image in `Gal(F(ζ_{pᴺ})/F)`. Apply 5.6 with `q = r ≥ dim H`.

*Needs:* [5.1](#taylor-wiles-datum); [5.2](#image-hypotheses);
[5.6](#chebotarev-selmer-selection); ArithmeticGaloisDuality R02.2 and R02.6;
ArithmeticGaloisRepresentations Layer 4.

**Checks.**

- **gee_r_padding.** if `h¹(G_{F,T}, (ad⁰ρ̄)(1)) < 1 + [F : ℚ] − |T|`, then `r` exceeds the dual dimension and
  the padding clause of 5.6 is used; a construction of exactly `dim H` primes would give the wrong
  count.
- **odd_size_constant.** the size of `Q_N` does not depend on `N` in either setting.
- **p3_excluded_from_taylor.** at `p = 3` the argument of Taylor's Lemma 2.5 (which assumes `l > 3`) does
  not apply; the Khare–Wintenberger input is used instead.

<a id="taylor-wiles-generator-count"></a>

### 5.8 Generator counts at Taylor–Wiles levels

**Theorem.** After dual Selmer vanishing, the relative tangent formula of 3.6 gives counts independent
of `N`. In the Khare–Wintenberger convention, with infinity in `S` and framing at every place of `S`,
`R^{□,ψ}_{S∪Q_N}` has `|Q_N| + |S| − 1` generators over `R^{□,loc,ψ}_S` (ArithmeticGaloisDuality R02.6).
In Gee's finite-place convention, framing at `T`, `R^□_{Q_N}` is generated over `R^loc` by
`|T| − 1 − [F : ℚ] + r` elements, and likewise with the primed fixed-determinant rings. The correct
local ring and archimedean convention are used in each application; the two numbers are not
identified by notation (KW final, Proposition 5.5, p. 48; Gee, Proposition 5.10, last bullet, p. 38).

*Proof sketch* (Gee's count). By 3.6 with `T` framed and `Q_N` relaxed, the relative tangent space has
dimension `|T| + |Q_N| − 1 − [F : ℚ] + h¹_{Q_N}(G_{F,T}, (ad⁰ρ̄)(1))`, since each `v ∈ Q_N` contributes
`h¹(G_v, ad⁰) − h⁰(G_v, ad⁰) = 1` and each real place `h⁰(G_v, ad⁰) = 1`; with `|Q_N| = r` and the dual
group zero this is `|T| − 1 − [F : ℚ] + r`.

*Needs:* [5.7](#odd-taylor-wiles-primes); [3.6](#relative-tangent-space);
[3.7](#local-to-global-presentation); ArithmeticGaloisDuality R02.5 and R02.6.

**Checks.**

- **count_KW_vs_gee.** for `F = ℚ` and `|Q_N| = q`, the KW count with `S = {p, ∞}` is `q + 1`, while Gee's
  count with `T = {p}` is `1 − 1 − 1 + q = q − 1`; the difference `2` is the relative dimension of the
  archimedean local ring, which Khare–Wintenberger include in their local tensor ring.
- **count_independent_of_N.** both counts depend only on `|Q_N|`, which is constant in `N`.
- **count_integer_first.** Gee's count `|T| − 1 − [F : ℚ] + r` is nonnegative because
  `r ≥ 1 + [F : ℚ] − |T|`; the nonnegativity is proved before the count indexes variables.

### Examples

- For `F = ℚ`, `p ≥ 5`, `T = {p}` and surjective `ρ̄ : G_ℚ → GL₂(𝔽_p)` unramified outside `p`, Gee's
  `r = max(h¹(G_{ℚ,T}, (ad⁰ρ̄)(1)), 1 + 1 − 1) = max(h¹, 1)`.
- At `p = 2` with `F = ℚ`, `n₀ = 2`, and for `n ≥ 3` the residual `Gal(F_n/F) = (ℤ/2ⁿ)ˣ ≅ ℤ/2 × ℤ/2^{n−2}`
  has two-dimensional `𝔽₂`-dual, the two-dimensional residual of 5.4.

### Dependencies

Layers R04.3–R04.4; ArithmeticGaloisDuality R02.2, R02.5, R02.6; ArithmeticGaloisRepresentations
Layer 4; `Chebotarev` Layer 10 and 11.3(2); LocalGaloisDeformationRings 1.1 and 1.10;
[rank-two local diagonalization](#rank-two-taylor-wiles-local).

## Layer R04.6: Finite-level deformation data for patching

This layer packages the condition-specific rings, the trace representations, the diamond actions and
the uniform presentations into systems indexed by the Taylor–Wiles level. The numerical comparisons
specify the deformation side of patching; no arithmetic module and no support theorem is assumed.

<a id="kw-deformation-data"></a>

### 6.1 The global deformation data of Khare–Wintenberger

**Construction.** For the rank-two totally real lifting data of KW §§8–9, fix the finite set
`S = Σ ∪ {v | p} ∪ {v | ∞}`, the determinant `ψχ_p` and the local conditions of LocalGaloisDeformationRings
8.2: semistable with fixed unramified `γ_v` away from `p` and infinity, odd at infinity, and at `p` the
case (A) low-weight crystalline, (B) weight two in the stated odd-`p` weight range, or (C) weight-two
semistable. Their completed tensor product `B = R̄^{□,loc,ψ}_S` is LocalGaloisDeformationRings 8.17:
flat, with all components of relative dimension `3|S|` (`3` at finite places away from `p`,
`3 + [F_v : ℚ_p]` above `p`, `2` at infinity) and regular generic fibre, a domain when all finite
conditions away from `p` are semistable. Base change the unrestricted global framed ring to `B` to obtain
`R̄^{□,ψ}_S`. In Gee's variant keep the two local systems, their equality modulo `λ`, and the assumed
irreducibility of the reduced local ring, which is not automatic for all local conditions (KW final,
§9.1.1, pp. 78–79).

The API:

- `KWDeformationData`: `S`, `ψ` and the local conditions at `v ∈ S` of KW §9.1.1.
- `KWDeformationData.localRing`: `R̄^{□,loc,ψ}_S = ⊗̂_v R̄^{□,ψ}_v`.
- `KWDeformationData.localRing_isDomain`: `R̄^{□,loc,ψ}_S` is a flat domain with regular generic fibre
  (under the semistable hypothesis, LocalGaloisDeformationRings 8.17).
- `KWDeformationData.localRing_relDim`: relative dimension `3|S|`.

*Needs:* [3.3](#global-deformation-type); [3.5](#local-to-global-map); LocalGaloisDeformationRings 1.11,
1.14, 2.5, 8.2, 8.17; [LocalGaloisDeformationRings §F.0.1](../LocalGaloisDeformationRings/README.md#completed-coefficient-products); SchemeAndStackFoundations §§0.16, 0.20–0.21.

**Checks.**

- **relDim_Q.** for `F = ℚ` and `S = {∞, p}` the relative dimension is `2 + 4 = 6`.
- **relDim_formula.** for totally real `F`, with `S_f` the finite places of `S`, the local relative
  dimensions sum to `3|S_f| + Σ_{v|p} [F_v : ℚ_p] + 2[F : ℚ] = 3|S_f| + [F : ℚ] + 2[F : ℚ] = 3|S|`, since `F` has
  `[F : ℚ]` real places; a count giving every place relative dimension `3` would be right in total only
  by accident of this cancellation, so the local dimensions are kept separately.
- **not_finite_claim.** a nonzero `R̄^{□,ψ}_S` is never finite over `𝒪` when `|S| ≥ 1`: it is a power series
  ring over `R̄^ψ_S` in `4|S| − 1 ≥ 3` variables.

<a id="trace-subring-universal-representation"></a>

### 6.2 The unframed ring as a trace subring, with its universal representation

**Theorem.** Inside the condition-specific framed ring define `R̄^ψ_S` as the closed `𝒪`-subring
generated by the universal traces. It is the image of the unframed ring, and for nonempty `S` the framed
ring is a power-series extension of it in `j = 4|S| − 1` variables. Coefficient descent (LocalGaloisDeformationRings §F.2.7) descends
the universal representation to this trace ring, and the torsor of simultaneous frames gives the
power-series coordinates (LocalGaloisDeformationRings §F.2.6). The same holds with `Q_n` added, the framing set staying `S`; the frame
variables are extra directions, not generated by traces (KW final, §4.1.2, Proposition 4.1, p. 38;
§9.1.1, p. 80).

The API:

- `KWDeformationData.unframedRing`: `R̄^ψ_S` as the trace subring of `R̄^{□,ψ}_S`.
- `KWDeformationData.univRep`: `ρ^univ_S : G_{F,S} → GL₂(R̄^ψ_S)`.
- `KWDeformationData.framed_powerSeries`: `R̄^{□,ψ}_S ≃ R̄^ψ_S⟦y₁, …, y_{4|S|−1}⟧`.

*Needs:* [6.1](#kw-deformation-data); [LocalGaloisDeformationRings §F.2.6](../LocalGaloisDeformationRings/README.md#framed-unframed-comparison);
[LocalGaloisDeformationRings §F.2.7](../LocalGaloisDeformationRings/README.md#carayol-trace-theorem).

**Checks.**

- **framingVars_rational.** For `F=ℚ` and `S={p,∞}`, there are `4·2−1=7` independent
  frame coordinates. Normalizing a distinguished entry at the `p`-adic frame removes the
  common scalar once; the real frame still has four coordinates.
- **trace_subring_S3.** in the fixed-sign-determinant `S₃` model over `ℤ₅`, with the
  integral matrices `C,S` of LocalGaloisDeformationRings §F.1.5, prime-to-five order gives no unframed deformation
  directions. The unframed ring and closed trace ring are `ℤ₅` (`tr C=−1`, `tr S=0`),
  while one frame in this general profinite-group model, outside the KW arithmetic data,
  gives `ℤ₅⟦a,b,c⟧`. Conjugating by `1+εE₁₂` changes the matrices
  but leaves all traces constant: the three frame directions never enter the trace ring.
- **framed_not_trace_generated.** `R̄^{□,ψ}_S` is not generated by traces when `|S| ≥ 1`, since the framing
  variables are not traces (LocalGaloisDeformationRings §F.2.7, **traceGen_framed_fails**).

<a id="factorization-through-local-conditions"></a>

### 6.3 Representations satisfying the local conditions factor through the quotient

**Theorem.** Let `A` be reduced, `𝒪`-flat and finite over `𝒪`, and let `ρ` be a rank-two lift of
determinant `ψχ_p` over `A`. If every specialization `A → 𝒪′` to the integers of a finite coefficient
extension satisfies each prescribed local condition at `S`, the classifying map `R^ψ_S → A` factors
uniquely through `R̄^ψ_S`, and likewise for the framed rings. The reduced flat local quotients are
characterised by their `𝒪′`-points, so the specializations detect their defining equations. With `Q_n`
added, check compatibility with the diamond structures and, for `p = 2`, with twists. The Hecke algebra
and its Galois representation are a consumer's separate input (KW final, Lemma 9.1 and its proof,
pp. 80–81; Definition 2.4, p. 10).

*Needs:* [6.2](#trace-subring-universal-representation); [6.1](#kw-deformation-data);
[5.5](#taylor-wiles-inertia-action); [4.9](#twisting-action).

**Checks.**

- **factor_A_O.** for `A = 𝒪` the statement is the point criterion of the local conditions
  (LocalGaloisDeformationRings 8.2, `KWCondition.points`).
- **factor_needs_reduced.** take the reduced flat quotient `R = 𝒪⟦x⟧ ↠ R̄ = 𝒪`, `x ↦ 0`, and
  the finite flat nonreduced algebra `A = 𝒪[ε]/(ε²)`. The map `x ↦ ε` does not factor through
  `R̄`, although every specialization to `𝒪′` kills `ε` and factors through `R̄`. Reducedness
  cannot be omitted from the point-detection argument.
- **factor_residue.** for `A = k` there are no characteristic-zero specializations, but the
  residual point does factor through every local quotient with residue field `k`. Thus `k`
  itself is not a counterexample to factorization.
- **factor_torsion_thickening.** with the same `R ↠ R̄`, take `A = k[ε]/(ε²)` and `x ↦ ε`. There
  are no characteristic-zero specializations and this map does not factor. This example
  violates both flatness and reducedness; it does not claim their independent necessity.

<a id="taylor-wiles-deformation-system"></a>

### 6.4 The Taylor–Wiles system of deformation rings

**Construction.** For `p` odd write `B` for the condition-specific local tensor ring, `d = 3|S|`, `h` for
the original dual Selmer dimension and `j = 4|S| − 1`. Choose the constant-size sets `Q_n` (5.7) and
generators `δ_i` of their `h` diamond factors. Construct compatible surjections
`B⟦x₁, …, x_{h+j−d}⟧ ↠ R̄^{□,ψ}_{S∪Q_n} ↠ R̄^{□,ψ}_S`. Make the middle ring an `𝒪⟦y₁, …, y_{h+j}⟧`-algebra: the
first `h` variables map to `δ_i − 1` and the remaining `j` are frame coordinates. Killing the first `h`
recovers the base framed ring; killing all of them recovers `R̄^ψ_S`. The completed diamond-group
algebra relations `(1 + y_i)^{|Δ_{v_i}|} − 1` lie in the ideal generated by `(1 + y_i)^{pⁿ} − 1`. This
finite-level ring system is the export; its modules and the patched limit belong to the modularity and
patching roadmaps (KW final, proof of Proposition 9.2, display (∗∗), p. 82; Gee, after
Proposition 5.10, p. 39).

The API:

- `TWSystem`: for each `n`, `R̄^{□,ψ}_{S∪Q_n}` with its `B⟦x⟧`-presentation and `𝒪⟦y⟧`-algebra structure.
- `TWSystem.quot_y_eq`: `R̄^{□,ψ}_{S∪Q_n}/(y₁, …, y_h) ≅ R̄^{□,ψ}_S`.
- `TWSystem.quot_all_eq`: `R̄^{□,ψ}_{S∪Q_n}/(y₁, …, y_{h+j}) ≅ R̄^ψ_S`.
- `TWSystem.numVars_const`: the number `h + j − d` of `x`-variables is independent of `n`.

*Needs:* [6.1](#kw-deformation-data); [6.2](#trace-subring-universal-representation);
[5.7](#odd-taylor-wiles-primes); [5.8](#taylor-wiles-generator-count);
[5.5](#taylor-wiles-inertia-action); [4.3](#enlarging-ramification).

**Checks.**

- **twSystem_h_zero.** for `h = 0` the system is constant.
- **twSystem_cyclic_augmentation.** a single diamond factor `C₃` over `ℤ₃` has algebra
  `ℤ₃⟦z⟧/((1+z)³−1)`. Augmentation kills `z` and gives `ℤ₃`; modulo `z²`
  the relation becomes `3z=0`, leaving a torsion tangent direction. Thus removing
  the entire diamond variable differs from merely removing its square.
- **twSystem_not_p2.** the odd-`p` construction does not extend by substituting `p = 2`: in the
  nonsolvable dyadic setting, distinct-eigenvalue Frobenius elements fail to detect the `Ad⁰/Z`
  constituent, and the determinant-on-`S` rings and the counts of 6.6 are used instead; it is not
  claimed that every dyadic dual Selmer group is nonzero.

<a id="patching-numerology"></a>

### 6.5 The numerical coincidence for patching

**Theorem.** With `dim B = 1 + d`: for `p` odd, `1 + d + (h + j − d) = 1 + h + j`, the dimension of
`𝒪⟦y₁, …, y_{h+j}⟧`. In the dyadic construction `t = 2 − |S| + h`, and the source has `h + j + t − d = 2h + 1`
generators and dimension `1 + h + j + t`. In Gee's framing convention the two corresponding source
dimensions both equal `4|T| + r`. These comparisons use the specific local-ring dimensions and the chosen
framing variables, not a general claim about the dimension of global deformation rings (KW final, proof of
Proposition 9.2, (II), p. 83; proof of Proposition 9.3, p. 86; Gee, §5.6, p. 40).

*Needs:* [6.1](#kw-deformation-data); [6.4](#taylor-wiles-deformation-system);
[6.6](#dyadic-patching-data) for the dyadic source; [5.4](#dyadic-taylor-wiles-primes).

**Checks.**

- **numerology_odd.** `h + j − d = h + |S| − 1`, the Khare–Wintenberger count of 5.8.
- **numerology_dyadic.** `h + j + t − d = 2h + 1`, the count (5) of 5.4.
- **numerology_integers.** all identities hold in `ℤ`; with `t = 2 − |S| + h` negative for large `S`, a
  natural-number version would be wrong.

<a id="dyadic-patching-data"></a>

### 6.6 The finite-level data for `2`-adic patching

**Construction.** At `p = 2` let `h = |Q_n|`, `t = 2 − |S| + h` and `G_n` the auxiliary abelian group of 5.4.
Choose an identification `G′_n = G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})^t` and a compatible surjection `ℤ^t ↠ G_n`.
Its dual embeds `G_n*` in `T = Ĝ_m^t` and identifies `(G′_n)*` with `T[2^{n−2}]`. Construct the pair
`R′_n = R̄^□_{S∪Q_n}`, with determinant imposed only on `S`, and `R_n = R̄^{□,ψ}_{S∪Q_n}`. Keep the determinant
map into `G_n*`, its fibre-one equation, its square-equivariance, the free twisting action, the
`B`-presentation in `h + j + t − d` variables and the compatibility with diamond elements. The lattice
presentation puts the determinant map into `T`, while the chosen quotient supplies the torsion subgroup
used for the action chunks of 4.7; levels `n + a` with `a ≥ 2` give chunks compatible with the required
truncations. These are the finite-level inputs of the dyadic patching argument (KW final, §9.1.3,
Proposition 9.3 (I)(3), p. 84; proof of Proposition 9.3, pp. 84–87).

The API:

- `DyadicPatchingDatum`: `(R′_n, R_n, ℤ^t ↠ G_n` compatible with `G′_n`, `d_n`, twisting action,
  presentation`)` at level `n`.
- `DyadicPatchingDatum.fiber_eq`: `Sp R_n = d_n⁻¹(1)`.
- `DyadicPatchingDatum.d_sq`: `d_n(λρ) = λ²d_n(ρ)`.
- `DyadicPatchingDatum.action_free`: the twisting action is free.

*Needs:* [5.4](#dyadic-taylor-wiles-primes); [4.8](#determinant-fixed-on-S);
[4.10](#twist-action-free); [4.5](#diagonalizable-groups); [5.5](#taylor-wiles-inertia-action);
[6.1](#kw-deformation-data).

**Checks.**

- **dyadic_t_zero.** for `t = 0`, `T` is trivial and `R′_n = R_n`.
- **dyadic_cyclic_four_fibre.** model the finite-character part with `G_n=C₄`,
  `G_n/2G_n=C₂`, `X′=μ₄` acting on itself by translation and `d(u)=u²`. Its
  determinant-on-`S` ring is `ℤ₂⟦z⟧/((1+z)⁴−1)` and the globally fixed fibre
  is `ℤ₂⟦z⟧/((1+z)²−1)`, namely `μ₂`. Over `ℤ₂[i]`, twisting the point `u=1`
  by `i` moves it out of this fibre, while twisting by `−1` preserves it. The
  order-two quotient supplies the preserving subgroup, not all of `μ₄`.
- **dyadic_chunk_level.** for the cyclic order-four model,
  `(1+z)⁴−1 = 4z+6z²+4z³+z⁴ ∈ (2,z)³`. Thus `μ₄` and the formal torus
  have the same points on Artinian coefficients with `𝔪³=0`, although their
  untruncated coordinate rings and determinant fibres differ.
- **dyadic_not_fixed_det.** the fixed-determinant rings `R_n` alone carry only the `2`-torsion
  `G*_{n,2}`-action, not a torus action (4.7, **chunks_not_untruncated**).

### Examples

- For `F = ℚ` and `S = {p, ∞}` with `p` odd: `d = 6`, `j = 7`, and the system has `h + 1` power-series
  variables over `B` for every `n`, matching `dim = 1 + h + 7`.
- At `p = 2`, `F = ℚ` and `S = {2, ∞}`: `t = h` and the source has `2h + 1` generators.

### Dependencies

Layers R04.3–R04.5; LocalGaloisDeformationRings §§F.2.1–F.2.11, F.4.12; LocalGaloisDeformationRings 1.11, 1.14, 2.5, 8.2, 8.17;
[LocalGaloisDeformationRings §F.0.1](../LocalGaloisDeformationRings/README.md#completed-coefficient-products); SchemeAndStackFoundations §§0.16, 0.20–0.21.

## Layer G8: Variable-determinant global problems

This layer uses the full adjoint and local coefficient rings `Λ_v`. It supplies the non-polarized global
rings of ACC and their fixed-determinant quotients, and comes before the arbitrary-rank Taylor–Wiles
applications of G7.

<a id="variable-determinant-problem"></a>

### 7.1 Global deformation problems with variable determinant

**Definition.** In the ACC setting assume `F` a number field, `ρ̄` continuous and absolutely irreducible
of rank `n`, `p ∤ 2n`, and a coefficient field containing the images of all embeddings of `F`. Choose a
finite `S` containing the places above `p` and the residual ramification; for each `v ∈ S` take
`Λ_v ∈ CNL_𝒪` and a strict-conjugation-stable, quotient-represented local lifting subfunctor `D_v` on
`CNL_{Λ_v}`. Put `Λ = ⊗̂_{v∈S} Λ_v` and `𝒮 = (ρ̄, S, (Λ_v), (D_v))`. A global lift over `CNL_Λ` is unramified
outside `S` and lies in `D_v` locally; no determinant equation is imposed. Strict classes and `T`-framed
classes use the simultaneous action of 3.3. The local quotient, strict stability, coefficient and
residue compatibility are part of the local data (ACC arXiv v2, §6.2.1, Definition 6.2.2, p. 136; ACC
published, Definition 6.2.2, printed p. 1032).

The API:

- `GlobalDeformationProblem`: `(ρ̄, S, {Λ_v}, {D_v})` with each `D_v` strict-conjugation-stable and
  quotient-represented.
- `GlobalDeformationProblem.IsOfType`: `ρ` is unramified outside `S` and `ρ|G_{F_v} ∈ D_v(A)` for all
  `v ∈ S`.
- `GlobalDeformationProblem.framedDef`: the functor `D^T_𝒮` of `T`-framed deformations of type `𝒮` on
  `CNL_Λ`.

*Needs:* [LocalGaloisDeformationRings §F.3.1](../LocalGaloisDeformationRings/README.md#local-deformation-problem); [LocalGaloisDeformationRings §F.3.2](../LocalGaloisDeformationRings/README.md#deformation-problem-ideal);
[LocalGaloisDeformationRings §F.1.1](../LocalGaloisDeformationRings/README.md#lifting-functor); [LocalGaloisDeformationRings §F.1.3](../LocalGaloisDeformationRings/README.md#strict-deformation-functor); LocalGaloisDeformationRings 1.1 and 1.15.

**Checks.**

- **problem_unrestricted.** among lifts already factoring through `G_{F,S}`, unrestricted `D_v` impose no
  further condition; they do not remove the requirement of being unramified outside `S`.
- **isOfType_unramified_conjugate.** over `𝔽₃[ε]` take an unramified rank-two
  local lift with Frobenius `diag(1,−1)` and inertia `1`. Strict conjugation by
  `1+εE₂₁` changes Frobenius to `[[1,0],[2ε,−1]]` but keeps every inertia matrix
  equal to `1`. Hence the unramified local condition is preserved even though a
  condition fixing the displayed Frobenius matrix is not.
- **fixed_matrix_not_problem.** for the `𝔽₃[ε]` example of LocalGaloisDeformationRings §F.3.1 the prescription `ρ(σ) = diag(1, −1)` fails
  strict-conjugation stability, while prescribing the central matrix `1` gives no such
  counterexample.

<a id="variable-determinant-representability"></a>

### 7.2 Representability and framing

**Theorem.** The unframed and `T`-framed type-`𝒮` functors are represented by `R_𝒮` and `R^T_𝒮` in `CNL_Λ`.
If `T` is nonempty and `v₀ ∈ T`, choose a universal representative and normalise one frame entry to get
`R^T_𝒮 ≅ R_𝒮 ⊗̂_𝒪 (𝒪⟦X_{v,i,j}⟧/(X_{v₀,1,1}))`, formally smooth over `R_𝒮` with `n²|T| − 1` frame variables; the
universal frame tuple is `1 + (X_{v,i,j})`. For `T` empty use `R_𝒮` directly. The full adjoint and the
residual absolute irreducibility of the ACC setting are kept (ACC arXiv v2, Theorem 6.2.3 and
Lemma 6.2.4, p. 137; ACC published, printed p. 1033).

*Needs:* [7.1](#variable-determinant-problem); [LocalGaloisDeformationRings §F.2.3](../LocalGaloisDeformationRings/README.md#universal-lifting-ring);
[LocalGaloisDeformationRings §F.2.2](../LocalGaloisDeformationRings/README.md#phi-p-global); [LocalGaloisDeformationRings §F.2.5](../LocalGaloisDeformationRings/README.md#universal-deformation-ring); [LocalGaloisDeformationRings §F.2.6](../LocalGaloisDeformationRings/README.md#framed-unframed-comparison);
[LocalGaloisDeformationRings §F.1.5](../LocalGaloisDeformationRings/README.md#strict-vs-full-conjugacy); [LocalGaloisDeformationRings §F.3.2](../LocalGaloisDeformationRings/README.md#deformation-problem-ideal).

**Checks.**

- **varDet_rank_one.** for `n = 1` with all `D_v` unrestricted and `Λ_v = 𝒪`,
  `R_𝒮 = 𝒪⟦G_{F,S}^{ab,(p)}⟧`.
- **varDet_frame_count.** `n = 2`, `|T| = 3` gives `11 = 4·3 − 1` frame variables.
- **varDet_T_empty.** for `T = ∅` there are no frame variables, not `−1`.

<a id="variable-determinant-presentation"></a>

### 7.3 Presentation over the local rings

**Theorem.** For nonempty `T ⊆ S`, require `Λ_v = 𝒪` outside `T` and put `R^{T,loc}_𝒮 = ⊗̂_{v∈T} R_v`. Let
`L¹_v ⊆ Z¹(F_v, ad ρ̄)` be the tangent subspace and `L_v` its image in `H¹`. The full-adjoint framed complex
below identifies the relative tangent space, and there is a local `Λ`-algebra surjection
`R^{T,loc}_𝒮⟦X₁, …, X_g⟧ ↠ R^T_𝒮` with `g = h¹_{𝒮,T}(ad ρ̄)` given by the displayed formula, using
SelmerIwasawaCohomology §2A.3; the orthogonal conditions apply at `S ∖ T`, and the scalar directions stay in
this variable-determinant complex (ACC arXiv v2, §6.2.22 and Proposition 6.2.24 with its proof,
pp. 143–146; ACC published, Proposition 6.2.25, printed p. 1041).

The global full-adjoint complex has degree zero `C⁰(G, ad)`, degree one `C¹(G, ad) ⊕ ⊕_T C⁰(G_v, ad)`,
degree two `C²(G, ad) ⊕ ⊕_T C¹(G_v, ad) ⊕ ⊕_{S∖T} C¹(G_v, ad)/L¹_v`, and the analogous mapping-fibre terms
in higher degrees, with the sign convention of 3.6. For the ordinary dual kernel impose `L_v^⊥` only
outside `T`. Then

```text
g = h¹_{𝒮^⊥,T}(ad ρ̄(1)) − h⁰(G, ad ρ̄(1)) − Σ_{v|∞} h⁰(G_v, ad ρ̄) + Σ_{v∈S∖T} (dim L_v − h⁰(G_v, ad ρ̄)).
```

The full-adjoint trace pairing identifies the dual with `ad(1)`; it uses no trace-zero hypothesis and no
`|T| − 1` correction borrowed from the fixed-determinant complex.

*Needs:* [7.2](#variable-determinant-representability); [3.6](#relative-tangent-space);
ArithmeticGaloisDuality R02.4 and D8.1; SelmerIwasawaCohomology §2A.3.

**Checks.**

- **varDet_count_rank_one.** for `n = 1`, `ad = k` with trivial action; the count involves the scalar
  classes `H¹(G_{F,S}, k)` that the fixed-determinant complex removes.
- **varDet_no_T_minus_one.** the formula contains no `|T| − 1` term; inserting it would double-count the
  scalar directions, which here are genuine deformation directions.
- **varDet_full_adjoint_dual.** the dual module is `ad ρ̄(1)`, not `ad⁰ρ̄(1)`; at `p ∤ n` they differ by the
  summand `k(1)`, whose `H⁰` is nonzero exactly when `ζ_p ∈ F`.

<a id="fixed-versus-variable-determinant"></a>

### 7.4 Fixed against variable determinant

**Theorem.** When all `Λ_v = 𝒪`, use the pullbacks `D_v^χ` of LocalGaloisDeformationRings §F.3.2 to obtain the fixed-determinant
problem `𝒮_χ`. The variable-determinant complex of 7.3 retains `L(D_v)` in the full adjoint;
only the fixed-determinant problem uses `L_v^χ`. The quotient `R_𝒮 ↠ R_{𝒮_χ}` defined by
`det ρ_𝒮(g) − χ(g)`, and its `T`-framed version,
always exist. If `p ∤ n` and every `D_v` is stable under all residually trivial local character twists,
unique `n`-th roots split the functor as fixed determinant times the functor of residually trivial
characters, giving `R_𝒮 ≅ R_{𝒮_χ} ⊗̂_𝒪 𝒪⟦G_{F,S}^{ab,(p)}⟧`. This extension is formally smooth of relative
dimension `rank_{ℤ_p} G_{F,S}^{ab,(p)}` exactly when that finitely generated abelian pro-`p` group is
torsion-free. Fixed Hodge–Tate or inertial data can violate twist stability; for such problems the
quotient statement is kept and the product conclusion is not claimed (ACC arXiv v2, §§6.1–6.2 opening,
pp. 135–136).

*Needs:* [7.2](#variable-determinant-representability); [LocalGaloisDeformationRings §F.2.9](../LocalGaloisDeformationRings/README.md#fixed-determinant-rings);
[LocalGaloisDeformationRings §F.1.7](../LocalGaloisDeformationRings/README.md#fixed-determinant-functors); [3.3](#global-deformation-type).

*Lean:* LocalGaloisDeformationRings §F.2.9 supplies `exists_unique_nthRoot_of_residue_eq_one`
and its boundary examples.

**Checks.**

- **fixedVar_rank_one.** for `n = 1`, all `Λ_v = 𝒪` and unrestricted local conditions,
  `R_{𝒮_χ} = 𝒪` and `R_𝒮 = 𝒪⟦G_{F,S}^{ab,(p)}⟧`. Restrictive local conditions can instead
  cut the fixed-character ring down to a quotient of `𝒪`.
- **fixedVar_p_divides_n.** in characteristic `3` with `ε² = 0`, `(1 + aε)³ = 1`, so `1 + ε` has no cube root
  of the form `1 + aε`; the splitting needs `p ∤ n`.
- **fixedVar_torsion.** take `F = ℚ`, `p = 3`, `S = {3, 7}`, rank one and unrestricted local
  conditions. The global abelian correspondence identifies the maximal abelian pro-`3` quotient
  with `ℤ₃ × ℤ/3`: the first factor is cyclotomic at `3`, and the second is the order-three
  quotient of `(ℤ/7)ˣ`. The ring is
  `𝒪⟦X, Y⟧/((1 + Y)³ − 1)`; its special fibre has the relation `Y³ = 0`, so it is not
  formally smooth. Local roots of unity or class-group torsion alone do not identify torsion
  in this global quotient, because global relations and nonsplit extensions must be accounted for.

### Examples

- Rank one with all `Λ_v = 𝒪` and unrestricted local conditions: the variable-determinant ring
  is the completed group algebra of the maximal abelian pro-`p` quotient, and the fixed-determinant
  ring is `𝒪`.

### Dependencies

Layer R04.3; LocalGaloisDeformationRings §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2; ArithmeticGaloisDuality R02.4 and D8.1; SelmerIwasawaCohomology §2A.3; LocalGaloisDeformationRings 1.1 and 1.15.

## Layer G7: Polarized problems and arbitrary-rank Taylor–Wiles data

The polarized fixed-multiplier branch uses the pairing dictionary of `𝒢ₙ` and its trivial strict
centralizer. The ACC auxiliary-prime branch instead uses G8's variable-determinant problem and enormous
cyclotomic image. Each branch has its own tangent and generator formula.

<a id="polarized-deformation-problem"></a>

### 8.1 Polarized deformation problems

**Definition.** Use the group `𝒢ₙ = (GLₙ × GL₁) ⋊ {1, j}` of ArithmeticGaloisRepresentations §7.4
(`CHTGroup`), with `j(g, μ)j⁻¹ = (μ·ᵗg⁻¹, μ)` and multiplier `ν(j) = −1`. In the CM setting `F/F⁺`
take `p` odd, a finite set `S` of finite places of `F⁺` split in `F` and containing those above `p`.
Let `S_F` be the set of all primes of `F` above `S`, and let `F(S_F)` be the maximal extension of `F`
unramified outside `S_F`. This set is invariant under `Gal(F/F⁺)`, so `F(S_F)/F⁺` is Galois. Put

```text
Γ = Gal(F(S_F)/F⁺),   Δ = Gal(F(S_F)/F),
1 → Δ → Γ → Gal(F/F⁺) → 1.
```

Write `η : Γ → {±1}` for the quotient character. Ramification of `F/F⁺` outside `S` is allowed in
`Γ`; it is not the ordinary maximal-extension group of `F⁺` unramified outside `S`.
Choose one prime `ṽ` over each `v ∈ S` and put `S̃ = {ṽ}`. Compatible separable closures give
local restriction maps `ι_ṽ : G_{F_ṽ} → Δ → Γ`; their images have trivial quotient character.
The chosen `S̃` indexes local deformation data, while `S_F` is the full ramification set over `F`.

Fix a continuous `r̄ : Γ → 𝒢ₙ(k)` with `component ∘ r̄ = η`, equivalently
`r̄⁻¹(𝒢ₙ⁰(k)) = Δ`, and a continuous lift `χ : Γ → 𝒪ˣ` of `ν ∘ r̄`. A polarized lift has
`component ∘ r = η` and `ν ∘ r = χ_A`. Along `ι_ṽ` it is the pair `(ρ_ṽ, χ_A|G_{F_ṽ})` in
`GLₙ(A) × GL₁(A)`, so a local problem `D_v` constrains the `GLₙ` component `ρ_ṽ`.
Quotient by strict `GLₙ`-conjugation and add `T ⊆ S` frames by simultaneous left multiplication.
Polarizations are actual pairings: by the correspondence of §7.4, for `γ₀ ∈ Γ ∖ Δ` the lifts
correspond to triples `(ρ : Δ → GLₙ(A), χ, ⟨ , ⟩)` with
`⟨x, ρ(γ₀²)y⟩ = −χ(γ₀)⟨y, x⟩` and
`χ(δ)⟨x, y⟩ = ⟨ρ(δ)x, ρ(γ₀δγ₀⁻¹)y⟩` for `δ ∈ Δ`.
Use the Schur condition of CHT; absolute irreducibility on `Δ` suffices (CHT, §2.1,
Lemma 2.1.1, p. 7; Definitions 2.2.1 and 2.2.7, pp. 17 and 21; beginning of §2.3, p. 26).

The API:

- `PolarizedDeformationProblem`: `(F/F⁺, S, S̃, 𝒪, r̄, χ, {D_v})`.

ArithmeticGaloisRepresentations §7.4 supplies `CHTGroup` and its triple correspondence;
the polarized deformation problem uses that group and that correspondence.

*Needs:* [LocalGaloisDeformationRings §F.3.1](../LocalGaloisDeformationRings/README.md#local-deformation-problem); [LocalGaloisDeformationRings §F.1.8](../LocalGaloisDeformationRings/README.md#change-of-coefficients);
ArithmeticGaloisRepresentations §7.4.

**Checks.**

- **polarized_CM_ramification.** for `F = ℚ(i)`, `F⁺ = ℚ`, `p = 5` and `S = {5}`, the two primes
  above `5` both belong to `S_F`, and `S̃` chooses one. Since `5` splits but `2` ramifies in
  `ℚ(i)/ℚ`, the intended `Γ` permits ramification at `2`; the ordinary group unramified outside
  `{5}` cannot have this quadratic quotient. The factorizations of `X² + 1` modulo `5` and `2`
  display the splitting and ramification.
- **polarized_rank_one.** for `n = 1` the polarized lifts are the conjugate-self-dual characters with the
  prescribed multiplier.
- **polarized_symplectic_triple.** over `𝔽₅` take `Γ=S₃×C₂`, `Δ=S₃`, the standard
  matrices `C=[[0,−1],[1,−1]]`, `S=[[0,1],[1,0]]`, and central `γ₀` generating `C₂`.
  Put `J=[[0,1],[−1,0]]`, `⟨x,y⟩=xᵀJy`, `χ|Δ=sign`, `χ(γ₀)=1`. Then
  `CᵀJC=J`, `SᵀJS=−J` and `Jᵀ=−J`, verifying both triple identities.
  The CHT lift has `r(γ₀)=(J⁻¹,−1)j` and multiplier `1`; replacing `χ(γ₀)`
  by `−1` breaks the first identity. Its residual restriction to `Δ` is absolutely irreducible.
- **polarized_not_schur.** over `𝔽₅` take `Γ=C₄×C₂`, `Δ=C₄`,
  `ρ(δ)=diag(2,3)`, `χ(δ)=1`, `χ(γ₀)=1` and the same `J`. Both triple
  identities hold, but `diag(1,−1)` commutes with `ρ(Δ)` and satisfies
  `XᵀJ+JX=0`. Thus `1+εX` is a nontrivial strict polarized centralizer.
  This concrete reducible representation fails the CHT Schur condition.

<a id="polarized-representability"></a>

### 8.2 Representability of polarized problems

**Theorem.** For Schur `r̄` on the group `Γ` of 8.1, the `T`-framed polarized type-`𝒮` functor is
represented by `R^{□T}_𝒮`. For every open `U ≤ Γ`, restriction of characters to `U ∩ Δ` is
injective at odd `p`, since `U/(U ∩ Δ)` has order at most two. Thus `Φ_p(Δ)` from LocalGaloisDeformationRings §F.2.2 gives
`Φ_p(Γ)`. Construct the local tensor map and identify its relative cotangent dual with
`H¹_{𝒮,T}(Γ, ad r̄)`. A universal representative gives `R^{□T}_𝒮 ≅ R^univ_𝒮⟦X_{v,i,j}⟧` in `n²|T|`
variables: the fixed-multiplier polarized strict centralizer is trivial at odd `p`, so no scalar frame
variable is removed. The adjoint is `Mₙ(k)` with `(g, μ)` acting by conjugation and `j` by negative
transpose; the `GLₙ` scalar-centralizer count is not reused (CHT, Proposition 2.2.9 and its proof,
pp. 22–24).

*Needs:* [8.1](#polarized-deformation-problem); [LocalGaloisDeformationRings §F.2.3](../LocalGaloisDeformationRings/README.md#universal-lifting-ring);
[LocalGaloisDeformationRings §F.2.2](../LocalGaloisDeformationRings/README.md#phi-p-global); [LocalGaloisDeformationRings §F.3.2](../LocalGaloisDeformationRings/README.md#deformation-problem-ideal).

**Checks.**

- **polarized_frame_count.** `n = 2`, `|T| = 1` gives `4` frame variables, not `3`.
- **polarized_centralizer_trivial.** conjugating `j` by a scalar `(c, 1)` gives `(c², 1)j`, so a residually
  trivial scalar commuting with the image of an element in `Γ ∖ Δ` satisfies `c² = 1`, hence `c = 1`
  for odd `p`; the strict polarized centralizer is trivial.
- **polarized_adjoint_j.** `j` acts on `Mₙ(k)` by `X ↦ −ᵗX`; over `𝔽₂` this is transpose and the invariants
  `gl_n^{𝒢ₙ}` are nonzero, one reason `p` is odd (ArithmeticGaloisRepresentations §7.4).

<a id="polarized-tangent-obstruction"></a>

### 8.3 Tangent and obstruction spaces of polarized problems

**Theorem.** For Schur polarized data on `Γ` of 8.1 and a small extension with kernel `I`, choose
lifts of the local representations in their prescribed problems at every place in `S`, including the prescribed
framed local lifts at `T`. The obstruction to a compatible global lift then lies in
`H²_{𝒮,T}(Γ, ad r̄) ⊗_k I`, and vanishes exactly when such a global lift exists. Without
chosen local lifts this obstruction is not asserted; liftability outside `T` supplies them for the
relation bound in 8.4. Prove the long exact sequence and the arithmetic comparisons: `Hⁱ_rel`
vanishes above degree `3`; `H⁰_rel` is the global `H⁰` when `T` is empty and zero otherwise;
`h³_rel = h⁰(Γ, ad r̄(1))`; `h²_rel` is the ordinary dual Selmer dimension. With `χ(c_v) = ±1`, the Euler
characteristic `Σ(−1)ⁱhⁱ_rel` is `Σ_{v|∞} n(n + χ(c_v))/2 + Σ_{v∈S∖T} (h⁰(G_{F_ṽ}, ad r̄) − dim L_v)`. The global
Euler formula uses restriction to `Δ = G_{F,S_F}` and index-two prime-to-`p` descent from
ArithmeticGaloisDuality R02.2/D7. The carrier `Γ` allows the ramification of `F/F⁺` outside `S`.
If `p ∤ n`, the adjoint splits as its trace kernel and a scalar line on which
`j` acts by `−1`; if `p | n` this fails and the full adjoint is kept (CHT, Lemmas 2.2.8, 2.2.11, 2.1.3,
2.3.3 and 2.3.4, pp. 8–32).

*Needs:* [8.2](#polarized-representability); [3.7](#local-to-global-presentation)
for the obstruction construction; ArithmeticGaloisDuality R02.2, R02.4, D7 and D8.1; SelmerIwasawaCohomology §2A.3.

**Checks.**

- **polarized_euler_rank_one.** for `n = 1`, the archimedean contribution is `(1 + χ(c_v))/2`, which is `0`
  for a totally odd multiplier (`χ(c_v) = −1`) and `1` otherwise.
- **polarized_H0_framed.** for nonempty `T`, `H⁰_rel = 0`; for `T` empty it is `H⁰(Γ, ad r̄)`, which is
  `0` for Schur `r̄` and odd `p`.
- **polarized_p_divides_n.** for `p = n = 3`, `tr(1) = 0` in `M₃(𝔽₃)`, so the scalars lie in the trace kernel
  and the splitting fails.
- **polarized_obstruction_needs_local_lifts.** the local problem represented by
  `𝒪⟦x⟧/(x²)` has the point `x ↦ t` over `k[t]/(t²)` and no lift to `k[t]/(t³)`.
  A global obstruction calculation conditional on local lifts cannot supply this missing lift.

<a id="polarized-presentation"></a>

### 8.4 Presentations of polarized deformation rings

**Theorem.** For the polarized data on `Γ` of 8.1, present `R^{□T}_𝒮` over its local tensor ring
in the nonnegative number

```text
g = h¹_{L^⊥,T}(Γ, ad r̄(1)) − h⁰(Γ, ad r̄(1)) + Σ_{v∈S∖T} (dim L_v − h⁰(G_{F_ṽ}, ad r̄)) − Σ_{v|∞} n(n + χ(c_v))/2
```

of variables. If the problems outside `T` are liftable, at most `h¹_{L^⊥,T}(Γ, ad r̄(1))` relations are
needed, and then

```text
dim R^{□T}_𝒮 ≥ 1 + Σ_{v∈T} (dim(R^loc_v/I_v) − 1) + Σ_{v∈S∖T} (dim L_v − h⁰(G_{F_ṽ}, ad r̄)) − h⁰(Γ, ad r̄(1)) − Σ_{v|∞} n(n + χ(c_v))/2.
```

The local conditions must be nonempty problems for the chosen residual representation; the rank-`n`
`p`-adic problems come from LocalGaloisDeformationRings Layers 1, 3 and 6 and the problems away from `p`
from its Layer 2, with their actual tangent dimensions and liftability. A torsion-free quotient and a
reduced generic fibre have their own roles in component arguments and are not substituted for the
representing ring here (CHT, Corollaries 2.2.12, 2.2.13 and 2.3.5, pp. 25 and 32).

*Needs:* [8.3](#polarized-tangent-obstruction); [8.2](#polarized-representability);
[LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4; LocalGaloisDeformationRings Layers 1, 2, 3 and 6.

**Checks.**

- **polarized_g_nonnegative.** `g` is computed in `ℤ` and shown nonnegative before it indexes variables.
- **polarized_liftability.** without liftability outside `T` only the generator count holds, not the
  relation bound (compare 3.7, **presentation_needs_liftability**).
- **polarized_dim_rank_one.** for `n = 1`, `T = S` and totally odd multiplier, the archimedean term vanishes
  and the bound reads `1 + Σ_{v∈T}(dim(R^loc_v/I_v) − 1) − h⁰(Γ, ad r̄(1))`.

<a id="taylor-wiles-local-diamond"></a>

### 8.5 Taylor–Wiles places in rank `n`

**Construction.** In the ACC rank-`n` setting take `v ∤ p` with `q_v ≡ 1 (mod p)`,
`ρ̄` unramified at `v` and an ordering of `n` distinct `k`-rational eigenvalues of
arithmetic `ρ̄(Frob_v)`. Start from the unrestricted framed local ring of
LocalGaloisDeformationRings 1.1. Construct here its coefficient-natural decomposition
into `n` labelled character deformations, using Hensel projectors and the tame relation
as in the rank-two local construction. The characters are unique and the diagonalizing
basis is determined up to rescaling each line. Independent inertia characters give
`𝒪[k(v)ˣ(p)ⁿ] → R^□_v`, formally smooth of relative dimension `n²`: the `n` unramified
character parameters and `n²−n` basis parameters supply the smooth directions. There
is no fixed determinant or unramified complementary block. For a set `Q` put
`Δ_Q = ∏_{v∈Q} k(v)ˣ(p)ⁿ` and augment `𝒮` by unrestricted local conditions at `Q`.
The orderings make `R^T_{𝒮_Q}` a `Λ[Δ_Q]`-algebra, and the specialization
`R^T_{𝒮_Q} ↠ R^T_𝒮` has kernel the augmentation ideal times `R^T_{𝒮_Q}`. This is the
variable-determinant action with `n` factors per place; 5.5 keeps its fixed-determinant
rank-two constraint (ACC published, §6.2.18, Lemma 6.2.19 and the following paragraph,
pp. 1038–1039, and the Taylor–Wiles datum and `𝒮_Q`, p. 1045; ACC arXiv v2,
§6.2.18, Lemma 6.2.19, p. 143, and the datum, p. 149).

Let `rec_ar` be Tau Ceti's arithmetic reciprocity. ACC uses
`Art_geom(u)=rec_ar(u)⁻¹`. Define the arithmetic-normalized diamond map on the
`i`-th factor by `[u] ↦ γ_i(rec_ar(u))`. Relative to ACC this transports the group
algebra by `[u] ↦ [u⁻¹]` on every factor. The geometric-Frobenius eigenvalues in
ACC's ordering are the inverses of the arithmetic-Frobenius eigenvalues used here.
Use this transport for the action in 8.7 and its exported patching data; augmentation
and generator counts are preserved (ACC published, notation, p. 906).

*Needs:* [7.1](#variable-determinant-problem);
[rank-two local diagonalization](#rank-two-taylor-wiles-local);
LocalGaloisDeformationRings 1.1; ClassFieldTheory Layer 7.

**Checks.**

- **rankn_TW_n1.** for `n = 1` the inertia restriction of the universal character factors through
  `k(v)ˣ(p)`, the local ring is formally smooth of relative dimension `1` over `𝒪[k(v)ˣ(p)]` (the value at
  Frobenius), and `Δ_Q = ∏_{v∈Q} k(v)ˣ(p)`.
- **rankn_TW_factors.** each place contributes `n` cyclic factors, so `Δ_Q` has `n|Q|` factors; the rank-two
  fixed-determinant action of 5.5 has one factor per place, because there the two inertia characters are
  inverse.
- **rankn_TW_ordering.** changing the ordering of the eigenvalues permutes the factors of `k(v)ˣ(p)ⁿ`; the
  algebra structure depends on the ordering, which is part of the datum.
- **rankn_TW_independent_inertia.** For `n=2`, `p=5`, `q_v=11`, over `𝔽₅[ε]`,
  Frobenius `diag(1,−1)` and inertia `(1+ε)I` define an unrestricted ACC lift.
  Its determinant on inertia is `1+2ε≠1` and both characters are ramified;
  fixed-determinant and unramified-complement conditions exclude it.
- **rankn_TW_reciprocity.** For `p=5`, `q_v=11`, a generator of the order-five
  inertia quotient maps to `ζ₅` under one diamond normalization and `ζ₅⁻¹` under
  the other. These differ, while both augment to one. Inverting arithmetic
  Frobenius also inverts each labelled residual eigenvalue.

<a id="enormous-taylor-wiles-primes"></a>

### 8.6 Taylor–Wiles primes for enormous image

**Theorem.** Assume the ACC setting, `F` CM, `ζ_p ∉ F` and `ρ̄(G_{F(ζ_p)})` enormous
(`ResidualImage.IsEnormous`, ArithmeticGaloisRepresentations §7.10), with `k` containing all residual
eigenvalues. For `T ⊆ S`, any `q` at least the ordinary dual Selmer dimension and every `N ≥ 1`, there are
exactly `q` auxiliary primes of degree one with `q_v ≡ 1 (mod pᴺ)` and ordered distinct residual
eigenvalues, outside any given finite avoidance set, killing the augmented dual Selmer group. The
enormous-image and Kummer arguments give detecting elements and an admissible padding class; then apply
5.6, using SelmerIwasawaCohomology §2A.3 to identify its joint kernel with the augmented dual Selmer group. The full adjoint
splitting uses `p ∤ n`, and the scalar Kummer summand uses `ζ_p ∉ F`. Enormous means the exact condition
of §7.10 (no nontrivial `p`-power quotient, vanishing `H⁰` and `H¹` on `ad⁰`, and a regular semisimple
detector on each simple submodule), not adequacy (ACC arXiv v2, Definition 6.2.28, Lemmas 6.2.29 and
6.2.31 with its proof, pp. 148–151; ACC published, §6.2.28, Definition 6.2.29, Lemmas 6.2.30 and 6.2.32,
printed pp. 1044–1046, PDF pp. 148–150).

*Needs:* [8.5](#taylor-wiles-local-diamond); [7.3](#variable-determinant-presentation);
ArithmeticGaloisRepresentations §7.10; [5.6](#chebotarev-selmer-selection); ArithmeticGaloisDuality
D8.1; SelmerIwasawaCohomology §2A.3.

**Checks.**

- **enormous_q_padding.** `q` may exceed the dual Selmer dimension; the padding class of 5.6 supplies the
  extra primes.
- **enormous_zeta_p.** if `ζ_p ∈ F`, the scalar summand `k(1) = k` of `ad ρ̄(1)` has `H⁰ ≠ 0`, the Kummer
  argument fails and the theorem is not claimed.
- **enormous_not_adequate.** adequacy alone does not give the regular semisimple trace-projection
  detectors required on each simple adjoint submodule; the hypothesis is the enormous one.

<a id="enormous-taylor-wiles-presentation"></a>

### 8.7 The Taylor–Wiles presentation of ACC

**Theorem.** Take the variable-determinant ACC problem with `T = S`. Assume `F = F⁺F₀` with `F⁺` totally
real and `F₀` imaginary quadratic, `ζ_p ∉ F`, `p ∤ 2n`, `ρ̄` continuous and absolutely irreducible with
enormous cyclotomic image, and a residue field containing all its eigenvalues. Given `N ≥ 1` and `q` at
least the ordinary dual Selmer dimension, there are a set `Q_N` of size `q` with `q_v ≡ 1 (mod pᴺ)`, lying
over rational primes split in `F₀`, and a local `Λ`-algebra surjection

```text
R^{T,loc}_𝒮⟦X₁, …, X_g⟧ ↠ R^T_{𝒮_{Q_N}},     g = qn − n²[F⁺ : ℚ].
```

Prove `g ≥ 0` in `ℤ` before indexing the variables. The diamond group has `qn` cyclic `p`-power factors,
each of order at least `pᴺ`, with the arithmetic-normalized action and factorwise
inversion transport of 8.5; its augmentation quotient is `R^T_𝒮`. The degree-one selection avoids
the primes ramified in `F₀`, which ensures the splitting assertion. This ring, action, quotient and count
are the input for patching arithmetic complexes; the polarized and fixed-determinant branches keep their
own formulas (ACC arXiv v2, Proposition 6.2.32 and its proof, p. 151; ACC published, Proposition 6.2.33
and its proof, printed p. 1047, PDF p. 151, with the diamond and augmentation data on printed p. 1045).

*Needs:* [8.6](#enormous-taylor-wiles-primes); [7.3](#variable-determinant-presentation);
[8.5](#taylor-wiles-local-diamond).

**Checks.**

- **acc_count_integer.** `g = qn − n²[F⁺ : ℚ]` is an integer identity; for `q < n[F⁺ : ℚ]` it is negative, and
  the nonnegativity (from `q` at least the dual Selmer dimension and the Euler characteristic) is proved
  before use.
- **acc_diamond_factors.** the diamond group has `qn` factors (`n` per place, 8.5), not `q`.
- **acc_split_F0.** a prime ramified in `F₀` would not split, so the avoidance set contains the primes
  ramified in `F₀`.

### Examples

- For `n = 1` the polarized lifts are conjugate-self-dual characters and the variable-determinant ACC
  count is `g = q − [F⁺ : ℚ]`.

### Dependencies

Layers R04.3–R04.5 and G8; LocalGaloisDeformationRings §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2; ArithmeticGaloisRepresentations §7.4 and §7.10; ArithmeticGaloisDuality
R02.4, D7 and D8.1; SelmerIwasawaCohomology §2A.3; LocalGaloisDeformationRings Layers 1, 2, 3 and 6; [LocalGaloisDeformationRings §F.0.2](../LocalGaloisDeformationRings/README.md#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4.

## Downstream consumers

- **GL2ModularityLifting** receives from R04.6 the local base ring, the universal trace representation,
  the finite-level diamond algebras and augmentation maps, the uniform presentations and, at `p = 2`, the
  determinant-on-`S` rings and twisting chunks; it constructs the arithmetic modules and their patching.
  A dimension lower bound here asserts neither finiteness over `𝒪` nor an `R = T` theorem.
- **PotentialAutomorphyInfrastructure** uses G8's global rings, the universal framed restrictions and the
  presentation for the ACC branch, and the polarized branch of G7 only where the pairing, multiplier and
  signs are part of its data; with the matching local conditions of LocalGaloisDeformationRings it
  builds the comparison maps to Hecke algebras. It receives from 8.7 the sets `Q_N`, the ordered
  eigenvalues, the norm congruences, splitting in `F₀`, the arithmetic-normalized `Λ[Δ_Q]`-action
  of 8.5 with `qn` sufficiently large cyclic factors, the augmentation quotient and the nonnegative count `qn − n²[F⁺ : ℚ]`. Auxiliary
  neatness primes serve a different purpose and are not added to the Taylor–Wiles set.
- The generic local deformation framework and block pseudodeformation rings are owned by
  **LocalGaloisDeformationRings**, §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2, F.4.12 and §3.8.
  **GL2ModularityLifting** uses its §F.2.11 for determinant-fixed two-dimensional pseudodeformation
  functors at residually reducible points; the finer comparisons at reducible points are its own.
- **OrdinaryAutomorphicFormsAndModularityLifting**, **PotentialModularityAndCompatibleSystems**,
  **AutomorphicCongruences** and **CompletedCohomologyAndLocalGlobalCompatibility** use the
  representability from LocalGaloisDeformationRings Layer F, the global restriction and twisting
  maps of Layers R04.3–R04.4 and the presentations of
  R04.3, G8 and G7.

## References

Page numbers are printed pages of the cited edition unless marked as PDF pages.

- **Gee.** T. Gee, [*Modularity lifting theorems*](https://arxiv.org/pdf/2202.05818v2), Essential Number
  Theory 1 (2022), 73–126; cited from arXiv:2202.05818v2, whose printed and PDF pages agree.
- **Kisin.** M. Kisin, [*Lectures on deformations of Galois representations*, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf),
  lecture notes, author's page.
- **Chenevier.** G. Chenevier, [*The p-adic analytic space of pseudocharacters of a profinite group and
  pseudorepresentations over arbitrary rings*](https://arxiv.org/pdf/0809.0415v2), in *Automorphic Forms
  and Galois Representations*, vol. 1, LMS Lecture Note Series 414 (2014), 221–285; cited from
  arXiv:0809.0415v2.
- **KW ESI.** C. Khare and J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.esi.ac.at/preprints/esi1892.pdf),
  ESI preprint 1892 (2007); the PDF page is the printed page plus one. Its Lemma 4.3, Proposition 4.4 and
  Lemma 4.5 are Lemma 4.4, Proposition 4.5 and Lemma 4.6 of the final version.
- **KW final.** C. Khare and J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf),
  author's final version (30 May 2009), published in Invent. Math. 178 (2009), 505–586; numbering of the
  final version, pages of the author PDF.
- **BLGGT.** T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, [*Potential automorphy and change of
  weight*](https://arxiv.org/pdf/1010.2561v4), Ann. of Math. (2) 179 (2014), 501–609; cited from
  arXiv:1010.2561v4.
- **ACC arXiv v2.** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton,
  P. Scholze, R. Taylor and J. A. Thorne, [*Potential automorphy over CM fields*](https://arxiv.org/pdf/1812.09999v2),
  arXiv:1812.09999v2 (2022); printed and PDF pages agree.
- **ACC published.** The same authors, *Potential automorphy over CM fields*, Ann. of Math. 197 (2023),
  897–1113; printed page = PDF page + 896 in the [author-hosted published PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf).
  Published Definition 6.2.29, Lemma 6.2.32, Proposition 6.2.25 and Proposition 6.2.33 are arXiv-v2
  Definition 6.2.28, Lemma 6.2.31, Proposition 6.2.24 and Proposition 6.2.32.
- **CHT.** L. Clozel, M. Harris and R. Taylor, [*Automorphy for some l-adic lifts of automorphic mod l
  Galois representations*](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Publ. Math. IHÉS
  108 (2008), 1–181.
- **Calegari–Geraghty.** F. Calegari and D. Geraghty, [*Modularity lifting beyond the Taylor–Wiles
  method*](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Invent. Math. 211 (2018), 297–433;
  §§8.5–8.6 give a fixed-determinant comparison distinct from the enormous-image theorem of 8.7.
- **Taylor.** R. Taylor, [*On the meromorphic continuation of degree two L-functions*](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf),
  Doc. Math., Extra Volume Coates (2006), 729–779; Lemma 2.5 on printed pp. 749–750. It is reference [59]
  of KW final, and its argument assumes `l > 3`.
