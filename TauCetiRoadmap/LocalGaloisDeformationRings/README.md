# Roadmap: local Galois deformation rings and their components

**Summary.** Build generic deformation functors and representing rings, then local framed lifting rings, their tangent and obstruction theory, tame conditions, Hodge-type quotients, finite-flat model resolutions, ordinary flag spaces and component comparisons. The outputs are actual universal rings, maps between them and descriptions of their components, for modularity lifting, potential automorphy, compatible systems and patching. Explicit small-rank equations distinguish a condition from its reduced flat closure, a flag space from its image and a full Weil–Deligne type from an inertia type.

## Scope and ownership

A framed ring, an unframed ring, a flag-incidence scheme and its flag-forgetting image have separate universal properties. Each condition retains the residual basis, coefficient category, determinant or multiplier, ordered characters and extension data. Point criteria quantify over finite coefficient algebras, including nonreduced ones whenever the theorem does.

`SchemeAndStackFoundations`, §4.2 supplies the coefficient categories. Layer F constructs the generic deformation functors, strict equivalence, continuous representability, local deformation problems and inertia-rigid rings. `ArithmeticGaloisRepresentations`, §7.4 supplies the polarized group, fixed-multiplier representations and CHT coset/pairing dictionary for arbitrary index-two groups. The local polarized conditions and nodal model are [2.12](#t2-12). Build the generic foundations before their local specializations in Layers 0–8.

`DeformationAndDerivedPatchingAlgebra` owns the common complete-local coproduct (§1.12), relative presentation and relation algebra (§§2.1–2.5), continuous framed matrix ring (§§2.6–2.7), ungraded canonical-module/type interface (§3.9) and pointed tensor comparison (§4.6). Sections F.0.1–F.0.2, F.2.3–F.2.4 and 0.1 specialize these carriers and maps to `C_𝒪`. The arithmetic tangent and obstruction assignments, local conditions, graded canonical-module comparison and `Φ_p`/Schlessinger representability argument belong here; the latter identifies its representing pair with the common framed pair.

Period rings and field-valued admissibility use `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.0–R07.3.3 and R07.4.13. Targets [0.2](#t0-2)–[0.4](#t0-4) construct the coefficient, ordinary and `(φ,Γ)` interfaces used here. `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1,R07.3,R07.4` owns finite-flat, scalar Fontaine–Laffaille and Breuil–Kisin categories and realizations. Target [1.6](#t1-6) owns the common coefficient Fontaine–Laffaille category, labelled decomposition, covariant realization and coefficient-change comparisons, including free-lattice and finite-torsion specializations. `AutomorphicGaloisRepresentations`, §1.5a consumes those specializations for its labelled tame-inertia formulas, interval twists and automorphic applications. The deformation applications and model spaces belong here. Target [1.7](#t1-7) owns the ordinary flag predicate and elementary flag API, with its definitions preceding [0.3](#t0-3); `PadicHodgeTheory`, §3.6 consumes its field-valued specialization for crystalline slope, monodromy and descent comparisons. Completed coefficient products and presentations use [F.0.1](#completed-coefficient-products) and [F.0.2](#minimal-relative-presentations); canonical-module tests are target [0.1](#t0-1), and excellence uses `SchemeAndStackFoundations`, §0.21; flags and lattice representability belong to `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and §1.7, and formal functions and algebraization to `SchemeAndStackFoundations`, §§4.9–4.10, and `AdicSpacesPartIII`, `F0`.8.

Tau Ceti's `LocalGaloisGroups`, Layers 3 and 7, supplies finite generation of the maximal pro-`p` Galois group over each finite local extension, hence the `p`-finiteness used here. `LocalFieldsRamification` supplies the full tame quotient, whose inertia is the whole prime-to-`ℓ` tame inertia. Target 2.6 instead removes the kernel of inertia's projection to its coefficient-`p` factor `ℤ_p`. The Tau Ceti module `NumberTheory/LocalField/Tame/PadicCharacter` already supplies `inertiaPadicTameCharacter`, its surjectivity, kernel criterion and arithmetic Frobenius conjugation. Target 2.6 consumes that character to construct the coefficient-`p` quotient and its matrix-pair universal property. The local Galois group, tame character and full tame quotient are not targets here.

Tau Ceti `FieldTheory/GaloisCohomology/Kummer` already supplies `TauCeti.kummerIso`, `TauCeti.kummerIso_res` for separable field embeddings, and `TauCeti.kummerIso_norm` for finite extensions. These basic Kummer maps are inputs, not local deformation targets. The coefficient-completed, decomposition-equivariant valuation sequence required for 8.9 is the further interface below. Tau Ceti's `IntegralHeckeAndGaloisDeterminants`, Layers IHG.0–IHG.1, owns determinant polynomial laws, pseudocharacters and generalized matrix algebras; continuous pseudodeformation representability is [F.2.11](#pseudodeformation-rings). Target 3.8 adds the block-centre comparison and its full-WD quotient.

Tau Ceti `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule` supplies `TauCeti.ClassFieldTheory.dualityMap0_kummerCoeff_bijective`, `dualityMap1_kummerCoeff_bijective` and `dualityMap2_kummerCoeff_bijective` for a finite discrete `G_K`-module killed by `n` invertible in `K`, with dual `Hom(−,μ_n)`. Finite-module Tate duality is therefore an input. The `κ`-linear, natural-topology comparisons required below remain the additional cohomology supplier contract; they are not new finite-module duality targets here.

`ReductiveGroups`, Layers 0, 7 and 9, owns affine group schemes, Lie theory, field-valued Borel theory and split integral forms. Target [1.21](#t1-21) constructs the relative Borel and parabolic schemes, local coefficient-ring conjugacy and canonical-torus comparisons used here. `ArithmeticGaloisRepresentations`, §§7.3–7.5 supplies the integral symplectic matrix carrier and multiplier. Tau Ceti `LinearAlgebra/Matrix/SymplecticMultiplier` already identifies the multiplier with the determinant in rank two; that identity is not a target. Rank-four ramification and ordinary deformation conditions here retain their local Galois, flag and coefficient data.

Global presentations, dual Selmer conditions, compatible systems and general patching stay with their respective roadmaps. The restricted arbitrary-rank away-from-`p` arithmetic cycle functor in 2.27, the local `GL₃` weak patching interface in 6.30 and the block pseudodeformation identification in 3.8 are the precise arithmetic inputs constructed here. The first includes Shotton's scoped globalization, finite-level coefficient functors and automorphy input for cycle descent; its abstract patching algebra remains with `DeformationAndDerivedPatchingAlgebra`. Division-algebra transfer and types, local-model geometry, endpoint classification and family admissibility are the targets and exact imports below; no application asserts that its supplier's theory already exists. Further locally algebraic trianguline geometry belongs to the trianguline-variety direction.

The canonical nonarchimedean local Jacquet–Langlands correspondence for central division algebras belongs to [2.26.1](#t2-26-1). `GL2AutomorphicRepresentationsAndTransfer`, R17.1.1, consumes its degree-two specialization, with the same isomorphism-class carriers, coefficient transport, inverse and character normalization. That roadmap owns the quaternionic local/global packaging and the split and real comparisons; division-algebra types, partition refinements, virtual inverse extension and deformation-cycle applications belong here.

## Conventions

Fix `d≥1`, the coefficient prime `p`, and a finite extension `K/ℚ_ℓ`, except in the explicitly equal-characteristic application. Away from `p`, `q` is `K`'s residue cardinality; above `p`, `f=[K:ℚ_p]`. Let `E/ℚ_p` be finite, `𝒪` its complete discrete valuation ring, `ϖ` a uniformizer, and `k` its finite residue field. The coefficient category `C_𝒪` consists of complete separated Noetherian local `𝒪`-algebras `A`, with an identified residue field `A/𝔪_A≅k` and their maximal-ideal topology. Artinian objects have a surjective residue map `A→k` with kernel exactly `𝔪_A`. Morphisms are continuous local `𝒪`-algebra maps inducing the specified residue identification. An unrelated map to a field or an arbitrary topology is insufficient.

Residual representations are continuous for discrete `k`. In Layers 0–8 take `Γ=G_K`. Layer F defines functors for arbitrary profinite `G`; its Noetherian representing-ring targets require Mazur's `Φ_p` condition: `Hom_cont(U,𝔽_p)` is finite for every open subgroup `U`. The countable product `∏_ℕ C_p` fails this condition, already for the trivial rank-one residual representation: its independent coordinate characters give an infinite-dimensional tangent space. All Noetherian lifting rings and their universal maps use this group hypothesis and the actual coefficient category.

`R□` represents actual lifts in a fixed residual basis; `R` represents strict classes under `End_Γ(ρ̄)=k`. `LiftingRing`, `ConditionRing` and `GenericFibre` mean the framed ring, its specified quotient and localization at `ϖ`. A quotient's point criterion specifies whether it uses every finite `E`-algebra or just field-valued points. Residual conjugacies and coefficient extensions are transported explicitly. A fixed determinant `ψ` is a continuous lift of `det ρ̄`, not a new free parameter hidden in a ring name.

Integral dimension is one plus relative dimension for the nonzero flat rings here; generic dimension is over `E`. The zero ring is allowed for type quotients and has no component dimension. Relative determinant presentations use `ad⁰` even when `p` divides `d`; integral scalar splitting requires `p∤d`. For generalised reductive `G`, set `G^der=(G⁰)^der` and likewise `H^der=(H⁰)^der`. Fixing the entire quotient representation into `G/G^der` uses `dim G^der`; this quotient can be noncommutative when `G` is disconnected. Abelianisation terminology applies to connected `G`; apply the schematic derived-subgroup construction to `G⁰`. `G`-valued lifts mean points of a specified smooth affine group scheme over `𝒪` with its base-change functor, not independently chosen subgroups of `GL_d(A)`.

Ordinary-character reciprocity sends a uniformizer to geometric Frobenius. Tau Ceti `ClassFieldTheory`, Layer 7, uses arithmetic reciprocity, so compose with inversion. The tame relation uses arithmetic `φtφ⁻¹=t^q`; inert quadratic places use `q²`. `HT(ε)=+1`. Negate labelled Hodge–Tate weights from `HT(ε)=−1` sources, while retaining the contravariant `D*` and covariant Fontaine–Laffaille dictionaries. Ordinary highest weights `λ` give ordered characters of weights `−λ_{τ,d−i+1}−i+1`. The rank-two weight-zero shape has `{0,−1}`, and its dual KW shape has `{0,1}`. LLHLM uses the same positive cyclotomic convention: type `η=(2,1,0)` has actual labelled Hodge–Tate weights `{0,1,2}`. Its contravariant `T*_dd` accounts for the descent type `τ∨` and realizes the original representation; it does not dualize that representation again ([LLHLM20], §1.4, p. 7, Definition 3.1.3 and Remark 3.1.5, p. 21).

Full types away from `p` retain `N`; `p`-adic inertia types have finite image and extend to the required Weil action. Full WD types also retain Frobenius. Flat closures may contain dropped-monodromy boundary points. A uniformizer fibre differs from the closed-point fibre of a model resolution. Mathlib `Matrix.symplecticGroup` uses `AJAᵀ=J`; compare it with `gᵀJg=νJ` before using similitudes. In rank four `dim GSp₄=11` and `dim Sp₄=10`.

For the wider `κ`-coefficient category of 1.15, the alternatives carry their actual field data: finite `κ/k`; finite `κ/E`; or `κ=k′((t))` with `k′/k` finite. An Artinian object has residue identified with `κ` and the topology induced by its finite-length coefficient-module presentation: discrete in the finite case, the finite-dimensional `κ`-vector topology in characteristic zero, and the topology from finite-length modules over `𝒪′[[t]][1/t]` in local characteristic `p`. For local `κ` retain a `G_K`-stable lattice over its valuation ring and its adic topology whenever applying `D7` duality. Completion then uses compatible Artinian quotients. These are the natural topologies of [BIP23], Remark 3.32, pp. 25–26, not a choice of arbitrary topological-ring structure.

## Exact supplier contracts

The contracts state the input needed at each boundary. Library declarations below are supplied by Mathlib at `6b7abb3` and Tau Ceti at `a91d3aa`; a citation to a roadmap section specifies its mathematical targets, rather than an imported Lean carrier.

- `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic` supplies `TauCeti.completedGroupAlgebra`, `TauCeti.completedGroupAlgebra.proj`, `TauCeti.completedGroupAlgebra.of`, `TauCeti.completedGroupAlgebra.mk`, `TauCeti.completedGroupAlgebra.lift` and `TauCeti.completedGroupAlgebra.ext`. For a profinite group `Γ` and commutative coefficient ring, this is the inverse limit of the finite quotient group algebras, with its tautological unit-valued character and compatible projections. Its maps induced by continuous group homomorphisms are `TauCeti.completedGroupAlgebra.map` in `TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Map`; coefficient extension is part of targets 1.3 and 1.12. Target 1.3 specializes this carrier to the ordered local unit factors, prescribed residual characters and selected minimal-prime quotient; it does not introduce another completed group algebra.
- `TauCeti.NumberTheory.LocalField.Tame.PadicCharacter` supplies `TauCeti.inertiaPadicTameCharacter`, `TauCeti.inertiaPadicTameCharacter_surjective`, `TauCeti.inertiaPadicTameCharacter_eq_one_iff` and `TauCeti.IsArithFrobeniusLift.inertiaPadicTameCharacter_conj`. For coefficient prime `p` different from the residue characteristic, these give the `p`-primary tame inertia character, its kernel and the arithmetic-Frobenius action by the residue cardinality `q`. Target 2.6 builds the quotient and its representation property using this character.
- `TauCeti.FieldTheory.GaloisCohomology.Kummer` supplies `TauCeti.kummerIso`, `TauCeti.kummerIso_res` and `TauCeti.kummerIso_norm`: for `n` invertible in the field, the power-class quotient is multiplicatively isomorphic to `H¹(G_K,μ_n)`, compatibly with restriction and, for finite separable extensions, norm/corestriction. `TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.FiniteModule` supplies `TauCeti.ClassFieldTheory.dualityMap0_kummerCoeff_bijective`, `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective` and `TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective` for finite discrete modules killed by `n` invertible in the local field. These finite-level inputs retain their existing carriers; the completed and `κ`-linear comparisons below add hypotheses and are separate mathematical targets.
- `TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier` supplies `Matrix.transpose_mul_J_mul_eq_det_smul` and `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` over every commutative ring in rank two. These identify the symplectic multiplier with the determinant without dividing by two. The rank-four integral similitude and Lie contracts are `ArithmeticGaloisRepresentations`, §§7.3–7.5, with its prescribed Gram matrices and its explicit hypotheses wherever scalar splitting is used.
- `TauCeti.RingTheory.Henselian.Basic` supplies `TauCeti.HenselianLocalRing.exists_pow_eq_of_residue_pow_eq`, which lifts a unit residue root of `X^n−u` when `n` is a unit, and `TauCeti.IsAdicComplete.henselianLocalRing`. Target [F.2.9](#fixed-determinant-rings) uses them for existence of the residue-one root over Artinian local coefficients and adds uniqueness and the `p∤n` formulation.

- [F.1.1](#lifting-functor)–[F.1.10](#determinant-comparison) construct deformation functors, strict equivalence and determinant conditions; [F.2.1](#phi-p-condition)–[F.2.11](#pseudodeformation-rings) supply continuous representability under `Φ_p` and Schur unframed representability. [F.3.1](#local-deformation-problem)–[F.3.2](#deformation-problem-ideal) supply the condition/ideal correspondence, and [F.4.12](#inertia-rigid-deformations) supplies inertia-rigid rings. [F.0.2](#minimal-relative-presentations) specializes the supplied relation bound for a natural, additive obstruction assignment detecting lifts over every finite-dimensional socle kernel. The local Galois obstruction assignment and surjection `H²(Γ,ad ρ̄)∨→J/𝔪_SJ` for a minimal `S=𝒪[[x₁,…,x_r]]→R` with kernel `J` are constructed in [1.4](#t1-4). See [Gee22], Lemma 3.2, p. 12, Corollary 3.12 and Lemma 3.13, p. 13.
- `DeformationAndDerivedPatchingAlgebra`, §1.12 supplies the joint-maximal-ideal completion coproduct, inclusions, symmetry, associativity and coefficient comparisons; §§2.1–2.5 supply the chosen relative presentation, relation space and obstruction bound for all finite-dimensional socle kernels; §§2.6–2.7 supply the fixed-basis continuous matrix ring and uniqueness of its representing pair. Its §3.9 supplies the canonical module by normalized duality and its regular-presentation `Ext`, power-series, regular-quotient, type/socle and Gorenstein comparisons; §4.6 supplies the pointed tensor-domain comparison, including generic regularity for `E/ℚ_p` finite. These interfaces specialize on the same carriers in [F.0.1](#completed-coefficient-products), [F.0.2](#minimal-relative-presentations), [F.2.3](#universal-lifting-ring), [F.2.4](#universal-continuous-lift) and [0.1](#t0-1).
- Completed coefficient products and the pointed domain comparison specialize the supplied algebra in [F.0.1](#completed-coefficient-products), with residue-extension and flat-dimension statements on that coproduct. Its product component dimensions require equidimensional total factors; identification of components by tuples retains geometric integrality of the domain quotients. Its domain comparison retains an `𝒪`-point and regular generic fibre for each domain factor. The coefficient categories and Schlessinger criteria use `SchemeAndStackFoundations`, §§4.2–4.4; excellence and regular completion maps use its §0.21. Target [0.1](#t0-1) specializes the supplied ungraded canonical-module/type tests and adds the graded completion comparison for 6.18.
- `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`, supplies the cocycle, strict-class and adjoint tangent comparisons. `SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*, retains the trace-sequence boundary when `p` divides the rank. Apply these to the functors of §§F.1.1–F.1.10; the local obstruction assignment and relation-space comparison are [1.4](#t1-4).
- `ClassFieldTheory`, Layer 5, supplies finite smooth discrete local Tate duality and the Euler characteristic. Above `p` the `κ`-linear extension is `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields*: retain continuity, a stable valuation-ring lattice for local `κ`, and its adic topology. It supplies finite-dimensional `κ`-linear cohomology, perfect pairings and Euler characteristic `−[K:ℚ_p] dim V` for precisely the fields of 1.15. Away from `p` use the finite duality input and the supplied tame inertia quotient and procyclic resolutions in 1.18, passing through stable-lattice quotients and localization; the resulting Euler characteristic is zero. The latter adapter, including scalar extension, is constructed in [1.18](#t1-18). Pinned `TauCeti.ContCohomology.H2` is only the additive `Z²/B²` carrier.
- `ClassFieldTheory`, Layer 7, supplies the local Artin map and its normalization, the identification of abelianized inertia with completed units and its pro-`p` factor. `LocalGaloisGroups`, Layers 3 and 7, supplies the `p`-finiteness input over every finite extension. The Kummer maps named in the scope supply `H¹(G_L,μ_{pⁿ})≅L×/L×^{pⁿ}` for characteristic-zero `L`. Target [4.2.1](#t4-2-1) constructs the decomposition-equivariant completed valuation sequence over `K^nr`, including its coefficient twists, from these finite-level maps and `SelmerIwasawaCohomology`, §§0.4–0.6. Full tame inertia and its coefficient-`p` quotient are different, as specified in the scope.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` supplies subobject, quotient and direct-sum stability of finite-flat representations, compatible finite-flat models forming `p`-divisible groups, and Raynaud's uniqueness/split-extension results when `e<p−1`, with inertial exponents `0≤i≤e`. Its §R07.6.7 supplies finite-flatness as a deformation condition and its Fontaine–Laffaille tangent calculation; 4.1 constructs the representing rings using that condition, and 8.6 identifies its finite-flat specialization with the supplied tangent interface. `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.4, R07.3.7 and R07.3.10–R07.3.12, supplies the scalar Fontaine–Laffaille category, its exact fully faithful contravariant realization on the safe interval `[0,p−2]`, and subquotient stability. Target 1.6 extends this category by commuting coefficient actions and labelled filtration summands, and uses the dual realization to fix the covariant convention (rank-one `ℚ_p` inertia `ε^{−i}`). Its `Ext` and coefficient-change comparisons retain those actions; multiplicity-one is an extra deformation hypothesis.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` supplies coefficient Breuil–Kisin and étale `φ`-module categories over `𝔖`, the `G_{K∞}` realization, finite-height lattice uniqueness with the repaired argument [KisinPST], Errata (E.4), author DVI p. 34, and semistable-to-height comparison. For `p>2` it supplies height-one/finite-flat and `p`-divisible equivalences, full faithfulness of restriction and the multiplicative/étale dictionary. At `p=2` import the full integral height-one classification and restriction full faithfulness of §§R07.4.23–R07.4.24 (`dyadicClassification`); Kisin’s connected groupoid and resolution in Layer 5 use their connected subcase. See [Kisin2adic], (1.2.8), (1.3.2), (1.3.9), (1.3.10), (1.3.13). Savitt's strongly divisible modules with tame descent data, their lattices and reductions are also required by Layer 4.
- Target 6.9 extends the coefficient Kisin modules of `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.36, by tame descent data over `𝔖_{L′,A}=(W(k′)⊗A)[[u′]]`, `v=(u′)^{p^{f′}−1}`, for `K′/K` unramified of degree `≤3` and `L′=K′((−p)^{1/(p^{f′}−1)})`. The semilinear `Δ`-action commutes with `φ`; descent to the étale module and `T*_dd` are coefficient compatible, as are changes of eigenbasis on partial Frobenius matrices. These are [LLHLM20], Definition 3.1.3, p. 21, and its cited LLHLM18 Propositions 2.13 and 2.15; plain coefficient Kisin modules do not include descent data.
- `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and §1.7 supplies projective Grassmannians and flag schemes, direct-summand universal subbundles, very ample bundles and closed invariant/Frobenius-stability equations; `SchemeAndStackFoundations`, §§4.9–4.10, and `AdicSpacesPartIII`, `F0`.8 supplies formal functions and algebraization. Target [4.7.1](#t4-7-1) constructs the Pappas–Rapoport and Deligne–Pappas local models and the comparisons required by 4.8 and 5.13. Grassmannian representability supplies their carriers, rather than their flatness or singularities.
- `AdelicAlgebraicGroups`, AA.3.4 (`Reduction.finite_classes`) and AA.4.4 (level quotients and finite full rational stabilizers, with the compactness hypotheses there), supplies the adelic finiteness and level infrastructure used by [6.30](#t6-30). The definite-unitary function modules, Hecke actions and their patching application belong to 6.30.
- Target [2.27](#t2-27) constructs the away-from-`p` arithmetic cycle functor and `GL_d` reduction descent. Its scoped arithmetic systems and generic cycle formula belong here; `DeformationAndDerivedPatchingAlgebra`, Layer 5 and §6.7, supplies abstract module patching, affine module cycles and uniformizer specialization. Adelic finiteness uses `AdelicAlgebraicGroups`, AA.3.4 and AA.4.4, with prime-to-`p` stabilizers for exact coefficient functors.
- Target [4.14.1](#t4-14-1) constructs the Breuil–Kisin/Emerton–Gee comparison giving generic reducedness of potentially Barsotti–Tate special fibres for `p>2` and tame `τ`, and its fixed-determinant scalar-twisting adapter.
- The period and filtered-module carriers use `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.0–R07.3.3 and R07.4.13; §§R07.4.27–R07.4.28 give its odd-prime field-valued descent dictionary. Target [0.2](#t0-2) supplies finite local `E`-algebra descent and completed deformation groupoids, with maximal-ideal topology. Targets [0.3](#t0-3) and [0.4](#t0-4) supply the ordinary and coefficient Robba comparisons.
- `ReductiveGroups`, Layer 9, supplies split integral forms. Target [1.21](#t1-21) constructs the relative Borel and parabolic schemes, conjugacy for split groups over local coefficient rings and canonical-torus comparisons ([Conrad], Corollaries 5.2.8–5.2.9, Theorem 5.2.11 and Corollary 5.2.13, pp. 155–159). These supply the flag geometry for 1.21, 3.11 and 6.5; `GL_d` and `GSp₄` agree with the explicit full and isotropic flags. `ArithmeticGaloisRepresentations`, §§7.3–7.5 supplies the integral `GSp` realization and transpose conventions.
- `SmoothRepresentationsOfLocalGroups`, SR.0 and SR.5, supplies integral smooth-representation language. Targets [2.26.1](#t2-26-1)–[2.26.2](#t2-26-2) construct the `GL_d`/division-algebra type and transfer interfaces required by 2.27; targets [3.7.1](#t3-7-1)–[3.7.2](#t3-7-2) construct the mod-`p` `GL₂(ℚ_p)` block and Montréal interfaces required by 3.8.

Mathlib at the pins supplies `MvPowerSeries`, `ProfiniteGrp`, `Module.Finite`, `IsAdicComplete`, `IsLocalRing.ResidueField` and `Matrix.symplecticGroup`. Its Weierstrass preparation and division declarations `PowerSeries.exists_isWeierstrassFactorization` and `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` require a nonzero residue series. They are inputs to the presentation arguments, not already the local deformation theorems. The block-to-pseudodeformation identification and `GL₃` weak minimal patching functor are local targets 3.8 and 6.30, with APIs and checks there.

## How to read the build

The generic foundations in Layer F precede the coefficient and comparison prerequisites in Layer 0 and the eight local deformation layers. Then construct the local universal rings, character coefficients, bounded-height lattices, Fontaine–Laffaille condition and ordinary incidence space. Tame rigidity then precedes Hodge-type quotients, finite-flat and dyadic geometry. Layer 6 gives ordinary and `GL₃` component comparisons; Layer 7 compares the determinant-ordinary image with flags; Layer 8 exports the selected local rings. Dependencies refer to numbered targets or exact external roadmap/layer addresses. API names are intended for `TauCetiRoadmap.LocalGaloisDeformationRings` unless explicitly qualified. README.md specifies every target; Suggested.lean records only representative signatures whose carriers are expressible at the pinned APIs.

## Layer F: Generic deformation foundations

Use `Art_𝒪` and `C_𝒪` from `SchemeAndStackFoundations`, §4.2 (`ArtinLocalAlg` and
`CompleteLocalAlg`), with the residue identifications and maximal-ideal topologies fixed above.
In this layer `G` is any profinite group, `n ≥ 1`, and `ρ̄ : G → GLₙ(k)` is continuous for
discrete `k`. Write `λ` for the maximal ideal of `𝒪`, generated by `ϖ`, and `Γ̂ₙ(A)` for the
kernel of reduction `GLₙ(A) → GLₙ(k)`. Artinian coefficient objects have discrete topology.
The functors exist before representability is asserted; `Φ_p`, Schur and absolute irreducibility
are imposed precisely where stated.

Specialize the common completed coefficient products and conditional presentations first, then construct deformation
functors, arithmetic representability and comparisons, the local-condition ideal correspondence and
inertia-rigid rings. For `k[ε]`, ArithmeticGaloisDuality `D8`.1 identifies lifts with
`Z¹(G, ad ρ̄)` and strict classes with `H¹(G, ad ρ̄)`, giving framed tangent dimension
`h¹ + n² − h⁰`; SelmerIwasawaCohomology §`2A`.4 supplies determinant tangent fibres, including the trace-sequence boundary
when `p | n`. The local obstruction-to-relation-space comparison is [1.4](#t1-4).

<a id="completed-coefficient-products"></a>

### F.0.1 Completed coefficient products and dimensions

**Completed local coefficient algebra.** For maps `A → B` and `A → C` in `C_𝒪`, use
`DeformationAndDerivedPatchingAlgebra`, §1.12's coproduct with coefficient base `A`.
The notation `B ⊗̂_A C` denotes its native `AdicCompletion` of `B ⊗_A C` at the ideal generated
by the two maximal ideals, with the same two inclusions. It is in `C_𝒪` and is its coproduct over `A`: continuous
local maps to `D ∈ C_𝒪` correspond to pairs of such maps from `B` and `C` agreeing on `A`.
Associativity, symmetry, the unit and empty-product conventions and compatibility with
Artinian quotients specialize that interface, preserving the inclusions. The general adic-map tensor product of AdicSpacesPartIII `F0`.1 uses the same
completion carrier where its hypotheses apply; the maps `𝒪 → 𝒪⟦X⟧` with maximal-ideal topology
are not adic maps, so the coefficient-category mapping theorem here carries its own hypotheses.
For a finite extension of coefficient DVRs `𝒪 → 𝒪′` with residue inclusion `k → k′`,
use the same completion and its finite-factor comparison `B ⊗̂_𝒪 𝒪′ ≅ B ⊗_𝒪 𝒪′`: it is a complete
Noetherian local `𝒪′`-algebra with residue `k′`, flat over `B`. Specialize the mapping property
to maps respecting `k → k′`; uniqueness gives transitivity ([KW209], §2.1, pp. 5–6).

For a finite nonempty family of `𝒪`-flat coefficient rings `B_i`, put
`d_i = dim(B_i/ϖ B_i)` and `T = ⊗̂_𝒪 B_i`. Prove that `T` is flat,
`dim T = 1 + Σ d_i` and `dim T[1/ϖ] = Σ d_i`. These whole-ring dimension formulas
require no equidimensionality. Reduction modulo `ϖ` gives the completed product over `k`,
whose dimension is `Σ d_i`; flatness then gives the integral dimension
(Stacks, tag [00KW](https://stacks.math.columbia.edu/tag/00KW)).
For every nonzero flat coefficient ring `B`, prove `dim B = 1 + dim B[1/ϖ]`
([KW209], Proposition 2.2 and proof, p. 9; §4.1.3, p. 39).

If each total ring `B_i` is equidimensional of absolute dimension `1+d_i`, prove that
every minimal-prime quotient of `T` has absolute dimension `1+Σ d_i`, and its generic
fibre has dimension `Σ d_i`. Specialize `DeformationAndDerivedPatchingAlgebra`, §4.6
to the reduced factors; passing to these quotients changes neither the minimal components
nor their dimensions. For the identification of minimal components by tuples of factor
components, require each domain quotient `B_i/𝔭_i` to be geometrically integral: its scalar
extension to every finite coefficient DVR extension is a domain. Under this hypothesis the
component for `(𝔭_i)_i` has quotient `⊗̂_𝒪 (B_i/𝔭_i)`, and the component maps commute with
coefficient extension ([BIP23], Lemma 6.3 and proof, pp. 52–53).
Equidimensionality of the special fibres alone does not give these component dimensions.

If every `B_i` is a domain with an `𝒪`-point and regular generic fibre, specialize
`DeformationAndDerivedPatchingAlgebra`, §4.6 to obtain a domain with regular generic fibre;
retain these hypotheses and `E/ℚ_p` finite ([KW209], §2.3, Proposition 2.2
and proof, p. 9).

*Needs:* DeformationAndDerivedPatchingAlgebra §§1.12, 4.6;
SchemeAndStackFoundations §§4.2, 0.16, 0.20–0.21; Mathlib `AdicCompletion`,
`IsAdicComplete`, `MvPowerSeries`, `TensorProduct`, `IsNoetherianRing`, `Module.Flat`.

**Checks.**

- **coefficient_product_series.** `𝒪⟦X⟧ ⊗̂_𝒪 𝒪⟦Y⟧ ≅ 𝒪⟦X,Y⟧`, with dimensions `2 + 2 − 1 = 3`.
  The completed ring carries the joint maximal-ideal topology, rather than only the `ϖ`-adic one.
- **coefficient_product_torsion.** `k ⊗̂_𝒪 k = k` has dimension zero; inserting the flat formula
  `0 + 0 − 1` would give `−1`, so flatness is essential.
- **coefficient_product_special_fibre.** in `S=𝒪[[x,y]]`, the ideal
  `I=(x(x−ϖ),xy)` equals `(x)∩(x−ϖ,y)`: modulo the second prime, `x` is the
  nonzerodivisor `ϖ`. Thus `B=S/I` embeds into `𝒪[[y]]×𝒪`, is reduced and `𝒪`-flat,
  and has an `𝒪`-point. Its special fibre `k[[x,y]]/(x²,xy)` has unique minimal prime
  `(x)` and dimension one. Its two total components have quotients `𝒪[[y]]` and `𝒪`,
  of dimensions two and one. For the singleton family, `dim B=2` and `dim B[1/ϖ]=1`,
  but the smaller horizontal component has generic dimension zero and specializes inside
  the other component's special fibre. Catenarity and a pure special fibre do not imply
  equidimensionality of the total ring.
- **coefficient_extension_residue.** for `𝒪 = W(k)` and `𝒪′ = W(k′)`,
  `𝒪⟦X⟧ ⊗̂_𝒪 𝒪′ ≅ 𝒪′⟦X⟧` has residue `k′`, and extension by `𝒪` itself is the identity.
- **coefficient_product_domain_hypotheses.** take a nontrivial finite coefficient extension
  `𝒪′/𝒪` with the same residue field. Its generic fibre is regular and it is a domain, but it
  has no `𝒪`-point. The generic fibre of `𝒪′ ⊗̂_𝒪 𝒪′` has distinct factors and is not a domain.
- **coefficient_product_common_base.** for `A=𝒪⟦t⟧`, the common coproduct
  `A⟦x⟧ ⊗̂_A A⟦y⟧ ≅ A⟦x,y⟧` identifies the two images of `t`. Agreement only on residue
  maps would leave two coefficient variables and would not give this coproduct.

<a id="minimal-relative-presentations"></a>

### F.0.2 Minimal relative presentations and obstruction bounds

**Presentation algebra.** Specialize `DeformationAndDerivedPatchingAlgebra`, §§2.1–2.5
to a local map `B → R` in `C_𝒪`, using `B` as coefficient base. Let
`g = dim_k 𝔪_R/(𝔪_R² + 𝔪_B R)`. Lifts of a basis give a continuous local surjection
`P = B⟦x₁,…,x_g⟧ ↠ R` inducing an isomorphism on relative tangent spaces.
Use that chosen evaluation map, its kernel `J` and the actual relation quotient `J/𝔪_P J`
from the supplier. A basis lifts to a minimal set of generators
of `J`, and `dim R ≥ dim B + g − dim_k(J/𝔪_P J)` ([CHT08],
Corollary 2.2.12 and proof, p. 25).

For the represented relative deformation functor, suppose a finite-dimensional obstruction space
`O` is supplied for all surjections of Artinian `B`-algebras with finite-dimensional kernel `I`
killed by the maximal ideal. Require classes in `O ⊗_k I`, natural under maps of such extensions,
including all linear pushouts of kernels, additive under direct sums of kernels, and zero exactly
when a lift exists. This is the supplier's complete obstruction interface for socle kernels.
For the minimal presentation above, specialize its obstruction-compatible injection
`(J/𝔪_P J)ˇ ↪ O`, equivalently the surjection `Oˇ ↠ J/𝔪_P J`.
The supplied comparison uses Artinian quotients of the extension with kernel `J/𝔪_P J`; minimality
makes changes of the variable lifts act trivially on this kernel. Hence
`dim_k(J/𝔪_P J) ≤ dim_k O`, and `O = 0` makes `R` a power-series ring over `B`.
An elementary obstruction assignment restricted to one-dimensional kernels alone is not the
asserted input. Arithmetic obstruction assignments and their identification with this
relation evaluation are [1.4](#t1-4); specializing the algebra does not supply those assignments.

(Sources: [Gee22], Lemma 3.13 and Corollary 3.14, pp. 13–14;
[KWESI], Lemma 4.5 and proof, pp. 32–33; [CHT08], Corollary 2.2.12, p. 25.)

*Needs:* DeformationAndDerivedPatchingAlgebra §§2.1–2.5; [F.0.1](#completed-coefficient-products);
SchemeAndStackFoundations §§4.2–4.4; Mathlib `MvPowerSeries`, `IsAdicComplete`, `IsNoetherianRing`.

**Checks.**

- **minimal_presentation_series.** `R = B⟦x₁,…,x_g⟧` has `J = 0` and zero relation space.
- **minimal_presentation_square.** for `B = 𝒪`, `R = 𝒪⟦x⟧/(x²)` has one tangent generator and
  one minimal relation; `x ↦ t` over `k[t]/(t²)` cannot lift to `k[t]/(t³)`.
- **minimal_presentation_required.** the one-point functor has zero obstruction space and
  minimal presentation `B → B`. The presentation `B⟦x⟧ ↠ B`, `x ↦ 0`, has one relation and is
  not minimal; applying the zero-obstruction bound to it would assert `1 ≤ 0`.

<a id="lifting-functor"></a>

### F.1.1 The lifting functor

**Lifts.** For a coefficient ring `A` with residue map `π_A`, define `Lift_ρ̄(A)` as the set of
continuous homomorphisms `ρ : G → GLₙ(A)` whose reduction `GLₙ(π_A) ∘ ρ` is `ρ̄`. A coefficient
morphism `f : A → B` pushes a lift forward by `GLₙ(f)`; this is a set-valued functor on `Art_𝒪` with
no representability assumption. On `C_𝒪`, construct the natural bijection
`Lift_ρ̄(A) ≅ limᵣ Lift_ρ̄(A/𝔪_Aʳ)`. The strict kernel `Γ̂ₙ(A)` acts by conjugation. Since an Artinian
coefficient ring here is finite, continuity of a lift to it is equivalent to factoring through `a`
finite quotient of `G` by an open normal subgroup ([Gee22], §3.1, p. 12; [KisinNotes], Lecture 1,
(1.1.1)–(1.1.2), p. 1).

The API:

- `Lift`: `Lift ρ̄ : Art_𝒪 ⥤ Type`, `A ↦` continuous lifts of `ρ̄` to `GLₙ(A)`.
- `Lift.map`: a coefficient morphism `f` induces `Lift(A) → Lift(B)`, `ρ ↦ GLₙ(f) ∘ ρ`, with
  `Lift.map_id` and `Lift.map_comp`. Composition is entrywise coefficient composition.
- `Lift.reduce`: every lift reduces to `ρ̄` modulo `𝔪_A`.
- `Lift.reduce_map`: reduction after pushforward along `f : A → B` is reduction along
  `π_B ∘ f`; the coefficient morphism equation `π_B ∘ f = π_A` identifies it with `ρ̄`.
- `Lift.charpoly_map`, `Lift.trace_map`, `Lift.det_map`: characteristic polynomial, trace
  and determinant commute with coefficient pushforward, including nonreduced coefficients.
- `Lift.conj`: `Γ̂ₙ(A)` acts on `Lift(A)` by conjugation.
- `Lift.limEquiv`: for `A ∈ C_𝒪`, `Lift(A) ≃ limₖ Lift(A/𝔪_Aᵏ)`.

*Needs:* [F.0.1](#completed-coefficient-products); ArithmeticGaloisRepresentations Layer 1;
Mathlib `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map`, `IsArtinianRing`,
`IsLocalRing`, `ContinuousMonoidHom`.

*Lean:* `strictKernel`, `Lift`, `Lift.conj`, `Lift.conj_apply`, `Lift.map`, `Lift.map_apply`,
`Lift.map_id`, `Lift.map_comp`, `Lift.reduce_map`, `Lift.charpoly_map`, `Lift.trace_map`,
`Lift.det_map`, the `MulAction` instance of `strictKernel` on `Lift`, the proved residue-field `example`.

**Checks.**

- **lift_trivial_char_Zp.** For `G=ℤ_p`, `n=1` and `ρ̄=1`, evaluation at `1` identifies
  `Lift(A)` with `1+𝔪_A`. For finite discrete local `A`, this is a finite `p`-group, so
  every such value extends uniquely to a continuous character. Over `A=k` only the
  identity value occurs: continuous characters already reduce trivially because
  `kˣ` has order prime to `p`. For `A=ℤ/9`, the values are exactly `1,4,7`.
- **lift_residue.** `Lift_ρ̄(k)` is the singleton `{ρ̄}`; a definition without the reduction equation
  would contain every continuous representation of `G` over `k`.
- **lift_not_continuous.** for `G = ∏_ℕ ℤ/p`, `n = 1`, `ρ̄ = 1` and `A = k[ε]`, a homomorphism
  `G → 1 + εk ≅ k` given by an `𝔽_p`-linear functional that vanishes on no open subgroup is not in
  `Lift(A)`; a definition forgetting continuity would accept it.
- **lift_functorial.** `Lift.map (g ∘ f) = Lift.map g ∘ Lift.map f`, checked on matrix entries.
- **lift_nonreduced_coefficients.** Over `k[ε]/(ε²)`, the rank-one lift of the trivial
  character of `ℤ_p` sending `1` to `1+ε` has characteristic polynomial `X−(1+ε)`.
  Reduction gives `X−1`, trace and determinant `1`; coefficient change before reduction
  gives the same result. Replacing the original polynomial by `X−1` loses the deformation.

<a id="module-deformation-functor"></a>

### F.1.2 Deformations as modules with a residual identification

**Module deformations.** Fix the standard residual `G`-module `V̄ = kⁿ` with its basis `β`. A module
deformation over `A` is a finite free `A`-module `V` with a continuous `A`-linear `G`-action and `a`
`G`-equivariant identification `ι : V ⊗_A k ≅ V̄`. Morphisms are `G`-equivariant `A`-linear
isomorphisms commuting with `ι`. Define `ModDef(A)` as the set of isomorphism classes, and
`ModDefFramed(A)` by adding an `A`-basis reducing through `ι` to `β`, morphisms then also preserving
that basis. A basis lifting `β` exists by freeness and Nakayama's lemma. Base change carries the
action, the residual identification and the basis, not only the underlying module ([KisinNotes],
Lecture 1, (1.1.1), p. 1).

The API:

- `ModDef`: `Def^mod_ρ̄ : Art_𝒪 ⥤ Type`, isomorphism classes of pairs `(V_A, ι)`.
- `ModDefFramed`: `Def^{mod,□}_ρ̄`, adding a basis lifting `β`.
- `ModDef.baseChange`: base change along coefficient morphisms, with identity and composition laws.
- `ModDef.exists_basis_lift`: every `(V_A, ι)` has a basis lifting `β`.

*Needs:* [F.0.1](#completed-coefficient-products); [F.1.1](#lifting-functor); Mathlib
`Module.Free`, `IsLocalRing`.

**Checks.**

- **moddef_residue.** `ModDef(k)` is a singleton, the class of `(V̄, id)`.
- **moddef_rank_one.** for `n = 1` and `ρ̄ = χ̄`, `ModDef(A) = {χ̃ψ : ψ ∈ Hom_cont(G, 1 + 𝔪_A)}` for `a`
  fixed lift `χ̃`. Distinct rank-one characters are nonisomorphic as `G`-modules, so here forgetting
  `ι` makes no further identifications; the rank-two check below detects that omission.
- **moddef_needs_iota.** for `ρ̄ = 1 ⊕ 1`, `A = k[ε]` and a nonzero continuous additive character
  `x : G → k`, the lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` are isomorphic `G`-modules by
  swapping the basis vectors, but they are distinct deformations, because the swap does not reduce
  to the identity on `V̄`. With the zero character the two lifts coincide, so the character must be
  nonzero.

<a id="strict-deformation-functor"></a>

### F.1.3 Deformations up to strict equivalence

**Strict classes.** For every continuous `ρ̄`, form `Def_ρ̄(A) = Lift_ρ̄(A)/Γ̂ₙ(A)`. Coefficient
morphisms descend to this orbit quotient. Two representatives have the same class precisely when `a`
conjugator reduces to the identity. The functor exists even when `ρ̄` has non-scalar endomorphisms;
representability is a separate target in §§F.2.1–F.2.11 ([Gee22], Definition 3.4, p. 12; [KisinNotes], Lecture 1,
Remark (1.1.2)(1), p. 1).

The API:

- `Def`: `Def ρ̄ A := Lift ρ̄ A ⧸ Γ̂ₙ(A)`.
- `Def.mk`: the class of a lift.
- `Def.mk_eq_mk_iff`: `[ρ] = [ρ′] ↔ ∃ a ∈ Γ̂ₙ(A), ρ′ = aρa⁻¹`.
- `Def.map`: functoriality in `A`.
- `Def.toModDef`: `Def ≃ ModDef` ([F.1.4](#module-deformations-are-strict-classes)).

*Needs:* [F.1.1](#lifting-functor); Mathlib `Matrix.GeneralLinearGroup`, `MonoidHom.ker`,
`MulAction.orbitRel`.

*Lean:* `Def`, `Def.mk`, `Def.mk_eq_mk_iff`, `Def.map`, `Def.map_mk` and `def_rank_one_eq_lift`.

**Checks.**

- **def_residue.** `Def_ρ̄(k)` is a singleton.
- **def_rank_one_eq_lift.** for `n = 1`, conjugation is trivial and `Def = Lift`; a definition quotienting
  by all of `GLₙ(A)` agrees here, so this check is paired with the next.
- **def_not_full_conj.** for `ρ̄ = 1 ⊕ 1`, the lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` to `k[ε]`
  (`x` a nonzero continuous character `G → k`) are distinct strict classes although they are
  `GL₂(k[ε])`-conjugate; a definition using full conjugacy would identify them.

<a id="module-deformations-are-strict-classes"></a>

### F.1.4 Module deformations are lifts up to strict conjugation

**Matrix and module descriptions agree.** Construct natural bijections
`Lift_ρ̄(A) ≅ ModDefFramed_ρ̄(A)` and `Def_ρ̄(A) ≅ ModDef_ρ̄(A)` for `A` in `Art_𝒪`, and in `C_𝒪` with
its topology. A compatible module isomorphism has reduction equal to the identity in any bases
lifting `β`; conversely a strict conjugator induces such an isomorphism. Check independence of the
chosen lifted basis and compatibility with coefficient morphisms ([KisinNotes], Lecture 1,
Remark (1.1.2)(1), p. 1).

Use the continuous representations and frames of
[ArithmeticGaloisRepresentations §1.2](../ArithmeticGaloisRepresentations/README.md#12-frames-coefficient-extension-operations-tate-twists)
and its [§1.9 residual marking interface](../ArithmeticGaloisRepresentations/README.md#19-reduction-and-the-residual-representation),
written `IsLiftOf ρ ρ̄ ι`:
`ι : k ⊗_A M ≃ₗ[k] kⁿ` identifies the reduced action with `ρ̄`, without
semisimplification. This marking belongs to that supplier. For a finite free `M`, a basis
`b` lifting the fixed residual basis gives `toLift (ρ, ι, b) : Lift_ρ̄(A)`.
Conversely `ofLift` uses the supplier's `ofFramed` on `Aⁿ`, with its standard basis and
residual marking. These adapters are inverse on representations with the specified basis;
forgetting that basis gives the strict-class comparison above. Changing a compatible basis
changes the lift by strict conjugation, rather than by an arbitrary residual conjugacy.
Provide the adapter identities, naturality under coefficient morphisms and simp identities
for characteristic polynomial, trace, determinant and reduction. The matrix formulas are
`Lift.charpoly_map`, `Lift.trace_map`, `Lift.det_map` and `Lift.reduce_map` of F.1.1;
the module formulas use the supplier's base-change and reduction comparisons.

*Needs:* [F.1.1](#lifting-functor); [F.1.2](#module-deformation-functor);
[F.1.3](#strict-deformation-functor); `ArithmeticGaloisRepresentations`, §§1.2 and 1.9
(frames, coefficient change and residual markings).

**Checks.**

- **modCompare_scalar_basis.** in rank one over `𝔽₃[ε]`, replacing a basis `e` by
  `(1+ε)e` preserves its residual marking and the character matrix. Different
  lifted bases need not give different module deformations.
- **modCompare_strict_basis.** for `a` `C₂`-action with generator `diag(1,−1)`,
  multiply the old basis by `(1+εE₂₁)⁻¹`. The new matrix is
  `[[1,0],[2ε,−1]]`, a distinct matrix but the same marked module and strict class.
- **modCompare_wrong_marking.** swapping the two residual basis vectors of this
  `C₂`-module changes `diag(1,−1)` to `diag(−1,1)`. It does not lift the fixed
  residual basis, so cannot be used in the framed comparison.

<a id="strict-vs-full-conjugacy"></a>

### F.1.5 Strict and full conjugacy agree for Schur residual representations

**Theorem.** Let `ρ̄` be Schur and let `A` be a local ring whose residue map `π_A : A → k` is
surjective with kernel `𝔪_A` (in particular any object of `Art_𝒪` or `C_𝒪`). If lifts `ρ, ρ′` over
`A` are conjugate by some `a ∈ GLₙ(A)`, they are strictly conjugate. The reduction of `a` centralizes
`ρ̄`, hence is a nonzero scalar `c`; a unit of `A` lifting `c` normalizes `a` into `Γ̂ₙ(A)`, by the
local-ring unit criterion ([Gee22], Definition 3.4 and the remark following it, p. 12).

The unbundled form requires locality, surjectivity of `π_A` and `ker π_A = 𝔪_A` explicitly. Both the
non-Schur failure and the failure for an arbitrary surjection onto `k` are recorded as checks.

*Needs:* [F.1.3](#strict-deformation-functor); Mathlib `Matrix.GeneralLinearGroup`;
[F.0.1](#completed-coefficient-products).

*Lean:* `IsSchur`, `strict_of_full` and the two proved `example`s on rank one and on `1 ⊕ 1`.

**Checks.**

- **strict_of_full_not_schur.** for `ρ̄ = 1 ⊕ 1` the dual-number lifts in §F.1.3 are
  conjugate by the swap but not strictly conjugate: the Schur hypothesis is needed.
- **strict_of_full_nonlocal.** let `S₃ ⊂ GL₂(ℤ)` be generated by `C = [[0, −1], [1, −1]]` and
  `S = [[0, 1], [1, 0]]`, with the surjective reduction `ℤ → 𝔽₅`; the reduction is absolutely
  irreducible (`1, C, S, CS` `span` `M₂(𝔽₅)`), hence Schur. The matrix `a = [[2, 5], [5, 12]]` lies in
  `GL₂(ℤ)` and reduces to `2·I`, so `aρa⁻¹` is a second lift of the same reduction. The integral
  centralizer of `C` and `S` is the scalars, whose units are `±1`, and `±a` does not reduce to `I`, so
  the two lifts are conjugate but not strictly conjugate over the nonlocal ring `ℤ`. Over the local
  ring `ℤ/25` the unit `13` lifts `2⁻¹` and `13·a` is a strict conjugator: locality is needed.
- **isSchur_absIrred.** an absolutely irreducible `ρ̄` is Schur, while `ρ̄ = 1 ⊕ 1` is not (its
  centralizer is all of `M₂(k)`, including non-diagonal matrices).

<a id="restriction-of-deformations"></a>

### F.1.6 Restriction of lifts and deformations is well defined

**Restriction.** For a continuous homomorphism `ι : H → G` of profinite groups, precomposition gives
`Lift_ρ̄ → Lift_{ρ̄∘ι}`. It commutes with strict conjugation and therefore descends to `Def`. A framed
pair `(ρ, α)` with `α ∈ Γ̂ₙ(A)` has restricted lift `α⁻¹(ρ ∘ ι)α`, and this lift is invariant under
the simultaneous replacement `(ρ, α) ↦ (βρβ⁻¹, βα)`. The identity is proved before it is used to
select a lift from a framed condition ring. Restriction need not be along an inclusion of
groups ([Gee22], §§3.20–3.21, p. 15).

*Needs:* [F.1.1](#lifting-functor); [F.1.3](#strict-deformation-functor); Mathlib
`ContinuousMonoidHom`.

*Lean:* `Lift.restrict`, `Lift.restrict_apply`, `framed_restrict_invariant` and the proved trivial-subgroup restriction `example`.

**Checks.**

- **restrict_id.** restriction along the identity is the identity on `Lift`.
- **framed_restrict_invariant.** `(βα)⁻¹(βρ(ι h)β⁻¹)(βα) = α⁻¹ρ(ι h)α` in any group; the version without
  the frame, `ρ ∘ ι`, changes as a matrix-valued lift under `β`. Its strict class is nevertheless
  well defined; a frame is needed to select an invariant lift, not to define restriction of classes.
- **restrict_not_injective.** for `ι` the inclusion of the trivial group, restriction sends every lift
  to the unique lift of the trivial group; it is not an inclusion of functors.

<a id="fixed-determinant-functors"></a>

### F.1.7 Lifts and deformations with fixed determinant

**Fixed determinant.** For a continuous character `χ : G → 𝒪ˣ` reducing to `det ρ̄`, define
`LiftDet_χ(A)` by the pointwise equation `det ρ(g) = χ_A(g)`. Strict conjugation preserves it; define
`DefDet` as its orbit quotient and construct the inclusions into `Lift` and `Def`. Pushforward
respects the determinant equation, so both are subfunctors. If `χ` does not reduce to `det ρ̄`, the
set of lifts is empty ([Gee22], §3.18, p. 15).

The API:

- `LiftDet`: `Lift_{ρ̄,χ}` as a subfunctor of `Lift_ρ̄`.
- `DefDet`: `Def_{ρ̄,χ}` as a subfunctor of `Def_ρ̄`.
- `LiftDet.conj`: `Γ̂ₙ(A)` preserves `Lift_{ρ̄,χ}(A)`.
- `mem_LiftDet_iff`: `ρ ∈ Lift_{ρ̄,χ}(A) ↔ det ∘ ρ = χ_A`.

*Needs:* [F.1.1](#lifting-functor); [F.1.3](#strict-deformation-functor); Mathlib
`Matrix.GeneralLinearGroup.det`.

*Lean:* `LiftDet`, `mem_LiftDet_iff`, `LiftDet.conj`, `liftDetSubMulAction` and `DefDet`.

**Checks.**

- **liftDet_rank_one.** for `n = 1`, `Lift_{ρ̄,χ}(A) = {χ_A}`; a definition imposing the determinant only
  modulo `𝔪_A` would give all of `Lift(A)`.
- **liftDet_residue.** `Lift_{ρ̄,χ}(k) = {ρ̄}`.
- **liftDet_wrong_char.** if `χ mod λ ≠ det ρ̄` the functor is empty already on `k`, so the
  compatibility hypothesis is needed.

<a id="change-of-coefficients"></a>

### F.1.8 Change of coefficient ring and residue field

**Coefficient change.** Take a finite local coefficient map `𝒪 → 𝒪′` with its residue inclusion
`k → k′`, and put `ρ̄′ = ρ̄ ⊗_k k′`. Identify lifts of `ρ̄′` over an object `A′` of `Art_𝒪′` with lifts
of `ρ̄` to the underlying `𝒪`-algebra `A′` whose reduction is prescribed by `ρ̄′`; the residue field of
`A′` is `k′`, not `k`. The identification descends to strict classes and to fixed-determinant
classes and is natural in `A′`. Scalar extension of the residual centralizer shows that `ρ̄` is Schur
if and only if `ρ̄′` is; ordinary irreducibility need not persist under residue extension ([Gee22], §3.1,
p. 12; [KisinNotes], Lecture 1, (1.1.1), p. 1).

The API:

- `Lift.changeCoeff`: `Lift^{𝒪′}_{ρ̄⊗k′}(A′) ≃` lifts of `ρ̄` to `A′` as an `𝒪`-algebra.
- `Def.changeCoeff`: the same for strict classes.
- `isSchur_baseChange`: `ρ̄` Schur `↔` `ρ̄ ⊗ k′` Schur.
- `LiftDet.changeCoeff`: the same with fixed determinant `χ` composed with `𝒪 → 𝒪′`.

*Needs:* [F.0.1](#completed-coefficient-products); [F.1.1](#lifting-functor);
[F.1.3](#strict-deformation-functor); [F.1.7](#fixed-determinant-functors).

*Lean:* `isSchur_baseChange`.

**Checks.**

- **changeCoeff_id.** for `𝒪′ = 𝒪` the change of coefficients is the identity.
- **changeCoeff_schur.** `ρ̄` is Schur iff `ρ̄ ⊗ k′` is, because the centralizer of `ρ̄ ⊗ k′` is the
  scalar extension of that of `ρ̄`.
- **changeCoeff_irreducible_fails.** the representation of `ℤ/(p² − 1)` through an element of order
  `p² − 1` of `𝔽_{p²}ˣ`, viewed over `𝔽_p`, is irreducible of dimension two but splits over `𝔽_{p²}`;
  a hypothesis "irreducible" in place of "Schur" would not be stable under coefficient change.

<a id="determinant-deformation-functor"></a>

### F.1.9 Deformations of a residual determinant

**Determinant deformations.** Use the degree-`n` multiplicative polynomial laws of
`IntegralHeckeAndGaloisDeterminants` Layer 0. Write `D̄` for the law obtained by extending `ρ̄`
linearly to `k[G]` and composing with the matrix determinant. `DetDef_D̄(A)` is the set of degree-`n`
determinants on `A[G]` reducing to `D̄` whose characteristic-polynomial coefficients `g ↦ Λᵢ(g)` are
all continuous. Give base change, restriction and the inverse-limit extension to `C_𝒪`. `A`
determinant law records characteristic-polynomial data on the group algebra; the character
`g ↦ det ρ̄(g)` alone is not its definition ([Chenevier], §3.1, p. 41; its representability is F.2.11).

The API:

- `DetDef`: `Def_D̄ : Art_𝒪 ⥤ Type`, continuous `n`-dimensional determinants lifting `D̄`.
- `DetDef.map`: base change of determinants.
- `DetDef.charpoly`: the characteristic-polynomial coefficients of a lifted determinant.
- `DetDef.rank_one`: for `n = 1`, `Def_D̄ ≃ Lift_{χ̄}`.

*Needs:* `IntegralHeckeAndGaloisDeterminants` Layer 0; [F.0.1](#completed-coefficient-products).

**Checks.**

- **detDef_rank_one.** for `n = 1` a degree-one determinant on `A[G]` is a character, and the functor is
  `Lift_{χ̄}`.
- **detDef_residue.** `Def_D̄(k) = {D̄}`.
- **detDef_ignores_extension.** two residual representations with the same semisimplification (for
  instance a nonsplit extension of `χ₂` by `χ₁` and `χ₁ ⊕ χ₂`) have the same `D̄` and hence the same
  functor `Def_D̄`; a definition depending on `ρ̄` itself would distinguish them.

<a id="determinant-comparison"></a>

### F.1.10 The determinant map from representation deformations to determinant deformations

**The map `δ`.** Extend a lift `ρ` `A`-linearly to `A[G]` and compose with the matrix determinant law.
Invariance under conjugation gives a natural map `δ : Def_ρ̄ → DetDef_D̄`, compatible with coefficient
change and with restriction to subgroups. Without absolute irreducibility `δ` need not be injective:
take distinct characters `χ₁`, `χ₂` and a nonsplit extension class `e ∈ Ext¹(χ₂, χ₁)` with
`dim Ext¹(χ₂, χ₁) ≥ 2`. Vary `e` over `k[ε]` to `e + εf` with `f` independent of `e`. Strict basis
changes alter the extension by a coboundary and a scalar multiple of `e`, so these strict classes
are distinct; the determinant law is unchanged. Such a nonsplit extension of distinct characters
is Schur. The isomorphism under absolute irreducibility is F.2.8 ([KisinNotes], Lecture 1, (1.5) Exercise 3,
p. 4; [Chenevier], §3.1, Example 3.4, p. 42).

*Needs:* [F.1.3](#strict-deformation-functor); [F.1.9](#determinant-deformation-functor);
`IntegralHeckeAndGaloisDeterminants` Layer 0.

**Checks.**

- **delta_rank_one.** for `n = 1`, `δ` is the identity of `Lift_{χ̄}` under `DetDef.rank_one`.
- **delta_not_injective.** in the reducible example above two distinct strict classes over `k[ε]` have
  the same determinant law.
- **delta_conj_invariant.** `δ(aρa⁻¹) = δ(ρ)` for every `a ∈ GLₙ(A)`, not only for strict conjugators,
  since the determinant is a class function.

#### F.1 Examples

- For `G = ℤ_p`, `n = 1` and `ρ̄ = 1`, `Lift(A) = Def(A) = 1 + 𝔪_A`, and `LiftDet_χ(A)` is the single
  point `χ_A`.
- Over `k[ε]` with `ρ̄ = 1 ⊕ 1`, the two lifts `diag(1 + εx, 1)` and `diag(1, 1 + εx)` show at once
  that module isomorphism forgets `ι` (F.1.2), that strict and full conjugacy differ for non-Schur `ρ̄`
  (F.1.3, F.1.5), and that the determinant law forgets which marked diagonal line carries the nonzero
  character `x`. The nonsplit example of F.1.10 separately detects loss of extension data.

#### F.1 Dependencies

[F.0.1](#completed-coefficient-products); ArithmeticGaloisRepresentations Layer 1;
`IntegralHeckeAndGaloisDeterminants` Layer 0; Mathlib `Matrix.GeneralLinearGroup`,
`MulAction.orbitRel`, `Module.Free`, `IsLocalRing`, `IsArtinianRing`.

<a id="phi-p-condition"></a>

### F.2.1 Mazur's finiteness condition `Φ_p`

**The condition.** For a profinite group `G` and a prime `p`, `Φ_p(G)` holds if for every open
subgroup `Δ ≤ G` the set of continuous homomorphisms `Δ → 𝔽_p` is finite. Prove that `Φ_p(G)` holds
if and only if the maximal pro-`p` quotient of every open subgroup is topologically finitely
generated; that `Φ_p` passes to open subgroups; and that topologically finitely generated profinite
groups satisfy `Φ_p`. Quantifying only over `G` itself does not define `Φ_p` ([Gee22], §3.1, p. 12;
[KisinNotes], Lecture 1, (1.2), p. 1, and Exercise 1, p. 4).

*Proof sketch.* Passage to open subgroups is immediate, since an open subgroup of an open subgroup
is open in `G`. For a topologically finitely generated `G`, every open subgroup is topologically
finitely generated (Tau Ceti `topologicalGeneratorRankNat_le_of_openSubgroup`), and a topologically
finitely generated group has finitely many homomorphisms with open kernel to `ℤ/p`
(`IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`). For the characterisation,
continuous homomorphisms `Δ → 𝔽_p` factor through `maximalProPQuotient p Δ`, and for a pro-`p` group
the topological generator rank equals the `𝔽_p`-dimension of the continuous dual
(`IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`).

The API:

- `PhiP`: the predicate `Φ_p` on profinite groups.
- `phiP_iff_fg`: `Φ_p(G) ↔` every open subgroup has topologically finitely generated maximal
  pro-`p` quotient.
- `PhiP.open`: `Φ_p` passes to open subgroups.
- `phiP_of_fg`: topologically finitely generated profinite groups satisfy `Φ_p`.

*Needs:* Mathlib `ProfiniteGrp`, `OpenSubgroup`, `ContinuousMonoidHom`; Tau Ceti
`IsTopologicallyFinitelyGenerated`, `IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`,
`maximalProPQuotient`, `topologicalGeneratorRankNat_le_of_openSubgroup`,
`IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`.

*Lean:* `PhiP`, `PhiP.open` (written `PhiP.«open»`), `phiP_of_fg`, the proved finite-group `example`.

**Checks.**

- **phiP_Zp.** `ℤ_p` satisfies `Φ_p`: its open subgroups are `pᵏℤ_p ≅ ℤ_p`, each with exactly `p`
  continuous homomorphisms to `𝔽_p`.
- **phiP_open.** if `G` satisfies `Φ_p`, so does every open subgroup.
- **phiP_not_of_Hom.** for `p` odd let `G = (∏_ℕ ℤ/p) ⋊ ℤ/2`, the involution acting by inversion. Every
  continuous homomorphism `G → 𝔽_p` kills the commutators `x·σ(x)⁻¹ = x²`, hence the whole normal
  factor, so `Hom_cont(G, 𝔽_p) = 0`; but the open subgroup `∏_ℕ ℤ/p` has infinitely many continuous
  coordinate characters. A definition quantifying only over `G` would accept this group.
- **phiP_finite.** every finite group satisfies `Φ_p`.

<a id="phi-p-global"></a>

### F.2.2 Global and local Galois groups satisfy `Φ_p`

**Arithmetic examples.** For a number field `F` and a finite set of places `S`, `Φ_p(G_{F,S})`
holds, where the maximal extension unramified outside `S` may ramify at the infinite places: apply
the finiteness of `H¹(G_{K,S}, 𝔽_p)` from ArithmeticGaloisDuality R02.3 to the finite extension `K`
attached to each open subgroup. For a finite extension `K/ℚ_ℓ`, with `ℓ` arbitrary including `p`,
`Φ_p(G_K)` holds by ClassFieldTheory Layer 5 `finite_H`, applied to `H¹(G_L, 𝔽_p)` for every finite
extension `L/K`; open subgroups of `G_K` are exactly these `G_L`. When `ℓ = p`,
`LocalGaloisGroups` Layer 3 alternatively gives topological finite generation of `G_L(p)` ([Gee22],
§3.1, p. 12; [KisinNotes],
Lecture 1, (1.2), p. 2).

*Needs:* [F.2.1](#phi-p-condition); ArithmeticGaloisDuality R02.3; ClassFieldTheory Layer 5
`finite_H`; `LocalGaloisGroups` Layer 3 for the `ℓ = p` alternative.

**Checks.**

- **phiP_GQS.** for `p` odd, `F = ℚ` and `S = {p, ∞}`, `Hom_cont(G_{ℚ,S}, 𝔽_p)` is one-dimensional (the
  first layer of the cyclotomic `ℤ_p`-extension, since `ℤ_pˣ = μ_{p−1} × (1 + pℤ_p)`); for `p = 2` it is
  two-dimensional. Both are finite, as `Φ_p` requires.
- **phiP_absolute_fails.** the absolute Galois group `G_ℚ` does not satisfy `Φ_p`: it has infinitely
  many independent quadratic (for `p = 2`) or cyclic degree-`p` characters, ramified at different
  primes. The ramification bound `S` is needed.
- **phiP_local_rank.** for `K = ℚ_p` with `p` odd, `μ_p ⊄ ℚ_p`, so `G_{ℚ_p}(p)` has `N + 1 = 2` topological
  generators (`LocalGaloisGroups` Layer 3, `N = [K : ℚ_p] = 1`), matching
  `ℚ_pˣ/ℚ_pˣᵖ ≅ (ℤ/p)²`: `Hom_cont(G_{ℚ_p}, 𝔽_p)` is two-dimensional.

<a id="universal-lifting-ring"></a>

### F.2.3 The universal lifting ring

**Theorem.** Under `Φ_p(G)`, use `R^□_ρ̄ ∈ C_𝒪` and `ρ^□` for the continuous framed
representing pair of `DeformationAndDerivedPatchingAlgebra`, §§2.6–2.7, specialized to `𝒪`,
`k`, `n` and the fixed residual basis. Continuous local
`𝒪`-algebra maps `R^□_ρ̄ → A` correspond naturally and bijectively to `Lift_ρ̄(A)`, by pushforward of
`ρ^□`. No Schur hypothesis is needed ([KisinNotes], Lecture 1, Proposition (1.2.1)(1) and its proof, p. 2;
[Gee22], Lemma 3.2 and Definition 3.3, p. 12).

*Proof sketch.* The continuous lifting functor preserves fibre products along surjections:
matrices and their reduction equations glue entrywise, and continuity into the finite Artinian
fibre product is equivalent to continuity of its projections. Its tangent space is finite by
`Φ_p` and the framed tangent count supplied by ArithmeticGaloisDuality `D8`.1. Apply SchemeAndStackFoundations
§4.4's Schlessinger pro-representability theorem and pass to complete coefficients using the
inverse-limit comparison of F.1.1. Specialise to global and local Galois groups by F.2.2.
For comparison with the matrix construction, `H=ker ρ̄` is open and `Φ_p(G)` makes its maximal
pro-`p` quotient finitely generated by F.2.1. Every Artinian lift kills the kernel of
`H → H(p)`, so §2.7 applies even when `G` itself is not finitely generated. The Schlessinger
representing pair has a unique continuous labelled isomorphism to that common pair carrying
the actual universal lifts to each other. Use this identification for `R^□_ρ̄` and its maps.

*Needs:* DeformationAndDerivedPatchingAlgebra §§2.6–2.7;
[F.2.1](#phi-p-condition); [F.1.1](#lifting-functor); `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`;
SchemeAndStackFoundations §§4.2–4.4; Mathlib
`MvPowerSeries`, `IsAdicComplete`.

**Checks.**

- **univLiftRing_rank_one_Zp.** for `G = ℤ_p`, `n = 1`, `ρ̄ = 1`, `R^□ = 𝒪⟦T⟧` with `ρ^□(1) = 1 + T`.
- **univLiftRing_trivial_group.** for `G = 1`, `Lift(A)` is a point and `R^□ = 𝒪`.
- **univLiftRing_not_schur_needed.** for `ρ̄ = 1 ⊕ 1` of `G = ℤ_p`, a lift is the free choice of the image
  `1 + X` of a topological generator in the pro-`p` group `Γ̂₂(A)`, so `R^□ = 𝒪⟦X₁₁, X₁₂, X₂₁, X₂₂⟧`
  exists although `Def` is not pro-representable.
- **univLiftRing_pair_comparison.** in the rank-one `ℤ_p` case, a second representing pair
  identifies with `𝒪⟦T⟧` by its universal value `1+T`. The automorphism `T ↦ T+T²` does not
  preserve that value, so it is not a second isomorphism of representing pairs.

<a id="universal-continuous-lift"></a>

### F.2.4 The universal continuous lift over the inverse-limit ring

**The universal lift.** Under `Φ_p(G)`, specialize `DeformationAndDerivedPatchingAlgebra`,
§2.7's universal representation on the common framed ring of F.2.3. Its inverse-limit
description recovers `ρ^□` from the compatible universal lifts over `R^□/𝔪ʳ`; the
representing-pair identification preserves every reduction. Its reduction is `ρ̄` and its entries are continuous for
the adic topology. Evaluation at this lift realizes the representing bijection for every complete
coefficient object, not only for Artinian quotients ([Gee22],
Definition 3.3, p. 12; [KisinNotes], Lecture 1, Remark (1.2.2)(2), p. 2).

The API consists of aliases and specializations on this same ring and universal lift:

- `univLift`: `ρ^□ : G →* GLₙ(R^□_ρ̄)`, continuous.
- `univLift_reduce`: `ρ^□ mod 𝔪 = ρ̄`.
- `liftEquivHom`: `Lift_ρ̄(A) ≃` local `𝒪`-algebra maps `R^□_ρ̄ → A`, for `A ∈ C_𝒪`.
- `univLift_continuous`: `ρ^□` is continuous for the `𝔪`-adic topology.

*Needs:* DeformationAndDerivedPatchingAlgebra §2.7; [F.2.3](#universal-lifting-ring);
[F.1.1](#lifting-functor); [F.0.1](#completed-coefficient-products); Mathlib `IsAdicComplete`.

**Checks.**

- **univLift_rank_one_trivial.** for `n = 1`, `ρ̄ = 1`, `ρ^□` is the tautological character into
  `𝒪⟦G^{ab,(p)}⟧ˣ`, the completed group algebra of the maximal abelian pro-`p` quotient.
- **univLift_residue.** `ρ^□` reduces to `ρ̄`.
- **univLift_not_Artinian.** for `G = ℤ_p` in rank one with trivial residual character the representing
  ring `𝒪⟦T⟧` is not Artinian, so the universal lift cannot be replaced by a lift over one fixed
  Artinian quotient.

<a id="universal-deformation-ring"></a>

### F.2.5 The universal deformation ring

**Theorem.** Under `Φ_p` and the Schur hypothesis, `Def_ρ̄` is pro-represented by `R_ρ̄ ∈ C_𝒪` with `a`
universal strict class: `Hom_{C_𝒪}(R_ρ̄, A) ≅ Def_ρ̄(A)` naturally. Without Schur, construct a hull from
the criteria of SchemeAndStackFoundations §4.4 and keep versality distinct from a representing
bijection: automorphisms can prevent pro-representability, and a hull is not called a universal ring ([KisinNotes], Lecture 1,
Proposition (1.2.1)(2), p. 2; [Gee22], Lemma 3.5, p. 12).

*Proof sketch.* Schlessinger's criteria hold for `Def_ρ̄`: the tangent space is finite by `Φ_p`, and
the gluing condition holds because, for Schur `ρ̄`, the stabiliser of a lift in `Γ̂ₙ(A)` is the
scalars `1 + 𝔪_A`, which surject along small extensions (F.1.5). After proving Schur representability, construct a chosen continuous universal representative by the inverse-limit argument of F.2.4, choosing compatible representatives along the Artinian tower.

Package a representing pair as `UniversalDeformation 𝒪 ρ̄ D`, where `D` is a
strict-conjugation-stable subfunctor of lifts on `C_𝒪`. Its data are `R_D ∈ C_𝒪`, a
continuous lift `ρ_D ∈ D(R_D)` and the universal property of its strict class. Write
`Defᴰ(A)` for the strict classes of `D(A)`. Provide
`UniversalDeformation.defEquivHom : Defᴰ(A) ≃ Hom_{C_𝒪}(R_D,A)` for every `A ∈ C_𝒪`;
its inverse sends `f` to `[f_*ρ_D]`, and pushforward along `A → B` corresponds to
postcomposition. This includes complete non-Artinian objects and their truncations.
The unrestricted existence theorem is the one above; F.3.2 supplies the condition quotients.
The representing-pair interface follows the Imperial College London FLT project.
Category instances for coefficient objects remain scoped to `C_𝒪`; representability
uses the stated `Φ_p` and Schur hypotheses on this same category.

The consumer API on these pairs includes the following results.

- `UniversalDeformation.hom_ext`: for `f,g : R_D → A` in `C_𝒪`, `f=g` iff
  `f_*ρ_D` and `g_*ρ_D` have the same strict class.
- `UniversalDeformation.mapOfLE`: an inclusion `D ≤ D′` induces
  `R_{D′} → R_D`, classifying the strict class of `ρ_D` in `D′(R_D)`. The maps
  respect identity inclusions and compose in this direction.
- `UniversalDeformation.mapOfLE_surjective`: this map is surjective. The inclusion
  gives an injection on tangent spaces, hence a surjection on relative cotangent spaces;
  complete Nakayama gives surjectivity on these complete Noetherian rings with residue `k`.
- `UniversalDeformation.surjective_of_traces`: for any such representing pair, if
  `ρ_A ∈ D(A)` has traces on a dense subset of `G` that topologically generate `A`
  over `𝒪`, its classifying map `R_D → A` is surjective. Apply the same complete
  cotangent criterion to the images of the centred traces. F.2.7 supplies trace
  generation of the universal ring in the absolutely irreducible case.

The map and surjectivity assertions use the relative cotangent and complete presentation
criterion of `DeformationAndDerivedPatchingAlgebra`, §1.9, specialized in F.0.2.
Universality identifies strict classes, so equality of chosen matrix representatives is
not required for `hom_ext`.

*Needs:* [F.2.1](#phi-p-condition); [F.1.3](#strict-deformation-functor);
[F.1.5](#strict-vs-full-conjugacy); `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`;
[F.2.3](#universal-lifting-ring); [F.2.4](#universal-continuous-lift); [F.0.2](#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4;
`DeformationAndDerivedPatchingAlgebra`, §§1.8–1.9 (truncations and the complete cotangent criterion).

**Checks.**

- **univDefRing_rank_one.** for `n = 1`, `R_ρ̄ = R^□_ρ̄ = 𝒪⟦G^{ab,(p)}⟧`.
- **univDefRing_hull_only.** for the trivial rank-two representation of `G = ℤ_p`, a hull exists
  but pro-representability fails. Put `A = k[t]/(t³)`, `B = k[t]/(t²)` and `M = I + tE₁₂`. In
  `A ×_B A`, the pairs `(M, M)` and `(M, I + (t + t²)E₁₂)` give distinct strict classes, but their
  projections to `Def(A) ×_{Def(B)} Def(A)` agree: conjugation by `I + tE₁₁` changes the second
  component as stated. A conjugator in the fibre product would have the same first-order matrix
  in both components, whose commutator with `E₁₂` would have to be both zero and `E₁₂`. Thus
  Schlessinger `H4` fails. For the trivial group itself the functor is a point and is represented
  by `𝒪`, despite the same non-Schur residual representation.
- **univDefRing_tangent.** `Hom(R_ρ̄, k[ε]) = H¹(G, ad ρ̄)`, of dimension `h¹(G, ad ρ̄)`, which differs
  from the framed count by `n² − h⁰ = n² − 1` for Schur `ρ̄`.
- **univDefRing_complete_naturality.** For `G=ℤ_p`, `n=1`, `ρ̄=1` and
  `A=𝒪⟦U⟧`, the character with value `1+U` corresponds to `T↦U` from
  `𝒪⟦T⟧`. Its reductions correspond to that same map modulo every positive power
  of `𝔪_A`; no single Artinian quotient represents this character over `A`.
- **univDefRing_condition_direction.** For the same residual character, the trivial-character
  condition is contained in the unrestricted condition. Its ring map is the surjection
  `𝒪⟦T⟧→𝒪`, `T↦0`; reversing this arrow would not classify the stricter condition.
- **univDefRing_trace_generation_needed.** The trivial character over `𝒪⟦U⟧` has
  classifying map `T↦0`, which misses `U`. Absolute irreducibility alone does not make
  a classifying map surjective; generation of the target by its traces is needed.

<a id="framed-unframed-comparison"></a>

### F.2.6 Framed rings are power series over unframed rings

**Theorem.** For a finite set `T`, define `TFramedLift(A)` as pairs `(ρ, α : T → Γ̂ₙ(A))`
and `UnrestrictedTFramedDef(A)` as their quotient by `(ρ, α) ↦ (βρβ⁻¹, βα)`. This definition
imposes no determinant, local conditions or ramification beyond the chosen group `G`.
For Schur `ρ̄` under `Φ_p`, choose a universal representative `ρ^univ` and construct an
isomorphism `R^□_ρ̄ ≅ R_ρ̄⟦X_{ij}⟧/(X₁₁)`, under which the universal framed lift is
`(1 + X)ρ^univ(1 + X)⁻¹`. A strict frame is normalised by its scalar unit in the distinguished entry;
the scalar centralizer removes exactly one variable, so the extension is formally smooth in `n² − 1`
variables. The same framing variables work with fixed determinant. For a nonempty finite framing set
`T` the simultaneous version has `n²|T| − 1` variables; `T` empty is unframed. None of these
coordinate isomorphisms is claimed to be canonical ([Gee22], Exercise 3.9, p. 13; [KisinNotes], Lecture 1,
Remark (1.2.2)(3), p. 2).

*Needs:* [F.2.3](#universal-lifting-ring); [F.2.5](#universal-deformation-ring);
[F.2.4](#universal-continuous-lift); [F.1.7](#fixed-determinant-functors);
[F.0.2](#minimal-relative-presentations); SchemeAndStackFoundations §§4.3–4.4; Mathlib `MvPowerSeries`, `Algebra.FormallySmooth`.

*Lean:* `TFramedLift`, its simultaneous action and `UnrestrictedTFramedDef`.

**Checks.**

- **framed_vars_rank_one.** for `n = 1` the number of framing variables is `0`, and `R^□ = R`.
- **framed_vars_T.** with `|T| = 2` and `n = 2` there are `7 = 4·2 − 1` variables, not `8`: one scalar
  direction is removed once, not once per place.
- **framed_normalisation_unique.** for a matrix whose `(1,1)` entry is a unit, there is exactly one unit
  scalar making that entry `1`; a normalisation of a non-unit entry is impossible, which is why the
  distinguished entry is that of a strict frame.

<a id="carayol-trace-theorem"></a>

### F.2.7 Universal deformation rings are generated by traces

**Theorem.** Let `ρ̄` be absolutely irreducible and assume `Φ_p(G)`. Then `R_ρ̄` is topologically
generated over `𝒪` by the traces `tr ρ^univ(g)` for `g` in any dense subset of `G`; equivalently the
closed `𝒪`-subalgebra generated by these traces is all of `R_ρ̄`. The same holds for the
fixed-determinant ring and, for a framing set `T`, the closed subring of `R^{□}` generated by traces
is the image of `R_ρ̄` ([Gee22], Exercise 3.8, p. 13, using Lemma 3.7, pp. 12–13; [KisinNotes], Lecture 1,
Theorem (1.4.1) and its proof, pp. 3–4).

*Proof sketch.* Traces separate deformations over `k[ε]` by Carayol's lemma and the Schur
normalisation of a conjugator. Hence their first-order coefficients separate the tangent space,
so the centred traces `span` the finite relative cotangent space
`𝔪_R/(𝔪_R² + λR)`. Choose finitely many giving a basis, subtract lifts of their residues in `𝒪`,
and apply complete Nakayama to obtain a surjection from a finite power-series ring over `𝒪` to
`R_ρ̄`. Thus these traces generate topologically. This avoids assuming that an arbitrary closed
subring of a Noetherian ring is Noetherian. The fixed-determinant case follows by quotienting, and
the framed assertion follows from F.2.6. Continuity allows the traces to be taken on any dense subset.

*Needs:* [F.2.5](#universal-deformation-ring); [F.1.3](#strict-deformation-functor);
ArithmeticGaloisRepresentations §5.10 (`GaloisRep.carayol_conj_of_trace_eq`) and §7.2
(`GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`);
`IntegralHeckeAndGaloisDeterminants` Layer 1 (`coefficient_descent`); [F.0.1](#completed-coefficient-products).

**Checks.**

- **traceGen_rank_one.** for `n = 1`, the traces are the values of the universal character, which
  generate `𝒪⟦G^{ab,(p)}⟧` topologically.
- **traceGen_framed_fails.** the framed ring `R^□` is not generated by traces when `n ≥ 2`: under
  `R^□ → R^□/𝔪_R R^□ ≅ k⟦X_{ij}⟧/(X₁₁)` every trace maps to a constant, while the framing variable
  `X₁₂` of F.2.6 does not.
- **traceGen_reducible_fails.** for `ρ̄ = 1 ⊕ 1` of `G = ℤ_p`, the lifts `diag(1 + T, 1)` and
  `diag(1, 1 + T)` over `𝒪⟦T⟧` both have trace `2 + T` but are not strictly conjugate (a conjugator
  carries one eigenline to the other, so its reduction is antidiagonal): traces do not determine
  strict classes without absolute irreducibility.

<a id="determinant-comparison-isomorphism"></a>

### F.2.8 For absolutely irreducible `ρ̄` the determinant map is an isomorphism

**Theorem.** If `ρ̄` is absolutely irreducible, the map `δ : Def_ρ̄ → DetDef_D̄` of F.1.10 is a natural
isomorphism on `Art_𝒪`, and on `C_𝒪` by inverse limits. Whenever `R_ρ̄` exists it therefore also
represents `DetDef_D̄`. No ordinary fixed determinant character is imposed ([Chenevier], §3.1,
Example 3.4, p. 42; [Chenevier], Theorem 2.`22(i)`, p. 34, with the Cayley–Hamilton quotient of §1.17).

*Proof sketch.* Surjectivity: for a determinant deformation `D` over Artinian local `A`, apply
henselian reconstruction (`Determinant.exists_ofMatrix_eq_of_henselian`, whose proof passes through
the Cayley–Hamilton quotient `A[G]/CH(D)`); the residual law is split and absolutely irreducible and
an Artinian local ring is henselian. Match the reconstructed reduction
with `ρ̄` by a change of basis, and check continuity on the finite quotient through which `D` factors.
Injectivity: equal determinant laws give equal traces, and strict conjugacy follows from
ArithmeticGaloisRepresentations §5.10.

*Needs:* [F.1.10](#determinant-comparison); [F.2.7](#carayol-trace-theorem);
[F.2.5](#universal-deformation-ring); `IntegralHeckeAndGaloisDeterminants` Layers 0–1
(`Determinant.exists_ofMatrix_eq_of_henselian`); ArithmeticGaloisRepresentations §5.10.

**Checks.**

- **detIso_rank_one.** for `n = 1` the comparison is the identity of `Lift_{χ̄}`.
- **detIso_needs_absIrred.** for the reducible example of F.1.10 the map is not injective, so absolute
  irreducibility cannot be weakened to Schur here (a nonsplit extension of distinct characters can be
  Schur).
- **detIso_charpoly.** in rank two, `δ(ρ)` has characteristic coefficients `Λ₁(g) = tr ρ(g)` and
  `Λ₂(g) = det ρ(g)`; a comparison through the determinant character alone loses `Λ₁` and cannot be
  injective (all lifts with fixed determinant would collapse).

<a id="fixed-determinant-rings"></a>

### F.2.9 Fixed-determinant rings and change of determinant

**Theorem.** Under `Φ_p`, the closed quotient of `R^□_ρ̄` by the equations `det ρ^□(g) − χ(g)` for all
`g` represents `LiftDet`; in the Schur case the corresponding quotient of `R_ρ̄` represents
`DefDet`. Construct the continuous universal lifts of these quotients by reducing the universal lifts, using the inverse-limit comparison of F.2.4 and the Schur representative of F.2.5. If `p ∤ n`, the `n`-th power map is a bijection of `1 + 𝔪_A`; with its inverse define
`ψ = (χ_A⁻¹ det ρ)^{1/n}`. Then `ρ ↦ (ψ⁻¹ ⊗ ρ, ψ)` gives
`R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪⟦G^{ab,(p)}⟧`, and similarly unframed. For another compatible `χ′`,
twisting by the unique `n`-th root of `χ′χ⁻¹` identifies the fixed-determinant rings. The hypothesis
`p ∤ n` stays on the root and on the product assertions ([Gee22], §3.18 and Exercise 3.19, p. 15).

For Schur `ρ̄`, package the fixed-determinant representing pair using the same
`UniversalDeformation` interface with `D=LiftDet_χ`. Its `defEquivHom` is natural on all
of `C_𝒪` and sends the quotient universal lift to the identity map. The determinant
quotient map is `mapOfLE` for `LiftDet_χ ≤ Lift`, and is surjective. For a further
condition use `D ∩ LiftDet_χ`, as in F.3.2. None of these universal properties requires
`p ∤ n`; that hypothesis belongs only to the root and twisting decompositions.

*Needs:* [F.1.7](#fixed-determinant-functors); [F.2.3](#universal-lifting-ring);
[F.2.5](#universal-deformation-ring); [F.2.4](#universal-continuous-lift); [F.2.1](#phi-p-condition); Mathlib
`Matrix.GeneralLinearGroup.det`.

*Lean:* `exists_unique_nthRoot_of_residue_eq_one` adds uniqueness and the `p∤n` formulation to the supplied Hensel existence theorem.

**Checks.**

- **fixedDet_rank_one.** for `n = 1`, `R^□_{ρ̄,χ} = 𝒪` and the product decomposition is
  `R^□ = 𝒪⟦G^{ab,(p)}⟧`.
- **nthRoot_unique.** for `p ∤ n`, `x ↦ xⁿ` is injective on `1 + 𝔪_A` for Artinian local `A`.
- **nthRoot_fails_p_dvd_n.** in `𝔽₃[ε]` with `ε≠0` and `ε²=0`, every unit with
  residue one is `1+aε` and has cube `1`. Hence there is no residue-one unit whose
  cube is `1+ε`; the splitting needs `p ∤ n`.

<a id="change-of-residue-field"></a>

### F.2.10 Representing rings under change of coefficients

**Theorem.** For a finite local map `𝒪 → 𝒪′` with residue inclusion `k → k′`, let `ρ̄′ = ρ̄ ⊗ k′`.
Then `R^□_{ρ̄′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′`, by the coefficient change of F.1.8 and the representing
property; in the Schur case the same holds for the unframed rings, and both fixed-determinant
versions hold. The maps carry the universal lifts or classes to their scalar extensions. Finiteness
of `𝒪′` over `𝒪` ensures that the completed tensor product is again a Noetherian coefficient object
([Gee22], §3.1, p. 12).

*Needs:* [F.1.8](#change-of-coefficients); [F.2.3](#universal-lifting-ring);
[F.2.5](#universal-deformation-ring); [F.0.1](#completed-coefficient-products).

**Checks.**

- **changeRing_id.** for `𝒪′ = 𝒪` the isomorphism is the identity.
- **changeRing_rank_one.** for `n = 1`, `𝒪⟦G^{ab,(p)}⟧ ⊗̂_𝒪 𝒪′ = 𝒪′⟦G^{ab,(p)}⟧`.
- **changeRing_unramified_residue.** for `𝒪′ = W(k′)` over `𝒪 = W(k)` the residue field changes, and `a`
  statement keeping residue field `k` for `R^□_{ρ̄′}` would have no residue map to `k′`.

<a id="pseudodeformation-rings"></a>

### F.2.11 Continuous pseudodeformation rings

**Theorem.** Let `G` be profinite and `D̄ : k[G] → k` a continuous determinant of dimension `n`
(equivalently, by `IntegralHeckeAndGaloisDeterminants` Layer 1, the isomorphism class of a continuous
semisimple `ρ̄` with characteristic polynomials over `k`). The functor `DetDef_D̄` of F.1.9 on finite local
`𝒪`-algebras with residue field `k` is represented by a profinite local `𝒪`-algebra `R^ps_D̄` with `a`
universal continuous determinant, and it extends to inverse limits of such algebras. `R^ps_D̄` is
topologically generated by the characteristic coefficients `Λᵢ(g)` of the universal determinant. If `G`
satisfies `Φ_p`, `R^ps_D̄` is Noetherian, hence an object of `C_𝒪`, and every deformation of `D̄` factors
through `G/H`, where `H ⊆ ker ρ̄` is the smallest closed normal subgroup with `ker ρ̄/H` pro-`p`. For `a`
continuous character `δ` lifting `det D̄`, the fixed-determinant ring `R^{ps,δ}_D̄` is the quotient by
`Λₙ(g) − δ(g)`. Coefficient change is the completed scalar extension, as in F.2.10. When `D̄` is the
determinant of an absolutely irreducible `ρ̄`, `R^ps_D̄ = R_ρ̄` by F.2.8; in general `D̄` may be residually
reducible, and no comparison with a representation deformation ring is asserted ([Chenevier], §3.1,
Lemma 3.2, Proposition 3.3 and Remark 3.5, pp. 41–42; Proposition 3.7, Example 3.6 and Lemma 3.8,
p. 43).

*Proof sketch.* Representability: take the Roby algebra `Γⁿ_𝒪(𝒪[G])^{ab}` with its universal
multiplicative law (`IntegralHeckeAndGaloisDeterminants` Layer 0). Take the inverse limit of its
finite local quotients with the specified residual point for which the universal determinant is
continuous; this continuity condition is part of the indexing system. Noetherianity: by Lemma 3.8
a deformation factors through `G/H`, which is topologically finitely generated under `Φ_p`;
Corollary 2.39 then gives the finite cotangent space used in Proposition 3.7.

The API:

- `PseudoDefRing`: `R^ps_D̄ ∈ C_𝒪` (under `Φ_p`) with its universal determinant.
- `PseudoDefRing.equivHom`: `DetDef_D̄(A) ≃` local `𝒪`-algebra maps `R^ps_D̄ → A`.
- `PseudoDefRing.topologicallyGenerated`: generation by the coefficients `Λᵢ(g)`.
- `PseudoDefRing.fixedDet`: the fixed-determinant quotient `R^{ps,δ}_D̄`.
- `PseudoDefRing.eq_univDefRing`: for absolutely irreducible `ρ̄`, `R^ps_D̄ ≅ R_ρ̄` (F.2.8).

*Needs:* [F.1.9](#determinant-deformation-functor); [F.2.1](#phi-p-condition); [F.2.2](#phi-p-global);
[F.2.8](#determinant-comparison-isomorphism); `IntegralHeckeAndGaloisDeterminants` Layers 0–1;
[F.0.1](#completed-coefficient-products).

**Checks.**

- **pseudoDef_rank_one.** for `n = 1`, determinants are characters and `R^ps_D̄ = 𝒪⟦G^{ab,(p)}⟧`, the
  universal deformation ring of the character.
- **pseudoDef_reducible.** assume `Φ_p`, distinct `χ₁`, `χ₂`, and a nonsplit residual extension
  with `dim Ext¹(χ₂, χ₁) ≥ 2`. It is Schur, so `R_ρ̄` exists by F.2.5. The noninjectivity of
  `δ : Def_ρ̄ → DetDef_D̄` in F.1.10 shows that the natural ring map `R^ps_D̄ → R_ρ̄` is not
  surjective: this comparison is not a closed immersion, even though both rings exist.
- **pseudoDef_not_noetherian.** for `G = ∏_ℕ ℤ/p`, which fails `Φ_p`, and `n = 1` with trivial `D̄`, `R^ps_D̄`
  is the completed group algebra of `G`, whose tangent space is infinite-dimensional: it is profinite
  but not Noetherian.

#### F.2 Examples

- For `G = ℤ_p`, `n = 1` and trivial residual character, the framed, unframed and pseudodeformation
  rings are `𝒪⟦T⟧`; the universal lift is `1 ↦ 1 + T`, and the fixed-determinant ring is `𝒪`.
- For `G = ℤ_p` and `ρ̄ = 1 ⊕ 1`, the framed ring exists while the unframed functor has only a hull;
  the two lifts `diag(1 + T, 1)` and `diag(1, 1 + T)` have equal traces.

#### F.2 Dependencies

§§F.1.1–F.1.10; [F.0.1](#completed-coefficient-products); [F.0.2](#minimal-relative-presentations); SchemeAndStackFoundations §§4.2–4.4; ArithmeticGaloisDuality R02.3;
ClassFieldTheory Layer 5; `LocalGaloisGroups` Layer 3; `IntegralHeckeAndGaloisDeterminants` Layers 0–1 (including the Roby
algebra);
ArithmeticGaloisRepresentations §5.10 and §7.2; Tau Ceti profinite generation; Mathlib
`MvPowerSeries`, `IsAdicComplete`, `Algebra.FormallySmooth`.

<a id="local-deformation-problem"></a>

### F.3.1 Local deformation problems

**Definition.** For a profinite `G_v` satisfying `Φ_p` and a residual `ρ̄_v`, a local deformation
problem is a family `D(A) ⊆ Lift_ρ̄_v(A)`, for `A ∈ C_𝒪`, satisfying six axioms: it contains the
residual point; it is preserved by coefficient morphisms; it is detected along injective coefficient
morphisms; it glues, that is, for closed ideals `I₁, I₂` and an identification `R₁/I₁ ≅ R₂/I₂`, a pair
of lifts in `D(R₁)` and `D(R₂)` with equal images over the quotient defines a lift in
`D(R₁ ×_{R₁/I₁} R₂)`; it is detected by a decreasing separated filtration of ideals; and it is stable
under strict conjugation. Each axiom is stated with actual lifts and classifying maps. The
unrestricted problem is the whole lifting functor. The nonzero condition quotients of Layers 2–8 carry this interface. A zero type quotient represents the empty lifting subfunctor and is not bundled as a `DeformationProblem` ([Gee22], Definition 3.16, p. 14).

The API:

- `DeformationProblem`: `a` `Γ̂ₙ`-stable family of lifts satisfying the six axioms.
- `DeformationProblem.unrestricted`: all lifts.
- `DeformationProblem.mem_map`: closure under pushforward.
- `DeformationProblem.conj_mem`: stability under `Γ̂ₙ`-conjugation.
- `DeformationProblem.ofPredicate P`: restrict a predicate on the supplier's continuous
  finite free representations to lifts using F.1.4. The hypotheses are `P(ρ̄_v)` and
  the five closure properties: invariance under marked isomorphisms (or strict
  conjugation on lifts), coefficient pushforward, descent along injective coefficient
  morphisms, gluing over the fibre products in the definition, and detection along
  decreasing separated filtrations of closed ideals. All coefficient objects and maps
  belong to the same `C_𝒪`; the limit is required to belong to it. Expose each
  hypothesis as a closure theorem for each instance, including its specialization
  `truncationLimit` to all `A/𝔪_A^(r+1)`, `r≥0`.
- `DeformationProblem.mem_iff_jointlyInjective`: for a nonempty finite family of
  coefficient morphisms `f_i : A → B_i` whose kernels have intersection zero,
  `ρ ∈ D(A)` iff every `(f_i)_*ρ ∈ D(B_i)`. This does not regard `∏ B_i` as a local
  coefficient object. By F.3.2, the classifying map kills the condition ideal iff all
  its composites kill it; equivalently glue the image quotients and use injective descent.
- `DeformationProblem.mem_iff_truncations`: for `A ∈ C_𝒪`, `ρ ∈ D(A)` iff
  every reduction in `Lift(A/𝔪_A^(r+1))` belongs to the same problem. Use the labelled
  truncations, residue identifications and complete limit of
  [DeformationAndDerivedPatchingAlgebra §1.8](../DeformationAndDerivedPatchingAlgebra/README.md#18-truncations-and-complete-towers).
  The forward implication is coefficient
  pushforward; the reverse is the separated-limit axiom.

The instances are unramified lifts in [2.2](#t2-2), the Steinberg flat-closure
condition in [2.5](#t2-5), ordinary lifts with the fixed residual filtration and character
hypotheses in [6.3](#t6-3), and the flat condition in [4.1](#t4-1) from
`FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.6.7. The finite-flat condition
interface applies for every `p` and every ramification index; the geometric assertions
of Layer 4 retain their own odd-prime hypotheses. Each instance supplies these five closure
theorems and the residual point; the two detection theorems then apply without new
condition-specific finiteness assumptions. No nonvanishing-monodromy condition is imposed
on the Steinberg boundary, and an ordinary flag image without unique flags is not
asserted to satisfy injective descent. Finiteness for Noetherian representing rings
comes from `Φ_p(G_v)`.

*Needs:* [F.1.1](#lifting-functor); [F.1.4](#module-deformations-are-strict-classes);
[F.1.6](#restriction-of-deformations); `DeformationAndDerivedPatchingAlgebra`, §1.8;
`ArithmeticGaloisRepresentations`, §§1.2 and 1.9 (continuous representations and markings).

(Sources for the constructor and detection API: [CHT08], Definition 2.2.2 and
Lemma 2.2.3, pp. 18–19; the factor-through-ideal criterion of F.3.2.)

**Checks.**

- **defProblem_unrestricted.** all lifts form a deformation problem.
- **defProblem_residue.** `(k, ρ̄_v)` belongs to every deformation problem; the empty family satisfies
  the other five axioms and is excluded only by this one.
- **defProblem_not_conj_stable.** take `G = ℤ/2` with generator `σ`, `A = 𝔽₃[ε]`, `D = diag(1, −1)`,
  `ρ(σ) = D` and `b = 1 + εE₂₁`. Then `b` reduces to `1` and `bDb⁻¹ = D + 2εE₂₁` has a nonzero lower-left
  entry, so the condition "upper triangular in this basis" is not stable under strict conjugation and
  is not a deformation problem. A central prescribed matrix such as `1` gives no such
  counterexample.
- **defProblem_jointly_not_individually_injective.** For
  `A=k[x,y]/(x,y)²`, the two maps to `A/(x)` and `A/(y)` are jointly injective, but
  neither is injective. The detection theorem applies to this family without requiring
  either individual map to be injective.
- **defProblem_all_truncations.** For the trivial-character condition on lifts of
  `ρ̄=1` of `ℤ_p` to `A=k⟦T⟧`, the value `1+T` is trivial modulo `𝔪_A` but
  not modulo `𝔪_A²`. Checking only the residue field cannot replace all truncations.

<a id="deformation-problem-ideal"></a>

### F.3.2 Deformation problems are invariant ideals of the lifting ring

**Theorem.** To a local deformation problem `D` associate a closed ideal `I(D) ⊆ R^□_ρ̄_v` such that `a`
lift lies in `D` exactly when its classifying map kills `I(D)`. The universal strict conjugation
transformations preserve the ideal; these transformations, indexed by matrices over universal rings,
are not asserted to form an ordinary group action on that ring. The annihilator of `I(D)` in the
tangent space is `L̃(D) ⊆ Z¹(G_v, ad ρ̄_v)`, the inverse image of a subspace
`L(D) ⊆ H¹(G_v, ad ρ̄_v)`. Every proper closed strict-conjugation-invariant ideal
`I ⊊ R^□_ρ̄_v` defines a problem
`D(I)`, and the two constructions are inverse on proper invariant ideals. Invariance means that
for every coefficient object `A`, every classifying map `α : R^□_ρ̄_v → A` killing `I` and every
strict conjugator `b ∈ Γ̂ₙ(A)`, the classifying map of `bρ_αb⁻¹` also kills `I`. This includes
non-radical invariant ideals. Properness supplies the residual point; it does not imply invariance,
even for `I = 𝔪`. The radical case of [Gee22]’s converse is a special case of the general correspondence of
[CHT08] Lemma 2.2.3 ([Gee22], Lemma 3.17, p. 14; [CHT08], Lemma 2.2.3, p. 19).

Under the Schur hypothesis, apply the same condition to the universal strict class to
construct its closed quotient of `R_ρ̄` and its `UniversalDeformation 𝒪 ρ̄ D` pair.
Its continuous representative is obtained by reducing the chosen universal representative;
strict-conjugacy stability makes the condition independent of that choice.
The quotient represents `Defᴰ` on every object of `C_𝒪`, and satisfies the
`defEquivHom`, `hom_ext` and inclusion-map API of F.2.5. The framed quotient remains
available without Schur.

For a compatible determinant lift `χ_v`, pull `D_v` back along `LiftDet_{χ_v} → Lift` and write
`D_v^χ(A) = D_v(A) ∩ LiftDet_{χ_v}(A)`. If `q_χ : R^□_ρ̄_v ↠ R^□_{ρ̄_v,χ_v}` is the determinant
quotient, put `I_v^χ = q_χ(I(D_v))`; the quotient by this image ideal represents `D_v^χ`.
The fixed-determinant tangent adapter is

```text
L̃_v^χ = { z ∈ Z¹(G_v, ad⁰ρ̄_v) : image(z) ∈ L̃(D_v) },
i_v : H¹(G_v, ad⁰ρ̄_v) → H¹(G_v, ad ρ̄_v),
L_v^χ = i_v⁻¹(L(D_v)).
```

Thus `L̃_v^χ` is the inverse image of `L_v^χ` under `Z¹(ad⁰) → H¹(ad⁰)`.
Every full-adjoint coboundary `d⁰X`, for `X ∈ ad`, has trace zero and belongs to `L̃_v^χ`:
conjugating the residual lift by `1 − εX` gives `(1 + εd⁰X)ρ̄`, and strict-conjugacy stability puts
it in `D_v`. The strict-class tangent of `D_v^χ` is therefore `L_v^χ/im δ_v`, where
`δ_v : H⁰(G_v, k) → H¹(G_v, ad⁰)` is the trace-sequence boundary and `ker i_v = im δ_v`.
When `p ∤ n`, `i_v` is injective and this is the usual trace-zero restriction of `L(D_v)`;
when `p | n`, neither that inclusion nor the deletion of `im δ_v` is asserted ([Gee22], Exercise 3.19,
p. 15; `SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*).

*Needs:* [F.3.1](#local-deformation-problem); [F.2.3](#universal-lifting-ring);
[F.2.9](#fixed-determinant-rings); `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`;
`SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*.

*Lean:* `adjoint_coboundary_mem_slIdeal`.

**Checks.**

- **ideal_unrestricted.** `I(unrestricted) = 0` and `L(unrestricted) = H¹`.
- **ideal_unramified.** for `G_v` with inertia `I_v` and unramified `ρ̄_v`, the unramified problem has
  ideal generated by the entries of `ρ^□(σ) − 1` for `σ ∈ I_v`, and `L = H¹_ur`.
- **ideal_nonradical.** a condition whose ideal is not radical (for example `(T²)` in `𝒪⟦T⟧`, which is
  strict-conjugation invariant in rank one) has a residual point and a nonzero nilpotent tangent
  thickening; a statement asserting radicality for every problem would exclude it.
- **ideal_unit_excluded.** `I = R^□` is radical and invariant, but no unital residue map kills `1`,
  so `D(I)(k)` is empty. It is excluded by properness, not by `I ≠ 𝔪`.
- **ideal_maximal_not_invariant.** for `𝒪 = ℤ₃`, `G = ℤ/2` and residual generator
  `D = diag(1, −1)`, the constant lift over `A = 𝔽₃[ε]/(ε²)` kills `𝔪`, but its strict conjugate
  by `b = 1 + εE₂₁` has generator `D + 2εE₂₁ ≠ D` and does not factor through `k`.
  Thus `𝔪` is not invariant. Its zero relative tangent space cannot contain the nonzero
  coboundary direction of this conjugation.
- **fixed_local_tangent_rank_one.** take `F = ℚ`, `p = 3`, `S = {3, 7}`, `T = {3}`, rank one and
  unrestricted local conditions. At `7`, `L(D_7) = H¹(G_7, k)` contains the nonzero unramified
  character direction, but `ad⁰ = 0` and `L_7^χ = L̃_7^χ = 0`. The fixed-determinant quotient uses
  this zero space, while the unrestricted local tangent condition retains the full-adjoint direction.
- **fixed_local_full_boundary.** for any local action, `d⁰X` with `X ∈ ad` lies in `L̃_v^χ`.
  Hence its image in `C¹(G_v, ad⁰)/L̃_v^χ` is zero even when `v ∉ T` and the local degree-zero
  term is zero; trace zero alone would only place it in the numerator.
- **fixed_local_trace_boundary.** if `p | n` and the local residual centralizer is scalar,
  `tr : H⁰(ad) → k` is zero and `δ_v` is injective. The unrestricted condition then has
  `L_v^χ = H¹(ad⁰)` but strict-class tangent `H¹(ad⁰)/im δ_v`.

<a id="inertia-rigid-deformations"></a>

### F.4.12 Inertia-rigid deformation rings

**Theorem.** Fix a profinite `G` with a finite normal inertia subgroup `I` and `G/I ≅ ℤ̂`, a lift `F`
of a generator, a residual rank-`d` representation, and an `𝒪`-valued lift `ρ₀` of determinant `φ`.
Form the affine scheme of pairs `(ρ_I, f)` satisfying the `F`-conjugation relation, determinant `φ`
and the equality of characteristic polynomials with `ρ₀` on every element of `I`. Complete its
`p`-torsion-free quotient at the residual point to obtain `R^□_{φ,0,fl}`. The residual point lies on
the flat part, every irreducible component is faithfully flat over `𝒪` of absolute dimension `d²`,
and the generic fibre is regular. Its `𝒪′`-points are exactly the determinant-`φ` lifts whose inertia
restriction is conjugate over the fraction field of `𝒪′` to that of `ρ₀`. Apply to finite inertial
image away from `p`, using SchemeAndStackFoundations §0.21's excellence and completion theorems
([KW209], §2.7,
Propositions 2.10 and 2.11, pp. 15–16; [KWESI], §2.3, Propositions 2.6–2.7, pp. 9–11).

*Needs:* [F.2.3](#universal-lifting-ring); [F.1.7](#fixed-determinant-functors);
[F.0.1](#completed-coefficient-products); SchemeAndStackFoundations §§0.16, 0.20–0.21.

**Checks.**

- **inertiaRigid_trivial_I.** for `I = 1` the ring is the unramified fixed-determinant ring, formally
  smooth of relative dimension `d² − 1` over `𝒪`, so of absolute dimension `d²`.
- **inertiaRigid_type.** if `ρ₀|I` is a nontrivial character plus the trivial character, the unramified
  lifts are not points of `R^□_{φ,0,fl}`, because their characteristic polynomials on `I` differ from
  those of `ρ₀`; a ring defined without the characteristic-polynomial equations would contain them.
- **inertiaRigid_flat_part.** the scheme before passing to the `p`-torsion-free quotient can have
  components in the special fibre; the theorem is about the flat quotient.

## Layer 0: Coefficient and comparison prerequisites

<a id="t0-1"></a>

### 0.1 Canonical modules and type under regular quotients

For a nonzero complete Cohen–Macaulay local quotient `R` of a regular local power-series ring `S`, use `DeformationAndDerivedPatchingAlgebra`, §3.9's canonical module `K_R`, with its comparison `K_R≅Ext_S^{dim S−dim R}(R,S)`. The local name `CanonicalModule` denotes this same module. Presentation independence up to isomorphism, power-series extension, quotient by a regular sequence in the maximal ideal and the type/socle/Gorenstein tests specialize that interface. In particular `CanonicalModule.regularQuotient` and `CanonicalModule.type_eq_socle` are its specialized comparisons. The minimal generator number is the Cohen–Macaulay type, equal to the socle dimension of an Artinian parameter quotient; type one characterizes Gorenstein rings.

The graded comparison used in 6.18 belongs here. For a nonzero standard graded Cohen–Macaulay quotient `C=P/I`, `P=k[x₁,…,x_N]`, with homogeneous `I`, put `d=dim C` and `ω_C=Ext_P^{N−d}(C,P(−N))` in graded modules. `CanonicalModule.completion` identifies its completion at `C_+`, after forgetting the grading, with the supplied canonical module of the completed local ring. A finite graded free resolution over `P` and flatness of completion identify the completed `Ext` with `Ext` over `k[[x₁,…,x_N]]`. Its residue generator number therefore computes the same type. This comparison and the supplied regular-quotient tests give the canonical-module tests for 6.18.

**Checks.**

- For `S` itself, `ω_S≅S` and its type is one.
- `k[[x,y]]/(x,y)²` has socle spanned by `x`,`y` and type two, so it is not Gorenstein.
- A regular-sequence quotient preserves type; a Cohen–Macaulay ring of type three cannot acquire type one through such a quotient.
- For `C=P`, the graded canonical module is `P(−N)`; after completion and forgetting grading it is free of rank one over `k[[x₁,…,x_N]]`, of type one.

*Needs:* DeformationAndDerivedPatchingAlgebra §3.9; `SchemeAndStackFoundations`, §§4.2 and 0.21; `ArithmeticGaloisDuality`, `D7`, *Grothendieck local duality for a complete Noetherian local ring*; Mathlib `Ext` and regular sequences.

(Sources: [CG18], §4.1, discussion before Lemma 4.1 and Lemma 4.2, arXiv pp. 43–44; Stacks [Tag 0AWS](https://stacks.math.columbia.edu/tag/0AWS), Cohen–Macaulay dualizing modules, and [Tag 00MB](https://stacks.math.columbia.edu/tag/00MB), flatness and finite-module exactness of completion.)

<a id="t0-2"></a>

### 0.2 Period, descent and finite-coefficient comparisons

For finite `K/ℚ_p`, import the period rings, `HT(ε)=+1` dictionary, filtered modules, weak admissibility, full faithfulness and admissibility of `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.0–R07.3.3 and R07.4.13. Import the odd-prime descent construction of §§R07.4.27–R07.4.28. Extend it to every `p` and to finite local `E`-algebras `A`: potentially semistable finite free `A`-representations becoming semistable over a fixed finite Galois `L/K` correspond to finite-projective filtered `(φ,N,L/K)`-modules over `L₀⊗_{ℚ_p}A`, with filtration on `L⊗_{L₀}D` by projective direct summands and weakly admissible residue module. Carry the period dimension/rank comparison, not just a fibrewise predicate. Use `D*=D(V∨)` with its contravariance; the covariant version uses `D(V)`.

The API `CoefficientPeriodComparison` supplies exact tensor and dual comparisons, coefficient change, the full WD parameter, inertia restriction and `N=0` crystalline criterion. `CoefficientPeriodComparison.completion` compares deformation groupoids at a characteristic-zero point, with maximal-ideal topology and fixed labelled Hodge and inertia data. Construct invariants and their period comparison by the field equivalence, then induction through square-zero Artinian extensions; impose the filtration and descent equations at each step. This also gives the rational Fontaine–Laffaille and height-one BT comparisons used below, retaining their safe weight intervals and integral classification hypotheses.

**Checks.**

- `D*_cris(ℚ_p(1))` has `φ=pσ` and filtration jump 1; `D_cris` has the reciprocal Frobenius and jump `−1`.
- A Tate-curve representation retains `N≠0` after finite extension; it is excluded by the crystalline subcategory.
- Over `E[ε]/(ε²)`, the comparison transports extension classes and projective filtrations, not just the residue representation.

*Needs:* the finite-flat targets listed above; [F.0.1](#completed-coefficient-products); `ArithmeticGaloisDuality`, `D7` local coefficient comparison.

(Sources: [KisinPST], Proposition (2.7.2), Lemma (3.2.1) and Proposition (3.3.1), author DVI pp. 22–23, 27–29; [BellovinGee], §3.2 and Proposition 3.3.2, arXiv v3 pp. 29–30.)

<a id="ordinary-flag-definitions"></a>

### Ordinary flag definitions for 1.7

Target [1.7](#t1-7) owns the following common predicate and elementary flag API. Let `K/ℚ_p` be finite, let `E` contain its embeddings, and let `A` be a finite local `E`-algebra or an integral coefficient algebra over `𝒪`. For dominant `λ=(λ_{τ,1}≥⋯≥λ_{τ,d})`, a continuous rank-`d` representation is `IsOrdinaryOfWeight` if it has an increasing stable full flag by direct summands, with rank-one graded characters satisfying `χ_i(Art_K^geom(u))=∏_τ τ(u)^{−(λ_{τ,d−i+1}+i−1)}` on an open subgroup of `𝒪_K^×`. The algebraic unit characters use the structure map to `A`. Equivalently their ratios with the prescribed characters have finite order on inertia. `IsSemistableOrdinaryOfWeight` requires equality on all units, equivalently on all inertia. These are flag-and-character definitions; their period consequences are target 0.3 and the comparison part of 1.7.

The elementary API is as follows.

- `IsSemistableOrdinaryOfWeight.isOrdinary`: The exact-inertia condition implies the open-inertia condition.
- `IsOrdinaryOfWeight.flag_unique`: For the prescribed ordering over a field, pairwise distinct restrictions to `I_K` make the flag unique. Over local integral or Artinian coefficients require pairwise distinct residual inertial characters, or vanishing of all inertia-equivariant `Hom` modules between distinct graded characters. Reordering the characters is a different condition.
- `IsOrdinaryOfWeight.restrict`: Restriction to `G_{K′}` preserves the flag condition, pulling each label back along embeddings of `K′` extending it; the exact-inertia condition is also preserved.
- `IsOrdinaryOfWeight.baseChange`: Coefficient maps preserve direct-summand flags and ordered inertia characters, including the exact-inertia condition.

Duality reverses the flag and inverts the ordered characters. In rank two at `λ=(k−2,0)`, the prescribed ordered inertia characters are 1,`ε^{1−k}`; the dual flag has `ε^{k−1}` on its subline. This elementary dictionary and the field specialization used by `PadicHodgeTheory` are part of the same API.

**Checks.**

- In rank one, the prescribed algebraic character times an unramified character satisfies the exact condition; multiplication by a nontrivial ramified finite-order character satisfies only the open-inertia condition.
- For `d=2` and `λ=(0,0)`, the ordered inertia characters are 1 and `ε⁻¹`, rather than two unramified characters.
- At `λ=(0,0)`, a nonsplit extension of 1 by `ε⁻¹` has the determinant polynomials but lacks the required stable subline of character 1.
- Over `A=ℤ₂[e]/(2e,e²)`, `ρ=1⊕ε⁻¹` has stable direct-summand lines `A·e₁` and `A·(e₁+e·e₂)`, both of character 1 with quotient `ε⁻¹`. The characters are distinct but their residual inertia characters coincide; mere inequality does not give uniqueness.

*Needs:* `ClassFieldTheory`, Layer 7, local reciprocity and its normalization; the coefficient categories fixed in the conventions.

(Sources: [NT26], Definition 2.5(2), arXiv v2 p. 12; [BCGP25], Definition 5.6.8, arXiv v1 pp. 129–130; [CN23], Definition 3.3.1, arXiv v3 pp. 50–51.)

<a id="t0-3"></a>

### 0.3 Ordinary period comparisons and rank-two endpoints

For the dominant ordered algebraic characters in the elementary definitions of 1.7 above, construct the stable-flag period comparison: equality on inertia gives semistability, equality on an open subgroup gives potential semistability, with labelled weights `−(λ_{τ,d−i+1}+i−1)` in the convention `HT(ε)=+1`. This uses regular ordering of the weights and retains the flags under coefficient change; apply the comparison to finite local `E`-algebras via 0.2. For split reductive `G` use a faithful representation and its root and torus character equations as in 6.5.

For rank two over unramified `K`, construct the crystalline and semistable ordinary branches of KW II Lemma 3.5: crystalline lifts of residually ordinary data of weights `{0,k−1}`, `2≤k≤p`, are ordinary; the `k=p+1` crystalline branch is over `ℚ_p`. Semistable noncrystalline weight two is ordinary. Include the Berger–Li–Zhu residual Serre-weight-`p+1` branch over `ℚ_p` with its irreducible/reducible qualifications as used in 5.5 and 5.14. Construct the low-weight comparison using the supplied Fontaine–Laffaille realization; use the endpoint strongly divisible modules and Berger–Li–Zhu calculation at `p+1`, rather than applying safe-interval full faithfulness there.

For the potentially Barsotti–Tate branch, retain a rank-two `G_K`-stable `𝒪`-lattice `T⊂V`, its identified reduction `ρ̄`, a chosen unramified quotient `q̄:ρ̄↠k(η̄₀)`, and its prescribed determinant `δ=det T`. Suppose `V` has labelled weights `{0,1}` and is crystalline over `ℚ_p^nr(μ_p)`. Choose finite unramified `F₀/K` such that `V|G_L` is crystalline and the residual diagonal characters are trivial on `G_L`, where `L=F₀(μ_p)`, and require `δ|I_L=ε`. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.19 and its height-one lattice realization to obtain the canonical connected–étale sequence. Its connected line descends to `G_K`; the descended quotient `T^{et}` has character `η` with `η|I_L=1`, hence tame inertia of order dividing `p−1`. This supplies potential ordinarity and a weight-one subline over `K`.

The stronger KW shape over `K` additionally requires that the reduction of `T↠T^{et}` agree with `q̄`, up to an isomorphism of the rank-one residual quotients. Then `η mod ϖ` is unramified. Injectivity of reduction on roots of unity of order prime to `p` gives `η|I_K=1`; the subline has character `δη⁻¹`. Nonsplit residual data with a unique rank-one quotient imply this compatibility; merely having a unique unramified quotient does not. The APIs `OrdinaryPeriodComparison` and `RankTwoOrdinaryEndpoints` retain these fields, lattice, determinant and quotient maps, distinguishing potential ordinarity from the unramified-quotient conclusion. The dual and reversed flag uses the ordinary convention of 1.7.

For odd `p`, construct `RankTwoNonordinaryEndpoint.exists`: given an irreducible residual `G_ℚ_p`-representation of Serre weight two and a compatible crystalline determinant of weight `p`, produce after coefficient extension a nonordinary crystalline lift of weights `{0,p}`. Over the unramified quadratic field choose a crystalline character of labelled weights `(0,p)`. Local reciprocity and induction give residual inertia `ω₂^p⊕ω₂^{p²}=ω₂^p⊕ω₂`, the Serre-weight-two pair. Match the residual unramified part first, then correct the determinant by the unramified square root of their residue-one ratio, using odd `p`. Construct the induction/period comparison from 0.2 and unramified descent; both induction and twisting retain the residual identification. (Sources: [KW109], Theorem 4.`1(2)(i)`, p. 7, for the required branch; [KW209], §3.2.7, pp. 31–32, for the weight-`p+1` boundary; the local construction uses the rank-one period dictionary and local reciprocity.)

**Checks.**

- The inducing character's two inertia exponents are `p` and `p²≡1` modulo `p²−1`, so its residual induction is irreducible and has Serre weight two.
- An unramified twist changes the determinant by its square and preserves the weights and crystallinity. The residue-one square-root argument requires odd `p`.
- The induced characteristic-zero representation is irreducible: the two labelled weights of its inducing character are interchanged by conjugation and differ. It is therefore nonordinary.
- Unramified `K` and `2≤k≤p` give the residually ordinary crystalline branch.
- An unramified quadratic `K` is outside the `ℚ_p`-only crystalline `p+1` endpoint.
- The weight-two Tate curve is ordinary with `N≠0`; an ordinary condition alone does not give crystallinity.
- At `p=5`, `K=E=ℚ₅`, let `ω̃` be the Teichmüller lift of the residual cyclotomic character `ω`. The split lattice in `V=(εω̃⁻¹)⊕ω̃` has determinant `ε`, weights `{1,0}` and reduction `1⊕ω`. Over `ℚ₅(μ₅)` it becomes `ε⊕1`. Its connected–étale quotient is `ω̃`, reducing to `ω`, whereas the chosen residual unramified quotient is 1. Neither characteristic-zero quotient is unramified: `ω̃` has tame inertia and `εω̃⁻¹` has wild inertia.
- If `ρ̄` is a nonsplit extension with its unique rank-one quotient unramified, the reduction of the descended étale quotient is necessarily that quotient; the stronger endpoint applies.
- At `p=2`, the descended quotient has tame inertia of order dividing `p−1=1`, so the potential branch already has an unramified quotient under the same lattice and determinant hypotheses.

*Needs:* the [ordinary flag definitions of 1.7](#ordinary-flag-definitions); [0.2](#t0-2); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.12–R07.3.17, R07.3.19, R07.4.20 and R07.4.29–R07.4.30; local reciprocity, `ClassFieldTheory`, Layer 7; [F.2.9](#fixed-determinant-rings).

(Sources: [CN23], Definition 3.3.1 and Lemma 3.3.2, arXiv v3 pp. 50–51; [FKP22], Lemmas `B`.3–`B`.4, arXiv v5 pp. 53–54; [KW209], Definition 3.4 and Lemma 3.5, §3.2.7 and its Remark, author pp. 22, 31–32; [Conrad–Diamond–Taylor](https://virtualmath1.stanford.edu/~conrad/papers/cdtmaster.pdf), §2.1 and Lemma 2.1.2, author pp. 8–9, with the residual-quotient identification for the downstairs unramified conclusion.)

<a id="t0-4"></a>

### 0.4 Coefficient Robba modules, Herr cohomology and period conditions

For finite `K/ℚ_p` and finite local `E`-algebra `A`, construct the coefficient Robba ring `ℛ_{K,A}`, finite-projective `(φ,Γ_K)`-modules and their exact tensor category. Use annular convergent Laurent series and coefficient tensor products; import the scalar Robba and slope theory of `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.4.7–R07.4.9. This section owns the common finite-`A` category, `D_rig` and its inverse on étale objects, compatibly with finite coefficient change, tensor products and duals. Supply saturated triangulations with actual rank-one character quotients and the de Rham period module with projective labelled filtrations.

`PadicHodgeTheory`, §4.3, is a consumer of the `A=E` specialization for its rational Robba realization. That roadmap owns the further cyclotomic analytic adapters, connections, B-pairs and period comparisons.

The APIs `CoefficientRobbaModule`, `CoefficientRobbaModule.etaleEquivalence`, `HerrCohomology` and `HerrCohomology.baseChange` give the Herr complex, `Ext` comparison, perfect amplitude `[0,2]`, derived base change, Euler characteristic `−[K:ℚ_p]` rank and Tate duality with the cyclotomic dual. Construct the étale equivalence by overconvergence followed by Artinian dévissage, and use the Herr complex to identify first-order deformation classes. Cohomology-group base change is asserted only when the associated `Tor` terms vanish. These are the carriers and comparisons used by 1.23, rather than new trianguline-variety geometry.

Take invariants under the full finite torsion subgroup `Δ⊂Γ_K` and choose `γ` whose image topologically generates `Γ_K/Δ`. On `D^Δ` use degrees `0,1,2`, with `d⁰x=((φ−1)x,(γ−1)x)` and `d¹(a,b)=(γ−1)a−(φ−1)b`. Supply the change-of-generator quasi-isomorphisms and the natural derived comparison with continuous Galois cochains on étale objects. The `A=E` specialization is the complex called `herrComplex` in `PadicHodgeTheory`, §4.5: its realization comparison identifies `D_rig(V)` with `D_(rig)^†(V)`, preserving the coefficient-ring identification, Frobenius, Gamma, tensor products and duals. The induced cohomology comparisons preserve cup products and the signed degree-two trace. Relative to Liu's swapped degree-one coordinates, the cochain adapter has degree maps `1`, `(a,b)↦(b,a)`, `−1`. Normalize the trace by arithmetic reciprocity: over `K=ℚ_p`, `tr(χ_ur∪κ(p))=1` for the additive unramified class `χ_ur(Φ)=1`, and the reversed cup has trace `−1`. Here `Φ` is arithmetic Frobenius and `κ` is the supplied Kummer map. Finite-torsion invariants remain exact over every such `A`, including at `p=2`. Construct this common interface before its field-level consumers; the analytic and B-pair comparisons preserve it.

**Checks.**

- `D_rig(E)` is the trivial rank-one étale module; its deformation tangent has dimension `[K:ℚ_p]+1`.
- The cyclotomic rank-one module has nonzero `H²`, paired with `H⁰` of the trivial module; the twist in duality is essential.
- Over `E[ε]/(ε²)`, extension classes in `Ext¹` transport to the actual representation extensions; fibrewise diagonal characters alone do not specify the extension.
- At `A=E`, the unit, its cyclotomic twist and their tensor/dual identifications agree in the common realization and the field-level realization.
- For scalar commuting operators `φ=2`, `γ=3`, `d⁰(1)=(1,2)` and `d¹(1,2)=0`. At `(a,b)=(1,0)`, the degree-two value is 2 and Liu's value after swapping is `−2`, forcing the sign adapter.
- Over `ℚ₂`, retain the finite Gamma torsion invariants; the character-first Kummer cup has trace 1 and its reverse has trace `−1`.

*Needs:* [0.2](#t0-2); the scalar Robba targets above; `ArithmeticGaloisDuality`, `D7`.

(Sources: [DING25], coefficient `(φ,Γ)`-module deformation setting; Kedlaya–Pottharst–Xiao, [Cohomology of arithmetic families of (φ,Γ)-modules](https://arxiv.org/abs/1203.5718), §§2.1–2.3, Definition 2.3.3, Proposition 2.3.7, the cup and trace in §2.3.10 and Theorems 4.4.2–4.4.5; [Liu, Cohomology and duality for (φ,Γ)-modules over the Robba ring](https://arxiv.org/abs/0711.4346), §§2.1–2.2 and Theorems 2.3, 4.7; Berger–Colmez/Kedlaya–Liu étale comparison as cited there.)

## Layer 1: Universal lifting rings and coefficient infrastructure

Begin with universal rings and the local continuous-cohomology calculation. Then construct the character coefficients and the rank-general integral-model functor once. The Fontaine–Laffaille condition is included here as input to the Hodge and rigidity applications; the ordinary flag scheme is constructed here, with its geometric comparisons in Layer 6.

<a id="t1-1"></a>

### 1.1 The local framed deformation ring

For continuous `ρ̄`:`Γ→GL_d(k)`, with `Γ` a local absolute Galois group satisfying Mazur `p`-finiteness, the framed lift functor on complete Noetherian local `𝒪`-algebras with residue `k` is represented by `R□` and its universal lift. Maps correspond naturally to lifts in the fixed residual basis. Local class field theory supplies `p`-finiteness.

*Needs:* [F.1.1](#lifting-functor); [F.2.1](#phi-p-condition); [F.2.2](#phi-p-global); [F.2.3](#universal-lifting-ring); [F.2.4](#universal-continuous-lift); [F.0.2](#minimal-relative-presentations).

(Sources: [Gee22], §3.1 and Lemma 3.2, p. 12; [KisinNotes], Lecture 1, (1.2) and Proposition (1.2.1)(1), p. 2.)

<a id="t1-2"></a>

### 1.2 The functor of bounded-height lattices of a deformation family

For a complete Noetherian family `V_A` and imported étale `M_A`, use projective rank-`d` `𝔖_B`-lattices spanning `M_B` with `φ`-cokernel killed by `E(u)^h`. On nilpotent coefficient algebras this is the lattice functor; integral/rational points use its model scheme. Tensoring gives functoriality, extensionality and height monotonicity. Finite-flat `ℤ_p` coefficients give uniqueness; existence requires coefficient projectivity. `V*` and `V(−1)` are distinct normalizations.

For a chosen free lattice with square Frobenius matrix `X`, the coordinate predicate `HasHeightLE E X h` means that there is a matrix `Y` with `XY=E^h I`. Its API `height_zero_iff_isUnit` identifies height zero with invertibility over a commutative ring. This coordinate predicate checks a fixed free lattice; the projective-lattice functor above additionally retains the étale ambient module and base change.

The construction provides the following API.

- `heightLatticeFunctor`: `L^{≤h}_{V_A}`: the functor from `A`-algebras to sets, `B ↦` {`𝔖_B`-lattices of `E`-height `≤ h` in `M_B`} (lattices in the sense of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.12).
- `heightLatticeFunctor.map`: For `B → B′`, `𝔐_B ↦ 𝔐_B ⊗_B B′`, with `map_id` and `map_comp`.
- `heightLatticeFunctor.ext`: Two points of `L^{≤h}_{V_A}(B)` are equal iff their underlying `𝔖_B`-submodules of `M_B` are equal; the projectivity, spanning and height conditions are properties.
- `heightLatticeFunctor_subsingleton`: For `B` finite flat over `ℤ_p`, `L^{≤h}_{V_A}(B)` has at most one element (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.12 (1)).
- `heightLatticeFunctor_nonempty_iff`: For finite-flat `B/ℤ_p`, nonemptiness is equivalent to finite `E`-height and projectivity of the unique lattice over `𝔖_B`. If `K⊃μ_p` and `B={(a,b)∈ℤ_p²:a≡b mod p}`, the character `(1,χ_p)` has height `≤1` but no projective `B`-lattice.
- `heightLatticeFunctor.mono`: For `h ≤ h′`, `L^{≤h}_{V_A}(B) ⊆ L^{≤h′}_{V_A}(B)`, compatibly with base change.

**Checks.**

- Rank one, `M = 𝒪_ℰ·e` with `φ(e) = E(u)e`: in the basis `e` the Frobenius matrix is `E(u)`, which divides `E(u)^1` but not `E(u)^0`, so `L^{≤1}(ℤ_p) = {𝔖e}` and `L^{≤0}(ℤ_p) = ∅`.
- A lattice with Frobenius matrix `X` in a basis lies in `L^{≤0}(B)` iff `X` is invertible over `𝔖_B`, i.e. iff `φ*𝔐_B → 𝔐_B` is an isomorphism.
- For `φ(e)=ue`, no `E(u)^h` is divisible by `u`. Over `ℚ_p`, odd `p`, no alternate finite-height lattice exists: this module realizes the nontrivial Teichmüller fundamental character on `K∞`, unlike a crystalline power of `ε`. At `p=2`, `𝔖u⁻¹e` instead has height zero.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.2; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.12; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.39; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [KisinPST], (1.2), author DVI pp. 4–5, and Errata (E.4), p. 34.)

<a id="t1-3"></a>

### 1.3 The universal character coefficient rings `Λ_v` and `Λ̃_v`

For residual full-flag data, take the completed group algebra of `(𝒪_K×(p))^d` and quotient by the intersection of a nonempty collection of minimal primes, selecting torsion-character components. The universal inertia characters combine the Teichmüller residual characters with the `d` ordered pro-`p` factors under geometric reciprocity. Extending to `(K×(p))^d` adds Frobenius variables and yields full Galois characters. The pro-`p` inertia here is inertia in the abelianized local Galois group, not the abelianization of the full inertia group. Minimal primes correspond to Galois orbits of torsion characters; `Λ` can have several components.

The construction provides the following API.

- `ordinaryWeightRing`: `Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞` for a chosen set of minimal primes.
- `universalInertialCharacter`: `χ_i^univ` : `I_{F_v} → Λ_v^×`.
- `ordinaryWeightRingTilde`: `Λ̃_v` and `χ̃_i^univ` : `G_{F_v} → Λ̃_v^×`.
- `universalInertialCharacter_residual`: `χ_i^univ ≡ χ̄_i` modulo the maximal ideal.
- `minimalPrimes_torsionCharacters`: Minimal primes `↔` Galois orbits of torsion characters.
- `ordinaryWeightRing.universal`: Maps `Λ_v→A` classify the ordered pro-`p` unit characters with the chosen reductions whose group-algebra map kills `𝔞`, naturally in `A`.

**Checks.**

- `F_v = ℚ_p`, `p` odd: `𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p` is torsion-free, so `Λ_v = 𝒪[[X_1, …, X_n]]` with `𝔞 = 0`.
- `F_v = ℚ_p(ζ_p)`: `𝒪_{F_v}^×(p)` has torsion `μ_p`, so `𝒪[[𝒪_{F_v}^×(p)]]` has several minimal primes once `ζ_p ∈ 𝒪`, and `𝔞` selects tuples of characters of `μ_pⁿ`.
- `n=1`: `χ₁^univ` represents deformations of the prescribed character on the pro-`p` unit factor of `G_K^ab` inertia whose coefficient map kills `𝔞`; `Λ̃_v` adds its unramified Frobenius parameter. It does not represent arbitrary characters of `I_K`.

- Over `K=ℚ₃`, let `L/K` be unramified quadratic. A nonzero trace-zero functional on the principal-unit tangent of `L` gives an inertia character into `𝔽₃[ε]/(ε²)` inverted by Frobenius. It cannot extend to `G_K` and is outside `Λ_v`'s universal property.

*Needs:* `TauCeti.completedGroupAlgebra` with its tautological character and finite-quotient projections (see Exact supplier contracts); `MvPowerSeries` (Mathlib); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [ACC+], §6.2.6, p. 138.)

<a id="t1-4"></a>

### 1.4 Tangent and obstruction description of local lifting rings

The dual cotangent space is `Z¹(Γ,ad ρ̄)`, of dimension `h¹+d²−h⁰`; `H²∨` surjects onto the minimal relation space. Local duality gives `h⁰−h¹+h²=−d²[K:ℚ_p]` above `p`, and zero away from `p`. Component dimensions are at least `1+d²(1+[K:ℚ_p])` and `1+d²` respectively. `H²=0` gives formal smoothness and equality.

*Needs:* [1.1](#t1-1); `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`; `SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*; [F.0.2](#minimal-relative-presentations); `TauCeti.ContCohomology.H2` (Tau Ceti); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [Gee22], Corollary 3.12, Lemma 3.13 and Corollary 3.14, pp. 13–14; [KisinNotes], Lecture 1, Lemma (1.3.1)(2), p. 3.)

<a id="t1-5"></a>

### 1.5 Forgetting the framing of local lifts

If `End_Γ(ρ̄)=k`, strict-equivalence deformations have universal ring `R` and `R□≅R[[X₁,…,X_{d²−1}]]`. For non-Schur data retain framed or versal deformations.

*Needs:* [1.1](#t1-1); [F.2.5](#universal-deformation-ring); [F.2.6](#framed-unframed-comparison); [F.1.5](#strict-vs-full-conjugacy).

(Sources: [KisinNotes], Lecture 1, Remark (1.2.2)(3), p. 2; [Gee22], Exercise 3.9, p. 13.)

<a id="t1-6"></a>

### 1.6 The Fontaine–Laffaille deformation condition

Over unramified `K/ℚ_p`, construct the common coefficient Fontaine–Laffaille category with filtration in `[0,p−2]` from the scalar category and contravariant realization of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4, R07.3.7 and R07.3.10–R07.3.17. Its objects carry commuting coefficient actions, preserving the filtration and commuting with the divided Frobenius maps. For `E` containing every embedding of `K`, retain the labelled factors `W(k_K)⊗𝒪≅∏_τ𝒪` and their permutation by scalar Frobenius. Include finite free `𝒪`-lattices, finite torsion objects and the objects with a commuting finite coefficient-algebra `A`-action; deformation objects require projective labelled `A`-modules and direct-summand filtrations. Subquotient closure concerns the full finite torsion category, without asserting that arbitrary subquotients remain `A`-projective.

Define the covariant realization `𝐆` using the `ℤ_p`-linear dual of the scalar contravariant lattice realization on free lattices, and `Hom_{ℤ_p}(U_S(M),ℚ_p/ℤ_p)` on finite torsion objects. Transport coefficient actions through these duals. Prove exactness, full faithfulness, subquotient stability, the injective `Ext¹` comparison, and coefficient extension and reduction comparisons, including lattice quotients. Kernels of coefficient-linear filtration-preserving maps commuting with divided Frobenius correspond to representation kernels, with induced strict filtrations. This target owns this common category and realization; `coefficientFontaineLaffaille` in AutomorphicGaloisRepresentations §1.5a is its free-lattice and finite-torsion specialization. That consumer owns the labelled tame-inertia formulas, interval twists and automorphic applications. In this normalization a labelled jump `i` corresponds to Hodge–Tate weight `−i`. For a rank-one object over `ℚ_p` this gives inertia `ε^{−i}`; higher-rank jumps do not assert a decomposition of inertia into cyclotomic characters.

For the deformation application require `ρ̄` to lie in the essential image with every labelled graded multiplicity at most one. Membership of all Artinian quotients in that image defines a liftable local deformation problem, with tangent the image of `Ext¹_{MF}(𝐆⁻¹ρ̄,𝐆⁻¹ρ̄)` in `H¹(G_K,ad ρ̄)`. The common category and realization do not require multiplicity one.

The construction provides the following API.

- `FLDeformation.coefficientRealization`: The common exact fully faithful covariant functor `𝐆_ṽ` from the labelled coefficient Fontaine–Laffaille category, using the linear lattice dual and Pontryagin torsion dual just specified. Its injective `Ext¹` map, subquotient and kernel comparisons, coefficient extension, reduction and lattice-quotient comparisons retain the labelled factors, Frobenius permutation and coefficient actions.
- `FLDeformation`: The condition `𝒟_ṽ` on lifts of `r̄|_{G_{F_ṽ}}`: every Artinian quotient lies in the essential image of the covariant coefficient realization `𝐆_ṽ` constructed here.
- `FLDeformation.isLocalDeformationProblem`: Closure of the realization image under subquotients and sums yields strict-conjugacy, fibre-product and inverse-limit stability.
- `FLDeformation.mem_iff`: For `R` Artinian, `r ∈ 𝒟_ṽ(R)` iff `r ≅ 𝐆_ṽ(M)` for some object `M` of the coefficient category `𝓜𝓕_{𝒪,ṽ}` with `R`-action; for general `R ∈ C_𝒪`, iff this holds for every Artinian quotient.
- `FLDeformation.tangentSpace`: The tangent space of `𝒟_ṽ` is `L_ṽ` = image of `Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄))` in `H¹(G_{F_ṽ}, ad r̄)`, using the coefficient `Ext` comparison just specified.
- `FLDeformation.liftable`: CHT Lemma 2.4.1: under the multiplicity-one hypothesis, every point over `R/I (𝔪_R I = 0)` lifts to `R`.
- `FLDeformation.baseChange`: A map of Artinian coefficient algebras carries a lift in `𝒟_ṽ` to a lift in `𝒟_ṽ`, via `𝐆_ṽ` and its coefficient-change comparison.

**Checks.**

- For `n = 1` the tangent space `L_ṽ` is the unramified classes `H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄)`, of dimension 1 (CHT Corollary 2.4.4 with `n = 1`).
- Over `ℚ_p`, `p≥3`, the split representation `𝒪⊕𝒪(ε⁻¹)` has jumps `{0,1}`, weights `{0,−1}` and inertia characters 1,`ε⁻¹`. Its dual has weights `{0,1}` and requires jumps `{−1,0}`, outside the chosen interval.
- The crystalline character `ε^{−(l−1)}` has filtration jump `l−1` and lies outside `𝒟_ṽ`: the selected objects satisfy `Fil^{l−1}M=0`. Its Hodge–Tate weight is `−(l−1)` in the stated convention.
- For `l≥3`, `r̄=ε⁻¹⊕ε⁻¹` comes from two Fontaine–Laffaille lines of jump one but violates multiplicity-one for `n=2`. Category membership alone therefore does not give Lemma 2.4.1.
- For unramified quadratic `K` and splitting `E`, the two factors of `W(k_K)⊗𝒪` are interchanged by Frobenius. Distinct labelled jumps retain both factors in the common category and in every specialization.
- For a free coefficient Fontaine–Laffaille lattice `M`, reduction gives `𝐆(M)/ϖ^m≅𝐆(M/ϖ^mM)`. The torsion side uses the Pontryagin dual; its `ℤ_p`-linear dual into `ℤ_p` would vanish.

*Needs:* [1.1](#t1-1); [F.3.1](#local-deformation-problem); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.3.4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.7 and R07.3.10; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.3.11; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.3.12; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.12–R07.3.17; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.12–R07.3.17.

(Sources: [CHT08], §2.4.1, pp. 33–35, the coefficient category, realization and `𝒟_ṽ`, and Lemma 2.4.1; [Diamond–Flach–Guo](https://arxiv.org/pdf/2512.02348v2), §1.1, pp. 6–7, coefficient actions, covariant realization and integral comparison.)

<a id="t1-7"></a>

### 1.7 Ordinary representations of weight `λ`

Use the common predicates and elementary flag API in the [ordinary flag definitions](#ordinary-flag-definitions). Target 0.3 supplies `IsOrdinaryOfWeight.potentiallySemistable`: over finite local `E`-algebras ordinary representations of weight `λ` are potentially semistable of Hodge type `v_λ`; the exact-inertia predicate `IsSemistableOrdinaryOfWeight` implies semistability of that type. For integral coefficient families apply this comparison to their characteristic-zero specializations. These period consequences use the predicates already defined before 0.3.

Weight `λ=(k−2,0)` in rank two has ordered characters 1,`ε^{1−k}`. Duality and flag reversal give KW's ordinary shape with `ε^{k−1}` on the subline and a weight-zero quotient. KW's quotient is unramified only when its character has trivial inertia; finite-order inertia in the common ordinary predicate remains visible. The original ordered representation and its dual have different weights.

`PadicHodgeTheory`, §3.6 uses the field-valued specialization of `IsOrdinaryOfWeight` as `RegularOrdinary`, with the same geometric reciprocity, ordered flags and dual/restriction API. Dominance and the `i−1` shift make the labelled weights strictly ordered; no additional regularity predicate is needed. Its crystalline slope, monodromy and descent theorems belong to that consumer.

**Checks.**

- At `λ=(k−2,0)`, ordered characters are 1,`ε^{−(k−1)}`; duality and flag reversal produce KW's subline `ε^{k−1}` and weight-zero quotient.
- The dual of a Tate-curve representation is semistable-ordinary of weight `(0,0)` and has nonzero monodromy. The exact-inertia predicate does not imply crystallinity.
- A ramified finite-order rank-one character has ordinary weight zero and is potentially crystalline; it fails the exact-inertia predicate and is not semistable over the original field.

*Needs:* the [ordinary flag definitions](#ordinary-flag-definitions); [0.3](#t0-3).

(Sources: [NT26], Definition 2.5(2), arXiv v2 p. 12; [BCGP25], Definition 5.6.8, arXiv v1 pp. 129–130; [CN23], Definition 3.3.1 and Lemma 3.3.2, arXiv v3 pp. 50–51.)

<a id="t1-8"></a>

### 1.8 Moduli of lattices of bounded `E`-height and their image

The lattice functor has projective model `Θ_A` with canonical very ample bundle, coefficient base change and a generic closed immersion. Its image `A^{≤h}` has the finite-rational-algebra height criterion and a finite universal `𝔖`-module, generically projective, specializing to the unique lattice. Use Grassmannian bounds and formal GAGA. Height zero of the `G_{K∞}`-restriction need not imply `G_K`-semistability.

*Needs:* [1.2](#t1-2); `AdicSpacesPartIII`, `F0`.8, *grothendieck-algebraization*; `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and §1.7.

(Sources: [KisinPST], Proposition (1.3), author DVI p. 5; Corollary (1.5.1), p. 7; Proposition (1.6.4), pp. 8–9; Corollary (1.7), pp. 9–10.)

<a id="t1-9"></a>

### 1.9 The ordinary flag scheme and its image ring `R^△_v`

Over `Λ_v`, the closed stable full-flag incidence scheme imposes the ordered inertia characters on direct-summand graded lines and projects properly to `Spec R□`. `R△` is the image in its global functions. For domain coefficients, factoring through `R△` is equivalent to having the required flag over the algebraic closure of the fraction field; the flag need not exist over the coefficient ring.

The construction provides the following API.

- `ordinaryFlagScheme`: `𝒢_v ⊂ 𝓕 × Spec R^□_v`.
- `ordinaryFlagScheme_proper`: `𝒢_v → Spec R^□_v` is proper.
- `ordinaryFlagImage`: `R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪))`.
- `ordinaryFlagImage_points`: The domain point criterion.
- `ordinaryFlagScheme.points`: `B`-points classify framed lifts with stable full direct-summand flags and the prescribed ordered inertia characters, by universal-flag pullback.
- `ordinaryFlagScheme.baseChange`: Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback.

**Checks.**

- `n = 1`: every line is a flag, and `R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ)`.
- Over `ℚ_3`, a nonsplit extension `0→ℚ_3(ε⁻¹)→V→ℚ_3→0` has the flag ordered `(ε⁻¹,1)`. The reversed order `(1,ε⁻¹)` fails: a second stable line would split the extension. Permuting the prescribed inertia characters therefore changes the incidence condition.
- Take the unramified `ℤ_3`-lift with Frobenius `[[1,6],[3,1]]`, determinant `−17` and trivial residual representation. With both prescribed inertia characters equal to 1, it has the required flag over `ℚ̄_3` and gives a point of `R△`. Its polynomial `(T−1)²−18` has no root in `ℚ_3` because 2 is not a square there, so it has no flag over `ℚ_3` or `ℤ_3`. The image criterion cannot require an integral flag.

*Needs:* [1.1](#t1-1); [1.3](#t1-3); `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and §1.7.

(Sources: [ACC+], §6.2.6, p. 138; [ACC+], §6.2.6, p. 139.)

<a id="t1-10"></a>

### 1.10 Fixing the determinant of local lifts

For a continuous determinant lift `ψ` and `p∤d`, the `det=ψ` quotient uses `ad⁰` for tangent and obstructions. Let `R_char` represent characters `θ` reducing to one. Unique `d`-th roots among such characters give the functor isomorphism `ρ↦(ρ⊗θ⁻¹,θ)`, where `θᵈ=detρ·ψ⁻¹`; its inverse is scalar twisting. Thus `R□≅R□`,`ψ⊗̂_𝒪R_char`, compatibly with the universal lifts and determinant. The fixed-determinant component lower bounds for relative dimension over `𝒪` are `(d²−1)(1+f)` above `p` and `d²−1` away from `p`; integral dimensions have one additional dimension. This integral splitting is not asserted when `p` divides `d`; the relative determinant presentation in 1.16 and power-map comparison in 1.24 still apply.

*Needs:* [1.1](#t1-1); [1.4](#t1-4); [F.1.7](#fixed-determinant-functors); [F.2.9](#fixed-determinant-rings); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [Gee22], §3.18 and Exercise 3.19, p. 15.)

<a id="t1-11"></a>

### 1.11 Archimedean deformation rings for odd `p`

For `Γ_ℝ=C₂` and `p` odd, all positive-degree residual cohomology vanishes. The framed ring is formally smooth of relative dimension `d²−h⁰(C₂,ad ρ̄)`. In rank two with odd determinant, the two eigenspaces are distinct and the relative dimension is two.

*Needs:* [1.4](#t1-4); [F.1.1](#lifting-functor); `ArithmeticGaloisDuality`, `D8`.1, *First-order Galois cocycle comparison* and *Trace-zero adjoint duality without division by `n*`; `SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*.

(Sources: [TUNG21], §3.2.5, Proposition 3.2.7, p. 15.)

<a id="t1-12"></a>

### 1.12 Local deformation rings under change of coefficients

For a finite extension of complete coefficient DVRs `𝒪→𝒪′` inducing `k→k′`, set `ρ̄′=ρ̄⊗_k k′`. The completed scalar-extension map identifies `R□_{𝒪′,ρ̄′}` with `R□_{𝒪,ρ̄}⊗̂_𝒪𝒪′` as complete local `𝒪′`-algebras with residue `k′`. The universal representation over the right side is the scalar extension of the original universal lift, and the coefficient square commutes. Extend `ψ` along `𝒪→𝒪′` for the analogous fixed-determinant comparison. Scalar extension preserves cohomology dimensions measured over the new field, but can split components; it does not give an endofunctor of the original residue-`k` category.

*Needs:* [1.1](#t1-1); [1.4](#t1-4); [F.2.10](#change-of-residue-field); [F.1.8](#change-of-coefficients); [F.0.1](#completed-coefficient-products).

(Sources: [Gee22], §3.1, p. 12; [BLGGT14], Lemma 1.2.1, arXiv v4 p. 13.)

<a id="t1-13"></a>

### 1.13 Fontaine–Laffaille deformations: tangent space and smoothness (CHT Lemma 2.4.2, Corollaries 2.4.3–2.4.4, Lemma 2.4.5)

For the preceding multiplicity-free Fontaine–Laffaille objects, prove the exact sequence `0→Hom_MF(M,N)→Fil⁰Hom(M,N)→Hom_{Fr⊗1}(gr M,N)→Ext¹_MF(M,N)→0`, with middle map `β↦(βΦ_M^i−Φ_N^iβ)_i`. It yields `dim L−h⁰(ad ρ̄)=fd(d−1)/2` and a formally smooth framed ring of relative dimension `d²+fd(d−1)/2`. In rank one `L` is unramified `H¹`. For a residual direct-sum decomposition, `H¹(ad)` and `L` split into the pairwise `Hom/Ext` summands. Keep the small weight range and multiplicity hypothesis, apart from the separately specified irreducible endpoint extension.

*Needs:* [1.6](#t1-6); [1.1](#t1-1).

(Sources: [CHT08], §2.4.1, Lemma 2.4.2, p. 35; [CHT08], §2.4.1, proof of Lemma 2.4.2 and Corollary 2.4.3, p. 36; [CHT08], §2.4.1, Corollary 2.4.4 and Lemma 2.4.5, p. 37.)

<a id="t1-14"></a>

### 1.14 The odd archimedean deformation ring at `p = 2`

At `p=2` in rank two, odd lifts complete the quadric `a²+bc=1` for matrices `(a,b;c,−a)`. This flat domain is a relative complete intersection of dimension two, with regular scheme generic fibre and integral special fibre. Its completed local deformation rings at closed characteristic-zero points are formally smooth for their maximal-ideal topology. At the identity involution the equation is `X²+2X+YZ`; at the nonidentity unipotent involution it is `X²+2X+YZ+Z`.

The light equation `OddInvolutionEquation a b c` is `a²+bc=1`. The API `odd_involution_matrix_iff` identifies it with both `M²=I` and `det M=−1` for `M=[[a,b],[c,−a]]`, over every commutative ring; no division by two occurs.

**Checks.**

- Over `ℤ`, `(a,b,c)=(1,0,0)` gives `diag(1,−1)`, whose square is `I` and determinant is `−1`.
- Over `𝔽₂`, `(1,1,0)` gives a nonidentity unipotent involution satisfying the same integral equation; removing it would lose the second dyadic residual case.
- Over `ℚ`, `(0,1,0)` has trace zero but square zero, and fails the equation `0=1`.

*Needs:* [1.11](#t1-11); [F.1.7](#fixed-determinant-functors); [F.2.9](#fixed-determinant-rings); `MvPowerSeries` (Mathlib).

(Sources: [TUNG21], §3.2.5, Proposition 3.2.7, p. 15.)

<a id="t1-15"></a>

### 1.15 Coefficient rings `Λ` for finite, `p`-adic and local residue fields

Use `κ` with its natural topology: a finite field, finite `p`-adic extension, or `k′((t))`. Its Cohen-type coefficient `Λ` is respectively the unramified coefficient extension of `𝒪`, `κ` itself, or the uniformizer completion of `𝒪′[[t]][1/t]`. Define the Artinian coefficient category and continuous lifting functor with these topologies.

The construction provides the following API.

- `CoeffRing`: The ring `Λ` attached to an `𝒪`-field `κ` of the three kinds, with its residue isomorphism `Λ/ϖ ≅ κ` in cases (1), (3) and `Λ = κ` in case (2).
- `CoeffRing.isCohen`: In case (3), any `𝒪`-algebra that is a complete DVR with uniformiser `ϖ` and the identified residue field `κ` admits a coefficient-compatible isomorphism to `Λ`. The choice of Cohen identification is not canonical.
- `ArtinCat`: Artinian local `Λ`-algebras `A` with an identified residue `A/𝔪_A≅κ` and the natural topology specified in the conventions; maps are continuous local `Λ`-algebra maps inducing that identification. In particular `ker(A→κ)=𝔪_A`.
- `liftFunctorΛ`: `D^□_ρ` : `𝔄_Λ →` Set, continuous lifts of `ρ` : `G_F → GL_d(κ)`.
- `liftFunctorΛ_finite`: For `κ` finite, `D^□_ρ` restricted to Artinian objects is the lifting functor of [F.1.1](#lifting-functor).

**Checks.**

- For `κ = k`, CoeffRing `κ = 𝒪`.
- For `κ = L`, CoeffRing `κ = L` and `𝔄_Λ` consists of finite local `L`-algebras with residue field `L`.
- For `κ = k((t))`, `Λ` is not `𝒪⟦t⟧` (not a DVR, residue field `k`) but the `ϖ`-adic completion of `𝒪⟦t⟧[1/t]`, a DVR with residue field `k((t))`.
- For `κ` finite, `liftFunctorΛ ρ` agrees with the lifting functor of [1.1](#t1-1) on Artinian objects.

*Needs:* [1.1](#t1-1); [1.12](#t1-12); [F.0.1](#completed-coefficient-products); `IsAdicComplete` (Mathlib); `IsLocalRing.ResidueField` (Mathlib).

(Sources: [BIP23], §3.5, the coefficient rings `Λ` and Remark 3.32, arXiv v2 pp. 25–26; [BIP23], Proposition 3.33, arXiv v2 p. 26.)

<a id="t1-16"></a>

### 1.16 Presentation of framed rings over `Λ` and the cocycle count

Over `Λ`, `R□=Λ[[X₁,…,X_r]]/(f₁,…,f_s)`, with `r=dim_κZ¹(ad ρ)`, `s=h²(ad ρ)` and `r−s=d²(1+f)`; relations may be padded by zero. For finite continuous `V`, `dim Z¹(V)=h¹(V)+dim V−h⁰(V)=(1+f)dim V+h²(V)`. Relative to the universal determinant ring `R_{det ρ}`, the same presentation uses `ad⁰` without assuming `p∤d`. Require coefficient-linear continuous cohomology, finiteness and natural-topology comparison for `κ`; for local `κ` use a stable valuation-ring lattice with its adic topology as in `D7`.

*Needs:* [1.15](#t1-15); [1.4](#t1-4); [F.0.2](#minimal-relative-presentations); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [BIP23], Proposition 3.33 and (21)–(22), arXiv v2 p. 26, and Proposition 4.3, p. 37; [PQ26], Lemma 3.1, p. 22, and Proposition 3.6, p. 24 (arXiv `v2`).)

<a id="t1-17"></a>

### 1.17 `G`-valued framed deformation rings

For smooth affine `G/Λ`, continuous framed lifts `Γ→G(A)` have universal ring `R□_{ρ̄,G}`, tangent `Z¹`(`Γ`,Lie `G` with `Ad ρ̄`), and contravariant maps induced by `G→H`. For generalised reductive `G`, the fixed-quotient condition specifies a lift `μ:Γ→(G/G^der)(Λ)` and requires equality with `μ` after the quotient map, with `G^der=(G⁰)^der`. For connected `GSp`, this is the fixed-multiplier condition. Import the integral group/Lie interface; `dim GSp₄=11` and `dim Sp₄=10`.

The construction provides the following API.

- `GLift`: `D^□_{ρ,G}(A)`: continuous lifts `Γ → G(A)` of `ρ`.
- `GFramedRing`: `R^□_{ρ,G}`, the pro-representing complete local Noetherian `Λ`-algebra, with the universal lift `ρ^□_G` : `Γ → G(R^□_{ρ,G})`.
- `GFramedRing.tangent`: `Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ)`.
- `GFramedRing.map`: A morphism `φ` : `G → H` induces `R^□_{φ∘ρ,H} → R^□_{ρ,G}`, with `map_id` and `map_comp`.
- `GFramedRing.fixedMultiplier`: For generalised reductive `G`, `ν:G→G/G^der` and a continuous quotient representation `μ:Γ→(G/G^der)(Λ)` lifting `ν∘ρ`, the quotient `R^{□,μ}_{ρ,G}` represents lifts with `ν∘ρ_A = μ_A`. For connected `GSp`, `μ` is a multiplier character.
- `GFramedRing.gl`: For `G = GL_d`, `R^□_{ρ,GL_d} = R^□_ρ` of [1.1](#t1-1).
- `GFramedRing.hom_ext`: Maps from the universal ring are equal iff their framed lifts agree; this bijection is natural in coefficients.

**Checks.**

- `G = 𝔾_m`, `F = ℚ_p` (`p` odd), `ρ` trivial: `R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧` ([1.19](#t1-19)).
- `G` trivial: `R^□_{ρ,G} = Λ`.
- `G = GSp₄` with fixed multiplier, `v ∤ p`, `H⁰(F_v, ad⁰ρ̄(1)) = 0`: `R^{□,μ}` is a power series ring over `𝒪` in 10 variables (BCGP21 Proposition 7.4.2).
- GFramedRing for `GL_d` agrees with `R^□_ρ` of [1.1](#t1-1).

*Needs:* [1.15](#t1-15); [1.1](#t1-1); [F.0.2](#minimal-relative-presentations); `Matrix.symplecticGroup` (Mathlib); `ArithmeticGaloisRepresentations`, §7.3 (Similitude groups).

(Sources: [PQ26], §3, Lemma 3.2, arXiv v2 p. 23; [BCGP21], §7.1, arXiv v3 p. 169.)

<a id="t1-18"></a>

### 1.18 Completed local rings at points of the generic fibre are framed rings

At a coefficient-valued lifting point, the completed localization of `Λ⊗R□` represents deformations of its specialised representation. In particular the completion of `R□[1/p]` at a closed point `x` represents `E′`-Artinian lifts of `ρ_x`, `E′` its residue field. `H²(ad ρ_x)=0` makes this a power-series ring.

For `K/ℚ_ℓ` with `ℓ≠p` and finite-dimensional local `κ`-coefficients, construct `LocalCohomologyAwayFromP` from a stable lattice: remove the prime-to-`p` inertia kernel, compute the remaining pro-`p` inertia/unramified two-step complex, and pass through finite lattice quotients and localization. It supplies `κ`-linearity, finiteness, scalar extension, perfect duality with `V∨(1)`, and Euler characteristic zero. Use the finite-module Tate pairing for compatibility and the two-term procyclic resolutions for the dimension formula; retain the stable-lattice topology and inverse-limit exactness hypotheses. This is the away-from-`p` comparison used by 1.4 and 1.22, independent of the above-`p D7` field theorem. (Sources for this adapter: [CHT08], §2.4.3, pp. 39–40; finite local Tate duality and the tame quotient as specified in the supplier contracts.)

**Checks.**

- For trivial `V=κ` in characteristic zero and `q≠1` as an element of `κ`, `h⁰=h¹=1` and `h²=0`, giving Euler characteristic zero.
- For finite `κ` of characteristic `p` with `q≡1 mod p`, the trivial twist has `h⁰=h²=1` and `h¹=2`, again giving zero.
- For the unramified twist `κ(1)` in characteristic zero, `h²=1` is paired with `h⁰(κ)=1`; omitting the cyclotomic twist fails this pairing.

*Needs:* [1.15](#t1-15); [1.16](#t1-16); [1.1](#t1-1); `ClassFieldTheory`, Layer 5; `ArithmeticGaloisDuality`, R02.1 (inverse limits); `LocalFieldsRamification`, tame quotient; [F.2.9](#fixed-determinant-rings).

(Sources: [BIP23], Proposition 3.41, arXiv v2 p. 29; [CG18], §4.1, proof of Lemma 4.11 (published p. 365); [BCGP21], §7.1, the paragraph after Definition 7.1.2, arXiv v3 pp. 169–170; [BHS19], §3.6 and Remark 3.6.1, printed pp. 362–363.)

<a id="t1-19"></a>

### 1.19 The universal deformation ring of a character

For `K/ℚ_p` finite, `R□≅𝒪[μ_{p∞}(K)][[X₁,…,X_{[K:ℚ_p]+1}]]`. Splitting the torsion characters labels geometric components, each formally smooth. For `ℚ_p`, odd `p`, this is `𝒪[[X,Y]]`; over a field with exactly `μ_p` torsion there are `p` geometric components.

*Needs:* [1.16](#t1-16); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BIP23], Lemma 4.1 and its proof, arXiv v2 p. 36.)

<a id="t1-20"></a>

### 1.20 Presentations of `G`-valued framed rings and central quotients

For smooth affine `𝒪`-groups `φ`:`G→H` with `G⁰→H⁰` smooth surjective, put `𝔨=ker(ad ρ→ad(φρ))`. Then `R□_G=R□_H[[X₁,…,X_r]]/(f₁,…,f_t)`, `r=dim Z¹(𝔨)`, `t=h²(𝔨)`; for `Γ=G_K`, `r−t=(dim G−dim H)(1+f)`. Taking `H=1` gives the absolute presentation. Continuous sections are required for local-field `κ`. For generalised reductive `G`, use `G^der=(G⁰)^der` and `H^der=(H⁰)^der`. The specified quotient representations, including their component-group actions, are retained in the completed product. For flat closed `Z⊂Z(G⁰)` normal in `G`, `H=G/Z`: finite étale `Z` gives `R□_H≅R□_G`; a torus `Z` with `Z∩G^der` étale gives `R□_{G/G^der}⊗̂_{R□_{H/H^der}}R□_H≅R□_G`. Away from `p`, `GSp₄` with fixed multiplier and `H⁰(ad⁰ρ̄(1))=0` has a ten-variable smooth ring; if `ρ̄` is also unramified, every lift is unramified.

**Checks.**

- For connected `GL_d`, `G^der=SL_d` and fixing `G/G^der` fixes the determinant.
- For connected `GSp₄`, `G^der=Sp₄`; fixing the multiplier leaves dimension ten away from `p` under the displayed vanishing hypothesis.
- Over a characteristic-zero field, `G=𝔾_m⋊C₂` with inversion has `G^der=1`, so `G/G^der=G` is noncommutative. Its full commutator subgroup is `𝔾_m`, since the commutator with the involution is the square map on the torus up to inversion, which is surjective as an fppf sheaf. Its actual abelianisation is `C₂`; fixing only that representation leaves torus deformations that fixing `G/G^der` excludes.

*Needs:* [1.17](#t1-17); [1.16](#t1-16); [F.2.9](#fixed-determinant-rings); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [PQ26], Introduction, arXiv v2 p. 4, Proposition 3.6, p. 24, Corollary 3.12 and Proposition 3.13, p. 26; [FKP22], §2, arXiv v5 p. 9; [BCGP21], Proposition 7.4.2, arXiv v3 p. 189.)

<a id="t1-21"></a>

### 1.21 `G`-valued ordinary representations of weight `λ`

**Relative Borel and parabolic geometry.** A reductive group scheme `H/S` is a smooth affine group scheme with connected reductive geometric fibres. For such `H`, construct the smooth proper schemes `Bor_{H/S}` and `Par_{H/S}` representing Borel and parabolic subgroup schemes, with their universal subgroups and compatibility with base change. For a parabolic `P`, identify `H/P` with its conjugacy-type locus; in particular `H/B₀≅Bor_{H/S}` when a Borel `B₀` is given. These supply the partial flag spaces of `H=G⁰` in 3.11 as well as the full flag spaces in 6.5. Construct the quotient torus `B/R_u(B)` and its identifications under conjugation. Since `N_H(B)=B` and inner conjugation by `B` acts trivially on that quotient, two conjugators between the same Borels induce the same torus map; descend these maps to `canonicalTorus`, compatibly with coefficient change.

Borels are conjugate étale-locally on `S`. For split `H` they are conjugate Zariski-locally, hence every Borel over a local coefficient ring `A` is `H(A)`-conjugate to the fixed `B₀`. Construct these comparisons over coefficient rings, including nonreduced Artinian rings ([Conrad], Corollaries 5.2.8–5.2.9, Theorem 5.2.11 and Corollary 5.2.13, pp. 155–159).

**Checks.**

- For `H=GL_d`, `Bor_{H/A}` is the full direct-summand flag scheme, and `H/P` for the stabilizer of a rank-`r` summand is the Grassmannian. Over local `A`, an adapted basis conjugates the flag to the coordinate flag.
- For `H=GSp₄` with its standard perfect alternating form, the Borel scheme is the isotropic full-flag scheme over `A`, including residue characteristic two. An adapted symplectic basis gives conjugacy over local `A`.
- For a torus `H`, `Bor_{H/S}=S`, its universal Borel is `H` and `canonicalTorus=H`. For `GL₂` over `A=k[ε]/(ε²)`, the line `A(1,ε)` is a Borel flag conjugate to `Ae₁` by `[[1,0],[ε,1]]`; two such conjugators give the same ordered torus quotient map.

For split connected reductive `G` over `𝒪`, identify the canonical Borel-quotient torus using a fixed split `B₀`,`T₀`. Given inertial cocharacters `λ_τ`, put `χ_λ=∏_τ λ_τ∘τ∘rec_v⁻¹`. A lift to `G(A)`, `A` finite local `E`-algebra, is `F′_v`-ordinary if it lands in a Borel and its torus projection on `I_{F′_v}` equals `χ_λ`; this is independent of the conjugating element. Dominant regular `λ` gives Hodge type `v_λ`. For `GL_d`, the exponent cocharacters are `−(λ′_{τ,d+1−i}+i−1)`, rather than the highest-weight `λ′` itself. The relative geometry above supplies conjugacy and representability over coefficient rings; `GL_d` and `GSp₄` agree with the explicit full and isotropic flags.

The construction provides the following API.

- `canonicalTorus`: `T_G = B/R_u(B)`, canonically independent of `B`.
- `chiLambda`: `χ_λ` : `I_{F_v} → T_G(𝒪)` attached to cocharacters `λ_τ`.
- `IsGOrdinary`: `ρ` : `G_{F_v} → G(A)` is `F′_v`-ordinary of weight `λ`.
- `IsGOrdinary.gl`: For `GL_d` the cocharacters satisfy `λ_{τ,j}=−(λ′_{τ,d+1−j}+j−1)`, with finite-order factors killed over `F′_v`.
- `IsGOrdinary.map`: Ordinarity is preserved by central isogenies `G → G′` with the induced weight.

**Checks.**

- `G = T` a torus: `B = T`, `T_G = T` and `ρ` is `F′_v`-ordinary of weight `λ` iff `ρ|I_{F′_v} = χ_λ`.
- For `GL₂`, cocharacter `(1,0)` corresponds to highest weight `(−1,−1)`, giving subline `ε` and trivial quotient inertia; highest weight `(0,0)` gives cocharacter `(0,−1)`.
- Regular `GSp₄` ordinarity uses an isotropic full flag with characters `χ₁`,`χ₂`,`ε⁻¹χ₂⁻¹`,`ε⁻¹χ₁⁻¹`.
- The definition is for lifts to finite `E`-algebras; a residual `ρ̄` with a stable Borel is not 'ordinary of weight `λ`' (`χ_λ mod 𝔪` loses the weight).

*Needs:* [1.17](#t1-17); [1.7](#t1-7); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors; ReductiveGroups / layer 7 structure theory; ReductiveGroups / layer 9 pinned chevalleydemazure group schemes over `ℤ`.

(Sources: [FKP22], Appendix B, arXiv v5 p. 52; [FKP22], Definition `B`.2, arXiv v5 p. 52.)

<a id="t1-22"></a>

### 1.22 Smooth points of the generic fibre and purity

Away from `p`, a closed characteristic-zero point is regular iff `H²(ad⁰ρ_x)=H⁰(ad⁰ρ_x(1))=0`. Pure WD points satisfy this vanishing. The unrestricted `GL_d` generic dimension is `d²`; fixing a compatible quotient representation into `G/G^der`, with `G^der=(G⁰)^der`, gives `dim G^der` in the group-valued setting.

*Needs:* [1.18](#t1-18); [1.4](#t1-4); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [BCGP21], Lemma 7.1.3, arXiv v3 p. 170.)

<a id="t1-23"></a>

### 1.23 Deformation rings of `(φ, Γ)`-modules and their trianguline and de Rham quotients

For noncritical crystabelline `D`, `End(D)=E`, generic regular parameters and noncritical refinements, `R_D`,`R_{D,w}`,`R_{D,g}` are smooth of dimensions `1+d²f`, `1+d(d+1)f/2`, `1+d(d−1)f/2`, `f=[K:ℚ_p]`. Identify `Ext¹` tangents and the first-order Cartesian comparison with locally algebraic parameters. For `D=D_rig(V)`, recover unframed Galois deformations.

The construction provides the following API.

- `PhiGamma.defRing`: `R_D` for a `(φ, Γ_K)`-module `D` with `End(D) = E`.
- `PhiGamma.triangulineDefRing`: `R_{D,w}`, deformations with a deformation of the triangulation attached to `w`.
- `PhiGamma.deRhamDefRing`: `R_{D,g}`, de Rham deformations.
- `PhiGamma.tangent_defRing`: Tangent space of `R_D` is `Ext¹(D, D)`; of `R_{D,w}` the classes preserving the triangulation.
- `PhiGamma.formallySmooth`: Under genericity of `δ`, `R_D`, `R_{D,w}`, `R_{D,g}` are formally smooth over `E`.
- `PhiGamma.galois_compat`: For `D = D_rig(V)`, `R_D` is the unframed deformation ring of `V` ([1.18](#t1-18) modulo framing).
- `triangulineDefRing.forget`: Forgetting the triangulation induces `R_D→R_{D,w}`, taking each trianguline point to its underlying deformation.

**Checks.**

- `n = 1`: `R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧`.
- The tangent map of `R_D → R_{D,w}` identifies `Hom(R_{D,w}, E[ε])` with the subspace of `Ext¹(D, D)` of extensions that are trianguline for the deformed refinement.
- `D=ℛ⊕ℛ(ε)` violates `End(D)=E` and genericity; its cyclotomic off-diagonal `H²` is nonzero.
- For `D = D_rig(V)` with `End V = E`, `R_D` is the unframed deformation ring of `V`.

*Needs:* [1.18](#t1-18); [0.4](#t0-4).

(Sources: [DING25], §3.2.2, arXiv p. 61; [DING25], §3.2.2, arXiv p. 61.)

<a id="t1-24"></a>

### 1.24 Fixed-determinant rings by twisting: the functor `𝒳` and the power map `φ_d`

Let `ψ` lift `det ρ̄` and `χ=ψ∘Art_K|_μ` on the selected local-Artin torsion subgroup `μ`. For continuous `θ`:`G_K→1+𝔪_A` trivial on `Art_K(μ)`, `𝒳` is represented by `𝒪(𝒳)=𝒪[[Y₁,…,Y_{f+1}]]`. The `d`-th-power map `φ_d` is finite flat, generically étale and a special-fibre universal homeomorphism. Scalar twisting `(ρ,θ)↦(ρ⊗θ⁻¹,θ)` gives `R^{□,χ}⊗_{𝒪(𝒳),φ_d}𝒪(𝒳)≅R^{□,ψ}⊗̂_𝒪𝒪(𝒳)`. Here `R^{□,χ}` fixes `det` on `μ` and `R^{□,ψ}=R□⊗_{R_{det ρ̄},ψ}𝒪` fixes the whole determinant. These comparisons allow `p|d`.

*Needs:* [1.19](#t1-19); [F.2.9](#fixed-determinant-rings); [1.1](#t1-1).

(Sources: [BIP23], §5, (30) and Proposition 5.1, arXiv v2 pp. 47–48; [BIP23], Lemma 5.3, arXiv v2 p. 48.)

### Examples

For `p` odd and `K=ℚ_p`, the rank-one trivial residual character has `R□=𝒪[[X,Y]]`, the two parameters being pro-`p` units and Frobenius. There is no framing variable in rank one. If the determinant is fixed, a rank-one lift is that determinant character itself and its ring is `𝒪`; scalar twisting identifies the unfixed ring with the character ring. For Schur rank-two residual data, forgetting the basis instead has three formal variables: `R□≅R[[X₁,X₂,X₃]]`, with the forgetful structural map retained.

At the dyadic real scalar residual point, put `ρ(c)=[[1+x,y],[z,−1−x]]`. The odd involution equation is `x²+2x+yz=0`. Its mod-2 tangent has no linear equation, whereas at the residual nonidentity unipotent point the translation `y=1+Y` gives `x²+2x+z+Yz=0` and a nonzero linear `z` term. The two points therefore have different formal smoothness behavior in the same integral quadric.

### Dependencies

The general deformation bundle, complete local algebra, local reciprocity/cohomology and the height, Fontaine–Laffaille, flag and relative-group supplier contracts enter here. None of the later type or patching constructions is a prerequisite for local representability.

## Layer 2: Tame conditions and components away from `p`

The prime-to-`p` inertia decomposition reduces minimal ramification to a tame matrix problem. Keep the tame full-type ring distinct from the finite-image inertia datum at `p`. The rank-two and symplectic examples specify equations and component behaviour rather than only dimension bounds.

<a id="t2-1"></a>

### 2.1 The tame quotient and the reduction to tame pieces

Away from `p`, `P=ker(I_K→ℤ_p)` has prime-to-`p` finite quotients. After splitting its absolutely irreducible residual constituents, decompose lifts into tame multiplicity spaces; Frobenius permutes constituents and induction reconstructs the lift. This gives an equivalence of lifting problems; `P` generally exceeds wild inertia.

*Needs:* [F.1.1](#lifting-functor); [F.1.3](#strict-deformation-functor); `ProfiniteGrp` (Mathlib).

(Sources: [CHT08], §2.4.4, Lemma 2.4.10 and Corollary 2.4.13, pp. 41–43.)

<a id="t2-2"></a>

### 2.2 Unramified lifts

If `ρ̄` is unramified, unramified lifts are determined by an arbitrary Frobenius matrix lifting `ρ̄(Frob)`. Their ring is formally smooth over `𝒪` of relative dimension `d²`; for a compatible fixed unramified determinant its relative dimension is `d²−1`. Unramified residual data alone does not force every lift to be unramified.

Construct `DeformationProblem.unramified` using F.3.1's predicate constructor. Provide
the five closure theorems: conjugation preserves trivial inertia; coefficient change
preserves it; injective maps detect it; the fibre-product projections jointly detect
it; and separated quotient maps detect it, including all maximal-ideal truncations.
These statements concern arbitrary rank and all coefficient objects in `C_𝒪`.

**Checks.**

- For the trivial rank-one residual character, the universal unramified character has
  Frobenius value `1+T` over `𝒪⟦T⟧` and trivial inertia.
- If `q≡1 mod p`, the coefficient-`p` tame quotient admits over `k[ε]/(ε²)` a
  character with tame generator `1+ε` and Frobenius `1`: its residual character is
  unramified but the lift is ramified.
- The same ramified character becomes unramified modulo `ε`; this coefficient map
  is not injective, so injective descent does not apply.

*Needs:* [2.1](#t2-1); [1.1](#t1-1); [F.3.1](#local-deformation-problem); [F.3.2](#deformation-problem-ideal); `MvPowerSeries` (Mathlib).

(Sources: [Gee22], Definition 3.36(1) and Theorem 3.38(2), p. 21; [CHT08], §2.4.4, remark after Definition 2.4.14, p. 43.)

<a id="t2-3"></a>

### 2.3 Minimally ramified lifts

In each tame multiplicity space choose a pro-`p` tame inertia generator `σ`. For every `j≥1` require `ker((ρ(σ)−I)^j)` to be a free direct summand of the corresponding residual rank, commuting with reduction and coefficient base change. Transport through tame splitting. The condition respects strict conjugacy, tame-generator change and coefficient maps. Prime-to-`p` residual inertia gives the fixed-kernel condition.

The construction provides the following API.

- `IsMinimallyRamified`: The minimally ramified condition on lifts of `ρ̄|_{T_q}` and of `ρ̄`.
- `isMinimallyRamified_iff_filtration`: Equivalent to the direct-summand filtration `ker((ρ(σ_q)−I)^j)` lifting `ker((ρ̄(σ_q)−I)^j)`, with its induced unipotent action.
- `IsMinimallyRamified.conj`: Stable under `Γ̂_n`-conjugation.
- `minimallyRamified_deformationProblem`: Minimally ramified lifts form a deformation problem.
- `minimal_baseChange`: A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change.
- `minimal_generator_independent`: Replacing a topological generator of the pro-`p` tame inertia factor by its unit power gives the same minimal condition and kernel filtration.

**Checks.**

- For unramified `ρ̄`, `minimally ramified = unramified`.
- For `p=5`, the unramified lift with Frobenius `diag(1,2)` is conjugated by `[[1,5],[0,1]]` to Frobenius `[[1,5],[0,2]]`. Both are minimally ramified. The condition must allow strict conjugacy, rather than impose a diagonal Frobenius in the fixed basis.
- Over `ℤ/25`, `σ=I+5E₁₂` and `Φ=diag(11,1)` satisfy the `q=11` tame relation and reduce to trivial inertia. Every `σ^j` is invertible, but `ker(σ−I)` is not the rank-two direct summand required by residual identity; this lift is not minimal.

*Needs:* [2.1](#t2-1); [F.3.1](#local-deformation-problem).

(Sources: [CHT08], §2.4.4, Definition 2.4.14 and Corollary 2.4.18, pp. 43–44.)

<a id="t2-4"></a>

### 2.4 Structure of unrestricted lifting rings away from `p`

Away from `p`, `H⁰(ad ρ̄(1))=0` gives an unrestricted rank-`d` ring `𝒪[[X₁,…,X_{d²}]]`. In rank two with compatible fixed determinant, the unrestricted ring is reduced, `𝒪`-flat and a complete intersection of dimension four. Its generic components are regular of dimension three, with constant inertia type after forgetting `N`. Full type may change at component intersections; `H⁰(ad⁰ρ(1))` detects ambient smoothness.

*Needs:* [1.1](#t1-1); [1.4](#t1-4); [2.1](#t2-1); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [CHT08], §2.4.3, Lemma 2.4.9, p. 40; [Gee22], Theorem 3.31, p. 19; [TUNG21], §3.2.6, Lemma 3.2.8, p. 15; [BLGGT14], Lemma 1.3.4, arXiv v4 p. 21.)

<a id="t2-5"></a>

### 2.5 Steinberg (unipotent-monodromy) lifts

For trivial residual data and `q≡1 mod p`, impose unipotent inertia and a `q`-chain `α`,`qα`,…,`q^{d−1}α` of Frobenius roots, then take the reduced flat closure. In rank two `q(tr Φ)²=(1+q)²det Φ`. Monodromy may drop on the boundary. Compare separately with the filtered discrete-series condition.

The fixed-basis predicate `SteinbergFrobRelation q Φ` is `q(tr Φ)²=(1+q)²det Φ` over a commutative ring. It is the rank-two Frobenius equation; the condition quotient also retains inertia, residual continuity and its flat closure.

The construction provides the following API.

- `SteinbergLifts`: `D^Stein`,1 and its flat closure `D^Stein`.
- `steinberg_charpoly_frob`: Frobenius eigenvalues in ratio `q`.
- `steinberg_le_unipotentInertia`: `D^Stein ⊆ D^{(1,…,1)}`.
- `steinberg_n_two`: For `n = 2`, the relation `q(tr ρ(φ))² = (1 + q)² det ρ(φ)`.
- `SteinbergLifts.baseChange`: The `q`-chain and unipotence equations, and the resulting flat-closure point, commute with coefficient maps.
- `DeformationProblem.steinberg`: For the stated trivial residual data and `q≡1 mod p`,
  the flat-closure predicate is factorization through the reduced `𝒪`-flat Steinberg
  quotient. Its invariant closed ideal gives the five closure theorems of F.3.1:
  strict conjugation, coefficient change, injective descent, fibre-product gluing and
  separated-limit detection, including `truncationLimit`. This predicate is defined on
  every `C_𝒪` object by factorization; it does not require the target coefficient ring
  itself to be reduced or flat.

**Checks.**

- For `q=2` and `Φ=diag(2,1)`, trace is 3 and determinant is 2; both sides of the rank-two relation are 18. For general unit `α` the matrix `diag(qα,α)` satisfies the same equation.
- With that `Φ`, setting inertia to the identity keeps the Frobenius relation and gives a dropped-monodromy boundary point in the Steinberg closure. Requiring nonzero `N` at every point would omit it.
- For `q=2` over `ℚ`, `Φ=I` and trivial inertia give the values 8 and 9 in the two sides, so unipotent inertia alone does not impose the Steinberg condition.

*Needs:* [2.1](#t2-1); [F.3.1](#local-deformation-problem); [F.3.2](#deformation-problem-ideal).

(Sources: [TaylorII], §3, definition of `D^{Stein,1}` and `D^{Stein}` before Proposition 3.1, p. 196; [Gee22], Definition 3.36(3), p. 21.)

<a id="t2-6"></a>

### 2.6 The `q`-tame group

For `p∤q`, `T_q=ℤ_p⋊ℤ̂` with `φtφ⁻¹=t^q`. For `b≥1` the closed subgroup generated by `t` and `φ^b` is `T_{q^b}`. Write `P_{K,p}=ker(I_K→ℤ_p)`, using a choice of the coefficient-`p` projection of tame inertia. Then `G_K/P_{K,p}≅T_q`; `P_{K,p}` generally contains more than the wild `ℓ`-inertia, unlike the full tame quotient of LocalFieldsRamification. In maximal-ideal-topological coefficients, tame matrices with pro-`p` inertia and `BAB⁻¹=A^q` give a unique continuous representation. Dense generators detect equality. The abelianisation is `ℤ_p/(q−1)×ℤ̂`.

In fixed matrix coordinates, `IsTameMatrixPair q Φ σ` requires both matrices to be units and `Φσ=σ^qΦ`. It is available over any commutative ring; the representation theorem additionally requires the profinite continuity and pro-`p` inertia hypotheses stated above.

The construction provides the following API.

- `TameGroup`: `T_q` as a profinite group with generators `t`, `φ_q`.
- `TameGroup.conj_t`: `φ_q t φ_q^{-1} = t^q`.
- `TameGroup.lift`: A pair `(A, B)` in `GL_n(R)` with `B A B^{-1} = A^q` and `A` of pro-`p` order (for `R ∈ C_𝒪`: the reduction of `A` unipotent) defines a unique continuous representation of `T_q`.
- `TameGroup.ofLocalField`: `G_K/P_{K,p} ≅ T_q` for `K/ℚ_ℓ` with residue field `𝔽_q`, given the choices.
- `TameGroup.lift_ext`: Agreement on dense generators `t`,`φ` determines a continuous representation; tame-pair lifting commutes with coefficient maps.

**Checks.**

- `T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂`.
- `q = 1`: `T_1 = ℤ_p × ℤ̂` is abelian (the relation `φtφ^{-1} = t` is trivial).
- For `q ≥ 2`, `T_q` is not abelian: `φ_q t φ_q^{-1} = t^q ≠ t` (`t` has infinite order).
- For `b≥1`, the closed subgroup `⟨t,φ_q^b⟩≅T_{q^b}`; `b=0` would leave only inertia and is excluded.

*Needs:* [2.1](#t2-1); `ProfiniteGrp` (Mathlib); Tau Ceti `NumberTheory/LocalField/Tame/PadicCharacter:inertiaPadicTameCharacter_surjective,IsArithFrobeniusLift.inertiaPadicTameCharacter_conj`; `LocalFieldsRamification`, tame quotient.

(Sources: [LTXZZrigid], Definition 3.3.1, arXiv v1 p. 15.)

<a id="t2-7"></a>

### 2.7 Ramification types `U1`–`U3`, `P`, `H` of `GSp₄`-valued residual representations

The `U₁`,`U₂`,`U₃` representatives are `E₂₃`, `E₁₂−E₃₄`, `E₁₂+E₂₃−E₃₄`. Require `p≥5` at `U₃` and `p≥3` at `U₁`,`U₂`. At `x≠p`, type `P` requires `r̄|G_x` to split as four `k`-valued characters and `k⁴=V₀⊕Vχ`, where both planes are isotropic, `V₀=(k⁴)^{I_x}` and inertia acts on `Vχ` through a nontrivial scalar character `χ_x`; also require `x−1` a unit in `k`. Thus `r̄|I_x=1⊕1⊕χ_x⊕χ_x`, and its similitude on inertia is `χ_x`. Type `H` has absolutely irreducible inertia and `x⁴−1` a unit. Geometric orbit comparisons use splitting coefficients. A cyclotomic-power similitude is unramified at `x≠p`, so excludes `P`.

The construction provides the following API.

- `GSp4RamType`: The types `U1`, `U2`, `U3`, `P`, `H` as a predicate on `r̄` : `G_x → GSp₄(k)`.
- `GSp4RamType.unipotent_rank`: `r̄` is of type `U_i` iff `r̄(I_x)` is generated by `exp(N)` with `N ∈ sp₄` nilpotent of rank `i`.
- `GSp4RamType.exclusive`: The types `U`, `P`, `H` are mutually exclusive.
- `GSp4RamType.not_P`: At `x≠p`, a similitude trivial on `I_x` excludes type `P`; in particular every cyclotomic-power similitude does.
- `GSp4RamType.conjugate`: Residual `GSp₄`-conjugacy preserves type; splitting coefficient extension preserves the geometric orbit description.

**Checks.**

- `r̄(σ) = exp(E₂₃) = 1 + E₂₃` has rank-one logarithm, so `r̄` is `U1`.
- For `p = 3`, `exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6` is not defined over `k`; type `U3` is stated for `p ≥ 5`.
- Unramified `r̄` is of no type.
- For `p=7`, `K=ℚ₁₃`, take `r̄(σ)=diag(2,2,4,4)` and arithmetic Frobenius `r̄(Φ)=diag(6,6,1,1)` in the split symplectic form pairing the first plane with the last. The commuting matrices satisfy `r̄(σ)³=1` and `r̄(Φ)²=1`; since `13≡1 mod 3`, they define a finite continuous tame representation. Its two isotropic inertia-character planes have reciprocal characters, `13−1` is a unit modulo seven, and its multiplier is cyclotomic: `1` on inertia and `6=13 mod 7` on Frobenius. Its inertia invariants are zero, so it is not type `P`.
- `r̄|I_x` absolutely irreducible with `x ≡ 2 mod 5`, `p = 5`: `x⁴ − 1 ≡ 0 mod 5` is excluded from type `H`.

*Needs:* [1.17](#t1-17); [2.1](#t2-1).

(Sources: [CG20], Assumption 4.3, published pp. 813–814, especially (4), arXiv v1 p. 11; [CG20], Remark 4.4, published p. 814, arXiv v1 p. 11.)

<a id="t2-8"></a>

### 2.8 The minimally ramified deformation ring

Minimal ramification is liftable, with framed ring `𝒪[[X₁,…,X_{d²}]]` and unframed tangent dimension `h⁰(ad ρ̄)`. Construct kernel/image filtrations over small extensions compatibly with tame splitting. If `p∤`#`ρ̄(I_K)`, minimality means killing `ker(ρ̄|_I)`, and `L=H¹(G_K/I_K,(ad ρ̄)^{I_K})`.

*Needs:* [2.3](#t2-3); [2.1](#t2-1); [1.1](#t1-1); [F.3.2](#deformation-problem-ideal); `MvPowerSeries` (Mathlib).

(Sources: [CHT08], §2.4.4, Corollary 2.4.21, p. 46; [CHT08], §2.4.4, Lemma 2.4.22, p. 47.)

<a id="t2-9"></a>

### 2.9 Fixed inertial type quotients

The rank-two fixed-type ring is the reduced flat closure of characteristic-zero exact full-inertia-type points: its ideal is their kernel intersection. These points are dense, while boundary points may lose type. Nonzero quotients have dimension four; only finitely many types occur. Uniqueness respects the universal quotient map.

The construction provides the following API.

- `typeQuotient`: `R^□_{ρ̄,χ,τ}` as a quotient of `R^□_{ρ̄,χ}`.
- `typeQuotient_points`: Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.
- `typeQuotient_krullDim`: Nonzero ⇒ Krull dimension `4 (n = 2)`.
- `typeQuotient_finite`: Only finitely many full inertial types have a nonzero closure quotient.
- `typeQuotient_unique`: Equality of closure kernels gives the unique isomorphism commuting with the universal quotient map.

**Checks.**

- For `ρ̄` unramified, trivial `r|I_K` and `N = 0` give the unramified quotient. The closure of a Steinberg type with `N ≠ 0` can meet it at an `N = 0` point.
- A characteristic-zero inertia character whose prime-to-`p` reduction disagrees with `ρ̄` has no exact-type point, so the closure quotient is zero. Enumerating every abstract inertial type as a nonzero component would fail.
- The flat-closure operation applied to `𝒪[[X]]/(ϖX)` gives `𝒪`: `X` vanishes in every characteristic-zero point and is killed by `ϖ` in the naive ring. Retaining that `X` would fail torsion saturation; this computation tests the closure operation used for the type quotient.

*Needs:* [2.4](#t2-4); [F.3.2](#deformation-problem-ideal).

(Sources: [Gee22], §3.31, after Theorem 3.31, pp. 19–20; [Shotton], Definition 3.5 and Proposition 3.6, p. 12.)

<a id="t2-10"></a>

### 2.10 Local rings at Taylor–Wiles primes

For rank two, odd `p`, `q≡1 mod p`, distinct residual Frobenius eigenvalues and fixed unramified determinant, the ring is `𝒪[[x,y,B,u]]/((1+u)^{p^m}−1)`, `p^m`∥`q−1`. Set `C=(1,y;x,1)` and lift one residual Frobenius eigenvalue to `α`. The universal matrices are `Φ=C⁻¹diag(α+B,χ(φ)/(α+B))C` and `σ=C⁻¹diag(1+u,(1+u)⁻¹)C`. It is smooth of relative dimension three over `𝒪[Δ]`.

*Needs:* [2.4](#t2-4); [2.1](#t2-1); [1.1](#t1-1).

(Sources: [Gee22], §3.32, Lemma 3.33 and Exercise 3.34, p. 20.)

<a id="t2-11"></a>

### 2.11 Local models for `GSp₄` Ihara avoidance: nilpotent strata, `𝒩(q)` and `ℳ(x, y; q)`

For `p≥3`, `exp₂(N)=1+N+N²/2+N³/2` and `log₂(U)=(U−1)−(U−1)²/2` are inverse on the specified symplectic schemes. Frobenius gives `ΦNΦ⁻¹=qN+((q−q³)/3)N³`, retaining the characteristic-three correction. Centralizers are smooth of dimensions 11,7,5,3 for ranks 0–3. The pair scheme `ΦNΦ⁻¹=qN+q*N³` identifies with the unipotent specialization of the reciprocal-eigenvalue tame matrix model.

Use `modifiedExp`, `modifiedLog` and `modifiedPowerCoefficient` for these explicit matrix formulas, with 2 invertible in the coefficient ring. The last computes `(q−q³)/3` in `ℤ` before mapping to the coefficient ring, so characteristic three causes no division by zero. The APIs `modified_exp_log_inverse` and `modified_exp_pow` state inverse and powering identities for any `4×4` matrix with fourth power zero; the symplectic local model additionally imposes its alternating-form equations.

The construction provides the following API.

- `GSp4.exp₂`: `exp₂` : `𝒩 → 𝒰`, `N ↦ I + N + N²/2 + N³/2`.
- `GSp4.log₂`: `log₂` : `𝒰 → 𝒩`, `U ↦ (U − I) − (U − I)²/2`.
- `GSp4.exp₂_log₂`: `exp₂ ∘ log₂ = id` and `log₂ ∘ exp₂ = id`.
- `GSp4.exp₂_pow`: `exp₂(mN + m*N³) = exp₂(N)^m`, `m* = (m − m³)/3`.
- `GSp4.nilpotentStratum`: `𝒩_i`, the rank-`i` nilpotent stratum, with representative `N_i`.
- `GSp4.MSpace`: `ℳ(x, y; q) ⊂ GSp₄²`, with `ℳ(1, 1; q) ≅ 𝒩(q)`.
- `GSp4.exp₂_conjugate`: For invertible `g` in `GSp₄`, `exp₂(gNg⁻¹)=g exp₂(N)g⁻¹` and `log₂(gUg⁻¹)=g log₂(U)g⁻¹`. Both polynomial maps commute with coefficient maps in which 2 is invertible.

**Checks.**

- `exp₂(E₁₄)=I+E₁₄` and `log₂(I+E₁₄)=E₁₄`, since `E₁₄²=0`.
- For the `4×4` regular Jordan nilpotent `J` over `ℚ`, `log₂(I+J)=J−J²/2≠J`; the quadratic correction is nonzero. Together with `log₂(I)=0` these distinguish the logarithm formula.
- `exp₂(0) = I` and `log₂(I) = 0`.
- For `p≥5` and `N₃` with `N₃³≠0`, `exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6`. At `p=3` the usual exponential formula is undefined, whereas `exp₂` is still a bijection `𝒩→𝒰`.
- `m* = (m − m³)/3 ∈ ℤ` for all `m ∈ ℤ`, `e`.`g`. `m = 2` gives `m* = −2`.
- For `q=2` one has `q*=−2`. In characteristic 3 the cubic coefficient is 1 and `N₃³≠0`, so the defining equation is `ΦN₃Φ⁻¹=2N₃+N₃³`, not merely `2N₃`.

*Needs:* [1.17](#t1-17); [2.5](#t2-5).

(Sources: [BCGP21], §7.4.9, arXiv v3 p. 190; [BCGP21], Proposition 7.4.10, arXiv v3 p. 191; [BCGP21], §7.4.13, pp. 193–194.)

<a id="t2-12"></a>

### 2.12 Level-raising local deformation problems `𝒟^mix`, `𝒟^unr`, `𝒟^ram`

At an inert CM place define the local fixed-multiplier `𝒢_N` lifting functor using the coset/pairing dictionary of ArithmeticGaloisRepresentations §7.4 and 1.17. Construct its local conditions directly. Take polarized rank `N≥2`, `p≥N`, `p∤(q²−1)`, even `μ` and multiplier `η_v^με^{1−N}`. The unramified residual restriction contains `q^{−N}`,`q^{−N+2}` exactly once. Its mixed ring is smooth of relative dimension `N²−1` over `𝒪[[x₀,x₁]]/(x₀x₁)`; both components have relative dimension `N²`. Monodromy points from `q^{−N}` to `q^{−N+2}`, with `x(s−q^{−N})=0` and tame exponent `q²`. For odd `μ`, `x₀(2+x+y)=0` forces `x₀=0`: mixed equals unramified, while the ramified subproblem is smooth of relative dimension `N²−1`.

The construction provides the following API.

- `LevelRaising.mix`: Inertia preserves the canonical rank-two block `M₀` and is trivial on `M₁`; the `GL_N` restriction is `r`♮ on `G_{F_w}`.
- `LevelRaising.unr`: Inertia is also trivial on `M₀`.
- `LevelRaising.ram`: Frobenius on `M₀` has characteristic polynomial `(T−q^{−N})(T−q^{−N+2})`.
- `LevelRaising.localModel`: For even `μ`, `𝒟^mix` is formally smooth over `Spf 𝒪⟦x₀, x₁⟧/(x₀x₁)`, with `𝒟^unr = {x₀ = 0}` and `𝒟^ram = {x₁ = 0}`.
- `LevelRaising.relation`: `x(s − q^{−N}) = 0` in `R^mix`.
- `LevelRaising.unr_eq_minimal`: For the unramified polarized residual problem `𝒟^unr` is the polarized unramified lifting condition; after restriction to `G_{F_w}` it is unramified `GL_N` inertia.

**Checks.**

- For even `μ`, the nodal base has relative dimension one, so both framed components have relative dimension `N²` and their intersection has relative dimension `N²−1`. For odd `μ`, mixed equals unramified; the ramified subproblem has relative dimension `N²−1` and is not a second component of the mixed ring.
- For `N=2` and even `μ`, `Spec R^mix` has exactly two irreducible components, `R^unr` and `R^ram`, meeting in `R^mix/(x, s − q^{−2})`.
- The direction `v↦v+xv′` gives `x(s′−q²s)=0`; reversal gives `x(s−q²s′)=0`. Both vanish on the unramified component `x=0`.
- When `p` divides `q²−1` the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires `p∤(q²−1)`.

*Needs:* [2.6](#t2-6); [2.2](#t2-2); [2.5](#t2-5); [1.1](#t1-1); [F.3.1](#local-deformation-problem); `ArithmeticGaloisRepresentations`, §7.4 (`CHTGroup`, coset/pairing dictionary); [1.17](#t1-17).

(Sources: [LTXZZrigid], Definition 3.5.1, arXiv v1 p. 27; [LTXZZrigid], Proposition 3.5.2, arXiv v1 p. 27; [LTXZZ], §6.4, arXiv v3 pp. 116–117.)

<a id="t2-13"></a>

### 2.13 Unrestricted lifting rings away from `p` are complete intersections

For any `d` and `K/ℚ_ℓ`, `ℓ≠p`, `R□` is reduced, flat and a local complete intersection of pure relative dimension `d²`; `R□/ϖ` is equidimensional of dimension `d²`. Each component gives a deformation problem; the smooth minimal quotient is one component. No `p≥d` restriction is needed for `GL_d`.

*Needs:* [2.1](#t2-1); [2.8](#t2-8); [2.4](#t2-4); [1.4](#t1-4).

(Sources: [LTXZZrigid], Proposition 3.4.12, arXiv v1 p. 25; [NT26], proof of Lemma 3.6, arXiv v2 p. 18; [Shotton], Theorem 2.5, arXiv v2 p. 7.)

<a id="t2-14"></a>

### 2.14 Lifts away from `p` of reducible residual representations with prescribed determinant

For `p≥3`, global residual (`χ̄`,*;0,1) and geometric determinant `μ=κ^{r−1}χ₀`, `r≥2` and `χ₀` finite order, every place away from `p` has, after coefficient extension, a determinant-`μ` lift on a smooth component. The nonsplit cyclotomic case uses a Steinberg lift with determinant-compatible unramified twist.

*Needs:* [2.8](#t2-8); [2.5](#t2-5); [1.10](#t1-10).

(Sources: [FKP22], Lemma 7.2, first bullet, arXiv v5 pp. 33–34.)

<a id="t2-15"></a>

### 2.15 Components for Ihara avoidance

For trivial rank-`d` residual data, `ℓ≠p` and `q≡1 mod p`, take finite `p`-power tame characters `χᵢ` of inertia with values in `1+ϖ𝒪`, each the restriction of a continuous character of `G_K`. Equivalently, they factor through the `p`-primary quotient of the residue-field units, so `χᵢ(t)^{q−1}=1` for a pro-`p` tame generator `t`. Choose coefficients containing their values. Let `Rχ` denote the framed quotient imposing the prescribed characteristic polynomial for every inertia element, and let `Rχᶠˡᵃᵗ`,`ʳᵉᵈ` be its reduced `𝒪`-flat closure, the image in `(Rχ[1/ϖ])ᵣₑd`. These are separate rings.

Pairwise distinct `χᵢ` give geometrically irreducible `Spec Rχ` of integral dimension `d²+1` with characteristic-zero generic point; `Rχᶠˡᵃᵗ`,`ʳᵉᵈ` is a domain of the same dimension. The equation quotients satisfy `Rχ/ϖ=R₁/ϖ`. For trivial characters, all components of `Spec R₁` have that dimension and characteristic-zero generic points, and each special generic point has a unique generic generalisation. These component statements pass to the reduced flat closures; equality of their special-fibre rings is not inferred from equality of the equation quotients. The Steinberg closure is a domain; the rank-two fixed-determinant comparison requires `p>2`.

*Lean:* `IsTameMatrixPair.charpoly_pow` gives the necessary Frobenius stability.

**Checks.**

- At `p=5`, `K=ℚ₁₁` and `𝒪=ℤ₅[ζ₂₅]`, the proposed characters with values 1 and `ζ₂₅` reduce to one but do not extend to `G_K`. The polynomials `(X−1)(X−ζ₂₅)` and `(X−1)(X−ζ₂₅¹¹)` differ, contradicting Frobenius conjugacy. The characteristic-zero locus is empty and its reduced flat closure is zero.
- In rank one with the same forbidden value `ζ₂₅`, the equation quotient is `𝒪/(ζ₂₅¹⁰−1)[[T]]`, of dimension one. Its reduced flat closure is zero; it does not have the dimension-two geometry of a permitted character.
- For `p=5` and `q=11`, values 1 and `ζ₅` are permitted: `ζ₅¹⁰=1`, and `Φ=1`, `Σ=diag(1,ζ₅)` obey `ΦΣΦ⁻¹=Σ¹¹`. Their reductions give the trivial residual representation.
- Since every permitted `χᵢ` reduces to one, the characteristic-polynomial equations reduce to those of the trivial characters. Taking the reduced flat closure is a separate quotient operation.

*Needs:* [2.5](#t2-5); [2.4](#t2-4); [2.9](#t2-9).

(Sources: [TaylorII], §3, Proposition 3.1, p. 196; [Gee22], Proposition 3.37 and Theorem 3.38, p. 21; [NT26], proof of Theorem 5.9, arXiv v2 p. 45; [THORNE15], Proposition 3.15 and its proof, p. 18.)

<a id="t2-16"></a>

### 2.16 Taylor–Wiles local conditions in rank `n`: the tangent dimension

For `p>d≥2`, semisimple unramified residual data, a selected simple eigenvalue and `q≡1 mod p`, fix an unramified determinant `ξ`. Decompose a lift into the selected line `A` and its rank-`(d−1)` complement `B`, and require inertia to act by possibly different scalars `ψ_A` and `ψ_B` on the two blocks, with `ψ_Aψ_B^{d−1}=1`. The resulting fixed-determinant Taylor–Wiles condition has `L⊆H¹(ad⁰ρ̄)` and `dim L−h⁰(ad⁰ρ̄)=1`. This is the two-scalar condition, distinct from 2.23's condition that `B` is unramified.

For `d=2`, `p=5` and `q=11`, inertia `diag(ψ,ψ⁻¹)` has one infinitesimal ramified parameter and determinant one. If instead the complementary character is forced unramified as in 2.23, fixing the determinant to be unramified forces `ψ=1`, removing that parameter. In `d=1` a fixed determinant determines the whole character, so the asserted extra tangent dimension would be false; `d≥2` is essential.

*Needs:* [2.10](#t2-10); [2.1](#t2-1); [F.3.1](#local-deformation-problem).

(Sources: [CG18], §8.5.1, arXiv v2 pp. 81–82, especially the local condition and tangent calculation on p. 82.)

<a id="t2-17"></a>

### 2.17 `GSp₄` lifts at Taylor–Wiles places

With four distinct residual Frobenius eigenvalues paired by similitude and `q≡1 mod p`, lifts have ordered inertia `γ₁`,`γ₂`,`ψγ₂⁻¹`,`ψγ₁⁻¹`. The fixed-similitude ring is smooth of relative dimension ten over `𝒪[Δ_v]`, `Δ_v=(k_v×(p))²`; the eigenvalue ordering is fixed.

*Needs:* [1.17](#t1-17); [1.20](#t1-20); [2.10](#t2-10); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGP21], Lemma 7.4.4, arXiv v3 p. 189.)

<a id="t2-18"></a>

### 2.18 Inertial types with monodromy and fixed-type rings

A full type away from `p` retains `N` and an inertia representation extendible to `W_K`. Its ring is the reduced flat closure of exact-type points. Finitely many closed type loci cover the generic fibre and may intersect. The finite-image `p`-adic potentially semistable inertia datum is a different type notion.

The construction provides the following API.

- `InertialType`: An inertial type: an `I_K`-isomorphism class of Weil–Deligne representations restricted to `I_K`, `N` retained.
- `fixedTypeRing`: `R^□_r̄(τ)`, the reduced `𝒪`-flat closure quotient of exact-type points.
- `fixedTypeRing_points`: Every exact-type point lies on `R^□_r̄(τ)`, and such points are dense in its generic fibre. Boundary points need not have exact type `τ`.
- `fixedTypeRing_union`: The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.
- `fixedTypeRing_n2`: For `n=2`, after imposing the same compatible determinant, this closure definition agrees with [2.9](#t2-9).
- `fixedTypeRing.unique`: The exact-type kernel intersection uniquely specifies the flat closure; precomposition with `R□` detects equality of its ring maps.

**Checks.**

- Trivial and Steinberg types differ by `N` but their closures meet: take `ρ(φ)=diag(q,1)`, `ρ(t)=(1 pt;0 1)`, `q≡1 mod p`, and specialize `t=0`.
- For `r̄` unramified and `τ` trivial with `N = 0` the ring is the unramified lifting ring, formally smooth of relative dimension `n²` ([2.2](#t2-2)).
- Each nonzero `R^□_r̄(τ)` is equidimensional of dimension `1 + n²`.
- Incompatible reductions of `τ|P_K` and `ρ̄|P_K`, even after coefficient extension, give an empty exact-type locus and zero closure ring.

*Needs:* [2.13](#t2-13); [2.9](#t2-9); [2.5](#t2-5); `ArithmeticGaloisRepresentations`, §2.4 (Grothendieck monodromy and the full Weil–Deligne construction).

(Sources: [NT26], proof of Lemma 3.6, arXiv v2 p. 18; [Shotton], Definition 3.5 and Proposition 3.6, p. 12.)

<a id="t2-19"></a>

### 2.19 Fixed-determinant rank-two rings away from `p`: complete intersection with regular generic fibre

For `p≥3` and conductor minimal among twists, the four ramified obstructed rank-two cases below give two group-algebra power-series rings and two hypersurfaces. The extension-of-1 case includes `C(T)−T` and has `(p^a+1)/2` geometric components, `p^a`∥`q−1`. Retain the ramification and conductor hypotheses.

In the ramified conductor-minimal setting, require `R_v` to be a complete intersection and `Spec R_v[1/p]` to be regular. At each closed characteristic-zero point `x` with residue field `E_x` finite over `E`, the completed local ring, with its maximal-ideal topology, pro-represents a formally smooth framed fixed-determinant deformation problem on finite local Artinian `E_x`-algebras with residue `E_x`. For the four exceptional cases its presentations refine as follows:

- In the diagonal and induced cases, `R_v` is a power-series algebra over `𝒪[Δ]`, where `Δ` is the maximal `p`-quotient of `ℱ_v×` or `ℱ_{v²}×` respectively.
- In the two ramified-extension cases, `R_v≅𝒪[[x₁,x₂,x₃,x₄]]/(r)` with `r≠0`.
- For the `q≡1` extension of 1 by 1, take the trace coordinate `T` at `T=2` and the relation `C(T)−T`, where `C(t+t⁻¹)=t^q+t^{−q}`. If `p^a` is the largest `p`-power dividing `q−1`, the geometric generic components are the unipotent `T=2` component and the `(p^a−1)/2` reciprocal pairs `T=ζ+ζ⁻¹`, `ζ≠1`, `ζ^{p^a}=1`. Thus the total is `(p^a+1)/2`. This `p^a` is distinct from the residue cardinality `q`.

**Checks.**

- The natural inclusion `𝒪[[X]][1/p] → E[[X]]` has image consisting of series with uniformly bounded coefficient denominators. The series `∑ n≥0 p^(−n²) X^n` lies in `E[[X]]` but not in that image: multiplying by any fixed power of `p` leaves nonintegral coefficients for large `n`.
- For `S=𝒪[[X]][1/p]`, the point `X=0` has residue field `E`, and the completion of its local ring is `E[[X]]`. This completion is formally smooth for the `X`-adic topology on finite local Artinian `E`-algebras with residue `E`; regularity of `Spec S` concerns the uncompleted scheme. Formal smoothness here is for the `X`-adic topology; in the discrete-topology sense (Mathlib's `Algebra.FormallySmooth`) it fails whenever `Ω_{E/ℚ}` is infinite-dimensional, for example `E=ℚ_p`.
- In the extension-of-1 case with `p=3` and `q=7`, `p^a=3` gives two geometric components: `T=2` and `T=ζ₃+ζ₃⁻¹=−1`. This retains the count `(p^a+1)/2` with the completed-local formulation.

*Needs:* [2.4](#t2-4); [2.13](#t2-13); [1.18](#t1-18); [1.10](#t1-10); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [CG18], Lemma 4.11, published p. 364; [CG18], proof of Lemma 4.11, published p. 364; [CG18], footnote 5, published p. 365; [BellovinGee], Proposition 3.3.2, Theorem 3.3.3, Remark 3.3.4 and proof, arXiv v3 pp. 30–31.)

<a id="t2-20"></a>

### 2.20 Rigidity of a residual representation for `(Σ_min, Σ_lr)`

For polarized `𝒢_N` data, `N≥2`, `p≥N` and the fixed similitude, rigidity means every lift is minimal on `Σ_min`, the inert Frobenius pair occurs once on `Σ_lr`, regular Fontaine–Laffaille at `p` and unramified elsewhere. The disjoint away-from-`p` sets include all ramification in `Σ_min`; `Σ_lr=∅` for odd `N`. Added level-raising places satisfy `p∤(q²−1)`. At an unramified place in `Σ_min`, a sufficient criterion for every lift to remain unramified is `q`≢`1 mod p` and absence of residual adjoint Frobenius eigenvalue `q`; residual unramifiedness alone is insufficient for condition (1). Condition (4) concerns only the residual representation.

The construction provides the following API.

- `IsRigidFor`: The predicate on `r̄` given by the local conditions (1)–(4) at `Σ_min`, `Σ_lr`, the places above `p` and the rest.
- `IsRigidFor.minimal`: For `v ∈ Σ_min` every lift of `r̄_v` is minimally ramified.
- `IsRigidFor.levelRaising`: For `v ∈ Σ_lr` the residual hypothesis of [2.12](#t2-12) holds.
- `IsRigidFor.fontaineLaffaille`: For `v | p`, `r̄^`♮`_v` is regular Fontaine–Laffaille crystalline (clause (3)), in the sense of [1.6](#t1-6).
- `IsRigidFor.unramified`: At every finite place outside `Σ_min ∪ Σ_lr` and not above `p`, `r̄_v` is unramified (clause (4)).
- `IsRigidFor.mono`: Adding an inert level-raising place preserves rigidity if it is disjoint from the existing sets and satisfies the Frobenius-pair and `q²−1` conditions.

**Checks.**

- `Σ_min = Σ_lr = ∅`: rigidity says `r̄` is unramified away from `p` and regular Fontaine–Laffaille at `p`.
- If `r̄^`♮`_v(φ_w)` has the pair {‖`v`‖`^{−N}`, ‖`v`‖`^{−N+2}`} twice, condition (2) fails and `𝒟^mix` is not defined at `v`.
- Adding to `Σ_lr` a place satisfying (2) preserves rigidity (used with `𝔭` in LTXZZ §6.4).
- At a minimal place with residue cardinality `q=2` and coefficient `p=5`, take unramified residual Frobenius `I₂`. Every lift has trivial wild inertia, and the linearized tame equation has coefficient `1−q=−1`, a unit. Induction on the maximal-ideal filtration forces tame inertia to be `I₂`, so the local minimality requirement (1) holds.

*Needs:* [2.3](#t2-3); [2.12](#t2-12); [2.13](#t2-13); [1.6](#t1-6).

(Sources: [LTXZZ], the rigidity definition (published Definition 6.3.3, p. 277; arXiv v3 Definition 6.3.4).)

<a id="t2-21"></a>

### 2.21 Unipotent lifts of a regular unipotent residual monodromy are minimally ramified

A single regular unipotent residual inertia block makes every unipotent lift minimal: the successive kernels of `(ρ(σ)−I)^j` are free direct summands reducing to the residual flag.

*Needs:* [2.3](#t2-3); [2.15](#t2-15).

(Sources: [CG20], Appendix §`A`.`4(2)(a)`, published p. 888.)

<a id="t2-22"></a>

### 2.22 `GSp₄` Ihara-avoidance deformation rings

For `p>2`, `ℓ≠p`, trivial residual `GSp₄`, `q≡1 mod p` and an unramified fixed similitude reducing to one, take two finite `p`-power tame inertia characters `χ₁`, `χ₂` valued in `1+ϖ𝒪`, each extending to a continuous character of `G_K`. Thus their values have order dividing `q−1`; equivalently they are characters of the `p`-primary quotient of the residue-field units. Choose coefficients containing these values. Require `χ₁`, `χ₂` nontrivial with `χ₁≠χ₂^{±1}`. The fixed-similitude characteristic-polynomial quotient for inertia eigencharacters `χ₁`, `χ₂`, `χ₂⁻¹`, `χ₁⁻¹` has irreducible spectrum of integral dimension eleven, regular scheme generic fibre of dimension ten and formally smooth completed local deformation rings at its closed characteristic-zero points for their maximal-ideal topology. Trivial characters give an equidimensional spectrum of integral dimension eleven, characteristic-zero generic points and unique generic generalisation over each special generic point. These equation quotients have equal special fibres. Their reduced flat closures retain the stated component geometry; equality of special-fibre rings after this further quotient is a separate assertion. Variable multiplier adds one variable.

**Checks.**

- At `p=5` and `q=11` with similitude one, eigenvalues `ζ₂₅`, `ζ₂₅²`, `ζ₂₅⁻²`, `ζ₂₅⁻¹` are not preserved by eleventh powers. No Frobenius matrix exists, even in `GL₄`, so the characteristic-zero locus and reduced flat closure are empty.
- Replacing `ζ₂₅` by `ζ₅` gives four distinct nontrivial eigenvalues. In an anti-diagonal symplectic basis, `Σ=diag(ζ₅,ζ₅²,ζ₅⁻²,ζ₅⁻¹)` has multiplier one, and `Φ=1` satisfies the tame relation at `q=11`.
- Trivial `χ₁=χ₂=1` belongs to the unipotent branch, rather than the distinct-character branch. Reduction of each permitted characteristic polynomial gives `(X−1)⁴` in both branches, at the level of the equation quotients.

*Needs:* [2.11](#t2-11); [2.15](#t2-15); [1.22](#t1-22); [1.17](#t1-17).

(Sources: [BCGP21], §7.4.5 and Lemma 7.4.6, arXiv v3 p. 189; Propositions 7.4.7–7.4.8, pp. 189–190; Proposition 7.4.18, p. 196; Propositions 7.4.20–7.4.21, p. 197.)

<a id="t2-23"></a>

### 2.23 The Taylor–Wiles block condition in rank `n` (including `p = 2`)

For semisimple unramified residual Frobenius, select an eigenvalue block `A` of multiplicity `d₁`, impose scalar inertia `ψ` on `A` and unramified complement `B`. The Hensel projector is coefficient-natural and `ψ` gives `𝒪[Δ_v]`. This permits `p=2`. In rank two, odd `p` and `q≡1 mod p`, fixing `det=ψ̃χ` and twisting by `ψ̃⁻¹/²` recovers the fixed-determinant ring; an unramified determinant instead forces `ψ=1`.

The construction provides the following API.

- `TaylorWilesBlock`: `𝒟^TW_v` for a chosen eigenvalue `α_v` of multiplicity `n₁`.
- `TaylorWilesBlock.decomposition`: The lifted decomposition `r = A_v ⊕ B_v`.
- `TaylorWilesBlock.deltaAlgebra`: The canonical map `𝒪[Δ_v] → R^TW_v` from `ψ_v∘Art_{F_v}`.
- `TaylorWilesBlock.isLocalDeformationProblem`: `𝒟^TW_v` is a local deformation problem.
- `TaylorWilesBlock.rank2`: In rank two, odd `p` and `q≡1 mod p`, fix the unramified determinant part and twist by `ψ̃⁻¹/²` to recover the Taylor–Wiles ring; the `Δ`-structures differ by `δ↦δ²`.
- `TaylorWilesBlock.decomposition_unique`: The Hensel idempotent separating the selected residual eigenvalue defines the block projector and scalar inertia character naturally under coefficient maps.

**Checks.**

- For distinct eigenvalues in rank two, the variable-determinant ring is `𝒪[Δ][[x,y,B,C]]`. Fixing `det=ψ̃χ` gives `𝒪[Δ][[x,y,B]]`; fixing unramified `det` gives `𝒪[[x,y,B]]` and `ψ=1`.
- `n₁ = n`: lifts are `ψ_v·`(unramified) on inertia, the ring is formally smooth over `𝒪[Δ_v]`.
- `p = 2`: `Δ_v = k(v)^×(2)`, the 2-part, `e`.`g`. `q_v = 17` gives `Δ_v ≅ ℤ/16`.
- A nonscalar Jordan block fails residual semisimplicity; the lift condition does not require Frobenius to be scalar on the selected block.

*Needs:* [2.1](#t2-1); [2.10](#t2-10); [F.3.1](#local-deformation-problem); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGP25], §5.5, arXiv v1 p. 124.)

<a id="t2-24"></a>

### 2.24 Fixed-type rings away from `p` in rank `n` and constancy of types on components

Nonzero full-type rings are flat reduced of dimension `d²+1`. Full type is constant between points on a common generic component that belong to no other component; this applies to pure points and their conductors. One finite extension of `K` makes all occurring inertia actions unipotent.

*Needs:* [2.18](#t2-18); [2.13](#t2-13); [1.22](#t1-22).

(Sources: [BCGP25], Lemma 5.6.2 and its proof, arXiv v1 p. 128; [NT26], proof of Lemma 3.6, arXiv v2 p. 18.)

<a id="t2-25"></a>

### 2.25 Minimal `GSp₄` conditions at the ramified primes of types `U`, `P`, `H`

At `U_i` require the prescribed split nilpotent orbit over the coefficient algebra, allowing compatible unit rescaling. At `P` use the residual predicate of [2.7](#t2-7), including decomposition-group character splitting and the inertia-fixed isotropic plane in `1⊕1⊕χ_x⊕χ_x`, and require reduction-injective inertia; `H` forces rigidity. These coefficient-natural conditions are local deformation problems; `U₃` is regular-unipotent minimality. Require `p≥5` at `U₃`, `p≥3` at `U₁`,`U₂`; generic rank does not specify Artinian orbit membership.

The construction provides the following API.

- `GSp4.MinimalAt`: The minimal condition at `x ∈ S(r̄)` according to its `GSp4RamType` from [2.7](#t2-7), with that residual predicate retained in every branch.
- `GSp4.MinimalAt.unipotent_rank`: At `U_i` impose the prescribed orbit over the Artinian ring via conjugacy or free kernel/image conditions for every power.
- `GSp4.MinimalAt.rigid`: At types `P`, `H` the reduction map is injective on `r(I_x)`.
- `GSp4.MinimalAt.isLocalDeformationProblem`: Each condition is a local deformation problem.
- `GSp4.MinimalAt.U3_eq_unipotent`: At type `U3` the condition equals the unipotent problem `R^1` and the minimally ramified condition.
- `GSp4.MinimalAt.baseChange`: Coefficient maps transport the `U_i` conjugator and unit parameter and preserve the fixed prime-to-`p P/H` inertia lift.

**Checks.**

- Type `U3`: the minimal condition equals `R^1` (single Jordan block, [2.21](#t2-21)).
- Type `H` with `x⁴ − 1` prime to `p`: `r(I_x) ≅ r̄(I_x)`, a finite group of order prime to `p`, so the condition is formally smooth.
- A lift of `N₁` with nonzero nilpotent square fails the `U₁` orbit condition although its reduction still has rank one.
- At primes outside `S(r̄) ∪ {p}` the minimal condition is 'unramified'.
- The `p=7`, `K=ℚ₁₃` representation of [2.7](#t2-7) cannot enter the type-`P` branch: its inertia-fixed subspace is zero.

*Needs:* [2.7](#t2-7); [2.11](#t2-11); [2.21](#t2-21); [2.8](#t2-8); [1.17](#t1-17).

(Sources: [CG20], Definition 4.6 (3)–(4), published p. 815.)

<a id="t2-26"></a>

### 2.26 The Steinberg lifting ring is a domain and equals the fixed-type ring

For trivial rank `d` and `q≡1 mod p`, the Steinberg closure is a domain of dimension `d²+1`. The natural surjection to the full special-type ring `R□(τ_{Sp_d})` is an isomorphism. Integral monodromy analysis removes Taylor's `p>d` restriction.

*Needs:* [2.5](#t2-5); [2.18](#t2-18); [2.24](#t2-24).

(Sources: [NT26], proof of Lemma 3.8, arXiv v2 p. 20; [THORNE15], Proposition 3.17, p. 20.)

<a id="t2-26-1"></a>

### 2.26.1 Division-algebra types and characteristic-zero transfer

For a central division algebra `D/K` of degree `d≥1`, use the smooth-representation categories of `SmoothRepresentationsOfLocalGroups`, SR.0, on the groups `D×` and `Matrix.GeneralLinearGroup (Fin d) K`. Their actions use Mathlib `Representation`, and irreducibility uses `Representation.IsIrreducible`. Take isomorphism classes under equivariant linear isomorphisms of irreducible admissible smooth representations over `Ē`, an algebraic closure of the characteristic-zero coefficient field `E`. On the `GL_d` side restrict to essentially square-integrable classes, meaning those whose complex transport is square-integrable modulo the centre after a smooth character twist. Fix an abstract field isomorphism `Ē ≅ ℂ` for this transport, without imposing continuity on that field isomorphism. Construct the canonical equivalence `DivisionAlgebraTypes.jacquetLanglands` from the `D×` classes to these `GL_d(K)` classes, together with its inverse and both inverse identities.

For a `D×` class `π` and matching regular elliptic elements `g_D`,`g` with the same reduced characteristic polynomial, require `Θ_{JL(π)}(g) = (−1)^(d−1) Θ_π(g_D)`. This identity characterizes the equivalence uniquely. Prove independence of the chosen complex transport and compatibility with coefficient-field isomorphisms. Scalar extension preserves the correspondence for absolutely irreducible models over finite coefficient extensions; for each finite collection of types and representation classes used to evaluate the cycle formula in 2.27, enlarge `E` to define absolutely irreducible models of that collection. Central characters agree under the common centre `K×`, and for every smooth character `χ : K× → Ē×` require `JL(π ⊗ (χ ∘ Nrd)) ≅ JL(π) ⊗ (χ ∘ det)`. The inverse has the same twist compatibility, and the correspondence commutes with smooth contragredients. Extend the inverse additively from irreducible `GL_d` classes to the Grothendieck group of finite-length smooth representations, sending each class outside the essentially square-integrable subset to zero. This virtual extension is the inverse-zero convention in 2.27.

Construct `DivisionAlgebraTypes`: the `GL_d(𝒪_K)` and `𝒪_D×` types for the inertial classes used by 2.27, including the Schneider–Zink partition refinements, and their detection multiplicities. Evaluate the `GL_d` detection identities on absolutely irreducible admissible generic representations over `Ē`, with genericity meaning a nonzero Whittaker functional. Retain the full WD parameter's monodromy partition in detection; the compact-restriction independence in 2.27 makes these multiplicities independent of the generic representative. Use simple strata and compatible `β`-extensions to construct the types and compare their character formulas on matching elliptic elements; the simple-stratum, `β`-extension and partition-type constructions used here are included in this target; types restricted to distinguished cuspidals do not supply the noncuspidal discrete-series cases. The API includes conjugacy of types, unramified twisting and inertial-class transport.

**Checks.**

- For `d=2`, the specialization is the nonarchimedean division correspondence consumed by `GL2AutomorphicRepresentationsAndTransfer`, R17.1.1. The trivial `D×` class maps to Steinberg, with matching elliptic characters `+1` on `D×` and `−1` on `GL₂` and nonzero monodromy.
- A norm character `χ ∘ Nrd` maps to `St_d ⊗ (χ ∘ det)`; both central characters are `χ^d`. For `d=1` the equivalence and its inverse are the identity on smooth characters of `K×`.
- An irreducible principal series for `d>1` lies outside the essentially square-integrable subset and has virtual inverse zero; it has no `D×` preimage under the equivalence.
- Unramified twisting preserves the inertial type while changing Frobenius; type detection must not identify the full WD parameters.
- Extending finite splitting coefficients or changing the abstract complex transport gives the same transferred isomorphism class after scalar extension, rather than an equality of chosen representation models.

*Needs:* `SmoothRepresentationsOfLocalGroups`, SR.0 and SR.5; `ReductiveGroupsPartII`, compact subgroups; [2.24](#t2-24).

(Sources: [DOTTO25], introduction, published pp. 213–215, notation, p. 218, §§3–4, Example 3.8, p. 230, and §5, p. 239, with the type-theoretic Jacquet–Langlands comparison used in Theorem 5.3; [Shotton], Theorem 3.7 and Example 3.8, arXiv v2 pp. 13–14.)

<a id="t2-26-2"></a>

### 2.26.2 Integral and mod-`p` Jacquet–Langlands maps

Construct the Grothendieck groups of finite-length smooth representations using the relations from short exact sequences. For `J=GL_d(𝒪_K)` or `𝒪_D×`, write `R_E(J)` and `R_k(J)` for these groups over the coefficient and residue fields; compactness makes their objects finite-dimensional and each representation factors through a finite quotient. Construct `r_p^J:R_E(J)→R_k(J)` by reduction of a stable `𝒪`-lattice. Prove existence of such lattices, independence of lattice after semisimplification, additivity on exact sequences and compatibility with coefficient extension and restriction to compact open subgroups. These are the groups and reduction maps used in 2.27 ([DOTTO25], introduction, published p. 214, and Theorem 5.5 and proof, pp. 242–243).

**Checks.**

- A rank-one compact character with values in `𝒪×` reduces to its residue character, and scaling its lattice by `ϖ` gives the same class.
- For an exact sequence `0→V₁→V→V₂→0`, the Grothendieck relation gives `r_p^J[V]=r_p^J[V₁]+r_p^J[V₂]`, including nonsplit extensions.
- For `K=ℚ₁₁`, `p=5`, inflate from the order-five quotient of `𝒪_K×` the action on `k²` generated by `[[1,1],[0,1]]`. Its class is twice the trivial character, although the representation is nonsplit. Reduction records this class rather than a chosen lattice or extension.

With the coefficients and types of 2.26.1, construct the additive Grothendieck-group transfers `DivisionAlgebraTypes.integralTransfer` `(JL_K)` and `DivisionAlgebraTypes.modpTransfer` `(JL_p)`, where `JL_p` is required for `p≠2`. Retain stable lattices and reduction maps, rather than asserting a functor between irreducible representations. Give the level-zero Deligne–Lusztig description and prove the reduction compatibility on the type classes: `JL_p(σ̄_D(τ,λ))=σ̄^+_{P_min}(τ,λ)`. For the away-from-`p` cycle application carry the residue-characteristic/coefficient-prime distinction of Dotto §6. The API provides additivity, independence of lattice in the Grothendieck class, partition signs consistent with 2.26.1 and the type detection identities needed to compose with the `GL_d` cycle map, evaluated on the generic representatives of 2.27 and their inverse-zero transfers. Construct transfer on type generators and compare Brauer characters, using unramified base change and compatible simple-type character formulas. Construct the finite `GL` character induction and the level-zero virtual classes from the Deligne–Lusztig character formulas used in Dotto §§2–4, with their degree, sign and restriction identities; these finite-group calculations are part of this target.

**Checks.**

- Degree `d=1` gives the identity transfer and identity reduction square.
- The trivial division-algebra type transfers to the signed discrete-series type class; a map to arbitrary positive irreducible classes loses the Grothendieck-group signs.
- At `p=2` the mod-`p` transfer/cycle assertion here is outside its hypothesis; a characteristic-zero transfer alone does not furnish that assertion.

*Needs:* [2.26.1](#t2-26-1); `SmoothRepresentationsOfLocalGroups`, SR.0 (smooth categories) and SR.6.4 (stable lattices); `RepresentationTheory`, finite-group characters and Grothendieck groups.

(Sources: [DOTTO25], Definition 5.2, Theorems 5.3 and 5.5, published pp. 239–242, and §6, pp. 243–245.)

<a id="t2-27"></a>

### 2.27 Breuil–Mézard cycles for central division algebras away from `p`

Let `D/K` be central division of degree `d`, with residue characteristic `ℓ≠p`, and choose `E` defining the occurring types and making the irreducible components of both fibres geometrically irreducible. For each occurring pair `(τ,N)`, choose an absolutely irreducible admissible generic representation `π_{τ,N}` of `GL_d(K)` over `Ē` whose WD parameter has that inertia and monodromy. Prove existence by the segment classification and generic choices of unramified twists. Prove that any two such generic choices have isomorphic restrictions to `GL_d(𝒪_K)`, hence the same finite detection multiplicities. These existence and independence statements are targets here, using Shotton Lemma 4.1 and Definition 4.2; the characteristic-zero Jacquet–Langlands equivalence remains 2.26.1.

Define `cyc(σ)=Σ_{(τ,N)} dim_{Ē} Hom_{GL_d(𝒪_K)}(σ∨⊗Ē,π_{τ,N})[R□(τ,N)]`, in dimension `d²+1`. Prove finite support for each finite-length compact representation `σ`. For each calculation descend its finite collection of types, generic representations and nonzero division-algebra transfers to absolutely irreducible models over a sufficiently large finite extension of `E`, with compatibility under further extension. Define `cyc_D` by the same sum using `Hom_{𝒪_D×}(σ∨⊗Ē,JL⁻¹π_{τ,N})`. Here the inverse-zero convention is applied to these generic representatives: an essentially square-integrable one has its inverse from 2.26.1, and every other one contributes zero. Prove independence of the generic choice also for these division-algebra multiplicities, using the type-detection identity of 2.26.2 and the compact-restriction independence above. Then `cyc_D=cyc∘JL_K`.

**Checks.**

- For `d=2`, trivial inertia and `N=0`, the inflated finite Steinberg type has multiplicity zero in the trivial `GL₂(K)` representation and one in the irreducible normalized principal series `Ind_B(1⊗1)`: its principal-congruence invariants are `1⊕St`. The trivial representation is nongeneric and cannot be used to define the coefficient.
- With `K=ℚ₁₁`, `p=5` and `ρ̄=1⊕1`, both parameters in the preceding comparison have integral models reducing to `ρ̄` after adjoining `√11≡1 mod 5`. Thus nonvanishing of the type quotient does not remove the need for genericity.
- An unramified twist of a generic representative has isomorphic compact restriction and the same multiplicities. A generic irreducible principal series has inverse-zero transfer, whereas `St_d` has the trivial division-algebra inverse.
- Finite coefficient extension preserves the Hom dimensions of the split absolutely irreducible models and transports the cycles by scalar extension.

**Arithmetic cycle functor.** For `p>2`, arbitrary `d≥1` and continuous `ρ̄:G_K→GL_d(k)` with `ℓ≠p`, construct `AwayFromP.arithmeticCycleFunctor`: after finite coefficient extension there are `m,c≥1`, a geometrically integral flat `A∈C_𝒪`, and an exact covariant functor `H∞` from finitely generated `𝒪`-modules with smooth `GL_d(𝒪_K)^m`-action to finite `R∞=(R□)^{⊗̂ m}⊗̂_𝒪A`-modules. It commutes with reduction modulo `ϖ`, preserves `𝒪`-torsion-free objects and satisfies `Z(H∞(⊠_i σ_i))=c·(⊗_i cyc(σ_i))⊗[A]` for finite free lattices, under the product identification of top-dimensional cycle groups. Shotton's construction gives `c=d!`.

This target includes the restricted CM globalization with prescribed completions `K` at the places above `ℓ`, adequate cyclotomic residual image, trivial residual representations and ordinary lifts at the places above `p`, and a nonzero definite-unitary automorphic space. It includes its finite-level exact coefficient functors, Hecke and Galois actions, reduction comparisons, and the ordinary automorphy lifting and local–global compatibility statements that meet every generic component and give the displayed cycle formula. Retain the splitting, multiplier and auxiliary-level hypotheses of Shotton Proposition 5.13 and §5.4; exactness uses prime-to-`p` stabilizers. These arithmetic inputs are constructed here using the supplied abstract patching algebra.

**Checks.**

- Applying exactness to `0→L→L→L/ϖL→0`, with first map multiplication by `ϖ`, gives the stated reduction comparison for a lattice `L`.
- At a product component the generic coefficient is `c` times the product of the type-detection multiplicities. A zero functor fails this formula whenever that product is nonzero.
- For `d=3`, `p=3`, the construction has `c=6`; the theorem imposes no prime-to-`p` condition on `c` or on the rank.

(Sources: [Shotton], proof of Theorem 4.6, arXiv v2 pp. 17–18; §§5.1–5.4, pp. 21–34, especially Proposition 5.13, pp. 27–28, Proposition 5.20, p. 32, and Corollary 5.21, p. 33.)

**Reduction descent.** For these same arbitrary-rank data with `p>2`, prove `AwayFromP.glCycleReductionDescent`: `ker(r_p^{GL})⊆ker(red∘cyc)`. Equivalently there is a unique additive `cyc̄_GL:R_k(GL_d(𝒪_K))→Z_{d²}(R□/ϖ)` with `red∘cyc=cyc̄_GL∘r_p^{GL}`. Here `R_E` and `R_k` denote Grothendieck groups of finite-dimensional smooth compact representations, and `r_p^{GL}:R_E→R_k` is lattice reduction. Exactness and the cycle formula above give the kernel inclusion by tensor powers and specialization; the auxiliary special cycle `Z(A/ϖ)` is nonzero. Surjectivity of reduction gives uniqueness. Compose with `JL_p` to obtain `cyc̄_D=cyc̄_GL∘JL_p` and `red∘cyc_D=cyc̄_D∘r_p^D`.

**Checks.**

- Two compact representations with the same mod-`p` Grothendieck class have equal specialized cycles, including when their difference is a nonzero virtual class in `ker(r_p^{GL})`.
- The cycle groups are free abelian: a nonzero cycle `β` has `c·β^{⊗ m}⊗Z(A/ϖ)≠0`. Thus `p|c`, as for `d=p=3`, does not obstruct descent; no inversion of `c` in `𝒪` is used.
- For `d=1` and `D=K`, both transfers are identities and division-algebra descent is the `GL₁` descent. Characteristic-zero transfer and its reduction square alone do not supply the kernel inclusion; `p=2` is outside this descent theorem.

(Sources: [Shotton], Theorem 4.6 and proof, arXiv v2 pp. 17–18; [DOTTO25], Theorem 6.3 and proof, published pp. 244–245.)

Under `p≠2` and even `d`, inflate an order-`p` character of the quadratic residue extension through `N_{k_D/k′}`; its type ring and Steinberg have isomorphic reduced special-fibre subschemes. Equal cycles do not assert reducedness of either original fibre.

*Needs:* [2.26.1](#t2-26-1); [2.26.2](#t2-26-2); [2.18](#t2-18); [2.24](#t2-24); [2.15](#t2-15); the arithmetic cycle functor and reduction-descent targets above; `DeformationAndDerivedPatchingAlgebra`, Layer 5 and §6.7; `AdelicAlgebraicGroups`, AA.3.4 and AA.4.4; `SmoothRepresentationsOfLocalGroups`, SR.0, SR.1.2 and SR.5.

(Sources: [NT26], proof of Lemma 3.6, arXiv v2 pp. 18–19; [DOTTO25], §6, case `ℓ ≠ p` and Theorem 6.3, pp. 243–245 (journal pages); [Shotton], §3.5, arXiv v2 pp. 14–15, Lemma 4.1 and Definitions 4.2, 4.4, pp. 16–17, and Theorem 4.6, p. 17.)

<a id="t2-28"></a>

### 2.28 Generic fibres of `G`-valued lifting rings away from `p` and minimally ramified lifts

For reductive, possibly disconnected `G` and a fixed compatible quotient representation into `G/G^der`, with `G^der=(G⁰)^der`, the generic fibre is reduced, equidimensional of dimension `dim G^der`, with dense regular open and finitely many type loci. For `GSp_{2d}`, assume `p>2d`, all irreducible representations of the subgroup `Λ_K=ker(I_K→ℤ_p)` occurring in the residual space are absolutely irreducible over `k`, and `𝒪×` contains square roots of `q`, `−1` and 2. Require a pure nilpotent lift `N_σ` of the residual logarithm with smooth scheme-theoretic centralizer `Z_G(N_σ)`. After the permitted finite residue/coefficient extension, the fixed-similitude minimally ramified condition is liftable with tangent dimension `h⁰(G_K,ad⁰ρ̄)`, giving a smooth framed quotient. These are Booher's `(A1)`–`(A4)` and splitting assumptions, not a consequence of `p>2d` alone. A Steinberg lift at the specified trivial prime is smooth.

*Needs:* [1.17](#t1-17); [1.22](#t1-22); [2.24](#t2-24).

(Sources: [FKP22], §9, proof of Proposition 9.1, arXiv v5 p. 41; [FKP22], §2, arXiv v5 p. 9; [BOOHER19], Theorem 1.1, p. 2; §1.2, assumptions `(A1)`–`(A4)`, p. 4, and Corollary 6.16, p. 30 (arXiv `v1`); [BellovinGee], §3.1 and Theorem 3.3.3, arXiv v3 pp. 29–30.)

<a id="t2-29"></a>

### 2.29 Unipotent ramification and Ihara-avoidance rings at `p = 2`

At `p=2` away from 2, one finite extension makes every lift unipotently ramified. With unramified regular semisimple residual Frobenius, first make the finite unramified coefficient extension splitting its residual polynomial and fix the resulting residual eigenbasis. In that basis strictly diagonalize lifts into characters. Over these extended coefficients a single finite extension of the local field makes all these lifts unramified. For the Frobenius-compatible characters of 2.15, trivial-residual character rings retain the Ihara dimension `d²+1`, distinct-character irreducibility and unique-generalisation statements.

**Checks.**

- Over `𝔽₂`, `[[0,1],[1,1]]` has separable irreducible polynomial `X²+X+1`; regular semisimplicity alone gives no eigenbasis over `𝔽₂`.
- Its unramified `ℤ₂` lift `[[0,−1],[1,−1]]` has order three and requires the unramified quadratic coefficient extension to diagonalize.
- For split distinct residual eigenvalues, Hensel projectors and the fixed residual eigenbasis give strict diagonalization; the uniform local-field extension is taken after this coefficient extension.

*Needs:* [2.24](#t2-24); [2.15](#t2-15); [2.17](#t2-17); [1.12](#t1-12).

(Sources: [BCGP25], Lemma 5.6.2, arXiv v1 p. 128; [BCGP25], Proposition 5.6.4, arXiv v1 p. 129.)

<a id="t2-30"></a>

### 2.30 Local lifts at places of global function fields

Over a local function field of characteristic `ℓ≠p`, every residual `GL_d` representation has a `p`-adic lift. For `p∤d` the unique `d`-th root of a `1+ϖ𝒪`-valued character permits determinant matching. The away-from-`p` generic-fibre analysis applies.

*Needs:* [2.8](#t2-8); [2.1](#t2-1); [2.28](#t2-28).

(Sources: [FKP22], §8, proof of Theorem 8.1, arXiv v5 p. 38; [FKP22], §2, arXiv v5 pp. 8–9.)

### Examples

Take `Φ=diag(qα,α)` and `σ=1+E₁₂` over a coefficient field, with `α` a unit. Then `ΦσΦ⁻¹=1+qE₁₂=σ^q` and `q(trΦ)²=(1+q)²detΦ`. Replacing `Φ` by the identity still gives unipotent inertia when `σ=1`, but fails the Steinberg eigenvalue relation for `q=2` over `ℚ`: its two sides are 8 and 9. Thus an inertia-only condition loses the Frobenius constraint.

For even-parity inert polarized level raising in rank two, the mixed ring is formally smooth of relative dimension three over `𝒪[[x₀,x₁]]/(x₀x₁)`. Its two components have relative dimension four, and setting both node coordinates to zero gives their relative-dimension-three intersection. For odd parity, the unit `2+x+y` kills `x₀` and removes the second mixed component; this uses `p∤(q²−1)`, which in particular excludes `p=2`.

### Dependencies

Uses Layer 1 and the local inertia/Frobenius, polarized deformation, coefficient-group and finite discrete duality interfaces. Full tame group theory is imported; the coefficient-`p` quotient and the stated deformation conditions are the local applications.

## Layer 3: Hodge-type quotients and characteristic-zero geometry

Construct bounded semistability first, then fixed Hodge and inertia conditions. Characteristic-zero smoothness and integral flatness are separate conclusions. The ordinary component construction supplies the fixed-determinant comparison needed for the finite-flat component results.

<a id="t3-1"></a>

### 3.1 `p`-adic Hodge types and Galois types

A Hodge type specifies a filtration on `K⊗E` of rank `d` with labelled multiplicities `m_{τ,i}`, using contravariant `D*` and the explicit `HT` dictionary. A `p`-adic Galois type is finite-image inertia extendible to `W_K`. Define `Δ(v)=Σ_τ(d²−Σ_i m_{τ,i}²)/2`, equal to `fd(d−1)/2` for regular type. Give equality and coefficient-transport APIs.

For one labelled filtration, `filtrationFlagDimension` computes `((Σm_i)²−Σm_i²)/2` from its jump multiplicities. It gives 3 for `(1,1,1)`, 2 for `(2,1)`, and 0 for (3), agreeing with the full, partial and scalar flag spaces. This arithmetic function records only the dimension; HodgeType retains the labelled jump values and its filtered-module realization.

The construction provides the following API.

- `HodgeType`: (`D_E`, `Fil^`• `D_{E,K}`) with finitely many integer-valued labelled jumps and their multiplicities.
- `GaloisType`: `τ` : `I_K → GL_r(E)` with open kernel, together with existence of an extension to `W_K`.
- `IsOfType`: `V_B` is potentially semistable of type `(τ, v)`.
- `HodgeType.adQuotDim`: `dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2`.
- `HodgeType.filteredIsom_iff`: Over splitting coefficients, filtered-isomorphism classes are determined by every labelled graded multiplicity.
- `GaloisType.conjugacy`: Conjugating the matrix representative preserves the inertia type and its lift condition.

**Checks.**

- Regular weights give `[K : ℚ_p]·d(d − 1)/2` (for `d = 2`, `K = ℚ_p`: 1).
- `(d² − Σ m_j²)/2` counts pairs of weights in different jumps; checked for `d = 3` with multiplicities `(2, 1)`: `(9 − 5)/2 = 2`.
- The restriction to `I_K` of the cyclotomic character has infinite image, so it is not a Galois type.
- Over `ℚ₃` the quadratic tame character with inertia generator `−1` extends with Frobenius 1: conjugation fixes `(−1)^3=−1`. This is a nontrivial finite Galois type.
- For `q=2`, a tame order-three inertia generator acting by a primitive cube root `ζ` cannot extend in rank one: Frobenius would have to conjugate `ζ` to `ζ²`, whereas scalar conjugation fixes `ζ`.

*Needs:* [0.2](#t0-2).

(Sources: [KisinPST], (2.6), author DVI p. 20, and (2.7), p. 21.)

<a id="t3-2"></a>

### 3.2 The semistable quotient with Hodge–Tate weights in `[0, h]`

For complete Noetherian `A`° with finite residue field and `A=A`°`[1/p]`, the bounded semistable quotient represents the weight-`[0,h]` condition on all finite `ℚ_p`-algebras, including nonreduced ones. Construct the finite-projective filtered `(φ,N)`-module and period comparison. Finite height on `G_{K∞}` alone does not imply semistability of the `G_K`-action.

Construct `HodgeType.tateTwist`: if `v` has jumps in `[a,b]`, twisting `V` by `ε^{−a}` transports it to jumps in `[0,b−a]` under `D*=D(V∨)`. Transport `ρ̄` to `ρ̄⊗ε̄^{−a}`, the determinant `χ` to `χε^{−ad}`, and retain the finite WD inertia type (the cyclotomic Tate twist is crystalline). Twisting and its inverse identify the universal framed rings and intertwine the type quotient maps, on finite local `E`-algebras and their integral reduced torsion-free closures. Thus 3.3–3.4 apply to arbitrary bounded integer types through this specified comparison.

**Checks.**

- `V=E(ε⁻¹)` has `D*` filtration jump `−1`; twisting by `ε` puts it in jump zero and twists its residual representation as well.
- A type in `[0,h]` uses the identity twist and the same universal quotient map.
- In rank `d` a twist by `ε^t` changes determinant by `ε^{td}`; forgetting this factor fails the fixed-determinant comparison, while the finite WD inertia type stays unchanged.

*Needs:* [1.8](#t1-8); [1.2](#t1-2); [0.2](#t0-2); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [KisinPST], Theorem (2.5.5), author DVI pp. 19–20; Proposition (2.4.7), p. 16, and Proposition (2.5.4), p. 18.)

<a id="t3-3"></a>

### 3.3 Fixing the `p`-adic Hodge type selects components

In the bounded semistable quotient, fixed Hodge type is a union of connected components: projective filtration steps and graded pieces make ranks locally constant. Prove coefficient compatibility.

*Needs:* [3.2](#t3-2); [3.1](#t3-1).

(Sources: [KisinPST], Lemma (2.6.1) and Corollary (2.6.2), author DVI pp. 20–21.)

<a id="t3-4"></a>

### 3.4 Potentially semistable deformation rings of fixed type

For finite-image `τ` and Hodge type `v`, construct the quotient of `R□[1/p]` with the potentially semistable finite-`E`-algebra point criterion; `N=0` gives the crystalline variant. Its integral reduced `p`-torsion-free closure is `R□_{τ,v}`, possibly zero. Over an extension killing `τ` the locus is a union of bounded semistable components. Include Schur unframed variants.

*Needs:* [3.3](#t3-3); [3.1](#t3-1); [1.1](#t1-1); [1.5](#t1-5); [F.2.9](#fixed-determinant-rings); [0.2](#t0-2).

(Sources: [KisinPST], Theorem (2.7.6) and Corollary (2.7.7), author DVI p. 23; [Gee22], Theorem 3.28, pp. 18–19.)

<a id="t3-5"></a>

### 3.5 Potentially semistable loci in families over a complete local base

Fix `A° ∈ C_𝒪`, a continuous representation `ρ : G_K → GL_d(A°)` on the finite-free module `V°`, and `A=A°[1/p]`, `V=V°[1/p]`. Fix integers `a≤b` and a labelled Hodge type `v` with jumps in `[a,b]`, in the convention of 3.1. Transport the bounded constructions of 3.2–3.4 to this family, using the Tate twist of 3.2 for an arbitrary interval.

Construct the unique quotients `A^{st,[a,b]}` and `A^{st,v}` with the following criterion: for every finite local `E`-algebra `B`, including nonreduced ones, an `E`-algebra map `ζ : A → B` factors through the respective quotient exactly when `V_B=V⊗_A B` is semistable over `K` with weights in `[a,b]`, respectively semistable of labelled Hodge type `v`.

For the potential variants, also fix a finite-image inertia type `τ` extending to `W_K` and a finite Galois extension `L/K` with `I_L ⊆ ker τ`. Construct `A^{pst,τ,v}`: the same factorization criterion for finite local `E`-algebras requires `V_B|G_L` to be semistable of the Hodge type pulled back from `v`, and the WD inertia type of `V_B` to be `τ`. Construct `A^{pcrys,τ,v}` by imposing `N=0` on this bounded potentially semistable period module; its point criterion requires crystallinity over `L` with the same Hodge and inertia types. Supply the finite-projective filtered period modules with descent data and their comparison isomorphisms, compatible with these specializations. Allowable coefficient maps transport the family and all the fixed data and induce the corresponding quotient maps. The criterion for a finite `E`-algebra follows by its product decomposition into local factors.

**Checks.**

- For the constant trivial rank-one family, `v={0}`, `[a,b]=[0,0]`, `τ=1` and `L=K`, all four quotients equal `A`.
- A ramified quadratic character over `K=E=ℚ₃` is potentially crystalline of weight zero over the quadratic extension cutting it out. Its constant family has `A^{pcrys,τ,{0}}=A` for its nontrivial inertia type, whereas `A^{st,[0,0]}=0`. Retaining the extension and inertia data distinguishes these loci.
- In the unramified rank-one family over `𝒪[[T]]` with arithmetic Frobenius `1+T`, specialization `T↦u` in `B=E[u]/(u²)` is crystalline of weight zero and trivial inertia type. The criterion includes this nilpotent coefficient family, not just its residue character.
- For odd `p`, take `A°=ℤ_p[[T]]`, `K=E=ℚ_p`, `ε=ω·⟨ε⟩` and `ℓ(g)=log(⟨ε(g)⟩)/log(1+p)`. The residually trivial continuous family `κ_T(g)=(1+T)^{ℓ(g)}` specializes at `T_s=(1+p)^s−1` to `⟨ε⟩^s`. For `s_m=(p−1)p^m` these are crystalline characters `ε^{s_m}`, with distinct `T_{s_m}→0` and unbounded weights. Any ideal `J` cutting out all crystalline points would vanish at every `T_{s_m}`. A nonzero series in `ℤ_p[[T]][1/p]` has no distinct zeros accumulating at zero: after its first nonzero power of `T` is removed, its constant coefficient dominates near zero. Thus `J=0`, but the specialization `s=1/2 ∈ ℤ_p` has Sen weight `1/2` and is not Hodge–Tate. The same obstruction excludes unbounded semistable and potentially semistable quotients, even with trivial inertia type fixed.

*Needs:* [1.8](#t1-8); [3.1](#t3-1); [3.2](#t3-2); [3.3](#t3-3); [3.4](#t3-4); [0.2](#t0-2); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.`P7`.3 (the character criterion for the weight-family Check).

(Sources: [KisinPST], setup (2.7.5), Theorem (2.7.6) and Corollary (2.7.7), author DVI p. 23; Theorem (2.5.5), pp. 19–20; Wang–Erickson, [Algebraic families of Galois representations and potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf), Theorems 6.1, 6.4 and 6.6, author pp. 46–49.)

<a id="t3-6"></a>

### 3.6 Deformation theory of filtered `(φ, N)`-modules with descent data

Over `L₀⊗A`, use finite-projective modules with invertible `φ`, nilpotent `N`, `Nφ=pφN`, commuting descent and stable projective filtrations. The obstruction complex uses `1−φ`,`N`,`pφ−1`; `H²=0` gives `H¹`-torsors of small-extension lifts. Forgetting filtration is smooth, with dense vanishing locus in a smooth family. Completed lifting-family comparison requires formal smoothness over this groupoid.

*Needs:* [0.2](#t0-2); [3.4](#t3-4).

(Sources: [KisinPST], (3.1.1) and Proposition (3.1.2), author DVI pp. 24–25; Corollary (3.1.3), Lemma (3.1.5) and Proposition (3.1.6), pp. 25–27; Lemma (3.2.1) and Proposition (3.3.1), pp. 27–29.)

<a id="t3-7"></a>

### 3.7 Potentially semistable rings under change of coefficients

For a finite coefficient-field extension `E′/E` with rings of integers `𝒪′/𝒪`, transport the residual representation and the labelled Hodge and inertia data. The generic potentially semistable and crystalline quotients commute with this scalar extension: their finite-`E′`-algebra point criteria are the scalar extensions of the finite-`E`-algebra criteria. The reduced torsion-free integral closure also commutes with `𝒪′/𝒪`. Indeed, `𝒪′` is finite free over `𝒪`, localization commutes with tensoring, and the reduced generic fibre stays reduced under the separable extension `E′/E`. Contract its zero ideal to the integral ring to obtain the same closure kernel. Schur comparison is compatible with these maps. Components can split; geometric assertions require splitting coefficients.

*Needs:* [3.4](#t3-4); [1.12](#t1-12); [0.2](#t0-2); [F.0.1](#completed-coefficient-products).

(Sources: [KisinPST], Theorem (2.7.6) and Corollary (2.7.7), author DVI p. 23, for the point criteria; the scalar-extension argument above uses the coefficient compatibility of the period comparison in Proposition (2.7.2), author DVI pp. 22–23, and the flat-base-change contract [F.0.1](#completed-coefficient-products).)

<a id="t3-7-1"></a>

### 3.7.1 Mod-`p` `GL₂(ℚ_p)` blocks, projective envelopes and centres

For `G=GL₂(ℚ_p)`, a coefficient DVR `𝒪` with finite residue field and a fixed continuous central character `δ`, construct the locally admissible smooth torsion category and its finite-length full subcategory, where length is taken over `𝒪[G]`. Define `GL2Block` using the equivalence relation on irreducibles generated by nonzero `Ext¹` in either direction. Construct injective envelopes in the larger locally admissible category and dualize to projective envelopes with central character `δ⁻¹`. Their sum `P_B` has `E_B=End_G(P_B)` and centre `Z_B`. Prove the block decomposition on finite-length objects and the reconstruction `Π ≅ (Hom_G(P_B,Π∨) ⊗̂_{E_B} P_B)∨` within each block, together with its Pontryagin-dual compact form. The multiplicity modules in this correspondence have finite length over `E_B`. Import the Serre-weight compact-induction and irreducible-quotient classification from `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.5.15. Compute here the linking `Ext¹` classes, including the `p=2`,3 cases, and use the block list for coefficient-orbit descent. The API `GL2Block.projectiveEnvelope` and `GL2Block.centre` includes coefficient splitting, natural centre actions and the inverse central character from duality.

**Checks.**

- A supersingular irreducible gives a singleton block.
- A generic principal-series pair `I(χ₁,χ₂)`,`I(χ₂,χ₁)`, `χ₁/χ₂∉{1,ε,ε⁻¹}`, lies in one block, not two singleton blocks.
- At `p=2` and `p=3` use the exceptional linked lists in CDN Proposition 1.10; the generic list alone omits irreducibles. Dualizing character `δ` gives `δ⁻¹`, not `δ`.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.5.15; `SmoothRepresentationsOfLocalGroups`, SR.0 (smooth categories) and SR.2.1 (compact induction); `ArithmeticGaloisDuality`, Pontryagin duality; Mathlib abelian categories, `Ext` and endomorphism rings.

(Sources: [CDN23], §1.1.2, arXiv p. 13; §§1.3.1–1.3.3, Propositions 1.10 and 1.12, Remarks 1.11 and 1.13–1.14, arXiv pp. 17–19.)

<a id="t3-7-2"></a>

### 3.7.2 Montréal functor and the block/Galois dictionary

Construct `MontrealFunctor` on the fixed-central-character finite-length smooth torsion `GL₂(ℚ_p)` category, with length over `𝒪[GL₂(ℚ_p)]`: an exact covariant functor to continuous Galois representations of finite length over `𝒪`. Separately construct its extension to compact inverse limits via Pontryagin duality, with profinite Galois output. For a stable unit ball whose reductions have finite length, inverse limits and localization give the extension to residually finite-length unitary Banach representations with central character and finite-dimensional `E`-Galois output. Construct the integral cyclotomic étale coefficient ring and its `p`-power torsion quotients, their `(φ,Γ)`-module categories and Galois realization, then the compact-module/étale-module realization of the functor. The API `MontrealFunctor.torsionEtaleRealization` on finite-length inputs retains finite-length Galois output and commutes with reduction; 0.4 provides the rational Robba comparison after localization. Prove the block dictionary `GL2Block.residualGalois`: over algebraically closed residue coefficients blocks correspond to semisimple rank-two residual representations, with `det ρ̄_B=δ̄ε̄`; finite coefficients use Galois orbits and the block's endomorphism residue field. Give the centre action on the functor and its trace/Cayley–Hamilton compatibility used by 3.8. The construction uses Colmez's compact-module/étale-module functor and the classification of supersingular and principal-series constituents; retain the constituents killed by the functor rather than asserting it is faithful.

**Checks.**

- A supersingular block gives an irreducible rank-two residual Galois representation.
- A generic principal-series pair gives `χ₁⊕χ₂` and `δ̄=χ₁χ₂ε̄⁻¹`.
- The functor can kill constituents factoring through determinant; exactness does not imply faithfulness. A centre identification uses determinant `δε`, not `δ`.
- At `p=5`, `𝒪=ℤ₅`, `k=𝔽₅` and `ω=ε̄`, the generic principal series `π=I(1,ω²)` has central character `ω` and `V(π)=k`. Fix the Teichmüller lift of `ω`. The representation `Π=⨁_{n≥1}π` is locally admissible and locally finite length, but has infinite length. Each `π^⊕m` is a split subobject, so any additive extension of the functor to `Π` has output length at least `m` for every `m`. Thus locally finite length, even for inputs killed by 5, does not give finite-length Galois output.

*Needs:* [3.7.1](#t3-7-1); [0.4](#t0-4); `IntegralHeckeAndGaloisDeterminants`, IHG.0–IHG.1.

(Sources: [CDN23], §1.1.2, arXiv p. 13; §§1.3.1–1.3.4, Remarks 1.13–1.15 and Theorem 1.16, arXiv pp. 17–20, including its cited Colmez construction.)

<a id="t3-8"></a>

### 3.8 Rings of fixed Weil–Deligne type cut out of pseudo-character deformation rings `(R_{B,M})`

Fix a mod-`p` `GL₂(ℚ_p)` block `B`, its corresponding residual two-dimensional pseudorepresentation and a determinant character `δ`. Construct `R^{ps,δ}_B` as the continuous pseudodeformation ring of `Tr ρ̄_B` with determinant `δε`, its universal trace `T^δ_B` and the natural map `ι_B` to the fixed-central-character block centre `Z_B`. For `p≥5`, `ι_B` is an integral isomorphism. For every `p` it becomes an isomorphism after inverting `p`; at `p=3` the centre is the torsion-free quotient, while at `p=2` the remaining cokernel is killed by two. Retain these integral qualifications and the Galois/block reduction dictionary. This local identification is part of the target; the underlying continuous pseudodeformation ring comes from the bundle supplier, not a higher-tier `p`-adic local Langlands roadmap. For supercuspidal full WD parameter `M`, define `R_{B,M}` by the weight-two de Rham point-kernel intersection in the fixed-determinant block pseudocharacter ring, and `R⁺` as its integral image. The reduced Jacobson ring is a finite product of the specified bounded-function PIDs on opens of `ℙ¹`; its trace gives a unique representation up to isomorphism. Full Frobenius data are needed; empty blocks give zero and special parameters require separate `L`-invariants.

The construction provides the following API.

- `WDTypeRing.blockIdentification`: Construct `ι_B`:`R^{ps,δ}_B→Z_B` with determinant `δε` and trace compatibility; it is an isomorphism for `p≥5` and after inverting `p` for every `p`, with the stated `p=2`,3 qualifications.
- `WDTypeRing`: `R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M}` and its integral model `R^+_{B,M}`.
- `WDTypeRing.points`: Maximal ideals containing `I_{B,M}` correspond to de Rham traces of weights `{0,1}`, full WD type `M` and determinant `δ_Mε`; the reverse implication uses the cited local Langlands theorem.
- `WDTypeRing.reduced`: `R_{B,M}` is reduced and Jacobson.
- `WDTypeRing.pid`: `R_{B,M}` is a finite product of principal ideal domains (bounded analytic functions on an open of `ℙ¹`).
- `WDTypeRing.universalRep`: The representation `ρ_{B,M}` with `Tr ρ_{B,M}` = the universal pseudo-character.
- `WDTypeRing.integralImage`: `R⁺` is the integral image: its kernel is the preimage of `I` under localization and `R⁺[1/p]=R_{B,M}`.

The family input from [3.5](#t3-5) retains labelled Hodge type `{0,1}`, inertia type `M|I_K` and a finite Galois `L/K` killing that inertia type. The full WD condition here also fixes `M`'s Frobenius data.

**Checks.**

- Every maximal ideal `x` of `R_{B,M}` gives `ρ_x` de Rham of weights `{0, 1}` with WD`(ρ_x) ≅ M` (Frobenius included).
- Choose a supercuspidal `M` whose restriction to inertia is irreducible, and let `η` be the nontrivial unramified quadratic character. Then `det(M⊗η)=det M` and the inertial restrictions agree, but `M⊗η` is not isomorphic to `M`: an inertia intertwiner is scalar and cannot conjugate its invertible Frobenius matrix to its negative in characteristic zero. For `M` induced from the unramified quadratic extension, `η` can instead be a self-twist, so that case does not distinguish full WD types.
- If no de Rham representation of type `M` has reduction in `B`, `I_{B,M}` is the unit ideal and `R_{B,M} = 0`.
- At `p≥5` the centre comparison is integral; at `p=2` an equality before inverting `p` is not the stated general theorem. The universal pseudorepresentation has determinant `δ_Mε`, whereas `δ_M` is the central-character parameter.
- `Tr ∘ ρ_{B,M}` equals the image of the universal pseudo-character of `R^{ps,δ_M}_B`.

*Needs:* [3.7.1](#t3-7-1); [3.7.2](#t3-7-2); [3.5](#t3-5); [3.1](#t3-1); [F.1.1](#lifting-functor); [F.2.11](#pseudodeformation-rings); the block identification constructed in this target.

(Sources: [CDN23], Remark 1.15 and Theorem 1.16, arXiv pp. 19–20; [CDN23], §5.2, arXiv p. 66; [CDN23], Théorème 5.11, arXiv p. 66.)

<a id="t3-9"></a>

### 3.9 Dimension and generic regularity of potentially semistable rings

Nonzero framed semistable scheme generic fibres `Spec R□_{τ,v}[1/ϖ]` are equidimensional of dimension `d²+Δ(v)` and have a dense regular open. At its closed points `x` with finite residue field `E_x/E`, the completed local deformation problem is formally smooth on finite local Artinian `E_x`-algebras; its representing completion carries the maximal-ideal topology. Schur unframed dimension is `1+Δ(v)`, integral framed dimension `1+d²+Δ(v)`. A compatible nonempty fixed determinant lowers generic dimension by one through rational twisting, including `p|d`. Component intersections may be singular.

*Needs:* [3.4](#t3-4); [3.6](#t3-6); [3.1](#t3-1); [1.5](#t1-5); [F.0.1](#completed-coefficient-products); [1.24](#t1-24).

(Sources: [KisinPST], Theorem (3.3.4), author DVI pp. 29–30; Introduction, p. 2, footnote 1; [BellovinGee], Theorem 3.3.3, Remark 3.3.4 and proof, arXiv v3 pp. 30–31.)

<a id="t3-10"></a>

### 3.10 Regular crystalline generic fibres and formally smooth local deformation problems

The crystalline scheme generic fibre `Spec R□`,`crys_{τ,v}[1/ϖ]` is regular and equidimensional of dimension `d²+Δ(v)`. At each closed point `x` with finite residue field `E_x/E`, its completed local ring, with the maximal-ideal topology, pro-represents the fixed-type crystalline deformation problem on finite local Artinian `E_x`-algebras and is formally smooth of that dimension. This completed-local assertion and scheme regularity specify different carriers. For unramified `K`, trivial `τ`, regular weights of width `≤p−2` and Fontaine–Laffaille residual data, the nonempty compatible fixed-determinant integral ring is formally smooth over `𝒪` for the maximal-ideal topology, of relative dimension `d²−1+fd(d−1)/2`.

*Needs:* [3.4](#t3-4); [3.6](#t3-6); [3.9](#t3-9); [1.6](#t1-6); [1.13](#t1-13).

(Sources: [KisinPST], Theorem (3.3.8), author DVI p. 30; [Gee22], Theorem 3.28, pp. 18–19; [BellovinGee], Remark 3.3.4 and Theorem 3.3.8, arXiv v3 pp. 30–33.)

<a id="t3-11"></a>

### 3.11 `G`-valued potentially semistable lifting rings (Balaji, Bellovin–Gee)

Let `G/𝒪` be a smooth affine group scheme with reductive identity component and the `G`-valued lifting interface of 1.17. Fix a continuous residual representation, a `G⁰`-conjugacy class `τ` of finite-image inertia representations extending to the required Weil action, and a labelled Hodge cocharacter class `v`. Choose a finite Galois `L/K` with `τ|I_L=1`. The general-linear family input from [3.5](#t3-5) carries the induced fixed labelled Hodge and inertia types and this extension `L`; its period modules retain the tensor compatibility of [0.2](#t0-2). Construct the unique reduced `𝒪`-flat integral quotient `R□_{τ,v}` characterized, on every finite local `E`-algebra including nonreduced ones, by lifts of labelled Hodge type `v` and WD inertia type `τ` whose restriction to `G_L` is semistable. The quotient can be zero. If nonzero, its scheme generic fibre `Spec R□_{τ,v}[1/ϖ]` is reduced, locally a complete intersection and equidimensional, with a dense regular open. Its dimension is `dim G+Σ_σdim(G/P_{v,σ})`, or `dim G+f dim Fl_G` for regular `v`. A nonempty compatible fixed quotient representation into `G/G^der`, with `G^der=(G⁰)^der`, replaces `dim G` by `dim G^der` and has the corresponding generic-fibre properties. Integral complete intersection, Cohen–Macaulayness or formal smoothness requires a separate theorem carrying its own hypotheses; ordinary quotients and patching modules use only the properties on the stated fibre.

**Checks.**

- For `G=GL₃` and three distinct labelled weights, the nonempty framed generic fibre has dimension `9+3f`, and its flat integral quotient has dimension `10+3f`. Fixing the full abelianisation means fixing the determinant and lowers these dimensions by one.
- For a complete DVR `𝒪` with uniformizer `π`, `A=𝒪[x,y]/(x²−πx,xy,y²−πy)` is free on 1,`x`,`y`. The map `A→𝒪³` given by evaluation at `(0,0)`,`(π,0)`,`(0,π)` is injective, so `A` is reduced; after inverting `π` it is `E³` and is étale. This is an algebraic control for the fibre distinction.
- The same `A` has special fibre `k[x,y]/(x,y)²` with socle spanned by `x`,`y`. An Artinian local complete intersection has one-dimensional socle, so this fibre is not a complete intersection. Since `π` is regular in `A`, an integral complete intersection would have a complete-intersection special fibre; thus flatness, reducedness and an étale generic fibre do not imply integral complete intersection.

*Needs:* [1.17](#t1-17); [1.21](#t1-21) (relative parabolic schemes); [3.5](#t3-5); [3.4](#t3-4); [3.9](#t3-9); [0.2](#t0-2).

(Sources: [FKP22], Appendix B, arXiv v5 pp. 52–53; [BellovinGee], §3.2 and Theorem 3.3.3 (= Theorem A), arXiv v3 pp. 29–30.)

<a id="t3-12"></a>

### 3.12 Breuil–Conrad–Diamond–Taylor type rings as Kisin rings

For Schur rank-two data, weak potentially Barsotti–Tate types define the intersection of weight-two characteristic-zero point kernels with determinant `ε` times a prime-to-`p` Teichmüller character. Compare inertia `τ`, extended Weil `τ′` and the Kisin quotient, using the weight-two theorem that weak type is actual type. `N≠0` Tate curves are excluded.

*Needs:* [3.4](#t3-4); [1.5](#t1-5); [0.3](#t0-3); [3.10](#t3-10).

(Sources: [BCDT01], §1.1 and Conjecture 1.1.1, author manuscript pp. 7–8; [KisinPST], Introduction, author DVI pp. 1–2.)

<a id="t3-13"></a>

### 3.13 Semistable-ordinary quotients of semistable lifting rings

Start with the semistable and crystalline fixed-Hodge-type quotients. In a finite local `E`-algebra, if a semistable lift reduces to a semistable-ordinary representation of weight `λ`, it is itself semistable-ordinary. Thus the ordinary condition selects an open and closed union of components of the semistable generic fibre, defining a unique flat reduced quotient `R^{△,λ}`. It is the ordinary component quotient inside that semistable space, not a closure in the unrestricted ring of an arbitrary ordinary point set.

*Needs:* [1.7](#t1-7); [3.4](#t3-4); [3.10](#t3-10); [3.11](#t3-11); [1.9](#t1-9).

(Sources: [CN23], Lemma 3.3.2, arXiv v3 p. 51; [CN23], Theorem 3.3.3, arXiv v3 p. 52.)

<a id="t3-14"></a>

### 3.14 Fixed-determinant crystalline and ordinary rings as power-series quotients

For `p∤d` and dominant `λ`, the determinant weight is `−Σ_i(λ_{τ,i}+d−i)`. A compatible `ψ` gives reduced flat crystalline or semistable-ordinary quotients with the finite-`E`-algebra point criterion. Scalar twisting with a section identifies the unfixed ring with `R^ψ[[X]]`; the ordinary variant uses the semistable ordinary component quotient.

*Needs:* [3.4](#t3-4); [1.10](#t1-10); [3.13](#t3-13).

(Sources: [CN23], Lemma 3.3.6, arXiv v3 pp. 52–53.)

### Examples

For a labelled rank-three filtration with three distinct jumps, `Δ=(9−3)/2=3`; with multiplicities `(2,1)`, `Δ=(9−5)/2=2`. A nonzero framed potentially semistable generic fibre therefore has dimension 12 or 11 respectively, while its flat integral closure has dimension 13 or 12. Equal numerical ranks do not identify these Hodge types: the labelled jumps and descent data remain part of the point criterion.

Two supercuspidal full WD parameters differing by an unramified twist can have the same inertia type. Their point-kernel intersections in the block pseudodeformation ring still select their respective full Frobenius data. Forgetting `N` is appropriate for the `p`-adic inertia-type projection, but forgetting Frobenius is not appropriate for `R_{B,M}`.

### Dependencies

Uses Layers 1–2, period/filtered-module admissibility, full WD and inertia-type comparisons, continuous pseudodeformation rings and complete local algebra. The local block identification is constructed in 3.8.

<a id="R08.4"></a>

`LocalGaloisDeformationRings:R08.4` is the finite-flat deformation-ring layer (Layer 4 here); its Savitt ring presentations are target 4.2.

## Layer 4: Finite-flat models and Barsotti–Tate components

The projective space of finite-flat models resolves a lifting condition. Its closed model fibre records multiple models of one representation; its uniformizer fibre carries the local-model singularity theorem. Use this distinction throughout the component comparison.

Throughout this layer `K/ℚ_p` is finite, `e=e(K/ℚ_p)`, `K₀` is its maximal unramified subfield, `p>2`, the residual module is finite-flat, and the model lattice has its fixed generic-fibre identification. Rank-two ordinary/nonordinary comparisons use `v_ψ=1`.

<a id="t4-1"></a>

### 4.1 Flat deformations and the flat deformation ring

For `p>2` and finite-flat residual data, apply the finite-flat deformation condition supplied by `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.6.7, on every Artinian quotient of a lift, constructing its framed and Schur unframed representing quotients. Integral points are Tate modules of `p`-divisible groups from compatible models. After inverting `p` compare with the crystalline weight-`{0,1}` locus.

The construction provides the following API.

- `flatLiftingRing`: `R^{fl,□}`, the quotient of `R^□` classifying flat lifts.
- `flatLiftingRing_points`: An `𝒪_E`-point is flat iff it is the Tate module of a `p`-divisible group.
- `flatDeformationRing`: `R^fl` when `End V_𝔽 = 𝔽`.
- `flatLiftingRing.universal`: `Hom_cont`,`𝒪`(`R^{fl,□}`,`A`) identifies naturally with finite-flat framed `A`-lifts; integral points satisfy the `p`-divisible-group criterion.
- `DeformationProblem.flat`: Apply F.3.1's predicate constructor to finite-flatness on
  every Artinian truncation, using §R07.6.7's closure under finite sums, submodules and
  quotients. Supply invariance under marked isomorphisms, coefficient change,
  injective descent, fibre-product gluing and separated-limit detection, with
  `truncationLimit` on the same labelled quotients. The finite-flat models and their
  closure theory remain with that supplier; this target constructs their lifting-condition adapter.

**Checks.**

- Over `ℚ_p`, `p>2`, `μ_p⊕ℤ/p` realizes `𝔽_p(1)⊕𝔽_p`, so the corresponding residual finite-flat lifting condition is nonempty.
- The compatible models `μ_{p^m}⊕ℤ/p^m` give the `p`-divisible group `μ_{p^∞}⊕ℚ_p/ℤ_p` and its Tate module `ℤ_p(1)⊕ℤ_p`. Requiring only a model at `m=1` would not specify this integral point criterion.
- `ω²` over `ℚ_p (p > 3)` has no finite flat model.

*Needs:* [1.1](#t1-1); [1.5](#t1-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.6.7 (`flatDeformationTangentSpace`, condition and tangent interface).

(Sources: [KisinFlat], (2.1.1), p. 16.)

<a id="t4-2"></a>

### 4.2 Savitt's weight-two deformation rings of tame type

Throughout this target `K=ℚ_p` and `p>2`. For Schur rank-two data and a compatible weight-two determinant, import `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.5.10 (`savittResidualTypes`), and compute the universal deformation rings for the residual-character cases below: principal-series rings `𝒪[[Y]]` or `𝒪[[X₁,X₂]]/(X₁X₂−pu)`; niveau-two rings `𝒪[[B]]` or zero. Retain peu-ramification endpoints and coefficient extensions. The nodal special fibre has two components and multiplicity two; its scheme generic fibre is regular, with formally smooth completed local deformation rings at closed points for their maximal-ideal topology.

The following lists are a concordance with that imported classification and its peu-ramification endpoints, with `ω` and `ω₂` the level-one and level-two fundamental characters of `ℚ_p`:

- For `τ=ω̃^i⊕ω̃^j`, `i≠j` modulo `p−1`, the allowed reducible residual inertia is an extension with ordered characters `ω^{1+i}`,`ω^j`, or with `i`,`j` exchanged. Each corresponding allowed reducible case gives `𝒪[[Y]]`. The irreducible case has inertia `ω₂^a⊕ω₂^{pa}`, `a=1+{j−i}+(p+1)i`, and gives the nodal ring above. Enlarge `E` to contain `ℚ_{p²}` and the residue field to contain a square root of the residual Frobenius determinant.
- For `τ=ω̃₂^m⊕ω̃₂^{pm}`, write `m=i+(p+1)j` with `1≤i≤p`. The reducible cases are the two orders of `ω^{i+j}`,`ω^{1+j}`, with the peu-ramification requirement at `i=2` and `i=p−1`. The other allowable inertia pairs are `ω₂^{p+m}⊕ω₂^{1+pm}` and `ω₂^{1+m}⊕ω₂^{p(1+m)}`. At `i=1` or `i=p` these degenerate to niveau-one cases. The ring for every allowed case is `𝒪[[B]]`, and outside this list it is zero.


**Checks.**

- An allowed reducible principal-series case has ring `𝒪[[Y]]`, of generic dimension one.
- The allowed ring `𝒪[[T]]` has regular `Spec 𝒪[[T]][1/ϖ]` and formally smooth completed local deformation rings, but its scheme generic fibre is not of finite type over `E`. It is not a smooth `E`-scheme.
- Its allowed irreducible case has `XY−pu`; the special fibre has two components and the scheme generic fibre is regular after the prescribed coefficient extension; the completed local deformation rings at closed points are formally smooth for their maximal-ideal topology.
- Residual data outside the imported niveau-two list give zero. For unramified quadratic `K/ℚ_p`, a nonzero fixed-determinant unframed BT ring has generic dimension two; these one-dimensional presentations are outside that field's scope.

*Needs:* [3.4](#t3-4); [3.1](#t3-1); [1.10](#t1-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; §R07.5.10 (`savittResidualTypes`).

(Sources: [Savitt], Theorems 6.22–6.24, p. 42 (arXiv `v3`).)

<a id="t4-2-1"></a>

### 4.2.1 Completed inertia Kummer valuation sequence

For unramified `F/ℚ_p`, complete Noetherian `B` over `𝒪[[T]]`, and finite `B`-module `N` with its maximal-ideal topology, construct `inertiaKummerValuationSequence`: `H¹(I_F,N(ε))≅(F^nr,×⊗_ℤN)^∧` and the continuous valuation map to `N`, with kernel the completed unit classes. The completion is in the coefficient ideal; `F^nr` is the algebraic maximal unramified extension. The sequence is decomposition-equivariant; valuation has trivial action before twisting. For unramified `η`, transport the action on every term by `η`, retaining `N(η)` as valuation target. Compose restriction of cocycles with valuation to obtain `inertiaKummerValuationSequence.finiteKernel` for `Ξ=εη`. For the other KW characters use their stated `k>2` branch, not this weight-two kernel.

Construct the finite-level equivariant Kummer maps from Tau Ceti restriction/norm naturality and the valuation/unit sequence, then pass through compatible Artinian coefficient quotients and their inverse limits. Use `SelmerIwasawaCohomology`, §§0.4–0.6 and ArithmeticGaloisDuality R02.1 for the limit comparisons; supply the required surjectivity/Mittag–Leffler statements for this tower rather than assuming completion preserves arbitrary exact sequences. The API includes restriction, unramified twist and finite-module tensor compatibility of the kernel used in 4.3.

**Checks.**

- With `v(p)=1`, the Kummer class of `p` has valuation one and is excluded by the finite kernel.
- A principal-unit Kummer class has valuation zero and lies in the finite kernel.
- An unramified twist multiplies the Frobenius action on the valuation target by `η(Frob)`; forgetting that twist breaks equivariance. Compatible reductions `B/𝔪_B^n` recover the same kernel in the limit.

*Needs:* Tau Ceti `kummerIso`, `kummerIso_res`, `kummerIso_norm`; `SelmerIwasawaCohomology`, §§0.4–0.6; `ArithmeticGaloisDuality`, R02.1, inverse limits and continuous cochains.

(Sources: [KW209], §3.2.5, definition before Lemma 3.7 and its proof, author pp. 25–26.)

<a id="t4-3"></a>

### 4.3 Finite cocycles via Kummer theory over `F^nr` (KW II Lemma 3.7)

For unramified `F_v/ℚ_p` and complete Noetherian `B` over `𝒪[[T]]`, take `Ξ=χ₁η₁η₂⁻¹`, unramified `η_i`, and `χ₁=χ_p^{k−1}` or `χ_pω^{k−2}`, `2≤k≤p`. At `k=2` use the inertia Kummer valuation kernel; at `k>2` finite cocycles are all `Z¹`. This module is `B`-free of rank `1+f` and commutes with tensor base change.

*Needs:* [4.2.1](#t4-2-1); [1.4](#t1-4); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [KW209], §3.2.5, Lemma 3.7, author copy pp. 25–26; [KW209], §3.2.5, the definition of finite cocycles, p. 25.)

<a id="t4-4"></a>

### 4.4 Normalising a vector over `𝒪[T]` inside `𝒪⟦T⟧` (KW II Lemma 3.8)

After a completion automorphism, the KW free `𝒪[[T]]`-module algebraizes to a free `𝒪[T]`-module at the chosen point, giving the cocycle torsor and projective-line parameter. Before Weierstrass preparation/division, remove the common `ϖ`-power to obtain nonzero residue series.

*Needs:* `PowerSeries.exists_isWeierstrassFactorization` (Mathlib); `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` (Mathlib).

(Sources: [KW209], Lemma 3.8, author copy p. 30; [KW209], proof of Lemma 3.8, p. 30.)

<a id="t4-5"></a>

### 4.5 The moduli of finite flat models

Height-one Kisin lattices with generic-fibre identification have a projective model scheme over the lifting family. Its closed fibre parametrizes models of the fixed residual representation, using the rank-general bounded-height construction. When `K` contains `ζ_p`, a generic fibre can have both multiplicative and étale models.

The construction provides the following API.

- `finiteFlatModels`: `𝒢ℛ_{V_𝔽,ξ}`, the projective `R`-scheme of `E`-height `≤ 1` lattices.
- `finiteFlatModels_toFlat`: `Θ` : `𝒢ℛ_{V_𝔽} → Spec R^fl`, projective.
- `finiteFlatModels_closedFibre`: `𝒢ℛ_{V_𝔽,0}(𝔽′) ≃` finite flat models of `V_𝔽 ⊗ 𝔽′`.
- `finiteFlatModels.points`: `B`-points classify height-one projective lattices in `M(ξ)_B` with their generic-fibre identification; the universal lattice pulls back naturally.

**Checks.**

- Over `ℚ_5`, `V_𝔽=𝔽_5(1)⊕𝔽_5` has the model `μ_5⊕ℤ/5`. Since `e=1<4`, its model with the fixed generic-fibre identification is unique.
- Over `ℚ_5` the trivial rank-one representation is realized by `ℤ/5`, whereas `μ_5` has nontrivial generic inertia character `ω`. A model must realize the specified generic representation, rather than merely have its rank.
- Over `ℚ_5(ζ_5)`, `μ_5` and `ℤ/5` have the same trivial generic representation and are distinct models: their special fibres are respectively connected and étale. The model scheme must retain both points.

*Needs:* [1.8](#t1-8); [1.2](#t1-2); [4.1](#t4-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [KisinFlat], Corollaries (2.1.11) and (2.1.13), p. 21.)

<a id="t4-6"></a>

### 4.6 The generic fibre of the flat deformation ring

The crystalline weight-`{0,1}` flat scheme generic fibre is regular, with formally smooth completed local deformation rings at closed points for their maximal-ideal topology, of framed dimension `d²+Σ_ψ(d−v_ψ)v_ψ` and Schur unframed dimension `1+Σ_ψ(d−v_ψ)v_ψ`. Rank two with `v_ψ=1` gives `4+f` and `1+f`. Integral smoothness and normality need not hold.

*Needs:* [4.1](#t4-1); [3.10](#t3-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [KisinFlat], Proposition (2.3.8) and Corollary (2.3.11), pp. 32–33.)

<a id="t4-7"></a>

### 4.7 Unique models in small ramification

For `e<p−1` the model is unique and the projective model map is an integral isomorphism onto the flat space. At `e=p−1` uniqueness can fail; the strict range contains no `p=2` case.

*Needs:* [4.5](#t4-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

(Sources: [KisinFlat], Proposition (2.1.14), p. 22.)

<a id="t4-7-1"></a>

### 4.7.1 Local models and comparison diagrams

The local-model constructions in this target allow every `p`: 4.8 uses the odd-prime family and 5.13 the connected dyadic family. For the maximal-parahoric `Res_{K/ℚ_p}GL_d` model with labelled ranks `v_ψ` and reflex coefficient ring, construct the naive determinant-condition Grassmannian locus and its scheme-theoretic flat closure. Construct `LocalModelComparison` as the smooth torsor diagram linking the height-one lattice model of 4.5, the Pappas–Rapoport flat model and its nilpotent orbit model. Require the lifting family to be formally smooth over the flat groupoid for the application to deformation resolutions. Prove normal Cohen–Macaulay structure, reduced normal uniformizer fibre with rational singularities, and the dual-partition stratum closure criterion using the nilpotent orbit comparison. Construct the `GL_r` nilpotent orbit closures, their flag resolutions and the normality/rational-singularity comparison used in PR Theorem 5.4, with the dual-partition rank equations and coefficient transport. For balanced ranks `|v_ψ−v_ψ′|≤1` above each `K₀` embedding, prove `naive=flat` only in the stated `v_ψ∈{0,1}` or `e≤2` cases. Where using PR Corollary 5.9 retain reducedness of its nilpotent scheme; the `r≤e` and `e=2` cases supply it.

For rank two, `v_ψ=1` and the fixed alternating pairing in the connected dyadic application, construct `DelignePappasComparison` from the self-dual determinant-condition lattice model and its smooth torsor diagram. Prove the normal local complete-intersection model, geometrically reduced special fibre and regular scheme generic fibre used by 5.13, with formally smooth completed local deformation rings at closed characteristic-zero points for their maximal-ideal topology. These are local lattice models; constructing global Hilbert modular varieties is outside this target. The APIs give universal lattices, torsor maps, coefficient transport and the transfer of these local properties to formally smooth lifting families.

**Checks.**

- At `e=1` the determinant-condition model is the Grassmannian with its usual smooth charts.
- Rank two with every `v_ψ=1` gives the balanced height-one case; the naive and flat conditions coincide.
- In PR's `e=2` case with `r₁>r₂` the flat model includes `∧^{r₂+1}(π−ϕ₁(π))=0`. The determinant equation alone cannot replace that wedge condition; equal ranks instead use the reduced nilpotent-scheme case.

*Needs:* [4.5](#t4-5); `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and 1.7; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, R07.4.

(Sources: [PR], Theorem 5.4 and Corollaries 5.9–5.10, arXiv v2 pp. 17, 21–22; [KisinFlat], Proposition (2.2.2) and Corollary (2.2.8), author pp. 23–28; [Kisin2adic], (2.3.5)–(2.3.13), author DVI pp. 27–30.)

<a id="t4-8"></a>

### 4.8 Local structure of the resolution

Pappas–Rapoport comparison gives a normal Cohen–Macaulay resolution and reduced normal uniformizer fibre with rational singularities. Stratum closure is the dual-partition Jordan inequality at each embedding. For each embedding `σ` of `K₀`, require `|v_ψ−v_ψ′|≤1` for every pair extending `σ`; if also all `v_ψ∈{0,1}` or `e≤2`, `naive=flat`. The closed-point model fibre has separate geometry.

*Needs:* [4.7.1](#t4-7-1); [4.5](#t4-5).

(Sources: [KisinFlat], Proposition (2.2.2), Corollary (2.2.8) and Proposition (2.4.6), pp. 23–35.)

<a id="t4-9"></a>

### 4.9 Kisin's resolution of the flat deformation ring

The flat closure of the type-`v` height-one model scheme maps projectively to `Spec R^v` and is an isomorphism after inverting `p`. Local-model comparison requires the lifting family to be formally smooth over the flat groupoid. For rank two, `v_ψ=1`, naive and flat model conditions coincide.

The construction provides the following API.

- `flatHodgeTypeQuotient`: `R^v`, the Hodge-type-`v` part of the flat ring.
- `flatResolution`: `𝒢ℛ^{v,loc}` with `Θ^v` : `𝒢ℛ^{v,loc} → Spec R^v` projective.
- `flatResolution_generic_iso`: `Θ^v[1/p]` is an isomorphism.
- `flatResolution.points`: For a test coefficient `𝒪`-algebra `B`, a point retains the coefficient map `R^v→B` and a height-one projective lattice in the associated étale module with its fixed generic-fibre identification. On the local-model trivialization torsor of 4.7.1, the associated local-model map must factor through the scheme-theoretic flat closure; this condition descends and is natural under coefficient change. It is imposed scheme-theoretically also for nonreduced `B`. The labelled determinant/rank condition alone classifies points of the naive scheme `𝒢ℛ^v`; it suffices for `flatResolution` only under the precise `naive=flat` hypotheses of 4.8.

**Checks.**

- Over `ℚ_5` with `v=1`, the lift `ℤ_5(1)⊕ℤ_5` has the unique model `μ_{5^∞}⊕ℚ_5/ℤ_5`. Here `e=1<4` and `Θ^v` is an integral isomorphism.
- Over `K=ℚ_5(ζ_5)`, the crystalline lift `ℚ_5(1)⊕ℚ_5` has exactly one rational preimage under `Θ^v[1/5]`, although its residual model fibre need not be a point. The generic isomorphism does not imply an integral isomorphism.
- For that `K`, scalar residual `V_𝔽=𝔽_5²` and `v_ψ=1`, the ordinary closed model fibre is `ℙ¹_𝔽_5`, parametrizing the generic-fibre identifications by their multiplicative lines. Its six `𝔽_5`-points show why `Θ^v` can have a positive-dimensional closed fibre ([KisinFlat], Proposition (2.5.15)(2), author DVI pp. 48–49).
- Take `p=3`, `K=ℚ₃(ζ₃,π)` with `π²=ζ₃−1`, and `E_K(u)=u⁴+3u²+3`. Over splitting coefficients write `E_K=P Q` with monic quadratic factors, and choose `v=(2,2,0,0)`, with rank 2 at the roots of `Q`. The height-one Frobenius matrix `P(u)I₂` gives a type-`v` lift, so `R^v≠0`. Its residual étale module is trivial: `P≡u²`, and a rank-one residual character trivial on `G_{K∞}` is trivial on `G_K`, since finite subextensions of `K∞/K` have 3-power degree while `k×` has order prime to 3; also `ε̄=1` on `G_K`. In the identified module with `φ(e_i)=e_i`, lattices with bases `(u e₁,u e₂)` and `(e₁,u²e₂)` have Frobenius matrices `diag(u²,u²)` and `diag(1,u⁴)`. Both satisfy the determinant polynomial law for `v` over the residual point of `R^v`: for `a=Σ_{i=0}³a_iπ^i` it reduces to `a₀⁴`. Their modules `im φ/u⁴𝔐` have Jordan types `(2,2)` and `(4)`. Only the first is dominated by the dual partition `(2,2)`; the second fails `u²=0` and is excluded from the flat resolution.

*Needs:* [4.5](#t4-5); [4.6](#t4-6); [4.8](#t4-8); [3.3](#t3-3).

(Sources: [KisinFlat], (2.4.1)–(2.4.3), Proposition (2.4.6)(3)–(4) and Proposition (2.4.8), author pp. 34–37; (2.4.2)–(2.4.3) and Proposition (2.4.6)(3), published pp. 1124–1125, for the determinant and flat point criteria; [PR], Theorem 5.4, arXiv v2 p. 17.)

<a id="t4-10"></a>

### 4.10 Connected components through the special fibre

The projective resolution, generic-fibre isomorphism and reduced uniformizer fibre give a bijection between generic deformation connected components and connected components of the closed-point model fibre, using properness, formal functions and algebraization.

*Needs:* [4.9](#t4-9); [4.8](#t4-8); `AdicSpacesPartIII`, `F0`.8, *grothendieck-algebraization*; `SchemeAndStackFoundations`, §4.9 (The theorem on formal functions and Stein factorisation).

(Sources: [KisinFlat], Corollary (2.4.10), pp. 37–38.)

<a id="t4-11"></a>

### 4.11 The ordinary type of a component

Maximal multiplicative rank `d_m` and maximal étale quotient rank `d_et` commute with coefficient extension and duality and are constant on closed model components. Rationally they detect unramified subrepresentations of `V(−1)` and unramified quotients of `V`. No general connectedness assertion for each pair is made.

*Needs:* [4.9](#t4-9); [4.10](#t4-10); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [KisinFlat], Proposition (2.4.14), (2.4.15) and Conjecture (2.4.16), pp. 38–41.)

<a id="t4-12"></a>

### 4.12 Connectedness of the non-ordinary locus in rank two

For rank two, `v_ψ=1` and `K₀=ℚ_p`, the nonordinary closed model locus is connected. Fundamental characters belong to `K`; ramification prevents identifying them with the `ℚ_p` cyclotomic character.

*Needs:* [4.11](#t4-11); [4.10](#t4-10); [4.5](#t4-5).

(Sources: [KisinFlat], Lemmas (2.5.1), (2.5.3), (2.5.5) and Proposition (2.5.6), pp. 41–48.)

<a id="t4-13"></a>

### 4.13 The ordinary locus in rank two

For `v_ψ=1`, a nonempty ordinary rank-two closed locus is one point unless residual data are two unramified characters: distinct characters give two points, equal ones `ℙ¹`, with generic-fibre framing retained. Trivial data over `K⊃ζ_p` exhibit `ℙ¹`; over `ℚ_p`, odd `p`, they have no prescribed `{0,1}` lift.

*Needs:* [4.11](#t4-11); [4.5](#t4-5); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

(Sources: [KisinFlat], Proposition (2.5.15), pp. 48–49.)

<a id="t4-14"></a>

### 4.14 Components of rank-two Barsotti–Tate deformation rings

The `v_ψ=1` rank-two BT ring is flat of relative dimension `4+f` with regular scheme generic fibre; its completed local deformation rings at closed characteristic-zero points are formally smooth for their maximal-ideal topology. Ordinary status is component-constant. For `K₀=ℚ_p` nonordinary points are connected; ordinary components are distinguished by the residual cyclotomic-line character. At `e=p−1` the trivial-residual `ℙ¹` gives one ordinary component; larger `e` can permit both statuses.

*Needs:* [4.6](#t4-6); [4.10](#t4-10); [4.11](#t4-11); [4.12](#t4-12); [4.13](#t4-13); [1.5](#t1-5).

(Sources: [KisinFlat], Corollary (2.5.16), p. 49; [CN23], Lemma 5.3.4, arXiv v3 p. 77.)

<a id="t4-14-1"></a>

### 4.14.1 Breuil–Kisin stack comparison and generic reducedness

For `p>2`, continuous residual rank-two data over finite `K/ℚ_p` and a tame type `τ` defined over the chosen coefficients, construct `BTStackComparison`: the coefficient height-one Kisin stack with tame descent, its proper map to the étale `φ`-module/Galois stack, and the potentially BT image stack. At the residual point compare the universal framed type ring's completion with the image stack's versal ring, retaining the smooth framing factors. Use the CEGS component and versality comparison to prove `BTStackComparison.genericallyReduced`: `R^{□,τ,BT}/ϖ` is generically reduced. Supply coefficient extension and generic-point multiplicity one; the special fibre need not be globally reduced or irreducible.

Construct the scheme-theoretic image as the smallest closed substack through which this proper map factors. Use smooth presentations and descent of the image ideals, and prove compatibility with flat coefficient change. The image construction and the comparison of its completed versal rings with framed type rings belong to this target (Stacks, tags [0CMJ](https://stacks.math.columbia.edu/tag/0CMJ), [0CPU](https://stacks.math.columbia.edu/tag/0CPU) and [0CMK](https://stacks.math.columbia.edu/tag/0CMK)).

For a compatible determinant, construct `BTStackComparison.fixedDeterminant`: require the fixed determinant to have the prescribed Hodge weight and inertial type. The ratio to this determinant is unramified. At odd `p` squaring unramified characters congruent to one is an isomorphism; use their unique square roots for scalar twisting. This splits the unramified determinant direction without changing `τ` or BT weights, giving the fixed-determinant comparison with one formally smooth character variable. Generic reducedness descends through that faithfully flat factor. Dualize the weights and determinant for the normalization used in 4.15. Construct the stack from invariant lattice charts and descent groupoids, then use the proper image and residual versality comparisons; plain height-one classification does not yield this result.

**Checks.**

- A smooth type branch has a reduced special fibre and generic multiplicity one.
- The nodal branch `k[[X,Y,Z₁,Z₂,Z₃]]/(XY)` has two generic points, each of multiplicity one; generic reducedness permits both components.
- At `p=2`, squaring unramified characters with Frobenius value in `1+𝔪` is not an isomorphism. The odd-prime fixed-determinant adapter cannot be applied there.
- The identity of `Spec k[ε]/(ε²)` has the entire nonreduced scheme as its scheme-theoretic image, whereas the inclusion of its reduced point has ideal `(ε)`. The underlying point set does not determine the image ideal.

*Needs:* [3.4](#t3-4); [4.5](#t4-5); [1.24](#t1-24); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.4.36–R07.4.39; `SchemeAndStackFoundations`, §1.21 (quotient stacks). The scheme-theoretic image of the proper stack map and its versal-ring comparison are constructed in this target.

(Sources: [CEGS], Theorem 1.3 and the versal-ring comparison in the introduction, arXiv v2 p. 4; [CN23], Lemma 5.3.3, arXiv v3 pp. 76–77.)

<a id="t4-15"></a>

### 4.15 Unique generalisation of generic points for Barsotti–Tate rings

For odd `p`, trivial inertia type, determinant `ε⁻¹` and BT weights `{0,−1}` here, each uniformizer-fibre generic point has a unique generic generalisation. For trivial residual data and local residue field `≠ℱ_p`, the nonzero ring has exactly ordinary and nonordinary components. This uses potentially BT generic reducedness from the Emerton–Gee interface.

*Needs:* [4.14.1](#t4-14-1); [4.14](#t4-14); [4.6](#t4-6); [3.14](#t3-14).

(Sources: [CN23], Lemma 5.3.3, arXiv v3 pp. 76–77; [CN23], Lemma 5.3.4, arXiv v3 p. 77; [CEGS], Theorem 1.3, arXiv v2 p. 4.)

### Examples

For a ramified field containing `ζ_p`, `μ_p` and the constant `ℤ/p` group scheme can have isomorphic generic Galois representations but different finite-flat integral models. Accordingly, the projective height-one model scheme retains a lattice with its fixed generic-fibre identification; the generic representation alone does not name its integral point. Under `e<p−1` the supplier's uniqueness theorem changes this behavior.

In Savitt's two-character nodal branch, `R□` is `𝒪[[X,Y,Z₁,Z₂,Z₃]]/(XY−pu)` with `u` a unit. Its special fibre is `k[[X,Y,Z₁,Z₂,Z₃]]/(XY)`, with the two minimal primes `(X)` and `(Y)`. It is flat and its generic fibre is regular, but the closed residual point is not formally smooth over `𝒪`. These are assertions about the quotient ring and its ideals, not a count of five variables.

### Dependencies

Uses Layers 1 and 3, finite-flat/Breuil–Kisin realization, Grassmannian representability, formal algebraization and the explicit local-model and generic-reducedness supplier contracts.

## Layer 5: Dyadic and endpoint-weight conditions

At `p=2`, connected modules and determinant normalization require their own arguments. The endpoint-weight branches also retain the irreducible and ordinarity hypotheses of their classification theorems. The comparisons refer to the same local rings built above.

<a id="t5-1"></a>

### 5.1 Deformation groupoids of connected Kisin modules with coefficients

On Kisin's augmented coefficient category, deform `M_ℱ=(𝒪_{ℰ^ur}⊗V_ℱ(−1))^{G_{K∞}}` by coefficient Kisin modules with fixed étale identification and compatible isomorphisms. Construct the connected subgroupoid and forgetful map to étale `φ`-deformations, importing the integral categories and dyadic connectedness criterion from R07.4.

The construction provides the following API.

- `kisinGroupoid`: `D_{𝔖,M_𝔽}`: over `(A, I)`, pairs `(𝔐_A, ι)` with `𝔐_A ∈ R07`.4's (Mod/`𝔖`)`_A` and `ι` : `𝒪_ℰ ⊗_𝔖 𝔐_A ⊗_A A/I ≅ M_𝔽 ⊗_𝔽 A/I`; morphisms are isomorphisms compatible with `ι`.
- `kisinGroupoid.connected`: `D^c_{𝔖,M_𝔽} ⊆ D_{𝔖,M_𝔽}`: the full subgroupoid of objects connected in R07.4's sense.
- `kisinGroupoid_toPhiModule`: `𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A`, a morphism of groupoids `D_{𝔖,M_𝔽} → D_{M_𝔽}` (Lemma 2.1.7).
- `kisinGroupoid.baseChange`: Admissible coefficient maps tensor the module and transport its identification `ι`, preserving connectedness and the canonical identity/composition laws.
- `kisinGroupoid.connected_iff_etalePart`: At `p=2`, `D^c` means zero maximal étale quotient. At `p>2` the finite-flat equivalence uses all height-one objects.

**Checks.**

- Rank one with `φ(e) = E(u)e` over `𝔽`: the object is étale (R07.4) and lies in `D_{𝔖,M_𝔽}` but not in `D^c_{𝔖,M_𝔽}`.
- Rank one with `φ(e) = e`: multiplicative, hence connected, so it lies in `D^c_{𝔖,M_𝔽}`.
- `φ(e)=pE(u)/E(0)e` is étale since `p/E(0)` is a unit, so it is outside `D^c`. Its `φ`-invariants have character `χ⁻¹`; the prescribed (1)-twist realizes the trivial étale group.
- At `p=2` an étale rank-one module is outside `D^c` but has a finite-flat étale model.

*Needs:* [4.5](#t4-5); [1.2](#t1-2); [1.1](#t1-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.36; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.39; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.23; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [Kisin2adic], §2.1, (2.1.1)–(2.1.7), pp. 19–21 (DVI).)

<a id="t5-2"></a>

### 5.2 Ordinary deformation rings of rank two at `p = 2`

Let `K/ℚ_2` be finite and `χ=ε`. Unit-class Kummer `H¹_f` is right exact on discrete `p`-nilpotent `G_K/I_K`-modules. Cyclotomic-determinant ordinary objects have a stable line on which inertia acts by `χ` and extension class in `H¹_f`. Their projective incidence map is a generic closed embedding, and its completed local rings at closed characteristic-zero points are formally smooth for their maximal-ideal topology when the ambient family is formally smooth over the fixed-determinant deformation groupoid. For fixed determinant `χψ` with `ψ` an unramified character lifting the residual determinant quotient, construct the reduced flat image quotient, allowing the zero ring. Its characteristic-zero points are precisely crystalline representations (`χψη`,*;0,`η⁻¹`), with `η` unramified. If the quotient is nonzero, its scheme generic fibre is regular and equidimensional of dimension `3+f`; its completed local deformation rings at closed points are formally smooth for their maximal-ideal topology. Outside the case `ρ̄=χ̄₁⊕χ̄₂` with distinct characters satisfying `χ̄₁|_I=χ̄₂|_I=χ̄`, the integral ring is zero or a domain. Mere upper-triangular shape without the `H¹_f` condition also admits Tate-curve extensions, which are semistable and noncrystalline and do not belong to this quotient.

**Checks.**

- Over `K=ℚ₂` with trivial residual representation and determinant `ε`, the split crystalline lift `ε⊕1` witnesses a nonzero ordinary quotient. Its generic fibre has dimension four and the integral ring is a domain.
- Over `K=ℚ₂`, let `η` be unramified with `η(Frob)=ζ₃` and take residue coefficients `𝔽₄`. The lifts `diag(εη,η⁻¹)` and `diag(εη⁻¹,η)` have determinant `ε` and the same split residual semisimplification, but their residual unramified quotients are distinct. This is the split-distinct exception to the domain assertion.
- For `K=ℚ₂`, `𝒪=ℤ₂`, `k=𝔽₂`, the natural representation of `Gal(ℚ₂(ζ₃,∛2)/ℚ₂)≅S₃≅GL₂(𝔽₂)` has inertia matrix `T=[[0,1],[1,1]]` and Frobenius `F=[[0,1],[1,0]]`, with `FTF⁻¹=T²`. It has determinant `1=ε̄` and is absolutely irreducible: Frobenius exchanges the two inertia eigenlines over `𝔽₄`. A stable characteristic-zero ordinary line, after finite coefficient extension, intersects a stable integral lattice in a saturated rank-one sublattice and would reduce to a stable residual line. Thus the ordinary quotient is zero, despite compatible determinant, and has no generic component of dimension four.

*Needs:* [F.2.9](#fixed-determinant-rings); [1.1](#t1-1); [4.11](#t4-11); [4.3](#t4-3).

(Sources: [Kisin2adic], §2.4, (2.4.1)–(2.4.6), pp. 30–33 (DVI), including the empty closed fibre in the proof of Corollary (2.4.5), p. 33.)

<a id="t5-3"></a>

### 5.3 Kisin's rings away from 2 and at `∞` against Layers 1–2

Compare with existing rings: away-from-`p` fixed-character Steinberg generic dimension three, unramified fixed-determinant relative dimension three, unrestricted generic dimension three and tangent dimension `3+h²`. The dyadic odd-real equations are `X²+2X+YZ` and `X²+2X+YZ+Z`, at identity and nonidentity residual involutions.

*Needs:* [2.5](#t2-5); [2.2](#t2-2); [2.4](#t2-4); [1.14](#t1-14).

(Sources: [Kisin2adic], §2.5, Propositions 2.5.2–2.5.6, pp. 33–35 (DVI).)

<a id="t5-4"></a>

### 5.4 Crystalline lifts of weight `k ≤ p` are ordinary when the residual representation is

For unramified `F/ℚ_p`, ordinary residual rank two and weights `{0,k−1}`, `2≤k≤p`, every crystalline lift is ordinary. The endpoint `k=p` requires [0.3](#t0-3)’s ordinarity criterion and R07.4 endpoint classification beyond the fully faithful small-weight range.

*Needs:* [0.3](#t0-3).

(Sources: [KW209], Lemma 3.`5 (i)` and its proof, author copy p. 22; [KW209], proof of Lemma 3.5, p. 22.)

<a id="t5-5"></a>

### 5.5 Crystalline lifts of weight `p + 1`: ordinarity and formal smoothness

For odd `p`, `F=ℚ_p` and Serre weight `p+1`, Berger–Li–Zhu gives ordinary crystalline lifts and a fixed-determinant framed ring `𝒪[[X₁,…,X₄]]`. Its stable-line character map is not smooth. For general unramified `F`, only the separate ordinary ring calculation gives relative dimension `3+f`.

*Needs:* [4.3](#t4-3); [0.3](#t0-3); [1.10](#t1-10); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [KW209], §3.2.7, author copy p. 31; [KW209], §3.2.7, p. 31; [KW209], Remark after §3.2.7, p. 32.)

<a id="t5-6"></a>

### 5.6 Semistable weight-two lifts at `p`: the resolution and the dyadic homothety case

For unramified `F_v` and residual (`γ̄χ̄_p`,*;0,`γ̄`), choose unramified `γ` with `γ²χ_p` equal to the determinant. The stable-line resolution is a rank-`(2+f)` cocycle torsor over the relevant `ℙ¹` completion, and an isomorphism unless `p=2` with residual homotheties. In that case complete along all special `ℙ¹`.

*Needs:* [4.3](#t4-3); [F.2.9](#fixed-determinant-rings); `AlgebraicModuliForArithmeticGeometry`, §§1.3–1.4 and §1.7.

(Sources: [KW209], §3.2.6, author copy p. 30; [KW209], §3.2.6, p. 30.)

<a id="t5-7"></a>

### 5.7 Minimal lifts in the dihedral and exceptional cases (`p = 2` and residue characteristic 2)

For noncyclic projective inertia whose order is divisible by `p`, retain the two exceptional minimal-lift constructions. If its wild centre is cyclic, `p=2` and the projective image is dihedral of order `2d` with `d` odd and local residue prime dividing `d`: induce a Teichmüller lift of the ramified quadratic character datum corrected by the specified ramified quadratic character `δ`, then choose an unramified determinant twist. The inertial restriction is independent of `δ` and has Teichmüller determinant and the residual conductor. With noncyclic centre, local residue characteristic two and `p=3`, use the `A₄/S₄` projective lift to `PGL₂(ℤ₃)`. Define minimality by inertia rigidity relative to the resulting lift `ρ₀`. Naively inducing without `δ` gives the wrong inertial determinant in the dihedral case.

The construction provides the following API.

- `DyadicMinimal.lift`: The lift `ρ₀` = unramified twist of `Ind(γ̂δ)` in case `(a)`, or the `S₄`-lift in case `(b)`.
- `DyadicMinimal.restrict_inertia`: `ρ₀|I_v` is independent of `δ` (case `(a)`).
- `DyadicMinimal.det_inertia`: `det ρ₀|I_v` is the Teichmüller lift of `det ρ̄_v|I_v`.
- `DyadicMinimal.conductor`: `a(ρ₀) = a(ρ̄_v)`.
- `DyadicMinimal.problem`: Minimal lifts: the inertia-rigid problem attached to `ρ₀` ([F.4.12](#inertia-rigid-deformations)).

**Checks.**

- For `ρ̄_v = Ind(γ)` with `γ` of odd order divisible by `q` (for example of order `3^a` when `q = 3`; here `p = 2`) on a ramified quadratic `L`, `det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v)`.
- The naive lift `Ind(γ̂)` without `δ` has `det|I_v = ε_L·(γ̂∘t)`, which differs from the Teichmüller lift of `det ρ̄|I_v` by the ramified `ε_L`; `δ` corrects it.
- `q = 2`, `p = 3`, `G ≅ A₄`: `ρ₀` has projective image `S₄ ⊂ PGL₂(ℤ₃)` or its subgroup `A₄`.
- Prime-to-`p` inertia has a unique rigid lift up to conjugacy; extending to `G_K` involves an unramified twist and gives relative dimension three.

*Needs:* [2.3](#t2-3); [F.4.12](#inertia-rigid-deformations); [F.2.9](#fixed-determinant-rings).

(Sources: [KW209], §3.3.1, author copy p. 33; [KW109], §5, the definition of minimal lifts, p. 8.)

<a id="t5-8"></a>

### 5.8 Étale quotients, multiplicative parts and connectedness

Maximal étale quotient and multiplicative subobject, including its Kisin-module quotient, commute with admissible coefficient changes. Zero étale quotient characterizes the open-and-closed connected subgroupoid. For `p>2` the full finite-flat equivalence includes nonconnected objects.

*Needs:* [5.1](#t5-1).

(Sources: [Kisin2adic], §2.1, Lemmas 2.1.8–2.1.9 and Proposition 2.1.10, p. 21 (DVI).)

<a id="t5-9"></a>

### 5.9 Twists of semistable deformations away from `p`

Away from `p` and residual (`γ̄χ̄_p`,*;0,`γ̄`), fix `γ` Teichmüller on inertia and `γ²χ_p` equal to the determinant. The extension resolution has cocycle rank two: finite `A` give `|Z¹(A(χ_p))|=|A|²`. Ramified data preserve conductor; `p=2` includes projectively cyclic order-two inertia.

*Needs:* [5.6](#t5-6); [4.3](#t4-3); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [KW209], §3.3.4, author copy pp. 36–37.)

<a id="t5-10"></a>

### 5.10 Moduli of connected finite flat models

Over each complete local deformation family, the Kisin-to-étale forgetful map is relatively represented by a projective scheme and is a generic-fibre closed immersion. Connected models form an open-and-closed subscheme.

*Needs:* [5.8](#t5-8); [1.8](#t1-8).

(Sources: [Kisin2adic], §2.1, Proposition 2.1.12, p. 22 (DVI).)

<a id="t5-11"></a>

### 5.11 Rank-two Kisin modules of type `v` and their determinant

The rank-two maximal-isotropic condition modulo `E(u)` forces `det H=(pE(u)/E(0))w` with `w` a unit. Connected residual type-`v` modules have connected deformations without multiplicative part. Realization determinant is `χ` on inertia, and on all `G_K` iff there exists a Kisin basis in which `w` maps to 1 under `u↦0` in `W(k)⊗A`; equivalently, there exists a basis with determinant Frobenius `pE(u)/E(0)`. Under a basis change `B`, the unit is multiplied by `φ(det B)/det B`, so the condition quantifies the basis.

**Checks.**

- A basis with `det H=pE(u)/E(0)` has `w=1` and gives determinant `χ` on all `G_K`.
- A unit with `w(0)=1` is a Frobenius coboundary, so changing the determinant basis removes it and gives the exact normalized determinant.
- Over `(W(𝔽₄)/4)[[u]]`, choose Teichmüller `a` with `a²+a+1=0` and put `c=1+2a`. The strict change `B=diag(c,1)` has `φ(c)/c=3 mod 4`; it changes a displayed `w(0)=1` to 3 while preserving the object and the existence of a normalized basis.

*Needs:* [5.1](#t5-1); [5.8](#t5-8); [4.9](#t4-9).

(Sources: [Kisin2adic], §2.3, (2.3.1) and Lemmas 2.3.2–2.3.4, pp. 25–27 (DVI).)

<a id="t5-12"></a>

### 5.12 Flat connected deformation rings at `p = 2`

Finite-flat and flat-connected Galois subgroupoids are relatively closed representable. For a flat family, its connected quotient is open in the flat generic fibre. Formal smoothness over the connected groupoid gives a regular scheme generic fibre with formally smooth completed local deformation rings at closed points for their maximal-ideal topology and identifies the connected Kisin model map after inverting `p`.

*Needs:* [5.10](#t5-10); [4.1](#t4-1); [4.6](#t4-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [Kisin2adic], §2.2, (2.2.1)–(2.2.7), pp. 22–24 (DVI).)

<a id="t5-13"></a>

### 5.13 Components of 2-adic Barsotti–Tate deformation rings

For a smooth flat-connected rank-two family of cyclotomic determinant, Deligne–Pappas comparison gives normal local-complete-intersection type-`v` models with geometrically reduced special fibre and regular scheme generic fibre. The completed local deformation rings at closed characteristic-zero points are formally smooth for their maximal-ideal topology. The closed model and generic deformation fibres are geometrically connected if `K₀=ℚ_p` or residual action is trivial. Fixed unramified `ψχ` gives framed generic dimension `3+f`, including `p=2` by rational twisting.

*Needs:* [4.7.1](#t4-7-1); [5.11](#t5-11); [5.12](#t5-12); [4.8](#t4-8); [4.14](#t4-14); [F.2.9](#fixed-determinant-rings); [1.24](#t1-24).

(Sources: [Kisin2adic], §2.3, (2.3.5)–(2.3.13), pp. 27–30 (DVI).)

<a id="t5-14"></a>

### 5.14 Endpoint-weight local rings for KW `I` Theorem 4.1

KW `I` Theorem 4.1 uses dyadic crystalline/semistable weight two, odd-`p` weights `2≤k≤p+1` with separate small-range and endpoint branches, and tame potentially semistable weight-two types. These framed fixed-determinant rings over `ℚ_p` have relative dimension four and regular generic fibre. For odd `p` and irreducible residual Serre-weight-two data, `RankTwoNonordinaryEndpoint.exists` of 0.3 supplies the nonordinary crystalline weight-`(p+1)` point with compatible determinant after coefficient extension. Target 3.10 then gives the nonempty regular four-dimensional framed fixed-determinant scheme generic fibre, with formally smooth completed local deformation rings at closed points for their maximal-ideal topology.

*Needs:* [0.3](#t0-3); [3.10](#t3-10); [5.12](#t5-12); [5.13](#t5-13); [5.6](#t5-6); [5.4](#t5-4); [5.5](#t5-5); [3.4](#t3-4); [4.2](#t4-2); [5.2](#t5-2).

(Sources: [KW109], Theorem 4.1, author copy p. 7; [KW109], Theorem 4.1 (1), p. 7.)

### Examples

At `p=2` import the full height-one classification and restriction full faithfulness of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.23–R07.4.24. Kisin’s connected model groupoid and its particular resolution are the connected subcase used here; an étale height-one object also has an integral finite-flat model. The étale and multiplicative rank-one Frobenius matrices are `E(u)` and 1 in the stated normalization, and duality interchanges the corresponding groups. The ordinary flag must keep this dictionary before its forgetful image is formed.

Over `ℚ_p` for odd `p`, the selected ordinary crystalline weight-`(p+1)` rank-two ring is actually `𝒪[[X₁,X₂,X₃,X₄]]` under 5.5's hypotheses. Its characteristic-zero points carry the prescribed stable line and unramified quotient. The unrelated unrestricted ring cannot be identified with it merely because its expected dimension also equals four.

### Dependencies

Uses Layers 1, 3 and 4, the full dyadic height-one classification, its connected subcase and the endpoint/ordinarity contract.

## Layer 6: Ordinary geometry, crystalline connections and `GL₃` charts

Construct ordinary flags before their images, and characterize weight and multiplier before discussing components. This layer also provides component connections, `GL₃` shape coordinates and explicit special-fibre primes. The detailed chart equations below fix the conventions for their labels.

<a id="t6-1"></a>

### 6.1 Local structure of the ordinary flag scheme at characteristic-zero points

At a closed flagged point, completion represents pair deformations `(ρ_x,Fil_x)`. An adapted basis gives a Borel lifting ring plus `d(d−1)/2` flag variables. For `𝔟=Fil⁰ad V_x` the presentation has `z=fd(d+1)/2+d²+h²(𝔟)` variables and at most `h²` relations. Components have dimension `≥fd(d+1)/2+d²`. Excluded cyclotomic character ratios, or uniqueness of every stable flag step, give `H²=0` and smooth equality.

*Needs:* [1.9](#t1-9); [1.1](#t1-1); [1.18](#t1-18); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [Geraghty], Lemma 3.7 (preprint Lemma 3.2.3, p. 35), with Lemma 3.5 and Corollary 3.6 (preprint Lemma 3.2.1, p. 33; Corollary 3.2.2, p. 35); [THORNE15], proof of Proposition 3.14, p. 17 (accepted manuscript).)

<a id="t6-2"></a>

### 6.2 Nearly ordinary rings of a `p`-distinguished split residual representation

For odd `p`, fixed determinant `χ̃` and split distinguished residual `χ⊕1` with `χ≠1`, construct versal unrestricted and nearly ordinary deformations. Write `f=[K:ℚ_p]` and `ω` for the local mod-`p` cyclotomic character. The nearly ordinary versal ring has `2f+2` variables and one relation if `χ=ω` or `ω=1`, and `2f+1` variables otherwise. The kernel in the unrestricted versal ring has `f+ε` generators: `ε=2` if `χ=ω=χ⁻¹`; `ε=1` if `ω=1`, or `χ=ω≠χ⁻¹`, or `χ≠ω=χ⁻¹`; `ε=0` otherwise. The character comparisons are local, and these are versal rings, not an asserted universal unframed ring for split data.

*Needs:* [1.1](#t1-1); [1.4](#t1-4); [F.0.2](#minimal-relative-presentations); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [SkinnerWiles], §2.1, Lemma 2.2, p. 11; [SkinnerWiles], §2.1, Corollary 2.3, p. 13.)

<a id="t6-3"></a>

### 6.3 Ordinary deformations with fixed inertial characters on a full flag (CHT §2.4.2)

Choose the decreasing residual filtration with `gr^i=k(χ̄_i)`, `i=0`,…,`d−1`. For `i<j` require `χ̄_j/χ̄_i` to be neither 1 nor `ε̄`. Define lifts admitting a direct-summand filtration reducing to it, with fixed inertia action `χ_i` on each graded piece. The filtration is unique; it descends along injective coefficient maps and is natural under coefficient change. This gives a local deformation problem. For the increasing flag convention, match `χ_j^univ` with `χ_{d−j}|_I`. The orientation of the cyclotomic-ratio exclusion is essential: replacing it by its inverse admits obstructed extensions.

The construction provides the following API.

- `OrdinaryFixedInertia`: The condition `𝒟_v` with its characters `χ_{v,i}`.
- `OrdinaryFixedInertia.filtration`: The filtration `Fil^i` of a lift in `𝒟_v`.
- `OrdinaryFixedInertia.filtration_unique`: Lemma 2.4.6(1).
- `OrdinaryFixedInertia.filtration_baseChange`: Lemma 2.4.6(2).
- `OrdinaryFixedInertia.isLocalDeformationProblem`: Lemma 2.4.6(3).
- `OrdinaryFixedInertia.ofPredicate`: Apply F.3.1's constructor with the stated residual
  filtration and character hypotheses. Expose the five closure theorems: invariance
  under strict conjugation by transporting the flag, coefficient change, injective
  descent of the unique flag, fibre-product gluing of the matching flags and detection
  along separated quotient limits, including `truncationLimit`. Freeness and the
  direct-summand property are retained in each comparison. This instance concerns the
  condition with fixed inertial characters in arbitrary rank.
- `OrdinaryFixedInertia.graded_character`: Inertia `σ` acts on `gr^i` by `χ_{v,i}(σ)`; in the decreasing flag `gr^{d−1}` is the stable subrepresentation.

**Checks.**

- For `n = 1`, `𝒟_v` is the lifts with inertial character `χ_{v,0}`.
- For `n=2` write `ρ̄=(χ̄₁ *;0 χ̄₀)` with `χ̄₁/χ̄₀ ≠ 1`,`ω`. The decreasing filtration has `Fil¹` equal to the unique line carrying the prescribed `χ̄₁`; its quotient carries `χ̄₀`.
- Over `ℚ_l`, `l>3`, residual `ω` on the subline and 1 on the quotient has `H²(k(ω))≠0`. It satisfies CHT's printed (2) but fails the corrected (2′) and smoothness.
- The lifts in `𝒟_v` are the lifts that admit `a` (unique, by Lemma 2.4.6) point of [1.9](#t1-9) over the point of `Λ_v` given by `χ_j^univ ↦ χ_{v,n−j}|_I`.

*Needs:* [1.1](#t1-1); [1.9](#t1-9).

(Sources: [CHT08], §2.4.2, the characters `χ_{v,i}`, p. 37; [CHT08], §2.4.2, `𝒟_v` and Lemma 2.4.6, p. 38.)

<a id="t6-4"></a>

### 6.4 Discrete series deformations away from `l` (CHT §2.4.5)

Let `d=mr` and fix a rank-`r` reference lift `r̃` with absolutely irreducible reduction, absolutely irreducible inertia constituents and `r̃⊗k≇(r̃⊗k)(i)` for `1≤i≤m`. The reference representation is induced from an unramified extension, and lifts with its inertia restriction are induced after a unique unramified twist; its inertia centralizer reduces surjectively. Define the discrete-series predicate on arbitrary coefficient representations by a decreasing direct-summand filtration with `gr^i≅gr⁰(i)` and `gr⁰|_I≅r̃|_I`. Its filtration is unique and coefficient compatible. For a fixed residual `ρ̄`, require a witness `IsDiscreteSeriesLift type ρ̄` before constructing the local deformation problem of its lifts. If this witness does not exist, reduction makes the condition empty over every coefficient object; it may have a zero condition quotient, but is not a `DeformationProblem` of F.3.1. For `r=1` it is the filtration version of Steinberg; its twist-separation hypothesis excludes `q≡±1 mod p` in rank two, unlike the Steinberg flat closure.

The construction provides the following API.

- `DiscreteSeriesType`: `(m, d, r̃_v)` with conditions (1)–(3).
- `IsDiscreteSeriesLift`: Definition 2.4.24: the filtration with `gr^i ≅ gr⁰(i)` and `gr⁰|_I ≅ r̃_v|_I ⊗ R`.
- `IsDiscreteSeriesLift.filtration_unique`: Lemma 2.4.25.
- `discreteSeriesDeformation`: Given `hρ̄ : IsDiscreteSeriesLift type ρ̄`, Lemma 2.4.26 constructs a local deformation problem of lifts of `ρ̄`.
- `DiscreteSeriesType.induced`: Lemma 2.4.23: `r̃_v ≅ Ind s_v`.
- `DiscreteSeriesType.filtration_baseChange`: Coefficient maps preserve the unique filtration, graded identifications and fixed prime-to-`p` inertia lift.

**Checks.**

- `r=1`, `d=m=n`, `r̃_v` trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues `α`, `qα`, …, `q^{n−1}α`.
- `m = 1`: lifts with `ρ|_I ≅ r̃_v|_I ⊗ R`, i.e. minimally ramified type `r̃_v`.
- If `q ≡ 1 mod l` (`l` the coefficient characteristic) then `k(1) ≅ k` and condition (3) fails for `i = 1`.
- `m=1`, `r=d=2` with `r̃_v` induced from the unramified quadratic extension (a supercuspidal type).
- For `K=ℚ₃`, `p=5`, `k=𝔽₅`, `r̃=1` and `d=m=2`, the reference twists have Frobenius values 3 and 4, so twist separation holds. But `ρ̄=1⊕1` has only trivial subquotients and cannot have `gr¹≅gr⁰(1)`. Its condition is empty and has no `discreteSeriesDeformation`.

*Needs:* [1.1](#t1-1); [2.5](#t2-5).

(Sources: [CHT08], §2.4.5, the set-up, p. 47, Definition 2.4.24 and Lemma 2.4.25, p. 49, Lemma 2.4.26, p. 50, and the standing residual hypothesis preceding Lemma 2.4.27, p. 51.)

<a id="t6-5"></a>

### 6.5 The `G`-valued ordinary flag scheme and the ordinary quotient `R^{△λ}`

Inside the fixed-extension semistable `G`-valued Hodge-type family, construct the closed Borel incidence locus imposing the prescribed inertia torus character. Include equations `ψ(t_σ)=ψ(χ_λ(σ))` for a character-lattice basis, as well as the root-space equations. Root equations alone see the torus only modulo the centre and fail for `GL₁`. The characteristic-zero image defines `R^{△λ}`; properness and the finite-local-`E`-algebra point criterion identify its points with `F′_v`-ordinary lifts. A Borel-valued representation with that torus restriction is semistable over `F′_v` of Hodge type `v_λ`. Keep dominant regularity for the unique-flag comparison.

The construction provides the following API.

- `gOrdinaryFlagScheme`: `𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄`.
- `gOrdinaryFlagScheme.isClosed`: `𝒢_λ` is a closed subscheme, with the ideal of (1) including the torus equations.
- `gOrdinaryFlagScheme.proper`: `𝒢_λ → Spec R^{□,v_λ}_ρ̄` is proper.
- `gOrdinaryRing`: `R^{△λ}_ρ̄`, the scheme-theoretic image of `𝒢_λ[1/p]`.
- `gOrdinaryRing_points`: Point criterion (3).
- `gOrdinaryRing.gl`: For `G = GL_n`, `R^{△λ}_ρ̄` is the weight-`λ` specialisation of [1.9](#t1-9)'s image ring, intersected with the Hodge type `v_λ`.
- `gOrdinaryFlagScheme.points`: Incidence points are lifts with Borel reductions satisfying root and torus equations; both pull back under coefficient maps, even for rootless `G`.

**Checks.**

- `G = GL₁`: `R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v})` up to the `p`-torsion-free generic fibre ([1.19](#t1-19)).
- For `GL₁` over `ℚ_p` with `λ=0` and `F′_v=F_v`, a nontrivial finite ramified character fails the condition, although every torus-valued representation is contained in a Borel. The equation `ρ|_I=χ_λ=1` cannot be omitted.
- For `GL₂` over `ℚ_p` and cocharacter `(1,0)`, (`ψ₁ε`,*;0,`ψ₂`) is semistable over `F′_v`; a Tate-curve extension can have `N≠0`.
- For `GL_d` and `F′_v=F_v`, apply the displayed cocharacter/highest-weight dictionary to recover the semistable-ordinary quotient's points.

*Needs:* [1.21](#t1-21); [3.11](#t3-11); [1.17](#t1-17); [0.3](#t0-3); [1.9](#t1-9).

(Sources: [FKP22], Lemma `B`.3, arXiv v5 p. 53; [FKP22], Lemma `B`.4 (1), arXiv v5 p. 54.)

<a id="t6-6"></a>

### 6.6 The two-dimensional ordinary ring of the trivial representation (Snowden)

For odd `p`, trivial rank-two residual data and `μ_p⊂K`, the fixed-determinant `ε⁻¹` semistable-ordinary weight-zero ring has integral dimension `[K:ℚ_p]+4` and exactly two components: crystalline and the extension component shaped (1,*;0,`ε⁻¹`). Each special-fibre generic point has a unique generic generalisation. Twisting by `ε` compares it with Snowden's ring. The `μ_p` hypothesis excludes `K=ℚ_p` for odd `p`.

*Needs:* [3.13](#t3-13); [3.14](#t3-14); [0.3](#t0-3).

(Sources: [CN23], Proposition 5.3.2, arXiv v3 pp. 75–76.)

<a id="t6-7"></a>

### 6.7 The ordinary ring with a Frobenius eigenvalue for trivial `ρ̄|G_p` (Calegari–Geraghty `R̃†`)

For `p≥3` and trivial rank-two residual data, choose weight `n≥2`, `χ=εω⁻¹≡1 mod ϖ`, and Frobenius `φ_p` with `χ(φ_p)=1`. Adjoin to the ordinary lift of determinant `χ^{n−1}` an eigenvalue `α≡1` for the unramified quotient. Define the ring by the inertia trace, ordered product and Frobenius compatibility equations listed below, then take its reduced flat form `R̃†`. Its image forgetting `α` is `R†`. With `β=α−1` and entries `φ_i` of `ρ(φ_p)−1`, the eigenvalue equation is `β²−(φ₁+φ₄)β−(φ₁+φ₄)=0`. Define the unramified quotient, its pullback, the kernel ideal `I` and doubling annihilator `J` in the original universal framed ring. Here `n` is a weight, not the matrix rank.

The light predicate `OrdinaryEigenvalueEquation t β` is `β²−tβ−t=0`. For `det Φ=1` and `t=tr Φ−2`, `ordinary_eigenvalue_equation_iff` says precisely that `α=1+β` is a characteristic-polynomial root. For scalar `Φ`, `β=0` works over `ℤ`, `β=3` also works over `ℤ/9` since `3²=0` there, and `β=1` over `ℤ/9` fails. Keeping `β` distinguishes the eigenvalue cover from its flag-forgetting image.

Write `Φ=ρ(φ_p)`, `G=ρ(g)`, `G′=ρ(g′)`, `c_g=χ^{n−1}(g)` for `g`,`g′` in inertia. Require the following equations for every such pair:

1. `det Φ=1` and `det(Φ−α)=0`.
2. `tr G=c_g+1`.
3. `(G−1)(G′−1)=(c_g−1)(G′−1)`.
4. `(G−1)(Φ−α)=(c_g−1)(Φ−α)`.
5. `(Φ−α)(G−1)=(α⁻¹−α)(G−1)`.

The entries of `Φ−1`, inertia-generator matrices minus one and `β` topologically generate the eigenvalue ring. The unramified quotient kills every entry of `ρ(g)−1` for `g` in inertia, and `R̃^{unr}=R̃†⊗_{R†}R^{unr}`. Define `I=ker(R^{univ}→R^{unr})` and `J=Ann_{R^{univ}}(R̃†/R†)`.


The construction provides the following API.

- `OrdinaryWithEigenvalue`: `R̃†` with the universal pair `(ρ, α)` satisfying (1)–(5).
- `OrdinaryWithEigenvalue.forget`: `R† → R̃†`, forgetting `α`; `R†` is the image.
- `OrdinaryWithEigenvalue.beta_relation`: `β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0`, `α = 1 + β`.
- `OrdinaryWithEigenvalue.unr`: `R^unr` and `R̃^unr = R̃† ⊗_{R†} R^unr`.
- `OrdinaryWithEigenvalue.unramifiedIdeal`: `I = ker(R^univ → R^unr)`.
- `OrdinaryWithEigenvalue.doublingIdeal`: `J = Ann_{R^univ}(R̃†/R†)`.
- `OrdinaryWithEigenvalue.hom_ext`: Maps from `R̃†` agree iff both `ρ` and `α` agree; maps from the image `R†` are determined by `ρ` alone.

**Checks.**

- For `𝒪=ℤ_3` and weight `n=2`, `χ` has image `1+3ℤ_3`, so `m=1`. The unramified quotient is `𝔽_3[[φ₁,…,φ₄]]/(φ₁+φ₄+φ₁φ₄−φ₂φ₃)`, rather than a flat `ℤ_3`-algebra.
- Specializing its Frobenius to `I` gives the eigenvalue algebra `𝔽_3[β]/(β²)`, free of rank two over `𝔽_3` with nonzero nilpotent `β`. It is not the product `𝔽_3×𝔽_3`; `α=1+β` retains the repeated-root direction.
- The unramified eigenvalue algebra is rank two as a module but has `ϖ`-power-torsion support. After inverting `p`, `I=J=(1)` and `R̃†=R†`.
- `R† ≠ R̃†`: the ring with an eigenvalue is not the image ring; their difference is measured by `J`.
- `α + α^{-1} = 2 + φ₁ + φ₄` in `R̃†`.

*Needs:* [1.9](#t1-9); [3.13](#t3-13); [1.10](#t1-10).

(Sources: [CG18], proof of Lemma 3.22, published pp. 336–337; [CG18], Definition 3.20, published p. 335; [CG18], Definition 3.21, published p. 335.)

<a id="t6-8"></a>

### 6.8 The relation "connects" between potentially crystalline lifts

For representations descending to integers of finite coefficient extensions, define `ρ₁∼ρ₂` by equivalent reductions, equal labelled Hodge types, potential crystallinity and membership in one geometric irreducible component of a common sufficiently-large-extension crystalline lifting ring. Away from `p` use the unrestricted geometric lifting ring. Strong connection additionally requires `ρ₁` on a unique component. Prove independence of the residual equivalence, coefficient splitting and sufficiently large extension, and conjugacy invariance. Connection is symmetric and is an equivalence relation on points lying on unique components; a common-component relation is not transitive at arbitrary component intersections.

The matrix-independent predicate `Connects x y` retains a common minimal prime `P` contained in both point kernels. The API `connects_trans_of_unique_component` gives transitivity when every minimal prime through the middle point is equal. The identity map of a field connects to itself, while the two projections of `E×E` to `E` do not connect; an intersection point of a node is the negative control for unconditional transitivity.

The construction provides the following API.

- `Connects`: `ρ₁ ∼ ρ₂`: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over `ℚ̄_l`.
- `Connects.symm`: `ρ₁ ∼ ρ₂` ⟹ `ρ₂ ∼ ρ₁`.
- `Connects.restrict`: `ρ₁ ∼ ρ₂` ⟹ `ρ₁|G_{K′} ∼ ρ₂|G_{K′}` for `K′/K` finite.
- `Connects.sum_tensor_dual`: ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.
- `Connects.symPow`: ∼ is compatible with `Sym^{n−1}` (components of these generic fibres are connected components and `Sym^{n−1}` induces a morphism of generic fibres).
- `Connects.trans_of_smooth`: On points lying on unique components, ∼ is transitive.

**Checks.**

- `n = 1`: `ψ₁ ∼ ψ₂` iff `ψ̄₁ = ψ̄₂` and `HT(ψ₁) = HT(ψ₂)` (crystalline characters).
- Two ordinary crystalline weight-0 lifts of the trivial representation connect ([6.25](#t6-25)).
- Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.
- `ρ₁ ∼ ρ₂` implies `ρ₁|G_{K′} ∼ ρ₂|G_{K′}`.

*Needs:* [3.4](#t3-4); [3.10](#t3-10); [3.7](#t3-7); [2.24](#t2-24).

(Sources: [BLGGT14], §1.3, p. 21, and §1.4, p. 26, arXiv `v4`.)

<a id="t6-9"></a>

### 6.9 `GL₃` eigenbasis charts and shapes of Kisin modules with tame descent

For unramified `K` of degree `f` and a 1-generic tame `GL₃` type, choose its lowest-alcove presentation `(s,μ)`, permutation order `r∈{1,2,3}`, `f′=fr`, the unramified `K′/K` and `L′=K′((-p)^{1/(p^{f′}−1)})`. Extend the height-bounded coefficient Kisin modules of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.2 and R07.4.36 over `𝔖_{L′,R}` by a semilinear `Gal(L′/K)`-action commuting with `φ`. Construct their coefficient-compatible étale descent and contravariant realization `T*_dd`, and prove the eigenbasis transformation law. The group action, its cocycle law and its commutation with Frobenius are part of the module data. The type condition on reduction modulo `u′` is `τ∨`; type `(η,τ)` realizes the original Galois representation with weights `{0,1,2}`.

Put `v=(u′)^{p^{f′}−1}`. The Kisin Frobenius matrix `C^{(j′)}` lies over the `u′` power-series ring, and the shifted-isotypic matrix `A^{(j)}` lies in `Mat₃(R[[v]])` after splitting the Witt coefficient factors. Their linearized Frobenius cokernels are killed by `E_{L′}(u′)^h=(v+p)^h`, as in `HasHeightLE`. They become invertible after localizing at that height polynomial. For the étale realization use `𝒪_{ℰ,K}=completion_p(W(k)[[v]][1/v])` and `𝒪_{ℰ,L′}=completion_p(W(k′)[[u′]][1/u′])`. For a complete local `R` define `𝒪_{ℰ,K,R}=𝒪_{ℰ,K}⊗̂_{ℤ_p}R` as the inverse limit of `((W(k)⊗R/𝔪_R^n)[[v]][1/v])`; use the analogous `u′` carrier for `L′`. The topology is the inverse-limit coefficient topology. A continuous local coefficient map induces maps on these limits, with identity, composition and Artinian reduction compatibility. The Kisin-to-étale map sends `v+p` to a unit in this completed carrier. In the descended basis the invertible étale Frobenius matrix is `A^{(j)}s_j* v^{μ_j*+η_j*}`, over the corresponding factor of `𝒪_{ℰ,K,R}`.

The representative `EtaleCoeffRing R I` is Mathlib's adic completion of `LaurentSeries R` at the extension of a coefficient ideal `I`. For a split coefficient factor use `I=𝔪_R`; `etale_height_factor_isUnit` makes `v+a` invertible for `a∈I`, and `laurent_height_factor_isUnit_of_nilpotent` gives its Artinian counterpart. Iwahori eigenbasis changes act on the power-series matrices by the prescribed twisted conjugation. Discrete shapes are Iwahori double cosets in `GL₃(k′((v)))` on residual field fibres, after principal-series base change when necessary. For 3-generic `τ` the shape attached to a residual representation is unique. Keep each stronger genericity hypothesis at its own theorem.

The construction provides the following API.

- `GL3KisinChart`: A rank-3 coefficient Kisin module with the tame descent datum of type `τ` constructed here, over `R` together with an eigenbasis: the data from which the partial Frobenius matrices are read.
- `GL3KisinChart.descentRealization`: `T*_dd` of the underlying module with tame descent, compatible with coefficient base change and the supplied étale `φ`-module realization after forgetting descent.
- `GL3KisinChart.frobMatrix`: `A^{(j)} ∈ Mat₃(R[[v]])` for `j ∈ ℤ/f`, the shifted-isotypic partial Frobenius matrix in the eigenbasis, with its height condition. Its image is invertible over the completed étale coefficient factor; the descended Frobenius is `A^{(j)}s_j* v^{μ_j*+η_j*}`.
- `GL3KisinChart.changeBasis`: Eigenbases differ by Iwahori tuples `I^{(j)}`; their matrices transform by LLHLM18 Proposition 2.15's `φ`-twisted conjugation, using `s_j* v^{μ_j*+η_j*}`.
- `GL3KisinChart.shape`: On residual field fibres, shape is the eigenbasis-independent Iwahori double coset of `A^{(j)}` in `GL₃(k′((v)))` for principal-series type; general types use unramified base change.
- `GL3KisinChart.unique`: For 3-generic `τ` the type-`(η,τ)` module realizing `ρ̄|_{G_{K∞}}` is unique when it exists, hence determines `w̃(ρ̄,τ)`.

**Checks.**

- For principal series, `Δ` has order `p^f−1`; each shifted isotypic piece has rank three over its `R[[v]]` coefficient factor, with the shifted three-element basis of LLHLM18 Lemma 2.9. The three eigenspaces modulo `u′` are rank-one with the prescribed distinct characters, and an eigenbasis adapts to the three characters.
- For `ρ̄ = T*_dd` of the semisimple Kisin module of shape `t_1` (`A^{(j)}` diagonal), the shape `w̃(ρ̄, τ)` is the identity at every `j`.
- `w̃(ρ̄, τ)` lies in `Adm^∨(η)` whenever `ρ̄` has a potentially crystalline lift of type `(η, τ)` (LLHLM Theorem 3.3.11).
- Trivial descent over `K` gives the supplied coefficient Kisin module and its étale realization; a semilinear group action that fails to commute with `φ` does not define a point, even when its underlying module has the correct height.
- For `R=k[x₀,x₁,…]` and the ideal `I=(x₀,x₁,…)`, which is not finitely generated, `v+x₀` is still a unit in `EtaleCoeffRing R I`: modulo the extended ideal's `n`-th power its inverse is `v⁻¹Σ_{j<n}(−v⁻¹x₀)^j`, compatibly in `n`.
- For 10-generic semisimple `ρ̄` and non-1-generic `τ`, `R^τ=0`. Dropping residual genericity fails: trivial residual data have trivial-type crystalline lifts.
- Rank one over `ℤ_p`: `v+p` is not a unit of `ℤ_p[[v]][1/v]`, since convergent evaluation at `v=−p` maps that ring to `ℚ_p` and kills `v+p`. Modulo `p^n` its inverse is `Σ_{i=0}^{n−1}(−p)^i v^{−i−1}`. These inverses are compatible and give a unit in the `p`-adic completed étale ring; their unbounded negative exponents exclude an ordinary Laurent-series inverse over `ℤ_p`.
- A coefficient map preserves each finite geometric inverse above and hence the inverse-limit unit. Reduction to `k′` gives `v`, whose residual matrix shape uses the usual `k′((v))`.

*Needs:* [1.2](#t1-2); [1.8](#t1-8); [3.1](#t3-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.2; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.36; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

(Sources: [LLHLM20], Definition 3.1.3, published p. 27; §3.2 and Proposition 3.2.1, arXiv v4 pp. 22–23; Definition 3.3.1, published p. 31. The height and eigenbasis matrices are LLHLM18 Definitions 2.3 and 2.11, Propositions 2.13 and 2.15, arXiv pp. 11, 14–15.)

<a id="t6-10"></a>

### 6.10 Unipotent lifting rings with monodromy bounded by a partition (Clozel–Thorne `R^m_v`)

For trivial residual rank `d` away from `p` and `q≡1 mod p`, let `R¹` classify unipotent inertia. For a partition `m` of `d`, impose that the arithmetic-Frobenius characteristic roots can be grouped into `q`-chains of lengths `m_i`, then take the maximal flat reduced quotient `R^m`. The one-part partition gives the Steinberg closure; all one-part-size-one chains give the reduced flat quotient of `R¹`, without asserting `R¹` itself reduced. Compare these ring-defined conditions with the local-deformation-problem interface.

The construction provides the following API.

- `partitionRing`: `R^m_v` for a partition `m` of `n`.
- `partitionRing_points`: `ℚ̄_l`-points of `R^m_v` are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in `Pol_n(m, q_v)`.
- `partitionRing_steinberg`: `R^{(n)}_v = R^St_v`.
- `partitionRing_trivial`: `R^{(1,…,1)}_v=(R^1_v)^{flat,red}`, the maximal reduced `𝒪`-flat quotient of `R^1_v`.
- `partitionRing_mono`: If `m′` is obtained from `m` by splitting consecutive `q`-chains, `Pol_d(m,q)⊆Pol_d(m′,q)`, inducing the surjection `R^{m′}↠R^m` compatible with the universal quotients. Partition dominance alone is insufficient.
- `partitionRing.coefficientMap`: Coefficient maps preserve unipotence, `q`-chain equations and points of the flat quotient, without prescribing the rank of `N`.

**Checks.**

- `m = (n)` gives `R^St_v` of [2.5](#t2-5).
- `m = (1, …, 1)` gives the maximal reduced `𝒪`-flat quotient of `R^1_v`.
- For `q=11`, `p=5` and trivial residual rank two, `Φ=I` and `σ=I` satisfy the `(1,1)` condition but not the characteristic-zero (2) condition: `44≠144`. The reduced flat unipotent ring surjects onto the Steinberg ring.
- `R^m_v` for `m = (2, 1)` is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain `α`, `q_vα`.
- `{1,q,q²,b}` for generic `b` has chains `(3,1)` but cannot be grouped as `(2,2)`, despite partition dominance.

*Needs:* [2.5](#t2-5); [2.15](#t2-15); [F.3.1](#local-deformation-problem).

(Sources: [CT17], §5.1, item 5, accepted manuscript p. 39.)

<a id="t6-11"></a>

### 6.11 Torsion crystalline representations with Hodge–Tate weights in `[a, b]`

For unramified `K/ℚ_p`, define a torsion module crystalline in `[a,b]` if it is a quotient of two stable lattices in a crystalline rational representation of those weights. A finitely generated `ℤ_p`-module has the condition when every quotient by `p^m` does; coefficient-`𝒪` modules use their underlying `ℤ_p`-module. A crystalline rational lattice gives this torsion condition. For `b−a≤p−2`, identify the torsion condition with the twisted Fontaine–Laffaille essential image using R07.3. The definition alone does not prove the converse that all these torsion quotients force the rational representation crystalline.

The construction provides the following API.

- `IsTorsionCrystalline`: `R` is a subquotient `R″/R′` of lattices in a crystalline representation with weights in `[a, b]`.
- `IsCrystallineIntegral`: `R` crystalline iff every `R/p^m R` is torsion crystalline.
- `IsTorsionCrystalline.closed`: For every fixed `[a,b]`, torsion crystalline objects are closed under subobjects, quotients and finite direct sums.
- `IsCrystallineIntegral.of_rational`: A lattice in a crystalline representation with weights in `[a, b]` is crystalline.
- `IsTorsionCrystalline.fontaineLaffaille`: For `b − a ≤ p − 2` these are the representations of Fontaine–Laffaille modules.
- `IsTorsionCrystalline.twist`: Tensoring by a crystalline character lattice of constant labelled weight `w` shifts `[a,b]` to `[a+w,b+w]`.

**Checks.**

- `μ_p ≅ ℤ/p(1)` is a quotient of the crystalline lattice `ℤ_p(1)`, of weight `+1` here, and is torsion crystalline in `[0,1]`. The interval `[−1,0]` in the source uses the opposite Hodge–Tate sign.
- `ℤ/p^m` with trivial action is torsion crystalline with weights in `[0, 0]`.
- At width `p−1` integral Fontaine–Laffaille full faithfulness can fail; crystalline lattice-subquotient closure still holds.
- A `Γ`-stable lattice in a crystalline representation is crystalline in the sense of (2).

*Needs:* [1.6](#t1-6); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.3.12; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.12–R07.3.17.

(Sources: [LTXZZ], Definition 2.2.4, published pp. 124–125.)

<a id="t6-12"></a>

### 6.12 Geraghty's fixed-weight ordinary rings: components, connected fibres and irreducibility

For dominant `λ`, the flag image in the semistable or crystalline Hodge ring has exactly the ordinary weight-`λ` finite-local-`E`-algebra points and is a union of ambient components. For trivial residual data, variable-weight characteristic-zero fibres are connected and every nonzero fixed-weight ordinary crystalline ring is irreducible.

*Needs:* [1.9](#t1-9); [6.1](#t6-1); [1.7](#t1-7); [3.4](#t3-4); [3.9](#t3-9); [3.10](#t3-10).

(Sources: [Geraghty], Lemma 3.10 (preprint Lemma 3.3.3, p. 37); [Geraghty], Lemmas 3.13–3.14 (preprint Lemmas 3.4.2–3.4.3, pp. 38–39).)

<a id="t6-13"></a>

### 6.13 Ordinary deformations with fixed inertial characters are formally smooth (CHT Lemmas 2.4.7–2.4.8)

Under that decreasing-filtration ratio hypothesis, every lift across a small extension exists. The fixed-inertia framed ring is formally smooth of relative dimension `d²+fd(d−1)/2`, and `dim L−h⁰(ad ρ̄)=fd(d−1)/2`. The same count occurs for regular Fontaine–Laffaille deformations, but the two conditions are defined by different functors.

*Needs:* [6.3](#t6-3); [1.1](#t1-1); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [CHT08], §2.4.2, proof of Lemma 2.4.7, p. 39; [CHT08], §2.4.2, proof of Lemma 2.4.8, p. 40.)

<a id="t6-14"></a>

### 6.14 The Siegel-ordinary `GSp₄` condition at `p` with fixed multiplier (Calegari–Geraghty)

For `p>2`, `a≥2` and the specified `GSp₄` residual shape of multiplier `ε̄^{1−a}`, require `(α²−1)(β²−1)(α²β²−1)(α−β)≠0`. A lift stabilizes a Lagrangian plane which is the sum of two unramified characters `χ_αψ⁻¹`,`χ_βψ⁻¹`; its quotient has characters `ε^{1−a}χ_β⁻¹ψ`,`ε^{1−a}χ_α⁻¹ψ`, with `ψ` unramified and residually trivial. The `(1,2)` and `(3,4)` entries vanish. Define `L′` as the kernel `H¹(𝔟⁰)→H¹(I,𝔟⁰/𝔲)` and `L` as its image in `H¹(ad⁰)`, where `𝔲` is the three-dimensional Siegel unipotent radical. This nonregular-weight Siegel condition is stronger than full-flag ordinarity.

The construction provides the following API.

- `GSp4.SiegelOrdinary`: The local deformation problem of Siegel-ordinary lifts with multiplier `ε^{−(a−1)}`.
- `GSp4.SiegelOrdinary.plane`: The stable unramified Lagrangian plane of a lift in the condition.
- `GSp4.SiegelOrdinary.plane_unique`: Under the genericity condition the plane is unique and lifts the residual one.
- `GSp4.SiegelOrdinary.tangent`: The tangent space of the condition is `L_p ⊂ H¹(G_p, ad⁰r̄)`.
- `GSp4.SiegelOrdinary.isOrdinary`: Every lift in the condition is `G`-ordinary of the corresponding (non-regular) weight in the sense of [1.21](#t1-21) with the Siegel parabolic.
- `SiegelOrdinary.baseChange`: Coefficient maps preserve the stable unramified Lagrangian plane and multiplier; uniqueness identifies the pulled-back plane.

**Checks.**

- `dim u = 3` (root spaces `(1,4)`, `(2,3)` and `(1,3)` ~ `(2,4)` in `sp₄`).
- A ramified nonsplit extension on the Lagrangian quotient plane fails unramified-plane ordinarity; an unramified extension may be conjugate to split form.
- For `R = k` the condition is the residual shape itself.
- Every lift in the condition has multiplier `ε^{−(a−1)}`: `(χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}`.

*Needs:* [1.17](#t1-17); [1.7](#t1-7); [6.3](#t6-3).

(Sources: [CG20], Definition 4.6 (6), published p. 815; [CG20], §4, the definition of `L′_p`, published p. 816.)

<a id="t6-15"></a>

### 6.15 The `GL₂` ordinary ring `R^{B₂}`: irreducible generic fibre and explicit presentations

For `p>2` and residual (`λ_ᾱ`,*;0,`ε̄⁻¹λ_ᾱ⁻¹`), fix determinant `ε⁻¹` and the universal inertial character over `𝒪[[1+pℤ_p]]`. The fully framed ordinary ring `R^{B₂}` has irreducible generic fibre of dimension five and is formally smooth over `𝒪` of that relative dimension when `H²=0`. `H²` is one precisely for `ᾱ²=1` and zero extension class, and zero otherwise. The partially `B₂`-framed chart `R^{B₂,◹}` is a flat complete intersection of relative dimension four, with the four explicit presentation cases below; a choice of flag splitting gives `R^{B₂}≅R^{B₂,◹}[[u]]`. The points nonsmooth over weight space are, up to unramified twist, crystalline extensions of `ε⁻¹` by 1.

For the `B₂`-framed calculation, use `y₁`,`y₂` from the rank-one character ring, `x_i` for framing and `z_i` for extensions. The residual character parameter is `γ` and the extension class is `η∈H¹(ℚ_p,ε̄λ_γ²)`.

| Residual case | `B₂`-framed ring or relation |
|---|---|
| `γ²≠1`, `η≠0` | `𝒪[[x₁,x₂,y₁,y₂]]` |
| `γ²≠1`, `η=0` | `𝒪[[x₁,z₁,y₁,y₂]]` |
| `γ²=1`, `η≠0` | `𝒪[[x₁,x₂,z₁,y₁,y₂]]/(g_η)`, with `g_η≡c_ηy₁+d_ηy₂ mod (ϖ,𝔪²)` |
| `γ²=1`, `η=0` | `𝒪[[x₁,z₁,z₂,y₁,y₂]]/(g)`, with `g≡z₁y₁+z₂y₂ mod (ϖ,𝔪³)` |

In the third row `[c_η:d_η]` depends only on `η` and `c_η=0` exactly for peu-ramification; the ring is smooth over `𝒪` but smooth over `Λ` only outside that peu branch. The last row is not smooth modulo `ϖ`. Full framing adds one variable. These congruences specify the initial terms of the relations; they do not identify an arbitrary chosen higher-order polynomial with the deformation equation.

**Checks.**

- The first two rows have four variables and no relation; full framing gives five variables.
- In the third row the nonzero linear term makes the chart smooth over `𝒪`, while the peu-ramifiée case still fails smoothness over `Λ`.
- At the residual origin in the last row the special-fibre tangent dimension is five and its dimension is four; its quadratic initial relation prevents formal smoothness.

*Needs:* [6.3](#t6-3); [1.19](#t1-19); [1.18](#t1-18); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGP21], Lemma 7.3.6, arXiv v3 p. 174; Lemma 7.3.7(1)–(4), p. 177; Lemma 7.3.9, p. 179.)

<a id="t6-16"></a>

### 6.16 Discrete series deformations are formally smooth of relative dimension `n²` (CHT Lemmas 2.4.27–2.4.30)

For the reference type of 6.4 and a witness `hρ̄ : IsDiscreteSeriesLift type ρ̄`, the resulting discrete-series lifting problem is liftable and its framed ring is formally smooth of relative dimension `d²`. Its tangent dimension is `h⁰(ad ρ̄)`. For rank-one reference type and `p∤d`, identify the tangent as the unramified scalar `H¹` plus the kernel of `H¹(ad⁰)→H¹(ad/Fil¹ad)`. This direct-sum description uses the scalar/trace-zero splitting; when `p|d` the liftability and dimension assertions still apply, but the tangent is kept as a subspace of `H¹(ad)`. In the induction proof the rank of the last graded piece is `r`, and the dimension identity is `r(d−r)+(d−r)²+(r²−1)+r(d−r)+1=d²`.

**Checks.**

- A compatible rank-two residual filtration with rank-one reference type gives framed relative dimension four.
- For `K=ℚ₃`, `p=5`, `r̃=1` and `ρ̄=1⊕1`, the missing residual cyclotomic filtration makes the condition empty, so there is no smooth relative-dimension-four representing ring.
- The induction with `m=1`, hence `r=d`, gives `(d²−1)+1=d²`; the residual witness still fixes the required inertia type.

*Needs:* [6.4](#t6-4); [1.1](#t1-1); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [CHT08], §2.4.5, Lemma 2.4.27, p. 51; [CHT08], §2.4.5, proof of Lemma 2.4.28, p. 52; [CHT08], §2.4.5, Lemma 2.4.30, p. 53.)

<a id="t6-17"></a>

### 6.17 The `G`-valued ordinary locus is a union of components

For dominant regular `λ` and the preceding fixed-extension ordinary quotient, its generic fibre is a union of components of the ambient `G`-valued semistable ring. It has dense regular open and every component has dimension `dim G+[K:ℚ_p]dim Fl_G`. Fixing a compatible quotient representation into `G/G^der`, with `G^der=(G⁰)^der`, replaces `dim G` by `dim G^der`.

*Needs:* [6.5](#t6-5); [3.11](#t3-11); [1.18](#t1-18); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [FKP22], Lemma `B`.4 (2)–(3), arXiv v5 pp. 54–55; [BCG25], proof of Theorem 2.1, arXiv v3 p. 6.)

<a id="t6-18"></a>

### 6.18 `R̃†` is a normal Cohen–Macaulay domain of relative dimension 4 and type 3

The ordinary eigenvalue ring `R̃†` is a normal Cohen–Macaulay domain of relative dimension four, with normal Cohen–Macaulay special fibre of dimension four and type three, hence not Gorenstein. Its eight-variable special-fibre presentation and six-variable quotient by `β` are specified below. The latter has dimension three, associated graded completion and Hilbert series beginning `1+6t+15t²`. Three degree-one generators form a regular sequence exactly when their quotient has Hilbert series `1+3t`. The sequence `β`,`a`,`φ₂+φ₃`,`b+c+φ₁` leaves `k[x,y,z]/(x,y,z)²`, proving the canonical-module generator count three.

Use the following explicit special-fibre presentation. Set `A=k[[a,b,c,φ₁,φ₂,φ₃,φ₄,β]]` modulo

- `φ₁+φ₄+φ₁φ₄−φ₂φ₃`;
- `β²−(φ₁+φ₄)β−(φ₁+φ₄)`;
- `aφ₁+bφ₃−aβ` and `aφ₂+bφ₄−bβ`;
- `−aφ₃+cφ₁−cβ` and `aφ₄−cφ₂−aβ`;
- `a²+bc`.

Then `A` is the completion at `(1,1;0)` of Snowden's `B₁`. Eliminating `β` and `φ₄` gives `B=A/(β)=k[[a,b,c,φ₁,φ₂,φ₃]]` modulo `−φ₁²−φ₂φ₃`, `aφ₁+bφ₃`, `aφ₂−bφ₁`, `−aφ₃+cφ₁`, `−aφ₁−cφ₂`, `a²+bc`. Compute the regular-sequence quotient and Hilbert functions in this presentation, before lifting the Cohen–Macaulay and canonical-module statements integrally.


*Needs:* [0.1](#t0-1); [6.7](#t6-7); [F.0.1](#completed-coefficient-products).

(Sources: [CG18], Theorem 4.3, published p. 356; [CG18], Lemma 4.7, published p. 360; [CG18], Lemma 4.5, published p. 358.)

<a id="t6-19"></a>

### 6.19 The induced local models `ρ_{n,m,0}`

For `p>`nm, choose the conjugate Lubin–Tate characters `ε₂`,`ε′₂` of `ℚ_{p²}`, trivial on the uniformizer under geometric reciprocity and with `ε₂ε′₂=ε⁻¹`. Put `ρ_{n,m,0}=⊕_{i=1}^n ε₂^{m(n−i)}(ε′₂)^{m(i−1)}`. Its labelled weights here are 0,`−m`,…,`−(n−1)m`. `Sym^{n−1}ρ_{2,m,0}=ρ_{n,m,0}` and `ρ_{n,m,0}⊗ρ_{m,1,0}=ρ_{nm,1,0}`. Over an unramified extension, matching residual inertia for a crystalline lift of this Hodge type gives residual equality after further unramified extension, then connection to the model on each extension with that equality.

The construction provides the following API.

- `rhoNM0`: `ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}`.
- `rhoNM0.hodgeTate`: `HT_τ(ρ_{n,m,0})={0,−m,…,−(n−1)m}` at each embedding in `HT(ε)=+1` convention; the source uses the opposite signs.
- `rhoNM0.symPow`: `Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}`.
- `rhoNM0.tensor`: `ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}`.
- `rhoNM0.connects`: Crystalline lifts of `ρ̄_{n,m,0}` with the same weights connect to `ρ_{n,m,0}` after an unramified extension.
- `rhoNM0.rank_one`: For `n=1` the sole summand has exponents zero, so `ρ_{1,m,0}` is the trivial character for every allowed `m`.

**Checks.**

- `n = 1`: `ρ_{1,m,0}` is the trivial character.
- `det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}`.
- `ρ_{3,2,0}` has weights `{0,−2,−4}` here, equivalently `{0,2,4}` in the source convention.
- `p>`dm gives the uniform Fontaine–Laffaille range; failure of this bound alone says nothing about an individual weight multiset.

*Needs:* [6.8](#t6-8); [1.13](#t1-13); `ArithmeticGaloisRepresentations`, §2.3 (Characters of inertia); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGNT25], Definition 5.1.1, arXiv p. 49; [BCGNT25], Lemma 5.1.3, arXiv p. 49.)

<a id="t6-20"></a>

### 6.20 Semisimple Kisin modules and the shapes of potentially crystalline lifts

A semisimple Kisin module has the explicit shape normal form and a semisimple `G_{K∞}` realization, with inertia computable from its étale `φ`-module. Semisimple residual representations have matching inertia exactly when their restrictions arise from semisimple modules of the same shape. Potentially crystalline liftability passes to semisimplification after coefficient extension. For an effective Hodge type, liftability gives an admissible shape when `τ` is regular principal series or `λ=η` and `τ` is 3-generic; `η` means actual weights `{0,1,2}`. Conversely a semisimple `ρ̄` arising from a module admits a semisimple model after residue extension if `ρ̄` is a sum of characters or `λ=η` with 3-generic `τ`; in the latter case uniqueness avoids residue extension.

*Needs:* [6.9](#t6-9); [3.4](#t3-4).

(Sources: [LLHLM20], Theorem 3.3.11, published p. 33; [LLHLM20], Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorem 3.3.12, arXiv v4 pp. 24–27.)

<a id="t6-21"></a>

### 6.21 Explicit `GL₃` rings for shapes of length two, three and four (LLHLM Tables 3–4)

The displayed matrices and equations define abstract completed polynomial quotients once the constants and residual unit coordinates are specified. Their local identification with length-at-least-two deformation charts assumes `p>3`, unramified `K/ℚ_p` of degree `f`, continuous semisimple `ρ̄`, and a 5-generic tame type `τ` with lowest-alcove presentation `(s,ν)`. Require the inertia identity `V(ρ̄|I_K)=R_{s w̃*}(ν+η)` of LLHLM20 Lemma 3.5.4, with admissible shape `w̃=(w̃_j)` and `ℓ(w̃_j)>1` at every embedding. Here `V` attaches to semisimple residual inertia its characteristic-zero representation of `GL₃(k_K)`, and `R_s` denotes the Deligne–Lusztig representation, as in LLHLM20 §2.2. The unique residual Kisin module of type `(η,τ)` is then semisimple; the actual weights are `{0,1,2}`. Identify the monodromy quotients with the deformation charts via the formally smooth gauge/framing comparisons, rather than identifying rings of different dimensions. This local theorem retains its 5-generic scope independently of patching, as in 6.30.

For the weight labels, canonical minimal-prime assignment and minimal-type matching of Tables 3–4, assume in addition that `ρ̄` is 10-generic and `R^τ_{ρ̄}≠0`, the scope of LLHLM20 §3.6.1; thus `τ` is 7-generic. In this scope use the length-two/three shape presentations and minimal-prime generators below, up to the outer affine-Weyl automorphisms. Keep the Table `3/4` indexing: a type written `τ(s,μ)` has lowest-alcove parameter `μ−η`, and the row for `w_{f−1−i}` uses `s_i⁻¹μ_i`. Unit coordinates `c*` are expanded about their chosen residual values. The listed ideals are primes in the presented quotient. The length-three rows have two components and the length-two rows four; the minimal-type length-four rows are smooth, and the length-three minimal-type rows are two-factor hypersurfaces. The abstract equations alone carry no assertion of primeness or weight matching outside these hypotheses.

The coordinate data below specify the matrices, relation ideals, weight labels and minimal-type matching elements. Each starred coordinate is a unit in its completed chart. The length-four auxiliary-lift theorem of 6.30 retains its own 6-generic semisimple residual hypotheses.

- **`βαγ`**. `A = (v c11, v c*12, 0; v² c*21, v c22, 0; v(c31 + v d31), v c32, c*33)`; relations `c11 c22 = 0`, `(−1 − a + c) c*12 c31 − (−1 − b + c) c32 c11 = 0`; primes `(ε1+ε2, 0)`: `(c11)`, `z̃* = βγ⁺β`; `(ε2, 1)`: `(c22)`, `z̃* = α`.

- **`αβγ`**. `A = (v² c*11, 0, 0; v(c21 + v d21), c22, c*23; v(c21 c33 (c*23)^{−1} + v d31), v c*32, c33)`; relations `c22 c33 = 0`, `(−1 − a + c) c21 c*32 + (b − c) d31 c22 = 0`; primes `(ε1+ε2, 0)`: `(c22)`, `αγ⁺α`; `(ε1, 1)`: `(c33)`, `β`.

- **`αβα`**. `A = (c11, c11 c32 (c*31)^{−1}, d33 c11 (c*31)^{−1} + v c*13; 0, v c*22, v c23; v c*31, v c32, v d33)`; relation `c11((a − b) c23 c32 − (a − c) c*22 d33) = 0`; primes `(0, 0)`: `(c11)`, `γ⁺`; `(0, 1)`: `((a − b) c23 c32 − (a − c) c*22 d33)`, `id`.

- **`αβ`**. `A = (c31 c12 (c*32)^{−1}, c12, c13 + v c*13; v c*21, c22, c23 + v d23; v c31, v c*32, c31 c23 (c*21)^{−1} + v d33)`; relations (3.14): `c12 c23 − c22 c13 = 0`, `c22 c31 = 0`, `c*32 c13 − d33 c12 = 0`, `c12((b − c) d33 c*21 + (a − b) c31 d23) = 0`, `(−1 − a + c) c23 c*32 = (−1 − a + b) c22 d33`; primes `(ε1, 1)`: `(c12, c31)`, `γ⁺β`; `(ε1 − ε2, 0)`: `(c31, d33)`, `βγ⁺αβ`; `(0, 0)`: `(c12, c22)`, `αγ⁺`; `(0, 1)`: `(c22, (b − c) d33 c*21 + (a − b) c31 d23)`, `α`.

- **`βα`**. `A = (c11, (c*31)^{−1} c11 c32 + v c*12, c13; 0, v d22, v c*23; v c*31, v c32, c33 + v d33)`; relations `c11 c33 = 0`, `d22(c13 c*31 − c11 d33) = 0`, `c11((a − b) c32 c*23 − (a − c) d22 d33) = 0`, `(1 + a − c) c33 c*23 c*12 = c13((a − b) c32 c*23 − (a − c) d22 d33)`; primes `(ε2, 1)`: `(d22, c11)`, `γ⁺α`; `(ε2 − ε1, 0)`: `(d22, c32)`, `αγ⁺βα`; `(0, 0)`: `(c11, c13)`, `βγ⁺`; `(0, 1)`: `((a − b) c32 c*23 − (a − c) d22 d33, c13 c*31 − c11 d33)`, `β`.

The intersection ideals `𝔴_ω = 𝔠_{(ω,0)} ∩ 𝔠_{(ω,1)}` of the second part of Table 3 are `(c22)` for `αβ` and `(c13 c*31 − c11 d33)` for `βα`.

For the minimal-type shapes `w̃′` (Table 4, structure constants `(a′, b′, c′) ≡ z̃_{f−1−i}(a, b, c)`): `αβαγ`, `βγβα` and `αγαβ` give power series rings in their entries; `βγαγ`, `γαβα` and `αβγβ` each have one relation, `(−1 − b′ + c′) c′32 c′*11 − (−1 − a′ + c′) c′12 c′31 = 0`, `(a′ − c′) c′13 c′*22 − (a′ − b′) c′23 c′12 = 0` and `(−1 − a′ + b′) c′21 c′*33 − (b′ − c′) c′31 c′23 = 0` respectively, solvable for one variable, so the ring is again a power series ring; the length-three shapes `αβα`, `βγβ` and `γαγ` have the relations `c′11((a′ − b′) c′23 c′32 − (a′ − c′) c′*22 d′33) = 0`, `c′22((b′ − c′) c′31 c′13 − (−1 − a′ + b′) c′*33 d′11) = 0` and `c′33((−1 − a′ + c′) c′12 c′21 − (−1 − b′ + c′) c′*11 d′22) = 0`, each with two minimal primes.


The `αβ` relations use (3.14), rather than the conflicting sign in the compressed table. The `γαγ` coefficient `−1−b′+c′` is fixed by the matching calculation in §3.6.2, arXiv v4 p. 47: substitute `(a′,b′,c′)=(b,c−1,a+1)`, `c′33=c31`, `c′12=c13`, `c′21=d22`, `c′*11=c*12` and `d′22=c23`. Up to an overall minus sign the displayed relation becomes `c31((a−b)c13d22+(−1−a+c)c*12c23)`, exactly the quotient relation on that page. The printed `1−b′+c′` would differ by `2c′33c′*11d′22` and does not give that matching.

**Checks.**

- Setting `c′33=0` makes the `γαγ` relation zero, retaining its first component regardless of the second factor.
- Over `𝔽_79[[T]]`, set `(a′,b′,c′)=(24,12,0)`, `c′12=c′21=T`, `c′*11=1`, `d′22=8T²` and `c′33=T`. The second factor is `−25T²+13·8T²=79T²=0`. The incorrect coefficient `1−b′+c′` gives `63T²` instead, hence a nonzero relation `63T³`.
- For the same constants, set `c′12=c′21=d′22=T` and `c′33=0`. The second factor `−25T²+13T` is nonzero although the full relation vanishes. Replacing the product equation by only its second factor would remove the first component.
- A 5-generic type with semisimple residual data, the stated inertia identity and all shape lengths at least two has the local presentation and component count `Π_j2^{4−ℓ(w̃_j)}`, without a 10-generic residual hypothesis. Uniqueness of a module for a merely 3-generic type does not supply this presentation theorem.
- If an abstract `αβα` quotient is specialized to `a=b=c`, its displayed relation vanishes identically. Its two named factors therefore do not define the asserted pair of minimal primes; specifying a polynomial quotient alone cannot extend the generic component assertion to arbitrary constants.


*Needs:* [6.9](#t6-9); [1.1](#t1-1).

(Sources: [LLHLM18], §5.3, arXiv v3 pp. 55–56, and §6; [LLHLM20], Lemma 3.5.4, arXiv v4 pp. 29–30, and §3.6.1, pp. 36–39; [LLHLM20], Table 3, published p. 51 (arXiv v4 p. 53), and its second part, published p. 52 (arXiv v4 p. 54); [LLHLM20], §3.6.2, (3.14), arXiv v4 p. 43; [LLHLM20], Table 4, published p. 60 (arXiv v4 p. 55).)

<a id="t6-22"></a>

### 6.22 Smooth pure points of partition rings and their minimal primes

At a pure closed characteristic-zero point of `R^m`, the unipotent generic lifting space is formally smooth and the point lies on a unique component. Its unique minimal prime contains the kernel of `R¹→R^m`. This transfers the partition condition to that component; the purity hypothesis prevents an ambiguous intersection-point comparison.

*Needs:* [6.10](#t6-10); [1.22](#t1-22); [2.15](#t2-15).

(Sources: [CT17], Lemma 5.2, accepted manuscript p. 39.)

<a id="t6-23"></a>

### 6.23 Rank-`n` conditions away from `p`: the interface with Layer 2

Export the same minimal, Steinberg, full-type, Ihara and discrete-series objects already defined above, together with the partition generalization. Their consumers are GlobalGaloisDeformations `G7` and PotentialAutomorphyInfrastructure PA.3; the scoped arithmetic patched-module construction is 6.30; the general global patched-complex programme has no prerequisite role here. Keep the unique-component hypothesis when comparing full inertia type including `N` on a common component.

*Needs:* [2.8](#t2-8); [2.21](#t2-21); [2.26](#t2-26); [6.10](#t6-10); [2.24](#t2-24); [2.15](#t2-15); [2.29](#t2-29); [6.4](#t6-4).

(Sources: [CT17], §5.1, accepted manuscript p. 39.)

<a id="t6-24"></a>

### 6.24 The flag image ring for trivial residual representation

Assume `ρ̄=1`, `f=[K:ℚ_p]>d(d−1)/2+1`, and `E` contains the values of every character of the `p`-power torsion subgroup of `𝒪_K×(p)`. Thus the torsion-character components are split over `E`. For each minimal prime `Q` of `Λ_v` the flag scheme over `Λ_v/Q` is flat integral of dimension `1+d²+fd(d+1)/2`, and its reduction modulo the uniformizer is integral. Its image `R△` is already flat and reduced. For integral `R∈C_𝒪`, a lift factors through `R△` iff over an algebraic closure of `Frac R` it admits the ordered universal-inertia flag. For odd `p`, over distinct inertia characters the incidence projection is an isomorphism. For odd `p` and pairwise distinct specialised characters, fibres over characteristic-zero weight points are geometrically connected with dimension at most `fd(d−1)/2+d²+d(d−1)/2`; excluding cyclotomic ratios makes them regular of dimension `fd(d−1)/2+d²` and the ambient point regular of dimension `fd(d+1)/2+d²`. Each `R△/Q` is geometrically irreducible, with generically reduced special fibre, and components correspond bijectively to those of `Λ_v`. At `p=2` use only the extended flatness and component-correspondence clauses cited by BCGP25.

**Checks.**

- On a split torsion-character component `Λ_v/Q` is a power-series ring over `𝒪`; its uniformizer fibre is integral.
- For `d=1`, `p=3`, `K/ℚ₃(ζ₃)` unramified quadratic and `E=ℚ₃`, the cyclotomic component of `Λ_v` is `ℤ₃[ζ₃][[T₁,T₂,T₃,T₄]]`, of dimension five. Modulo 3, `ζ₃−1` is nonzero and square-zero, so the unsplit special fibre is not integral.
- After `E` contains `ζ₃` the two generic torsion characters split; each selected flat component has integral uniformizer fibre. The coefficient extension and component selection are those of 1.12.

*Needs:* [1.9](#t1-9); [1.4](#t1-4); [6.1](#t6-1); [6.12](#t6-12); [1.3](#t1-3); [1.12](#t1-12).

(Sources: [ACC+], §6.2.6, Proposition 6.2.10, p. 139; [BCGP25], Proposition 5.6.6 (3) and Remark 5.6.7, arXiv v1 p. 129; [THORNE15], Lemma 3.11, Corollary 3.12, Lemma 3.13, Proposition 3.14, pp. 16–17.)

<a id="t6-25"></a>

### 6.25 Connectedness results for crystalline weight-zero lifts

Ordinary crystalline weight-zero lifts of trivial residual data connect through the irreducible ordinary crystalline ring. For any fixed crystalline weight-zero `ρ`, sufficiently close crystalline weight-zero lifts connect to it. In the source `HT(ε)=−1` convention, weights 0,…,`d−1` are ordinary exactly when `φ^f` Frobenius valuations are 0,`f`,…,`(d−1)f`, normalized by `v(p)=1`; here the `HT` weights have opposite signs. Symmetric powers and tensor products retain crystalline ordinary flags when the resulting labelled weights are distinct and have one compatible ordering at all embeddings; repeated weights do not satisfy the regular condition automatically.

*Needs:* [6.8](#t6-8); [3.13](#t3-13); [3.10](#t3-10); [1.7](#t1-7); [6.12](#t6-12).

(Sources: [BCGNT25], Lemma 5.1.4, arXiv p. 50; [BCGNT25], Lemma 5.1.5, arXiv p. 50; [BCGNT25], Proposition 4.2.5(2) and its proof, arXiv pp. 42–43; [Geraghty], Lemma 2.32 (preprint Lemma 2.7.7, pp. 27–28).)

<a id="t6-26"></a>

### 6.26 Tangent dimension of the Siegel-ordinary condition and its comparison with finite flatness

The quotient `𝔟⁰/𝔲` has characters 1,1,`λ(α)λ(β)⁻¹`; `𝔲` has `λ(α²)ε̄^{a−1}`,`λ(β²)ε̄^{a−1}`,`λ(αβ)ε̄^{a−1}`. The standing nonvanishing hypotheses give `h⁰(𝔲)=h²(𝔲)=0`, `h¹(𝔲)=3`, `h⁰(ad⁰/𝔟⁰)=0`, the required `H¹` surjection and injection, and `dim L−h⁰(ad⁰)=3`. At `a=2` this condition is equivalent to finite flatness of the dual `r∨≅r⊗ε`, not of the original normalization without twisting.

*Needs:* [6.14](#t6-14); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [CG20], Lemma 4.8 and its proof, published pp. 816–817; [CG20], Remark 4.7, published p. 816.)

<a id="t6-27"></a>

### 6.27 `p`-distinguished weight-two ordinary `GSp₄` conditions (`B`- and `P`-ordinary)

Over `ℚ_p` with `p>2` and distinguished weight-two residual ordered unramified characters `ᾱ≠β̄`, construct the two Borel conditions distinguished by the first character `ᾱ` or `β̄` over the two-variable weight algebra. On the one-variable diagonal-weight algebra require both orderings: this gives the subgroup `P` with zero `(1,2)`,`(3,4)` entries and scalar inertia on the Lagrangian plane. `P` is the six-dimensional torus times Siegel unipotent radical, not the full Siegel parabolic. Give the ordinary lifting rings and the `B/P`-framed comparisons. These semistable ordinary lifts need not be crystalline.

The construction provides the following API.

- `GSp4.IsPDistinguishedOrdinary`: The residual and lifted `p`-distinguished weight-2 ordinary shapes.
- `GSp4.BorelOrdinary`: `𝒟^{B,𝔠̄}_v` over `Λ_{v,2}`, represented by `R^{B,𝔠̄}_v`.
- `GSp4.ParabolicOrdinary`: `𝒟^P_v` over `Λ_{v,1}`, represented by `R^P_v`.
- `GSp4.partiallyFramed`: `R^B` and `R^P` are formally smooth over the `B`- and `P`-framed rings `R^{B,◹}`, `R^{P,◹}` (BCGP21 Lemma 7.3.12).
- `GSp4.BorelOrdinary.semistable`: The weight-two arithmetic finite-flat flag criterion gives semistability at that specialization.
- `ParabolicOrdinary.iff_bothBorel`: After `θ₁=θ₂`, `P`-ordinarity is equivalent to both Borel orderings. Each single diagonal-weight Borel condition has generic dimension 15; their `P`-ordinary intersection has dimension 14.

**Checks.**

- `Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧` for `p > 2`.
- `ᾱ = β̄` is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.
- When `α²=1`, the Kummer class of `p` gives a `p`-distinguished weight-two ordinary extension on the first/fourth subquotient that is semistable and noncrystalline.
- A ramified nonsplit `Fil₂` cannot satisfy both Borel orderings; satisfying one ordering alone does not give `P`-ordinarity.
- For `p`-distinguished `ρ̄` the flag-incidence map of [6.29](#t6-29) is a closed immersion with image `R^{B,𝔠̄}_v`.

*Needs:* [6.14](#t6-14); [1.17](#t1-17); [6.3](#t6-3); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGP21], Definition 7.3.1, arXiv v3 p. 172.)

<a id="t6-28"></a>

### 6.28 Explicit rings `R^{expl,∇}` and the comparison diagram (3.9)

Construct the gauge-basis deformation chart and its monodromy quotient `R̄^{expl,∇}=⊗̂_i R̄^{expl,∇}_{w_i}` for type `(η,τ)`, with actual weights `{0,1,2}` and the completed étale coefficient carrier of 6.9. For 10-generic semisimple `ρ̄` and nonzero type quotient, `τ` is 7-generic and the residual Kisin module is unique. The étale `φ`-module comparison is a monomorphism under the stated 3-generic semisimple assumptions. The common framed gauge ring is formally smooth of relative dimension `3f` over `R̄^τ_ρ̄` and nine over the explicit chart; hence `Irr(R̄^τ_ρ̄)≅∏_i Irr`(`R̄^{expl,∇}_{w_i}`). There is no asserted algebra map from the explicit ring to `R̄^τ_ρ̄` itself: their dimensions are `6f` and `9+3f`. Include the length-one and identity-shape equations below, with the necessary determinant coefficient and corrected `p`-saturation relations.

Use the following remaining chart equations, in addition to the length-two/three rows.

**Length one.** For `αt₁`, transport the other simple-root shapes by `δ̃=(123)t_(0,0,−1)`. `A^{(i)} = (c11, c12 + v c*12, c13; v c*21, c22 + v d22, c23; v c31, v c32, c33 + v c*33)`, `c̃32 := (c32 c*21 − d22 c31)/c*21`, and `R̄^{expl,∇}_{𝔐̄,αt₁}` is `F⟦c11, c12, c13, c22, c23, c31, c̃32, c33, d22, c*12 − [c̄*12], c*21 − [c̄*21], c*33 − [c̄*33]⟧` modulo: `c11 c23 = 0`; `c*33 c11 c̃32 = c13 c31 c̃32`; `(a − b) c11 d22 c*33 = (b − c) c*21 c13 c̃32`; `c13 c23 c̃32 = 0`; `c23 c31 c̃32 = 0`; `(a − b) c13 c31 d22 + (c − b) c13 c̃32 c*21 + (−1 − a + c) c23 c31 c*12 = 0`; `(a − b) c12 c*33 = (a − c) c13 c̃32`; `(−1 − a + b) c22 c*33 = (−1 − a + c) c23 c̃32`; `c*21 c33 = c31 c23` — the three-variable power-series extension of the corrected companion-ring presentation (LLHLM18, Proposition 8.11);

**Identity.** For `t₁`, `A^{(i)} = (c11 + v c*11, c12, c13; v c21, c22 + v c*22, c23; v c31, v c32, c33 + v c*33)`, and `R̄^{expl,∇}_{𝔐̄,t₁}` is `F⟦c_{jk} (1 ≤ j, k ≤ 3), c*_{kk} − [c̄*_{kk}]⟧` (twelve variables) modulo: `c_{jj} c_{kk} = 0 (j ≠ k)`; `c11 c23 = c31 c22 = c33 c12 = 0`; `c12 c23 = c22 c13`; `c11 c32 = c12 c31`; `c21 c33 = c31 c23`; `(−1 − a + c) c*22 c33 + (−1 − a + b) c22 c*33 − (−1 − a + c) c23 c32 = 0`; `(a − b) c*33 c11 + (−1 − b + c) c33 c*11 − (a − b) c13 c31 = 0`; `(b − c) c*11 c22 + (a − c) c11 c*22 − (b − c) c12 c21 = 0`; and the cubic `c11 c*22 c*33 + c22 c*11 c*33 + c33 c*11 c*22 − c*11 c23 c32 − c*22 c13 c31 − c*33 c12 c21 + c13 c32 c21 = 0` (the vanishing of the `v²` coefficient of `det A^{(i)}`), the three-variable power-series extension of the corrected dimension-three companion ring (LLHLM18, Corollary 8.4), giving dimension six.

For the identity chart include `c₁₂c₃₃=0` and the cubic coefficient of `det A`. For the length-one chart the unit denominators `a−b` and `−1−a+b` are cleared using genericity. These saturation and determinant relations are part of the quotient.


The construction provides the following API.

- `GL3.explicitRing`: `R̄^{expl,∇}_{𝔐̄,w̃}` for each shape `w̃` (three cases by length).
- `GL3.comparisonDiagram`: The diagram (3.9) relating `R̄^τ_ρ̄`, explicit rings and étale `φ`-modules.
- `GL3.iotaPrime_mono`: For `τ 3`-generic and `𝔐̄` semisimple, `ι′_τ` : `Ȳ^{η,τ}_{𝔐̄} → Φ`-`Mod^ét_{ℳ̄}` is a monomorphism.
- `GL3.formallySmooth_over_explicit`: `R̄^{τ,β̄,□}_{𝔐̄,ρ̄}` is a power series ring in `3f` variables over `R̄^τ_ρ̄` and is formally smooth of relative dimension 9 over `⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}`.
- `GL3.irr_bijection`: `Irr(R̄^τ_ρ̄) ↔ Π_i Irr`(`R̄^{expl,∇}_{w̃_i}`).

**Checks.**

- The twelve-variable identity chart has six minimal primes in its quotient ring, each of dimension six, as in the component list below.
- For shape `α` the explicit ring (the nine relations of `(b)`) has exactly 6 minimal primes (Table 3, row `α`).
- Length-four charts are power-series rings (solve the lone relation if present); lengths `≥2` are generically formally smooth over `R_N`.
- `ι′_τ` is a monomorphism; étale `φ`-deformations not arising from type-`(η,τ)` Kisin modules lie outside its image.

*Needs:* [6.9](#t6-9); [1.1](#t1-1); [6.21](#t6-21).

(Sources: [LLHLM20], §3.6.1, items (1)–(4) and diagram (3.9), published p. 49; arXiv v4 pp. 36–39; [LLHLM20], §3.6.1 item `(4)(b)`–`(c)`, arXiv v4 p. 38 (relations for the shapes `α` and `id`; repeated on pp. 46 and 48 respectively).)

<a id="t6-29"></a>

### 6.29 The `GSp₄` ordinary flag-incidence scheme and its scheme-theoretic image `R^△_v`

For ordinary `GSp₄` residual data over `ℚ_p`, any `p`, fix the `p`-stabilisation and multiplier `ε̄⁻¹`. The weight algebra has two universal inertial characters and its extension has two full Galois characters. In the symplectic full-flag variety impose graded characters `χ̃₁`,`χ̃₂`,`ε⁻¹χ̃₂⁻¹`,`ε⁻¹χ̃₁⁻¹`. Define `R△` as the scheme-theoretic image in global functions without removing `p`-torsion. Integral points are exactly ordinary lifts with this stabilisation. Pairwise distinct residual graded characters make the flag unique and the incidence map a closed immersion. The lowering filtration on `ad⁰` has dimensions 6,4,2,1,0. At `p=2` the weight space has four components; its generic fibre is regular.

The construction provides the following API.

- `GSp4.weightAlgebra`: `Λ_{GSp₄,v}` and `Λ̃_{GSp₄,v}` with their universal characters.
- `GSp4.ordinaryFlagScheme`: `𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v`.
- `GSp4.ordinaryFlagScheme_proper`: `𝒢_v → Spec R_v` is proper.
- `GSp4.ordinaryImage`: `R^△_v`, the scheme-theoretic image (no flat closure).
- `GSp4.ordinaryImage_points`: `𝒪_{E′}`-points of `Spf R^△_v` are the ordinary lifts with the given `p`-stabilisation.
- `GSp4.ordinaryFlagScheme_closedImmersion`: Residually `p`-distinguished ⟹ `𝒢_v → Spec R_v` is a closed immersion.
- `GSp4.ordinaryFlagScheme.points`: Incidence points classify fixed-similitude framed lifts with stable isotropic full flags and ordered universal characters, naturally in coefficients.

**Checks.**

- `p = 2`: `Spec Λ_{GSp₄,v}` has 4 irreducible components (from `(ℤ/2)² ⊂ (ℤ₂^×)²`) and regular generic fibre.
- `dim Fil^i ad⁰ρ_x = 6`, 4, 2, 1, 0 for `i = 0`, …, 4.
- `R^△_v` may have `p`-torsion; replacing it by its flat closure changes the ring when `𝒢_v` is not `𝒪`-flat.
- For `p > 2` and `ρ̄ p`-distinguished of weight 2 (unramified residual characters `χ̄₁ ≠ χ̄₂`), `R^△_v` is the ring `R^{B,𝔠̄}_v` of [6.27](#t6-27).

*Needs:* [1.17](#t1-17); [1.9](#t1-9); [6.27](#t6-27); ClassFieldTheory / layer 7 the absolute local artin map its normalizations and conductors.

(Sources: [BCGP25], §6.2, arXiv v1 p. 142; [BCGP25], §6.2, arXiv v1 p. 143.)

<a id="t6-30"></a>

### 6.30 Potentially crystalline `GL₃` rings of Hodge type `η` and the weak minimal patching input

For 10-generic semisimple residual `GL₃` data over unramified `K` and Hodge type `η=(2,1,0)`, with actual labelled Hodge–Tate weights `{0,1,2}`, a tame type not 1-generic gives the zero ring. For semisimple residual data and 5-generic `τ` with the stated Deligne–Lusztig presentation and all admissible shapes of length `>1`, a local proof gives nonemptiness and `Π_j2^{4−ℓ(w_j)}` special-fibre components. This local calculation uses 6.20–6.21 independently of a patching functor.

The local input is a nonzero exact covariant functor `M∞` from finitely generated `𝒪`-modules with continuous `GL₃(𝒪_K)`-action (including lattices in tame types and Serre weights) to finite modules over `R∞=R□[[x₁,…,x_h]]`, with the following contract. For a type lattice `σ`°`(τ)`, `M∞`(`σ`°`(τ)`) is `𝒪`-torsion-free and maximal Cohen–Macaulay over `R∞(τ)=R□`,`η`,`τ[[x₁,…,x_h]]`. For a Serre weight `σ`, `M∞(σ)` is zero or maximal Cohen–Macaulay over its scheme-theoretic support, and that support is equidimensional of dimension `dim R∞(τ)−1`. After inverting `p`, type-lattice modules have rank at most one on each connected component. If `M∞(R₁(μ))≠0`, `ρ̄` admits the semistable lift with type `τ(1,μ)` required by Definition 3.5.1(2). This Deligne–Lusztig nonvanishing axiom is separate from the type-lattice support axiom. The category, exactness and support conditions are the four axioms of [LLHLM20], Definition 3.5.1; they cannot be replaced by a module with a chosen multiplicity number.

**Conditional local theorem.** Given `GL3.WeakMinimalPatchingFunctor` for the 10-generic semisimple data, prove `GL3.weakMinimalPatching_multiplicity`: weight elimination and the local length `>1` charts give `e(M∞(σ))=1` for `σ∈W?(ρ̄)` and zero otherwise. Then `GL3.typeGeometry_of_weakMinimalPatching` gives nonemptiness exactly when `W?(ρ̄,τ)≠∅`, and every nonzero 1-generic type ring is a normal Cohen–Macaulay domain with reduced special fibre, formally smooth special-fibre components of equal dimension and count #`W?(ρ̄,τ)`. Its support comparison supplies the length-zero/one cases and the uniform prime assignment of 6.33. (Sources: [LLHLM20], Definition 3.5.1 and Theorems 3.5.2–3.5.3, arXiv v4 pp. 28–29; proof of Theorem 3.5.3, p. 34; Proposition 3.6.1, p. 35.)

**Checks.**

- Exactness makes reduction of a type lattice compatible with its Jordan–Hölder multiplicity sum; independently assigned weight modules do not give this comparison.
- A predicted weight has multiplicity one and nonempty support, while a weight outside `W?(ρ̄)` has zero module. A constant nonzero assignment to every weight violates the conclusion.
- Local length `>1` charts suffice for their local component calculation. An identity or simple-root chart still needs the assumed functor and its support theorem for the uniform assignment.

**Auxiliary local lifts.** Prove `GL3.auxiliaryLift`: for `p>3` and 6-generic semisimple `ρ̄` over unramified `K`, after coefficient extension there is a 1-generic tame type `τ_aux` with every shape of length four, a potentially diagonalizable lift of type `(η,τ_aux)`, and a nonzero integral type ring formally smooth over `𝒪`. Potential diagonalizability means that after a finite local extension the lift connects, in its crystalline ring, to a sum of crystalline characters. Use the semisimple shape normal forms and the length-four presentations of 6.20–6.21; the theorem does not use the uniform type geometry. (Sources: [LLHLM20], §3.5.3, paragraph preceding Proposition 3.5.15, arXiv v4 p. 33; LLHLM18 §5.3 and its length-four presentations.)

**Checks.**

- Length-four presentations are power-series rings over `𝒪`, so their auxiliary factors can be absorbed into formal variables.
- After the extension splitting the semisimple realization, the lift has a crystalline character-sum comparison with the same actual labelled weights `{0,1,2}`.
- A length-three nodal factor is not formally smooth over `𝒪` at its residual origin and cannot replace the auxiliary smooth factor in this theorem.

**Scoped automorphic globalization.** Prove `GL3.scopedGlobalization` for `p>3` and a residual representation having the potentially diagonalizable regular lift above. Construct a CM extension `F/F⁺`, unramified at finite places, with `p` split in `F/F⁺` and chosen completions `F_w≅K`, together with an automorphic polarized residual representation whose `GL₃` restrictions there are `ρ̄`. Retain the Taylor–Wiles image and cyclotomic-disjointness hypotheses of LLHLM18 Definition 7.3, split ramification away from `p`, and an actual nonzero localized definite-unitary space in some weight. This is the scoped globalization theorem required here, including the potential-automorphy and base-change input preserving the chosen completions. It requires only the auxiliary lifts, not the uniform component theorem. (Sources: [LLHLM20], §3.5.3, arXiv v4 p. 33; Emerton–Gee, *A geometric perspective on the Breuil–Mézard conjecture*, Appendix A, Propositions A.2, A.6 and Corollary A.7, author pp. 32–35; LLHLM18 §7.1 and Definition 7.3, arXiv pp. 65–68.)

**Checks.**

- At every chosen `p`-adic place both the field identification `F_w≅K` and the residual representation identification are retained.
- The globalization input is the exhibited potentially diagonalizable regular lift; arbitrary prescribed local data without that hypothesis are outside this target.
- Automorphy includes a weight `V` and level `U` with `S(U,V)_𝔪≠0`. A global polarized representation without that nonvanishing is insufficient for a nonzero patching functor.

**Finite-level unitary modules and patching.** Prove `GL3.definiteUnitaryPatching` for this globalized residual representation and the source's minimal levels. For the definite unitary group `G/F⁺`, quasi-split at finite places, construct `S(U,W)` as `W`-valued functions on `G(F⁺)\G(𝔸^∞_{F⁺})` with `f(gu)=u_p⁻¹f(g)`. Use `AdelicAlgebraicGroups`, AA.3.4 (`Reduction.finite_classes`) and AA.4.4 (level quotients and rational stabilizers), and the Hecke-ring carrier of `SmoothRepresentationsOfLocalGroups`, SR.1.2. At sufficiently small `U`, prime-to-`p` stabilizers give exact coefficient functors. Construct the Hecke action on these function modules, localization at the residual eigensystem, Taylor–Wiles level modules and their specialization maps. Their Galois representations and local compatibility must give the action of the framed local deformation rings, including the type-quotient action for type lattices and the Deligne–Lusztig nonvanishing axiom above. Patch these modules to a nonzero functor with all four stated axioms; carry minimal ramification away from `p` and the auxiliary place with distinct residual Frobenius eigenvalues and no ratio `q^{±1}`. Those hypotheses give projectivity and generic rank at most one. Completed coefficient products and presentations use [F.0.1](#completed-coefficient-products) and [F.0.2](#minimal-relative-presentations); this scoped arithmetic construction is a target here, rather than a consequence of those algebra targets. (Sources: LLHLM18 §§7.1, 7.3, Definition 7.11 and Proposition 7.15, arXiv pp. 65–66, 70–72; [LLHLM20], Proposition 3.5.14, arXiv v4 p. 33.)

**Checks.**

- For trivial stabilizers the finite-level function module is a finite direct sum of `W`. A short exact coefficient sequence stays exact; `p`-torsion stabilizers cannot be used for this assertion.
- A type lattice acts through the matching local type quotient, while nonvanishing for `R₁(μ)` supplies the semistable lift in axiom (2). Hecke characteristic polynomials away from `p` alone do not establish that local axiom.
- Minimal levels and the prescribed auxiliary place yield rank at most one after inverting `p`. Replacing a module by two copies preserves exactness but violates minimality on a component of rank one.

**Existence of the local functor.** Prove `GL3.weakMinimalPatching_exists` for `p>3` and the 10-generic semisimple data. Compose `GL3.auxiliaryLift`, `GL3.scopedGlobalization` and `GL3.definiteUnitaryPatching`, tensoring type lattices at the other `p`-adic places and restricting to the selected place. The auxiliary smooth local factors are absorbed into the variables of `R∞`. Thus the dependency chain is 6.20–6.21 (length four) → auxiliary lifts → scoped globalization → finite-level modules and patching → local functor → conditional local theorem → uniform components and 6.33. General global automorphy theorems can consume the resulting local interface. (Sources: [LLHLM20], Propositions 3.5.14–3.5.15 and Corollary 3.5.16, arXiv v4 pp. 33–34.)

**Checks.**

- Free type lattices at the other places preserve exactness when tensoring; replacing them by arbitrary torsion modules would not give this construction.
- The remaining coefficient ring is `R□[[x₁,…,x_h]]`, since only formally smooth auxiliary factors are absorbed.
- The auxiliary type module is nonzero, so the restricted functor is nonzero. Neither its construction nor that nonvanishing uses identity/simple-root component labels from 6.33.

The construction provides the following API.

- `GL3.WeakMinimalPatchingFunctor`: The exact functor with the coefficient, Cohen–Macaulay, generic-rank and nonvanishing axioms above, compatible with reduction of type lattices.
- `GL3.typeGeometry_of_weakMinimalPatching`: The conditional all-type geometry and nonemptiness theorem above, assuming the functor.
- `GL3.auxiliaryLift`, `GL3.scopedGlobalization`, `GL3.definiteUnitaryPatching`: The three prerequisite theorems above, retaining their separate local-lift, arithmetic and finite-level module hypotheses.
- `GL3.weakMinimalPatching_exists`: Existence for `p>3` and 10-generic semisimple `ρ̄` over unramified `K`, with the auxiliary globalization and type specified in Proposition 3.5.15.
- `GL3.weakMinimalPatching_multiplicity`: `e(M∞(σ))=1` exactly on `W?(ρ̄)`, and zero on its complement.
- `GL3.weakMinimalPatching_typeSupport`: The special-fibre support for a tame type is the union of the components labelled by its predicted weights; it supplies the length-zero/one cases and the uniform prime assignment of 6.33.

**Checks.**

- An exact sequence of finite type-coefficient modules must give an exact sequence of `M∞` modules; assigning independent modules to the Jordan–Hölder factors without extension maps is not a patching functor.
- For `σ∈W?(ρ̄)`, the Hilbert–Samuel multiplicity is one and the support is nonempty. For `σ` outside that set the module is zero; a constant rank-one assignment to all weights fails this test.
- A nonzero characteristic-zero type-lattice module forces `R□`,`η`,`τ≠0`. A `τ` which is not 1-generic gives the zero type ring under the theorem's hypotheses, so its module is zero as well.
- Shapes of length `>1` admit the stated purely local chart proof. The identity and simple-root shapes still require the functor's existence and support theorem; merely checking their displayed polynomial equations does not prove the all-type result.
- The cyclotomic rank-one lattice `ℤ_p(1)` is realized from the contravariant height-one Kisin module with Frobenius `E(u)` times its normalization unit, and has weight `+1`; its dual has weight `−1`. This is the dictionary of FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.12–R07.4.13.
- A rank-three type-`η` point has determinant of labelled Hodge–Tate weight `0+1+2=3`. Its dual has determinant weight `−3` and residual representation `ρ̄∨`, inertia type `τ∨` and dual weight/shape labels; it belongs to the transported dual deformation problem.

*Needs (conditional local theorem):* [6.9](#t6-9); [6.20](#t6-20); [6.21](#t6-21); [6.28](#t6-28); [3.4](#t3-4); `GL3.WeakMinimalPatchingFunctor`; the weight-elimination argument of [LLHLM20], Proposition 3.5.6 and Theorem 3.5.2. *Needs (existence):* the auxiliary lifts, scoped globalization and finite-level unitary patching targets above; `AdelicAlgebraicGroups`, AA.3.4 (`Reduction.finite_classes`) and AA.4.4 (level quotients and rational stabilizers); [F.0.1](#completed-coefficient-products) and [F.0.2](#minimal-relative-presentations). Integral Cohen–Macaulayness is the conditional type-geometry theorem here, not an inference from [3.11](#t3-11)'s generic-fibre complete intersection.

(Sources: [LLHLM20], Theorem 3.5.3, arXiv v4 p. 29; [LLHLM20], Lemma 3.5.4, arXiv v4 pp. 29–30; [LLHLM20], §3.5.3, proof of Theorem 3.5.3 and Remark 3.5.17, arXiv v4 p. 34; Theorem 3.5.2 and Proposition 3.5.15, arXiv v4 pp. 29, 34.)

<a id="t6-31"></a>

### 6.31 Regularity of the `GSp₄` ordinary flag scheme at characteristic-zero points

At a flagged closed characteristic-zero point over `ℚ_p`, `H²(G_K,Fil⁰ad⁰ρ_x)=0` is equivalent to `H⁰(G_K,(ad⁰ρ_x/Fil¹ad⁰ρ_x)(1))=0`. It gives a regular point on a unique component of dimension sixteen. Sufficient conditions are none of `χ̃₁²ε`, `χ̃₂²ε`, `χ̃₁χ̃₂ε`, `χ̃₁χ̃₂⁻¹` equalling `ε`; purity with distinguished characters; or purity with potential crystallinity. Transfer this regularity to the image ring only when the point is distinguished. Without that assumption the conclusion remains about the flagged point.

*Needs:* [6.29](#t6-29); [1.18](#t1-18); [1.22](#t1-22); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology); [6.1](#t6-1).

(Sources: [BCGP25], Lemma 6.2.2, arXiv v1 p. 143.)

<a id="t6-32"></a>

### 6.32 Formal smoothness of the finite-flat ordinary flag scheme for `GSp₄`

For `p>2` over `ℚ_p`, ordinary residual data with `ρ̄⊗ε̄` finite flat, cut out the incidence locus where `ρ⊗ε` is finite flat and inertia is trivial on the Lagrangian plane. Prove formal smoothness of its completion at every finite residue extension point by the finite/unit extension argument, extended to the three Siegel coordinates. Its closed residual flag fibre is a point or `ℙ¹`, so its image is irreducible. State the formal smoothness itself rather than inventing an undefined `H²_flat` carrier.

*Needs:* [6.29](#t6-29); [1.1](#t1-1); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; [4.2.1](#t4-2-1).

(Sources: [BCGP25], proof of Lemma 6.2.5, arXiv v1 p. 145.)

<a id="t6-33"></a>

### 6.33 Labelling of components of `GL₃` potentially crystalline rings by Serre weights

For 10-generic semisimple `ρ̄`, construct the unique prime assignment `σ↦𝔭(σ)` in `R□` whose images are the special-fibre type-`(η,τ)` components, with actual weights `{0,1,2}`, for `σ∈W?(ρ̄,τ)`. Use the explicit chart/component bijections to label them by the Table 3 primes. Matching Frobenius matrices `A=A′z̃` modulo intersections of primes yields the same ideal of `R̄□` after the compatible gauge normalization. The minimal type of `σ` is `τ(sz*,μ+sz̃*(0))`, its shape satisfies `w(τ′)z̃=w(τ)`, and its weight set is contained in that of `τ`. For all shapes of length`≥2`, the node-coordinate primes select `x_j` or `y_j` in `N=Σ_i(4−ℓ(w_i))` slots; the symmetric difference has cardinality `2d_gph(σ₁,σ₂)`. The nine-vertex, fifteen-edge extension graph and prime lists are given below. The existence of the uniform prime assignment uses the stated weak patching input; local ideal matching and distance computations do not.

These are the remaining prime generators in the explicit quotient rings.

**Simple-root chart `α`.** Use these label/ideal pairs: `(ε1, 1)`: `(c11, c13, c31)`;
`(ε2, 0)`: `(c11, c31, c*21 c̃32)`;
`(ε2, 1)`: `(c11, c*21 c̃32, (a − b) c13 d22 + (−1 − a + c) c23 c*12)`;
`(ε2 − ε1, 0)`: `(c23, d22, c*21 c̃32)`;
`(0, 0)`: `(c11, c13, c23)`;
`(0, 1)`: `(c11 c*33 − c13 c31, c23, (a − b) c31 d22 + (c − b) c*21 c̃32)`.

**Identity chart.** Use these label/ideal pairs: `(ε1, 0)`: `(c11, c22, c33, c21, c31, c23)`;
`(ε1, 1)`: `(c31, c33, c11, (−1 − a + c) c32 c13 − (−1 − a + b) c12 c*33, c21 c13 − c23 c*11)`;
`(ε2, 0)`: `(c11, c22, c33, c12, c31, c32)`;
`(ε2, 1)`: `(c12, c22, c11, (a − b) c21 c13 − (−1 − b + c) c23 c*11, c21 c32 − c31 c*22)`;
`(0, 0)`: `(c11, c22, c33, c13, c23, c12)`;
`(0, 1)`: `(c23, c33, c22, (b − c) c21 c32 − (a − c) c31 c*22, c32 c13 − c12 c*33)`.

**Extension graph.** Its vertices are `(ε₁+ε₂,0)`, `(ε₁−ε₂,0)`, `(ε₂−ε₁,0)`, `(0,0)`, `(ε₁,0)`, `(ε₂,0)`, `(0,1)`, `(ε₁,1)`, `(ε₂,1)`. Join each of `(0,0)`,`(ε₁,0)`,`(ε₂,0)` to each of `(0,1)`,`(ε₁,1)`,`(ε₂,1)`. Add the six edges from `(ε₁+ε₂,0)` to `(ε₁,1)`,`(ε₂,1)`, from `(ε₁−ε₂,0)` to `(ε₁,1)`,`(0,1)`, and from `(ε₂−ε₁,0)` to `(ε₂,1)`,`(0,1)`. This gives fifteen edges. The product over embeddings has the graph distance used above. Length-two, three and four shapes give respectively a four-cycle, an edge and a point. In the identity-chart matching for `(0,0)`, use `z̃=t_{(−1,0,1)}`. The codimension calculation sums the two prime ideals.


*Needs:* [6.21](#t6-21); [6.28](#t6-28); [6.30](#t6-30).

(Sources: [LLHLM20], Proposition 3.6.1, published p. 46; [LLHLM20], Theorem 3.6.4, published p. 55; [LLHLM20], Lemma 3.6.10, published p. 59 (arXiv v4 p. 43), with Definition 2.1.6 and Table 1 (arXiv v4 pp. 12, 17); [LLHLM20], Remark 3.6.8, arXiv v4 pp. 41–42; [LLHLM20], Proposition 3.6.9 and Lemma 3.6.6, Corollary 3.6.7, arXiv v4 pp. 40–42; Table 2, arXiv v4 p. 18.)

<a id="t6-34"></a>

### 6.34 Generic fibres of the `GSp₄` ordinary rings: irreducibility, dimension and smooth pure points

For the preceding distinguished residual problems, the Borel generic fibres are irreducible of dimension sixteen, each single Borel condition after diagonal-weight base change has dimension fifteen, and their `P`-ordinary intersection has dimension fourteen. The universal `P`-ring and its weight specialisation are complete intersections with connected characteristic-zero fibres and nonsmooth locus of codimension at least two; their dimensions are fifteen and fourteen. The `P`-framed ring is the completed tensor product of the three `GL₂` ordinary subquotient rings over the character bases specified below. The Borel `H²` exceptional cases are listed below, with dimension at most one except the simultaneous double exception, where it is two. Pure distinguished closed points are smooth, using the symplectic dual-quotient argument. In the double exception the integral Borel ring is not asserted flat or to have complete-intersection special fibre.

Let `R_A` and `R_B` be the `B₂`-framed ordinary rings of 6.15 with determinant `ε⁻¹`, top characters `χ_A`,`χ_B` and bottom characters `ε⁻¹χ_A⁻¹`,`ε⁻¹χ_B⁻¹`. Let `R_AB` be the `B₂`-framed ring of the cross subquotient with variable determinant, and write its top and bottom characters as `ξ₁`,`ξ₂`. Put `D=R_{GL₁×GL₁}=R_{GL₁}⊗̂_𝒪R_{GL₁}` for the pair of characters lifting the ordered residual unramified characters. The map `D→R_A⊗̂_𝒪R_B` classifies `(χ_A,χ_B)`; the map `D→R_AB` classifies `(ξ₁,ε⁻¹ξ₂⁻¹)`. Thus the tensor product identifies `χ_A=ξ₁` and `χ_B=ε⁻¹ξ₂⁻¹`, or equivalently `ξ₂=ε⁻¹χ_B⁻¹`.

With `Λ=𝒪[[1+pℤ_p]]` mapping by the top inertial character to both `R_A` and `R_B`, the presentations are `R^{P,univ,◹}≅(R_A⊗̂_𝒪R_B)⊗̂_D R_AB` and `R^{P,◹}≅(R_A⊗̂_ΛR_B)⊗̂_D R_AB`. The second presentation additionally identifies the two inertial weights. All completions use the coefficient-category coproduct of F.0.1. Full framing is formally smooth of relative dimension five over these `P`-valued charts, whose generic dimensions are ten and nine.

Write the residual Siegel extension classes as `η_{α²}`,`η_{β²}`,`η_{αβ}`. The only possible nonzero Borel obstruction cases are:

- `η_{αβ}=η_{α²}=0` and `ᾱ²=1`;
- `η_{β²}=0` and `β̄²=1`; if the first case also holds then `h²=2`, while outside it `h²=1` and the obstruction is identified with the `GL₂` Borel obstruction of `W=λ_β̄⊗(1⊕ε̄⁻¹)`;
- `η_{αβ}=η_{β²}=0` and `ᾱβ̄=1`.

The list supplies necessary conditions, without asserting a converse for every listed datum. For smooth pure points, duality uses the quotient `ad⁰/Fil¹ad⁰`, rather than treating the dual of the Borel as a submodule of `ad⁰`. In case `(2b)`, let `W=Fil₃/Fil₁` be the middle symplectic subquotient, with residual representation `λ_β̄⊗(1⊕ε̄⁻¹)`. Choose compatible splittings of the ordinary flags reducing to the fixed residual bases. Taking this subquotient in the resulting triangular basis induces `R^{B₂,◹}(W)→R^B`, formally smooth of relative dimension twelve over the four-dimensional chart of 6.15. Retaining one transverse frame coordinate for `W` extends this map to the fully framed `R^{B₂}(W)≅R^{B₂,◹}(W)[[u]]→R^B`, formally smooth of relative dimension eleven over the five-dimensional base. These are comparisons with the fully framed `GSp₄` Borel ring `R^B`, of relative dimension sixteen over `𝒪`. The other estimates are complement dimension at most thirteen in case `(2a)` and codimension three in the indicated `P` comparison.

**Checks.**

- A triple with `ξ₁≠χ_A` or `ξ₂≠ε⁻¹χ_B⁻¹` cannot define a point of the tensor product over `D`, even if all three individual subquotient lifts exist over the same coefficient algebra.
- Over the unrestricted chart the inertial weights can differ; tensoring `R_A` and `R_B` over `Λ` forces their equality and gives the scalar-inertia `P` condition.
- The chart generic dimensions ten and nine become fifteen and fourteen after adding the five full-framing variables; the tensor products over `𝒪` alone would omit the character identifications.
- In case `(2b)`, `4+12=5+11=16`. Relative dimension twelve over the fully framed five-dimensional `GL₂` base would instead give seventeen and fails this comparison.

*Needs:* [6.27](#t6-27); [6.15](#t6-15); [1.18](#t1-18); [1.22](#t1-22); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology); [6.31](#t6-31).

(Sources: [BCGP21], Proposition 7.3.4, arXiv v3 p. 173, and its proof, case `(2b)`, p. 185; Lemma 7.3.12, p. 180; [BCGP21], Lemma 7.3.15 and Proposition 7.3.16, arXiv v3 p. 183; [BCGP21], Lemma 7.3.18, arXiv v3 p. 188.)

<a id="t6-35"></a>

### 6.35 Finite-flat ordinary weight-two lifts lie on one component

For `p>2` and finite-flat `ρ̄⊗ε̄`, all ordinary pure crystalline weight-two lifts lie on one component of `R△`, each on a unique component of relative dimension sixteen. If a component `R△/Q` surjects onto weight space, some minimal prime of `R△/(p)` contains `Q` and no other generic minimal prime, and that component has relative dimension sixteen. Surjectivity to weight space is a hypothesis, not a conclusion for every component.

**Checks.**

- Two ordinary pure weight-two lifts with the stated finite-flat residual twist lie on the same unique component, of relative dimension sixteen.
- For a component surjecting onto weight space, the special-fibre prime furnished by Lemma 6.2.6 contains exactly its generic minimal prime among those of `R△`.
- The second assertion requires surjectivity for the selected component; existence of an ordinary point alone does not discharge that hypothesis.

*Needs:* [6.31](#t6-31); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; [6.32](#t6-32).

(Sources: [BCGP25], Lemmas 6.2.5–6.2.6, arXiv v1 pp. 145–146.)

### Examples

In the `GL₃` identity chart, `identityFrobenius` is the polynomial matrix `A(v)=[[a+va*,b,c],[vd,e+ve*,f],[vg,vh,i+vi*]]`, where `a*`,`e*`,`i*` are unit coordinates. Its `v²` coefficient is `a e*i*+e a*i*+i a*e*−a*fh−e*cg−i*bd+chd`, and its `v³` coefficient is `a*e*i*`. The theorem `identity_frobenius_determinant_coefficients` states those equalities over every commutative coefficient ring. For `a=e=i=c=d=h=0`, `b=f=g=a*=e*=i*=1`, the determinant is `v³+v`: the cubic `v²` relation holds, while the `v` relation fails. For `a=1` and all other residual coordinates zero, with stars one, the determinant is `v³+v²` and the cubic relation fails. At zero residual coordinates and stars one it is `v³`. Target 6.28 includes the additional relation `c₁₂c₃₃=0` together with that actual cubic coefficient; its prime list cannot be checked using a different matrix chart.

The helpers `affineNodeIdeal`, `AffineNode` and `affineNodePoint` give the coordinate ring `ℚ[x,y]/(xy)` and evaluation maps at `(1,0)`, `(0,0)`, `(0,1)`. The theorem `connects_not_transitive` states that the common-component relation of 6.8 is not transitive on this nodal ring: an intersection point belongs to both branches of `E[x,y]/(xy)`, so a point on each separate branch connects to the intersection point without the two outer points connecting to each other. At a regular crystalline point the unique-component conclusion gives the stronger local statement used in the weight-zero application.

### Dependencies

Uses Layers 1–5, `D7` local duality with stable-lattice hypotheses, descent-data Kisin modules, Serre-weight/type representation theory and the completed-coefficient/presentation targets [F.0.1](#completed-coefficient-products)–[F.0.2](#minimal-relative-presentations). Target 6.30 constructs the scoped weak minimal functor needed for the uniform `GL₃` statement.

## Layer 7: Determinant-ordinary equations and flag comparisons

Characteristic polynomials, ordered products and flag incidence give three related interfaces. Compare reduced spaces over the distinct-character open and keep the collision-locus dimension bound. The eigenvalue doubling computation is the rank-two image/flag example.

<a id="t7-1"></a>

### 7.1 The determinant-ordinary rings `R̃^{det,ord}_v` and `R^{det,ord}_v`

Over `Λ̃` impose both `det(X−ρ(g))=∏_i(X−χ̃_i(g))` for every `g` and the ordered products `(ρ(g₁)−χ̃₁(g₁))⋯(ρ(g_d)−χ̃_d(g_d))=0` for every tuple. Define `R̃^{det,ord}` by this quotient and `R^{det,ord}` as the image of `R□` after forgetting the Frobenius characters. Give the factorisation criterion by vanishing of all coefficients and matrix entries, compatible with coefficient maps. The two sets of equations are independent over nonreduced rings; never replace the definition by the characteristic-polynomial equations alone.

For a representation into `GL_d(A)` and full characters `χ_i`:`G→A×`, `IsDetOrdinary` imposes both families of equations over the actual coefficient algebra `A`. The comparison predicate `HasOrderedTriangularization` means that a single `GL_d(A)` basis change makes every group matrix upper triangular with diagonal `χ_i(g)`. Over a field, `det_ordinary_iff_ordered_triangularization` equates them for pairwise distinct character functions (including `d=0`), as in 7.4. In rank one both predicates reduce to equality of the actual character; distinct-character data cannot be replaced by a choice of `d` unrelated scalar values.

The construction provides the following API.

- `detOrdTilde`: `R̃^{det,ord}_v`, the quotient by (6.2.7)–(6.2.8).
- `detOrd`: `R^{det,ord}_v = im`(`R^□_v → R̃^{det,ord}_v`).
- `detOrdTilde_charpoly`: (6.2.7) holds over `R̃^{det,ord}_v`.
- `detOrdTilde_product`: (6.2.8) holds over `R̃^{det,ord}_v`.
- `detOrd_universal`: `R^□_v → R` factors through `R^{det,ord}_v` when `R ↪ S` carries characters `ψ_i` with the relations.
- `detOrdTilde.factor_iff`: Factoring through the quotient is equivalent to vanishing of all coefficients of (6.2.7) and all ordered entries of (6.2.8), naturally in `A`.

**Checks.**

- At `d=0`, both `IsDetOrdinary` and `HasOrderedTriangularization` hold: the empty characteristic polynomial is 1, the empty matrix product is `1=0` in the zero-dimensional matrix ring, and `B=1` gives the empty flag. This is the rank-zero specialization of `det_ordinary_iff_ordered_triangularization`.
- `n = 1`: (6.2.7) says `ρ^□ = χ̃_1^univ` and (6.2.8) is the same relation.
- A diagonal lift `diag(χ̃_1, …, χ̃_n)` satisfies (6.2.7) and (6.2.8).
- Over `ℤ/9`, `M=diag(4,7)`, `U=(1 1;0 1)` generate a group with every characteristic polynomial `(X−1)²`, yet `(M−I)(U−I)=(0 3;0 0)`. The ordered-product equations are independent constraints.

The Lean helper `controlMatrixUnit` constructs invertible rank-two matrices from two-sided inverses. The helper `nilpotentShiftCharacters` gives reciprocal characters generated by 4 and 7 over `ℤ/9`.

**Checks for `HasOrderedTriangularization`.**

- The rank-two diagonal representation has the specified flag and satisfies `IsDetOrdinary` for its two diagonal characters.
- The nonsplit upper extension generated by `diag(2,1)` and `I+E₁₂` has only its first coordinate line as a stable line. Its given order works; the reversed order fails both triangularization and the ordered-product equation. This is the matrix control for 1.7's reversed extension.
- The theorem `det_ordinary_nilpotent_shift_not_flag` states that over `ℤ/9`, the scalar representation `I` of the free group on one generator satisfies `IsDetOrdinary` for the characters generated by 4 and 7: their shifts are divisible by 3 and every length-two product vanishes. It has no direct-summand flag with those characters, since conjugating `I` leaves `I`. A nilpotent eigenvalue shift does not produce the prescribed graded action.

*Needs:* [1.1](#t1-1); [1.3](#t1-3).

(Sources: [ACC+], §6.2.6, p. 138; [ACC+], §6.2.6, p. 139.)

<a id="t7-2"></a>

### 7.2 `R̃^{det,ord}_v` is finite over `R^{det,ord}_v`

The extended determinant-ordinary ring `R̃^{det,ord}` is a finite module over its image `R^{det,ord}`. Each added Frobenius character satisfies a monic characteristic-polynomial equation, which supplies the finite generators. Finiteness is over the image lifting ring, not over weight space.

*Needs:* [7.1](#t7-1); `Module.Finite` (Mathlib).

(Sources: [ACC+], §6.2.6, Lemma 6.2.9, p. 139.)

<a id="t7-3"></a>

### 7.3 Point criteria and `Spec R^△_v ⊂ Spec R^{det,ord}_v`

If a lift over `R` acquires ordered characters satisfying both determinant-ordinary equations in an injective coefficient extension `R↪S`, it factors through `R^{det,ord}`. Therefore the underlying flag-image locus is contained in the determinant-ordinary locus and there is a universal-ring-compatible surjection `R^{det,ord}→(R△)_red`. This gives the reduced comparison, not an isomorphism of the unreduced rings.

*Needs:* [7.1](#t7-1); [1.9](#t1-9).

(Sources: [ACC+], §6.2.6, p. 139.)

<a id="t7-4"></a>

### 7.4 Characteristic polynomials and ordered products give a flag

Over a field, a rank-`d` representation with pairwise distinct prescribed characters, their characteristic-polynomial identities and every ordered-product identity admits a stable full flag with those ordered graded characters. Use the distinct-character separation in the induction proof. This is a field theorem and does not recover an integral flag over an arbitrary nonreduced ring.

*Needs:* [7.1](#t7-1).

(Sources: [ACC+], §6.2.6, Lemma 6.2.11, p. 140.)

<a id="t7-5"></a>

### 7.5 The doubling ideal equals the unramified ideal (Calegari–Geraghty Lemma 3.22)

For the ordinary rank-two eigenvalue ring, let `ϖ^m` be the common divisibility of `χ^{n−1}(g)−1`. Its unramified quotient is `(𝒪/ϖ^m)[[φ₁,…,φ₄]]/(φ₁+φ₄+φ₁φ₄−φ₂φ₃)`; adjoining `β` by `β²−(φ₁+φ₄)β−(φ₁+φ₄)` makes a rank-two free module. The quotient by the image copy is a faithful rank-one module over the unramified quotient. Conclude `J=I`: the annihilator of `R̃†/R†` equals the kernel defining the unramified quotient in the universal framed ring.

*Needs:* [6.7](#t6-7); [7.1](#t7-1).

(Sources: [CG18], Lemma 3.22, published p. 335; [CG18], proof of Lemma 3.22, published pp. 336–337.)

<a id="t7-6"></a>

### 7.6 Determinant-ordinary versus flag-ordinary components

For trivial residual data and `f=[K:ℚ_p]>d(d+1)/2+1`, take `E` splitting the `p`-power torsion unit characters as in 6.24 and let `U` be the distinct-character open in `Λ`. The flag and determinant-ordinary loci agree over `U` as underlying subspaces of `Spec R□`. Every component of weight space is dominated by exactly one determinant-ordinary component of dimension `1+d²+fd(d+1)/2`. Any other component lies over the collision locus and has dimension at most `d²−1+fd(d+1)/2`. Retain this stronger degree bound than the flag-ring theorem and the topological/reduced nature of the comparison.

*Needs:* [7.3](#t7-3); [7.4](#t7-4); [7.2](#t7-2); [6.24](#t6-24); [1.4](#t1-4); [6.1](#t6-1).

(Sources: [ACC+], §6.2.6, Proposition 6.2.12, p. 140; [ACC+], §6.2.6, proof of Proposition 6.2.12, p. 141.)

### Examples

Over `ℤ/9`, `z9Family a b` is `[[1+3a,b],[0,1−3a]]`. Its API `z9_family_determinant_and_charpoly` gives determinant one and characteristic polynomial `(T−1)²` for every `a`,`b`. Let `M=diag(4,7)=z9Family 1 0` and `U=[[1,1],[0,1]]=z9Family 0 1`. The Lean helpers `z9Generators` and `z9Subgroup` give these invertible generators and their actual generated subgroup. Every element of that subgroup has diagonal `(1+3a,1−3a)`, hence determinant one and characteristic polynomial `(T−1)²`. Nevertheless `(M−1)(U−1)=[[0,3],[0,0]]≠0`. The theorem `charpoly_not_det_ordinary` states this failure on the subgroup representation. Thus the characteristic-polynomial equations alone do not define the determinant-ordinary condition; the ordered products must also vanish.

For `d=1`, the extended ring is `R□⊗_ΛΛ̃` and its determinant-ordinary equation identifies the universal Galois character with `χ̃₁` on every `g`. Its image in the extended quotient is the ring of this character condition. In higher rank, descent to the image requires an injection of coefficient rings `R↪S`; tensoring full characters into `R□` first is part of the construction, required by the universal property.

### Dependencies

Uses the character and incidence constructions in Layer 1 and ordinary component geometry in Layer 6. Its universal-property descent uses injective coefficient extension, and its finite-algebra theorem uses actual full Galois characters.

## Layer 8: Local interfaces for lifting and patching

These results package the preceding local rings for global lifting and patching consumers. They state nonemptiness, relative dimension, regularity and dependence on selected characters. Global theorems consume these exports through their own deformation problems.

<a id="t8-1"></a>

### 8.1 Smooth resolutions of framed deformation conditions

Let a nonzero framed condition quotient admit a proper map `f` from a flat `𝒪`-scheme `ℛ`, with injective map `𝒪_{Spec R}→f_*𝒪_ℛ`, closed immersion into the unrestricted generic fibre, geometrically connected closed-point fibre `Y`, and a smooth finite-type algebraization inducing an isomorphism of completions along all of `Y`. Then `R` is a domain, `R[1/p]` is regular, and its relative dimension equals that of `ℛ`; integral points are images of resolution points specializing into `Y`. Formal smoothness at individual closed points alone is not the whole algebraization hypothesis. The Kisin variant additionally uses reduced special fibre. Formal functions, Stein factorization and excellence supply the algebraic proof.

*Needs:* `SchemeAndStackFoundations`, §4.9 (The theorem on formal functions and Stein factorisation); [F.0.1](#completed-coefficient-products).

(Sources: [KW209], §2.8, Proposition 2.12 and its proof, pp. 16–18.)

<a id="t8-2"></a>

### 8.2 The local conditions of KW II

For rank two over a totally real field, fix determinant `φ=ψχ_p` and the local choices: odd at infinity; low-weight crystalline, ordinary endpoint or prescribed weight-two type above `p`; fixed-character semistable or inertia-rigid away from `p`. The `p`-adic local field is unramified, and is `ℚ_p` in the irreducible and crystalline endpoint branches. Define each quotient as the reduced flat closure of its selected points. The chosen unramified quotient character, semistable `γ` and reference inertia lift `ρ₀` are data. In the abelian split-distinct case selecting one graded character selects one component; the union of both choices need not be a domain.

Above `p`, low weight means crystalline of residual Serre weight `k≤p`, or ordinary of weight `p+1`. For odd `p` the weight-two WD parameter is `(ω^{k−2}⊕1,0)`, or `(1,N≠0)` at `k=p+1`; for `p=2` use crystalline weight two at `k=2` and semistable weight two at `k=4`. At `p`, the fixed-character semistable shape is (`γχ_p`,*;0,`γ`), with `γ` unramified. Inertia-rigid lifts are conjugate on inertia to `ρ₀`; the split-distinct branch fixes its upper-triangular graded character. Retain `F_v=ℚ_q` in the level-two branch.

The construction provides the following API.

- `KWCondition`: `A` KW II local condition at `v`, with its choices.
- `KWCondition.ring`: `R̄^{□,ψ}_v` as the flat reduced quotient classifying `X_v`-lifts.
- `KWCondition.points`: `𝒪′`-points of the ring are exactly the `X_v`-lifts.
- `KWCondition.ring_unique`: With all local choices fixed, equal characteristic-zero point kernels give a unique compatible isomorphism of reduced flat quotients.

**Checks.**

- At a real place `diag(1,−1)` has determinant `−1` and square `I` and is odd. Over characteristic zero the identity matrix has determinant `+1` and is excluded, even though both reduce to the identity modulo 2.
- At `p=2`, the `k=2` branch has `N=0` and is crystalline; the `k=4` weight-two branch permits `N≠0` and is semistable. A condition recording only that both are weight two loses the prescribed monodromy data.
- For distinct unramified residual characters, allowing either quotient character gives two components; fixing KW's choice selects one.

*Needs:* [1.1](#t1-1); [F.2.9](#fixed-determinant-rings); [3.1](#t3-1).

(Sources: [KW209], §3 opening and §3.2.2, pp. 18 and 22–24.)

<a id="t8-3"></a>

### 8.3 irreducible residual representation, low-weight crystalline

For `F_v=ℚ_p` and irreducible rank-two residual representation of Serre weight `2≤k≤p`, the compatible fixed-determinant crystalline ring has unframed relative dimension one and framed relative dimension four, both formally smooth. For `2≤k≤p`, construct `IrreducibleEndpointDeformation` using the restricted endpoint Fontaine–Laffaille categories and strongly divisible lattices of `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.11–R07.3.17. In an adapted basis `(v₁,v₂)`, `Fil^{k−1}` is generated by `v₂` and `φ` has matrix `[[λ,p^{k−1}],[α,0]]`, where `α` is the determinant-prescribed unit and `λ` lies in the coefficient maximal ideal. Prove the irreducible residual object and its successive self-extensions satisfy the restricted-category hypotheses, including `k=p` and `p=2`. Identify the coefficient-compatible deformation functor, its strict basis changes and its small-extension lifts with the free `λ` parameter. This gives the unframed ring `𝒪[[λ]]` and the framed ring `𝒪[[λ,z₁,z₂,z₃]]`.

**Checks.**

- At `k=p` for odd `p`, the restricted irreducible object excludes the rank-one endpoint factors; `λ` lifts freely across small extensions even though `[0,p−1]` exceeds the safe interval.
- At `p=2`,`k=2`, the adapted matrix is `[[λ,2],[α,0]]`; the unframed ring still has one parameter and framing adds three.
- The crystalline lines `E` and `E(ε^{p−1})` have `D*` jumps 0 and `p−1` and identical residual characters. Their reducible sum is outside this irreducible adapter; unrestricted endpoint full faithfulness is not asserted.

*Needs:* [1.5](#t1-5); [1.13](#t1-13); [F.2.9](#fixed-determinant-rings); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.3.11–R07.3.17.

(Sources: [KW209], §3.2.3, p. 24.)

<a id="t8-4"></a>

### 8.4 irreducible residual representation, weight two

For odd `p`, `F_v=ℚ_p` and irreducible residual Serre weight `3≤k≤p`, use the nontrivial principal-series weight-two type `ω^{k−2}⊕1`. After the required coefficient extension and unit rescaling, its unframed ring is `𝒪[[T₁,T₂]]/(T₁T₂−p)`, and the framed ring adds three variables. It is a flat domain of relative dimension four with regular generic fibre, but is not formally smooth over `𝒪`. At `k=2` the type is trivial, so the preceding smooth crystalline ring applies instead of Savitt's distinct-character formula.

For the coefficient-ring equation, `nodalIdeal A π u` is the principal ideal `(XY−πu)` in `A[[X,Y]]`, and `NodalRing A π u` is its actual quotient. The API `nodal_ring_flat_domain` gives a flat domain for a DVR `A`, nonzero nonunit `π` and unit `u`; `π` may equal `p` in a ramified coefficient DVR.

**Checks.**

- Taking `π=p` gives the displayed integral nodal equation, with framing supplied by three genuine power-series variables. Replacing `p` by a coefficient uniformizer without a unit rescaling would change a ramified ring.
- Over the noncomplete DVR `A=ℤ_(3)`, taking `π=3`, `u=1` still gives a flat domain `A[[X,Y]]/(XY−3)`. Completeness is unnecessary for this coefficient-ring theorem.
- Taking `π=0` over a field gives `(XY)`; the two nonzero coordinate classes multiply to zero. The nonzero hypothesis of the domain theorem is essential.
- Taking `π=u=1` over a field makes `XY−1` a unit in the formal power-series ring, so the quotient is the zero ring. The nonunit hypothesis is essential.

*Needs:* [4.2](#t4-2); [1.5](#t1-5).

(Sources: [KW209], §3.2.4, p. 24.)

<a id="t8-5"></a>

### 8.5 Ordinary potentially crystalline local lifts of reducible residual representations

For `p≥3` and global residual (`χ̄`,*;0,1) with geometric determinant `μ=κ^{r−1}χ₀`, `r≥2`, construct at `v|p` an ordinary potentially crystalline lift of weights `{0,r−1}` and determinant `μ` after coefficient extension. There also exists such a lift with nontrivial unramified quotient, but its determinant need not still be `μ`. Ordinary means ordinary after a fixed finite local extension in the group-valued condition. In the weight-two Barsotti–Tate example use a Kummer unit class; a uniformizer class produces semistable noncrystalline monodromy.

*Needs:* [1.21](#t1-21); [1.10](#t1-10); [0.3](#t0-3); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [FKP22], Lemma 7.2, second bullet, arXiv v5 p. 34.)

<a id="t8-6"></a>

### 8.6 Deformation conditions cut out by a category `S` (BCDT §4.3)

For a Schur residual module `V`, let `S(ρ̄)` consist of finite-length coefficient Galois modules admitting a finite filtration with every successive quotient isomorphic to `V`. With the Schur hypothesis this is an abelian category. A full subcategory `S` containing `V` and closed under isomorphism, finite products, subobjects and quotients inside `S(ρ̄)` defines a deformation condition by requiring every open-ideal quotient of a lift to lie in `S`. Construct its universal unframed quotient, with and without fixed determinant. Put `S_k={M∈S:ϖM=0}`, with exact sequences inherited from discrete `k[G_K]`-modules. The relative tangent of the condition is `t(D^S)≅Ext¹_{S_k}(V,V)↪H¹(G_K,ad ρ̄)`; define `L_S` as the image of this injection. The Ext classes have middle object in `S_k`; extensions in `S` whose middle object is not killed by `ϖ` do not give tangent deformations. With fixed determinant the tangent is `L_S∩ker(tr_*:H¹(ad ρ̄)→H¹(k))`. When `p∤d`, scalar splitting identifies this with the corresponding subspace of `H¹(ad⁰ρ̄)`. For `p|d` use the kernel in `H¹(ad)`, equivalently trace-zero cocycles modulo coboundaries from all of `ad`; `H¹(ad⁰)` alone can overcount strict classes. Inclusion `S⊆T` gives a compatible surjection `R^T→R^S`; the finite-flat subcategory recovers Layer 4.

The construction provides the following API.

- `CategoryCondition`: A full subcategory `S ⊂ S(ρ̄)` closed under isomorphism, finite products, `S(ρ̄)`-subobjects and `S(ρ̄)`-quotients, containing `V`.
- `CategoryCondition.defFunctor`: `D^S_{V,𝒪}` and `D^{ψ,S}_{V,𝒪}`.
- `CategoryCondition.ring`: `R^S_{V,𝒪}`, `R^{ψ,S}_{V,𝒪}`, quotients of `R_{V,𝒪}`, `R^ψ_{V,𝒪}`.
- `CategoryCondition.tangent`: The relative tangent of `D^S` identifies with `Ext¹_{S_k}(V,V)` and embeds with image `L_S` in `H¹(G_K,ad ρ̄)`. The tangent of `D^{ψ,S}` is `L_S∩ker(tr_*:H¹(G_K,ad ρ̄)→H¹(G_K,k))`; for `p∤d` it identifies with `H¹_S(G_K,ad⁰ρ̄)`. In general `Z¹(ad⁰)/B¹(ad)` maps injectively into `H¹(ad)`, and its intersection with `L_S` gives the condition tangent.
- `CategoryCondition.flat`: For `S` the finite flat modules, `D^S` is [4.1](#t4-1), with the condition and Fontaine–Laffaille tangent identification supplied by `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.6.7 (`flatDeformationTangentSpace`).
- `CategoryCondition.mono`: `S⊂T` induces `R^T↠R^S`, compatibly with the same residual object, determinant and universal lifts.

**Checks.**

- `S = S(ρ̄)`: `R^S_{V,𝒪} = R_{V,𝒪}`.
- `S` = finite flat `𝒪[G_ℓ]`-modules `(ℓ = p)`: `R^S` is the flat deformation ring.
- The category `{0,V}` fails product closure since `V⊕V` is missing.
- For `p=3`, `K=ℚ₃`, `𝒪=ℤ₃`, `V=𝔽₃` trivial, let `S` consist of all finite-length coefficient modules with trivial Galois action. Its deformation functor has only the trivial character, so `R^S=𝒪` and `t(D^S)=Ext¹_{S_k}(V,V)=0`. In contrast, `0→k→𝒪/9→k→0`, with first map `a↦3a`, is nonsplit in `S` and gives `Ext¹_S(k,k)≅k`. Its middle object is not killed by 3 and cannot underlie a `k[ε]/(ε²)` deformation. More generally the same exclusion applies to the trivial-action extension `𝒪/ϖ²`.
- A nonsplit Schur extension `V` of distinct characters belongs to `S(ρ̄)` by its one-step `V`-filtration. Its two character factors are not `V` and need not be objects of `S(ρ̄)`.
- For a Schur representation with `p=2` and `d=2`, every invariant endomorphism is scalar and has trace `2a=0`. In `0→ad⁰→ad→k→0` the connecting class `δ(1)` is therefore nonzero in `H¹(ad⁰)` but maps to zero in `H¹(ad)`. Counting it as an unframed fixed-determinant tangent direction would count a strict coboundary.
- For `p` odd, `S` = finite flat, `ρ̄` peu ramifié of weight 2 over `ℚ_p`: `dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄)`.

*Needs:* [4.1](#t4-1); [1.5](#t1-5); [F.3.1](#local-deformation-problem); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.6.7.

(Sources: [BCDT01], §4.3, author manuscript pp. 27–28; the general fixed-determinant tangent description follows from the strict equivalence of [F.1.3](#strict-deformation-functor) and [F.1.7](#fixed-determinant-functors), and `SelmerIwasawaCohomology`, §`2A`.4, *Determinant tangent fibres*.)

<a id="t8-7"></a>

### 8.7 odd archimedean rings

Export the odd real quadric ring as a flat domain of relative dimension two with regular generic fibre. It is formally smooth when the residual involution is not the identity (always for odd `p`). At `p=2` and identity residual involution it is the hypersurface `𝒪[[X,Y,Z]]/(X²+2X+YZ)`. Identify the chosen determinant quotient and its universal involution with Layer 1's construction.

*Needs:* [1.11](#t1-11); [1.14](#t1-14); [8.1](#t8-1).

(Sources: [KW209], Proposition 3.3 and the Remark after it, pp. 20–21.)

<a id="t8-8"></a>

### 8.8 rings at finite places away from `p`

For fixed-character semistable extensions away from `p`, export a flat domain of relative dimension three with regular generic fibre. For inertia-rigid conditions, after splitting coefficients and fixing the reference inertia representation, export a flat ring with every component of relative dimension three and regular generic fibre. It need not be a domain. The nonabelian level-two case assumes `F_v=ℚ_q`, and the abelian split-distinct condition selects one component as specified above.

*Needs:* [2.5](#t2-5); [2.3](#t2-3); [F.4.12](#inertia-rigid-deformations); [8.1](#t8-1); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology); [5.9](#t5-9).

(Sources: [KW209], Theorem 3.1 and §3.3, pp. 18–19 and 32–37.)

<a id="t8-9"></a>

### 8.9 ordinary rings of low weight or weight two

For unramified `F_v`, ordinary residual data with Serre weight `k≤p`, and the selected quotient character, the low-weight crystalline or weight-two potentially Barsotti–Tate ring is a flat domain of relative dimension `3+[F_v:ℚ_p]` with regular generic fibre. It is formally smooth if the residual representation is ramified or split with two distinct unramified characters. Every selected lift is (`χ₁η₁`,*;0,`η₂`), `η_i` unramified, with `χ₁=χ_p^{k−1}` or `χ_pω^{k−2}`. The scalar unramified case uses the projective-line resolution and may be nonnormal as well as nonsmooth; domain does not imply normality.

*Needs:* [8.2](#t8-2); [8.1](#t8-1); [3.9](#t3-9); [1.13](#t1-13); [4.3](#t4-3); [4.4](#t4-4); [5.4](#t5-4).

(Sources: [KW209], §3.2.5, Proposition 3.6, Lemma 3.7 and their proofs, pp. 24–30; [KW209], Lemma 3.5, p. 22.)

<a id="t8-10"></a>

### 8.10 A crystalline lift in Serre weight

For `p≥3` and rank-two residual (`χ̄`,*;0,1) over `ℚ_p`, construct a crystalline lift in its Serre weight `r` with weights `{0,r−1}`. It can be chosen ordinary with unramified quotient using the preceding existence statement. The residual shape is essential: a representation with no unramified quotient cannot be the reduction of such a quotient-bearing lift.

*Needs:* [0.3](#t0-3); [5.5](#t5-5); [8.5](#t8-5).

(Sources: [FKP22], Lemma 7.2, third bullet, arXiv v5 p. 34.)

<a id="t8-11"></a>

### 8.11 The good-dihedral local condition at `q ≡ −1 mod p`

At `q≠p` with `p|q+1` and residual cyclotomic-extension shape up to unramified twist, choose a conjugate pair `χ′`,`χ′^q` of level-two tame characters of `p`-power order, with the dyadic parity constraint. Fixed-determinant induced lifts give a nonempty flat ring of relative dimension three and regular generic fibre. For odd `p` use nontrivial powers of `ω_{q,2}^{(q²−1)/p^r}`, `r=v_p(q+1)`; at `p=2` require `r≥2` and order at least four with the specified parity. No such dyadic character exists when `r=1`. For `q` odd, `i+j=q−1` makes `i−j` even, excluding the adjacent-index case; `q=2`,`p=3` gives `(i,j)=(1,0)`. In the residual-trivial case retain the source's chosen integral triangular basis; equality of generic inertia types alone need not select that integral condition.

*Needs:* [8.8](#t8-8); [F.4.12](#inertia-rigid-deformations); [F.2.9](#fixed-determinant-rings).

(Sources: [KW109], Theorem 5.1 (4), author copy pp. 9–10; [KW109], Remarks after Theorem 5.1, p. 10.)

<a id="t8-12"></a>

### 8.12 Local quotients for weight-two symmetric power lifting (Newton–Thorne §4)

After the specified soluble base change, residual data are trivial and determinant `ε⁻¹`. Nonordinary crystalline, ordinary crystalline and, for `p>2`, noncrystalline semistable quotients at `p` are domains of dimension `4+f`. Fixed-character extension rings away from `p` have dimension four; odd-real rings dimension three. The weight-two source convention translates to `{0,−1}` here.

*Needs:* [4.14](#t4-14); [4.13](#t4-13); [6.6](#t6-6); [8.8](#t8-8); [1.11](#t1-11); [5.13](#t5-13); [5.2](#t5-2); [5.3](#t5-3); [1.14](#t1-14).

(Sources: [NT26], §4, after Theorem 4.1, arXiv v2 p. 27; [NT26], §4, after Theorem 4.1, p. 27.)

<a id="t8-13"></a>

### 8.13 semistable weight-two rings above `p`

With unramified `F_v` and fixed unramified `γ` satisfying `γ²χ_p=φ`, export the semistable extension ring. It is formally smooth of relative dimension `3+[F_v:ℚ_p]` except in the dyadic residual-homothety case, where it is a faithfully flat domain of that relative dimension with regular generic fibre. Fixing `γ` and `φ` forbids adding a free unramified-twist variable.

*Needs:* [8.1](#t8-1); [8.9](#t8-9); [5.6](#t5-6).

(Sources: [KW209], §3.2.6, pp. 30.)

<a id="t8-14"></a>

### 8.14 Torsion semistable lifts of the Newton–Thorne weight-two type form a stable condition

Rank-two torsion semistable objects are subquotients of stable lattices in semistable `ℚ_p`-representations with weights `{0,−1}` in `HT(ε)=+1` convention. This is the source's `{0,1}` type under `HT(ε)=−1`; dualizing gives the distinct KW `{0,1}` shape. Subobject, quotient and sum closure gives a fixed-determinant deformation quotient; the crystalline and noncrystalline semistable quotients factor through it.

*Needs:* [8.12](#t8-12); [4.1](#t4-1); [6.6](#t6-6).

(Sources: [NT26], proof of Lemma 4.2, arXiv v2 pp. 28–29.)

<a id="t8-15"></a>

### 8.15 crystalline lifts of weight `p + 1`

For odd `p`, `F_v=ℚ_p` and the residual Serre-weight `p+1` branch, crystalline weight-`p+1` lifts equal ordinary lifts. The compatible fixed-determinant framed ring is formally smooth of relative dimension four. Retain the nonsmoothness of its stable-line character morphism. This is the endpoint ring comparison of Layer 5, with its complete ordinarity criterion.

*Needs:* [8.13](#t8-13); [5.5](#t5-5); `ClassFieldTheory`, Layer 5 (finite smooth discrete coefficients); `ArithmeticGaloisDuality`, `D7`, *Local duality over finite and local coefficient fields* (stable-lattice topology).

(Sources: [KW209], §3.2.7 and the Remark, pp. 31–32.)

<a id="t8-16"></a>

### 8.16 The dyadic weight-two transition: `k(ρ̄) = 2` versus `k(ρ̄) = 4` at `p = 2`

For `p=2`, the KW weight-two condition is crystalline/Barsotti–Tate for residual Serre weight two and semistable with nonzero monodromy for residual Serre weight four. The mod-two cyclotomic character does not distinguish these cases; `N` does. At weight two use the irreducible smooth ring over `ℚ₂` or the selected reducible ordinary ring over an unramified extension. At weight four the residual extension is très ramifiée, so it is not a homothety and the semistable ring is formally smooth of relative dimension `3+[F_v:ℚ₂]`. Trivial residual data cannot have Serre weight four here.

*Needs:* [5.6](#t5-6); [8.13](#t8-13); [8.1](#t8-1); [8.3](#t8-3); [8.9](#t8-9).

(Sources: [KW209], §3.2.`2 (i)`, author copy p. 23; [KW109], Theorem 5.1 (2), p. 9.)

<a id="t8-17"></a>

### 8.17 the completed tensor product of KW II's local rings

For the selected KW conditions at a finite set `S` containing all real and `p`-adic places of a totally real field, the completed tensor product of the local fixed-determinant framed rings is flat, with all components of relative dimension `3|S|` and regular generic fibre. If all finite away-from-`p` conditions are semistable, it is a domain. After finite coefficient extension it has an integral point. Use the completed-tensor-product and geometric-domain results of [F.0.1](#completed-coefficient-products); for `ℚ` and `S={∞,p}`, the dimensions add as `2+4=6`.

The total factors are equidimensional by their component dimensions in 8.3–8.4,
8.7–8.9, 8.13 and 8.15. For component identification, enlarge coefficients so that each domain component
is geometrically integral, retaining the component maps of F.0.1. The domain conclusion
uses the selected domain factors, their integral points over common coefficients and their
regular generic fibres; special-fibre dimensions alone supply neither conclusion.

*Needs:* [8.7](#t8-7); [8.9](#t8-9); [8.8](#t8-8); [F.0.1](#completed-coefficient-products); [8.2](#t8-2); [8.3](#t8-3); [8.4](#t8-4); [8.13](#t8-13); [8.15](#t8-15).

(Sources: [KW209], Proposition 3.2, p. 19.)

<a id="t8-18"></a>

### 8.18 Nonemptiness of KW II's local rings

For every KW condition satisfying Theorem 3.1's hypotheses and local choices, construct an integral lift after finite coefficient extension. Hence its ring and their completed tensor product are nonzero. General fixed-type quotients can instead be zero.

*Needs:* [8.2](#t8-2); [8.17](#t8-17); [8.8](#t8-8); [8.9](#t8-9); [F.0.1](#completed-coefficient-products).

(Sources: [KW209], Theorem 3.1, p. 19.)

<a id="t8-19"></a>

### 8.19 The local conditions of KW `I` Theorem 5.1

Export the four local patterns for KW `I`'s compatible-system construction: minimal away from `p` with the selected crystalline weight at `p`; minimal away from `p` with prescribed weight-two inertia/monodromy at `p`; the same with a chosen nontrivial tame character at `q`∥`N`, `p|q−1`; and the good-dihedral condition at `q≠p`, `p|q+1`. Supply the relevant quotient, tangent condition, point existence and dimensions (three away from `p` and `3+[F_v:ℚ_p]` above `p`). Characters of `p`-power order require enlarged coefficient integers containing the roots of unity; they need not be `ℤ_p`-valued. The compatible-system and global irreducibility conclusions remain with their global owner.

*Needs:* [8.8](#t8-8); [8.9](#t8-9); [8.3](#t8-3); [8.4](#t8-4); [8.13](#t8-13); [8.15](#t8-15); [8.18](#t8-18); [5.7](#t5-7); [2.8](#t2-8).

(Sources: [KW109], Theorem 5.1, author copy p. 9.)

### Examples

For an odd-prime irreducible weight-two nodal KW branch with unframed ring `𝒪[[T₁,T₂]]/(T₁T₂−p)`, framing gives `𝒪[[T₁,T₂,Z₁,Z₂,Z₃]]/(T₁T₂−p)`. The ring has relative dimension four and a regular generic fibre, but the residual origin is not formally smooth over `𝒪`. A low-weight smooth branch and this nodal branch must retain their separate type choices.

For a rational global application with a real odd local factor `A∞=𝒪[[x,y,z]]/(x²+2x+yz)` and a selected smooth `p`-adic factor `Ap=𝒪[[u₁,u₂,u₃,u₄]]`, the completed tensor product is `𝒪[[x,y,z,u₁,u₂,u₃,u₄]]/(x²+2x+yz)`. Its relative dimension is six. Flatness, component structure and the real dyadic singularity are inherited from the actual equation; a bare sum `2+4` does not specify this ring.

### Dependencies

Uses the selected conditions and geometry of Layers 1–7, the coefficient-algebra component/tensor-product contract, and the full endpoint, Kummer and ordinarity inputs. Global deformation and automorphy roadmaps consume these rings afterward.

## Downstream consumers

`GlobalGaloisDeformations:G7,R04.6` consumes polarized local conditions and selected quotients for global presentations. `PotentialAutomorphyInfrastructure:PA.3` and `PotentialModularityAndCompatibleSystems:R24.2` consume local component and nonemptiness results, including the scoped `GL₃` interface of 6.30. `GL2ModularityLifting:R32` consumes the KW conditions of Layer 8. `PadicLocalLanglandsForGL2Qp:R30.5` consumes the local block/type-ring interface of 3.8. These directions do not supply prerequisites upward to this package.

`GlobalGaloisDeformations`, R04.6, uses the `UniversalDeformation` pair and `hom_ext`,
`mapOfLE`, `mapOfLE_surjective` and `surjective_of_traces` of F.2.5 for its classifying
maps. Its local-condition comparisons use F.3.1's jointly injective and truncation
detection theorems. The fixed-determinant interfaces are those of F.2.9 and F.3.2.

## References and numbering

Locators in the layers refer to the version linked here. Journal numbers are included where the original manuscript and publication differ. A number concordance identifies a result; it does not identify two texts word for word.

- **Chenevier**. Gaëtan Chenevier, [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/pdf/0809.0415v2). In Automorphic Forms and Galois Representations, vol. 1, LMS Lecture Note Series 414 (2014), 221–285. Locators use arXiv:0809.0415v2.

- **KWESI**. Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (II)](https://www.esi.ac.at/preprints/esi1892.pdf). ESI preprint 1892 (2007). Printed pages are PDF pages minus one; its Lemma 4.5 is Lemma 4.6 in the final version [KW209].

- **Gee22**. Toby Gee, [Modularity lifting theorems](https://arxiv.org/pdf/2202.05818v2). Essential Number Theory 1 (2022), 73–126. Locators use arXiv:2202.05818v2, 45 pages.

- **KisinNotes**. Mark Kisin, [Lectures on deformations of Galois representations (Lecture 1)](https://people.math.harvard.edu/~kisin/notes/notes.pdf). Harvard author lecture notes, Lecture 1, four pages.

- **TUNG21**. Shen-Ning Tung, [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/pdf/1908.06174v3). Math. Z. 298 (2021), 107–159. Locators use arXiv:1908.06174v3.

- **CHT08**. Laurent Clozel, Michael Harris and Richard Taylor, [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf). Publ. Math. IHÉS 108 (2008), 1–181. Numdam open-access article; article page equals PDF page.

- **TaylorII**. Richard Taylor, [Automorphy for some l-adic lifts of automorphic mod l Galois representations. II](https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf). Publ. Math. IHÉS 108 (2008), 183–239. Numdam article pages equal PDF pages plus 182.

- **KisinPST**. Mark Kisin, [Potentially semi-stable deformation rings](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi). J. Amer. Math. Soc. 21 (2008), 513–546. Locators use the author DVI def.dvi and its own 34-page pagination, including Errata (E.4), p. 34. In particular (2.7.5) is the setup on p. 23; the point-criterion statements are Theorem (2.7.6) and Corollary (2.7.7) on that page.

- **KW209**. Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Invent. Math. 178 (2009), 505–586. Locators use the 98-page UCLA author copy proofs.pdf (30 May 2009).

- **KisinFlat**. Mark Kisin, [Moduli of finite flat group schemes, and modularity](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi). Ann. of Math. 170 (2009), 1085–1180. Locators use the author DVI bt.dvi and its own pagination (21 October 2008).

- **Savitt**. David Savitt, [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327v3). Duke Math. J. 128 (2005). Locators use the corrected arXiv:math/0404327v3 (15 September 2010), including Remark 1.7; they refer to this corrected text.

- **ACC+**. Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). Ann. of Math. 197 (2023), 897–1113. Locators use arXiv:1812.09999v2 and its 218-page pagination.

- **SkinnerWiles**. C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126. Numdam article pages equal PDF pages plus three.

- **Conrad**. Brian Conrad, *Reductive group schemes*, Luminy author manuscript. Relative Borel locators use Theorem 5.2.11 and Corollary 5.2.13, pp. 157–159.

- **PR**. Georgios Pappas and Michael Rapoport, [Local models in the ramified case I. The EL-case](https://arxiv.org/abs/math/0006222), arXiv v2.

- **CEGS**. Ana Caraiani, Matthew Emerton, Toby Gee, David Savitt, [The geometric Breuil–Mézard conjecture for two-dimensional potentially Barsotti–Tate Galois representations](https://arxiv.org/abs/2207.05235), Theorem 1.3, arXiv v2 p. 4.

- **Kisin2adic**. Mark Kisin, [Modularity of 2-adic Barsotti–Tate representations](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi). Invent. Math. 178 (2009). Locators use the author DVI serre2.dvi and its own pagination (21 October 2008).

- **BIP23**. Gebhard Böckle, Ashwin Iyengar, Vytautas Paškūnas, [On local Galois deformation rings](https://arxiv.org/abs/2110.01638). Forum Math. Pi 11 (2023), e30; corrigendum 12 (2024), e5. Locators use arXiv:2110.01638v2.

- **PQ26**. Vytautas Paškūnas, Julian Quast, [On local Galois deformation rings: generalised reductive groups](https://arxiv.org/abs/2404.14622). Forum Math. Pi 14 (2026), e15. Locators use arXiv:2404.14622v2 (9 January 2026).

- **CG18**. Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/abs/1207.4224). Invent. Math. 211 (2018), 297–433; correction 227 (2022), 855–856. The linked accepted manuscript is arXiv:1207.4224v2; the layer citations also give journal page numbers.

- **BCGP21**. George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269). Publ. Math. IHÉS 134 (2021), 153–501. Locators use arXiv:1812.09269v3 (28 November 2021).

- **BHS19**. Christophe Breuil, Eugen Hellmann, Benjamin Schraen, [A local model for the trianguline variety and applications](https://arxiv.org/abs/1702.02192). Publ. Math. IHÉS 130 (2019), 299–412. The linked manuscript is arXiv:1702.02192.

- **DING25**. Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GL_n](https://arxiv.org/abs/2407.21237). Publ. Math. IHÉS 142 (2025), 1–74. The linked manuscript is arXiv:2407.21237.

- **LTXZZ**. Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/abs/1912.11942). Invent. Math. 228 (2022), 107–375; linked version arXiv:1912.11942v3. The rigidity definition is 6.3.4 there, corresponding to journal Definition 6.3.3; citations distinguish the two numberings.

- **LTXZZrigid**. Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [Deformation of rigid conjugate self-dual Galois representations](https://arxiv.org/abs/2108.06998). arXiv:2108.06998v1; published in Acta Math. Sin. 40 (2024), 1599–1644. Locators refer to arXiv v1.

- **NT26**. James Newton, Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595). Ann. of Math. 203 (2026), no. 1. Locators use arXiv:2212.03595v2.

- **CG20**. Frank Calegari, David Geraghty; appendix by Frank Calegari, David Geraghty, Michael Harris, [Minimal modularity lifting for nonregular symplectic representations](https://arxiv.org/abs/1907.08691). Duke Math. J. 169 (2020), 801–896. Linked manuscript arXiv:1907.08691v1, with appendix arXiv:1907.08694v1; layer locators specify journal pages.

- **FKP22**. Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis, [Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/abs/2008.12593). Invent. Math. 228 (2022), 415–492. Locators use arXiv:2008.12593v5.

- **BCGP25**. George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (2025); locators use its own pagination.

- **CDN23**. Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/abs/2204.11214). Forum Math. Pi 11 (2023), e16; linked manuscript arXiv:2204.11214. The full Weil–Deligne point theorem is Théorème 5.11.

- **BCDT01**. Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://math.stanford.edu/~conrad/papers/tswfinal.pdf). J. Amer. Math. Soc. 14 (2001), 843–939. Locators use the linked author manuscript: §1.1 is on pp. 7–8 and §4.3 on pp. 27–28.

- **CN23**. Ana Caraiani, James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/abs/2301.10509v3). arXiv:2301.10509v3; locators use this version.

- **KW109**. Chandrashekhar Khare, Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Invent. Math. 178 (2009), 485–504. Locators use the UCLA author copy results.pdf.

- **BLGGT14**. Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/abs/1010.2561). Ann. of Math. 179 (2014), 501–609. Locators use arXiv:1010.2561v4.

- **BCGNT25**. George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/abs/2309.15880). Forum Math. Pi 13 (2025), e10; linked manuscript arXiv:2309.15880.

- **BCG25**. George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944). J. Amer. Math. Soc. 38 (2025), 509–520; linked manuscript arXiv:2309.15944v3.

- **LLHLM20**. Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, [Serre weights and Breuil's lattice conjecture in dimension three](https://arxiv.org/abs/1608.06570). Forum Math. Pi 8 (2020), e5. Locators use the journal-style numbering of arXiv:1608.06570v4. References to LLHLM18 within the chart formulas are to the earlier companion paper cited there.

- **LLHLM18**. Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, [Potentially crystalline deformation rings and Serre weight conjectures: shapes and shadows](https://arxiv.org/pdf/1512.06380v3). Invent. Math. 212 (2018), 1–107. Locators use arXiv:1512.06380v3; the descent, eigenbasis and finite-level patching targets use §§2.1 and 7.1–7.3.

- **EG14**. Matthew Emerton, Toby Gee, [A geometric perspective on the Breuil–Mézard conjecture](https://math.uchicago.edu/~emerton/pdffiles/refinedbm.pdf). J. Inst. Math. Jussieu 13 (2014), 183–223. The scoped globalization uses Appendix A, Propositions A.2, A.6 and Corollary A.7, author pp. 32–35, with its potentially diagonalizable regular-lift hypothesis.

- **CT17**. Laurent Clozel, Jack A. Thorne, [Level-raising and symmetric power functoriality, III](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf). Duke Math. J. 166 (2017), 325–402. Locators use the Cambridge accepted manuscript lrspiii.pdf.

- **Shotton**. Jack Shotton, [The Breuil–Mézard conjecture when l ≠ p](https://arxiv.org/pdf/1608.01784v2). Duke Math. J. 167 (2018), 603–678. Locators use arXiv:1608.01784v2 (16 October 2017).

- **THORNE15**. Jack Thorne, [Automorphy lifting for residually reducible l-adic Galois representations](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download). J. Amer. Math. Soc. 28 (2015); locators use the accepted author manuscript of 16 April 2014.

- **Geraghty**. David Geraghty, [Modularity lifting theorems for ordinary Galois representations](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf). Math. Ann. 373 (2019), 1341–1427. Locators use the author preprint of 12 March 2010, with concordance: journal 2.32↔preprint 2.7.7, 3.5↔3.2.1, 3.6↔3.2.2, 3.7↔3.2.3, 3.10↔3.3.3, 3.13↔3.4.2 and 3.14↔3.4.3. The preprint statements are the targets.

- **BOOHER19**. Jeremy Booher, [Minimally ramified deformations when ℓ ≠ p](https://arxiv.org/pdf/1807.10743). Compositio Math. 155 (2019), 1–37; locators use arXiv:1807.10743v1.

- **DOTTO25**. Andrea Dotto, [Breuil–Mézard conjectures for central division algebras](https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf). Algebra & Number Theory 19 (2025), 213–247. Journal page equals PDF page plus 211; arXiv:1808.06851v3 has the same numbering.

- **BellovinGee**. Rebecca Bellovin, Toby Gee, [G-valued local deformation rings and global lifts](https://arxiv.org/pdf/1708.04885). Algebra & Number Theory 13 (2019), 333–378. Locators use arXiv:1708.04885v3 (30 December 2018).
[ACC+]: https://arxiv.org/pdf/1812.09999v2
[BCDT01]: https://math.stanford.edu/~conrad/papers/tswfinal.pdf
[BCG25]: https://arxiv.org/abs/2309.15944
[BCGNT25]: https://arxiv.org/abs/2309.15880
[BCGP21]: https://arxiv.org/abs/1812.09269
[BCGP25]: https://arxiv.org/abs/2502.20645v1
[BHS19]: https://arxiv.org/abs/1702.02192
[BIP23]: https://arxiv.org/abs/2110.01638
[BLGGT14]: https://arxiv.org/abs/1010.2561
[BOOHER19]: https://arxiv.org/pdf/1807.10743
[BellovinGee]: https://arxiv.org/pdf/1708.04885
[CDN23]: https://arxiv.org/abs/2204.11214
[CG18]: https://arxiv.org/abs/1207.4224
[CG20]: https://arxiv.org/abs/1907.08691
[CHT08]: https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf
[CN23]: https://arxiv.org/abs/2301.10509v3
[CT17]: https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf
[DING25]: https://arxiv.org/abs/2407.21237
[DOTTO25]: https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf
[FKP22]: https://arxiv.org/abs/2008.12593
[Gee22]: https://arxiv.org/pdf/2202.05818v2
[Geraghty]: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf
[KW109]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[KW209]: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf
[Kisin2adic]: https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi
[KisinFlat]: https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi
[KisinNotes]: https://people.math.harvard.edu/~kisin/notes/notes.pdf
[KisinPST]: https://people.math.harvard.edu/~kisin/dvifiles/def.dvi
[LLHLM20]: https://arxiv.org/abs/1608.06570
[LTXZZ]: https://arxiv.org/abs/1912.11942
[LTXZZrigid]: https://arxiv.org/abs/2108.06998
[NT26]: https://arxiv.org/abs/2212.03595
[PQ26]: https://arxiv.org/abs/2404.14622
[Savitt]: https://arxiv.org/pdf/math/0404327v3
[Shotton]: https://arxiv.org/pdf/1608.01784v2
[SkinnerWiles]: http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf
[THORNE15]: https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download
[TUNG21]: https://arxiv.org/pdf/1908.06174v3
[TaylorII]: https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf

[Conrad]: https://math.stanford.edu/~conrad/papers/luminysga3.pdf
[CEGS]: https://arxiv.org/abs/2207.05235

[PR]: https://arxiv.org/abs/math/0006222

[Chenevier]: https://arxiv.org/pdf/0809.0415v2
[KWESI]: https://www.esi.ac.at/preprints/esi1892.pdf
