# Roadmap: reductive bundles, B(G) and Newton strata

**Summary.** For connected reductive groups over every nonarchimedean local field, this roadmap develops the arithmetic classification of `B(G)`, its acceptable and ordinary classes, algebraic `σ`-centralizers and Newton topology. It proves Beauville–Laszlo uniformization, isocrystal-family descent, stratum dimensions and connected components, using the tensor–torsor dictionary and bundle geometry supplied by RelativeFarguesFontaine and VStackSheavesAndLisseCategories. Its chart comparison identifies the supplied open images with Newton-order down-sets.

## Scope and ownership

This roadmap owns, over every nonarchimedean local field `E` with finite residue field:

- rational filtered tensor theory, pure inner twisting and families of `G`-isocrystals (Layer 0);
- the arithmetic classification of `B(G)`, basic, decent, acceptable and ordinary classes, the algebraic `σ`-centralizers `J_b` and their defect, and comparisons with straight elements, torus classes and abelianized cohomology (Layer 1);
- Newton topology, Beauville–Laszlo uniformization and descent for families of `G`-isocrystals over perfect schemes (Layer 2);
- filtered relative automorphism group schemes, stratum dimensions and connected components, together with the supplier comparisons below (Layer 3); the locally profinite classifying-stack theorem is §0.9;
- the Newton-order interpretation of the supplied chart images and the rank-two extension calculation (Layer 4).

VStackSheavesAndLisseCategories §VS4.0 supplies `BunGeometry`, `BunNewtonGeometry`, `BunAutomorphisms` and `BunCharts`, with pullback, general-local-field invariant maps, geometric classification, strata, full automorphisms and contracting charts, including nonsplit `G`. The overlapping statements in §§0.5–0.6, 1.8, 1.21, 2.3–2.6, 2.15, 3.1–3.2, 3.4–3.5, 3.7, 3.9, 3.16–3.17 and 4.1–4.7 are supplier contracts. The abstract group APIs, arithmetic classification and the identification of chart images with Newton-order down-sets remain targets here. RelativeFarguesFontaine §7.0 supplies the scheme and sousperfectoid tensor–torsor dictionary of §§0.1, 0.3 and 0.4. HodgeTateAndCanonicalSubgroups §2.14 supplies integer-filtered fibre functors and their parabolic, unipotent and Levi theory; §§0.2 and 3.3 add rational reindexing, affine splitting and higher raising subgroups. IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5 supplies the flag strata and unitary results of §§3.12–3.15; its §§IG.F.6, IG.F.9, IG.F.11 and IG.F.12a supply the corresponding mixed-characteristic bundle, stratum and chart interfaces.

The linear theory belongs to VectorBundlesAndIsocrystals: finite isocrystals and their slope blocks, bundles on the relative curve and their HN theory, the isocrystal-to-bundle functor, geometric classification of vector bundles, Banach–Colmez spaces and relative slope filtrations. Lattice gluing of `G`-bundles at an untilt divisor (Beauville–Laszlo gluing) belongs to RelativeFarguesFontaine Layer 7; this roadmap proves that the resulting modification map is a v-cover of `Bun_G`. Modification spaces, Schubert bounds and open Schubert cells belong to GeometricSatakeAndFusion GS0. Artin v-stacks, smooth descent and the Jacobian criterion belong to VStackSheavesAndLisseCategories VS0–VS1, and its VS4.0 supplies the bundle geometry. Sheaf categories belong to VStackSheavesAndLisseCategories VS3–VS5; Hecke stacks, local shtukas and the spectral action are developed downstream, by the consumers HeckeStacksAndLocalShtukas and ExcursionOperatorsAndSpectralAction.

<a id="algebraic-fundamental-group"></a>

Reductive groups over a field, their rational representations as comodules and their structure theory are Tau Ceti's ReductiveGroups, Layers 1 and 7. The integral algebraic fundamental group `π₁(G)`, z-extensions, the representative Kottwitz homomorphism `κ̃: G(L) → π₁(G)_I` with its Frobenius equivariance, parahoric group schemes, Lang's theorem, the Iwahori–Weyl group with lengths and admissible sets, and the surjectivity `G(E) → (π₁(G)_I)^σ` belong to ReductiveGroupsPartII §§RG2.1.5, RG2.3 and RG2.4; this roadmap descends `κ̃` to `σ`-classes and proves the applications to centralizers. Scheme bundle foundations are AlgebraicVectorBundles; Tau Ceti supplies `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, its symmetric monoidal category, free sheaves and pullbacks. The weight-space construction after corestriction, its membership criterion and finite-support theorem are already `TauCeti.DiagonalizableGroup.weightSpace`, `mem_weightSpace` and `finite_setOf_weightSpace_ne_bot`; the rational-slope additions below are common-denominator bounds and coordinate-map comparisons. Crossed-module Galois cohomology, Tate–Nakayama and abelianization of reductive groups belong to EndoscopicTransferAndUnitaryTraceComparison Layer 1.

PadicHodgeTheory §5.5 supplies the minimal `p`-adic invariant theory and the affine tensor-isomorphism torsor. VStackSheavesAndLisseCategories §VS4.0 extends the invariant maps to general local fields; RelativeFarguesFontaine §7.0 glues the affine scheme comparison. The arithmetic classification below uses these supplied constructions. Two neighbouring roadmaps state the special case `E = ℚ_p` of part of this theory in the form their arguments use: IgusaVarietiesAndTorsionConcentration §§IG.0.1–IG.0.2 (`B(G)`, the Newton and Kottwitz maps, the order and `B(G, μ)`) and EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.5 (`G`-isocrystals, Newton and Kottwitz invariants with the PEL sign, decent representatives and `J_b`). The supplied definitions and the arithmetic targets here cover every nonarchimedean local field and specialise to those statements at `E = ℚ_p`; EndoscopicTransfer writes `σ`-conjugacy as `b ↦ g⁻¹ b σ(g)`, which has the same orbits.

## Conventions

Let `E` be a nonarchimedean local field with residue field `F_q`, uniformizer `π`, and `L = Ĕ` the completion of its maximal unramified extension, with residue field an algebraic closure `k` of `F_q`. In mixed characteristic `L = W_{O_E}(k)[1/π]`; in equal characteristic `L = k((π))`. Frobenius `σ` is the arithmetic `q`-Frobenius of `L`; it fixes `E` and `π`. For `E = ℚ_p`, `L` is Mathlib's `FractionRing (WittVector p k)` with `WittVector.FractionRing.frobenius`. Statements that need a reductive integral model, a quasi-split form, a minuscule cocharacter, an unramified group or `p`-adic `E` carry these hypotheses explicitly.

`Rep_E(G)` is the category of finite-dimensional rational representations of `G`, that is, finite comodules over its coordinate Hopf algebra (Tau Ceti's `FGPointRepresentationCat` with its rigid symmetric monoidal structure). A representation of the abstract group `G(E)` is not a rational representation. Exact tensor functors preserve short exact sequences, tensor products, the unit and duals; isomorphisms of tensor functors are tensor natural isomorphisms.

`σ`-conjugacy is `b′ = g b σ(g)⁻¹`. The slope protorus `D` has character group `ℚ`. A rank-one isocrystal with Frobenius `π^m σ` has isocrystal slope `m` and gives the bundle `O(−m)`: the isocrystal-to-bundle functor reverses slopes. For dominant Newton vectors the bundle HN vector is `ν* = w₀(−ν)`, and the first Chern class of `E_b` is `−κ(b)`. For `GL_n` slopes are listed in decreasing order and compared by partial sums with equal total. Dominance uses nonnegative rational combinations of positive **coroots** in the rational cocharacter space.

The representative Kottwitz homomorphism takes values in `π₁(G)_I`; the class invariant takes values in the full Galois coinvariants `π₁(G)_Γ`, integrally and with torsion. Rational averaging relates `κ ⊗ 1` to `ν` and loses torsion. The order on `B(G)` fixes `κ` and increases the dominant Newton point. On `|Bun_G|` one has `[b] ≤ [b′]` exactly when `E_{b′}` lies in the closure of `E_b`: the basic point of a `κ`-fibre generalizes to the more unstable points. A rational Newton orbit need not have an `E`-rational representative in `G`; the central Newton morphism of `J_b` does descend for every `b`.

Translations of the Iwahori–Weyl group are indexed through the Kottwitz quotient `T(L)/T(L)_0 ≅ X_*(T)_I` for the maximal torus of ReductiveGroupsPartII RG2.4.3. A geometric cocharacter contributes its inertia-coinvariant class. When `μ` is defined over `L`, evaluation `μ(π)` represents the translation with Kottwitz class `+[μ]_I`; RG2.4 labels the same element by `−[μ]_I`, because its apartment translation parameter uses the inverse Kottwitz image. Dominant displacements convert by `ν_std = −w₀(ν_disp)`. In split `GL_2`, `diag(π, 1)` has RG2.4 dominant displacement `(0, −1)`, Newton point `(1, 0)` and `κ = 1`.

Schubert labels use GeometricSatakeAndFusion GS0: `Gr^GS_μ` is indexed by `μ(ξ)`. RelativeFarguesFontaine §7.7 gives `BL(ξ^m B_dR⁺)=O(−m)`, hence `κ(BL(x))` is the Γ-coinvariant image of the component `α`. Caraiani–Scholze and Igusa use the inverse label: `Gr^CS_η=Gr^GS_((−η)^dom)`, so `η=(−μ)^dom` converts a GS label `μ` to a CS label. A rank-one lattice `ξ^m` has CS label `−m`. Flag strata below use the supplied Igusa carriers through this adapter.

For the bundle moduli, `J̃_b` denotes the full automorphism v-group of `E_b`. Its positive Banach–Colmez kernel has dimension `⟨2ρ, ν_b⟩` and the stratum has the negative of that dimension. The charts use the opposite extension filtration and negative-slope extension spaces. The framed chart is not an absolute diamond, although the complement of its split point is locally spatial and its map to the point is representable in locally spatial diamonds; the chart quotient is an Artin v-stack. For `ℓ`-cohomological statements fix a prime `ℓ ≠ p`. Finite-coefficient comparisons on the curve treat `p`-power torsion separately, by tilting and Artin–Schreier theory.

The abelianized Weil construction is stated for `p`-adic `E`. Its coefficients are `L^sep`-points, with the natural continuous action of the Weil group, inertia included; `L`-points do not suffice. For isocrystal slope `λ`, `A_λ = End_Φ(D_λ)` has arithmetic Brauer invariant `−λ`; the bundle has slope `−λ`. Right-module Morita equivalence uses `Hom(E_b, E)` with precomposition, with inverse `M ↦ M ⊗_A E_b`; Fargues–Scholze's `Hom(E, E_b)` uses left modules. The slope one-third example detects the sign; slope one-half does not.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The generic passage from a monoid equivalence to its unit-group equivalence is
[`Units.mapEquiv`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Group/Units/Equiv.lean),
with `Units.coe_mapEquiv` for its value. The sign automorphism of an additive
commutative group is `AddEquiv.neg` in that same module. These supply the Witt
unit Frobenius and the sign action in the integral component examples directly.

Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

- `TauCeti.ReductiveAffineGroupSchemeCat` and `TauCeti.AffineGroupSchemeCat`: reductive affine group schemes of finite type over a field, through the Hopf-algebra equivalence, and affine group objects over `Spec` of a commutative ring. Neither supplies local Newton theory.
- `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.leviGroupExtension`: the dynamic parabolic, unipotent and Levi point groups of a cocharacter; HodgeTateAndCanonicalSubgroups §2.14 supplies the relative filtration groups, with rational-threshold comparisons here.
- `TauCeti.FGPointRepresentationCat` and its `instRigidCategory`: finite rational representations as finite comodules, rigid symmetric monoidal. `TauCeti.Tannaka.fgPointTensorIsoEquiv`: over a field, algebra-valued points are tensor automorphisms of scalar extension on finite comodules. `TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`, `TauCeti.Comodule.pointsAction`, `TauCeti.Tannaka.scalarExtensionComponent`, `TauCeti.Comodule.rTensor_comp_endOfPoint`, `TauCeti.Comodule.baseChange_comp_endOfPoint`, `TauCeti.Comodule.endOfPoint_tensor` and `TauCeti.Comodule.endOfPoint_trivial`: scalar extension of comodules and the action of points on it, with its tensor, unit and base-change compatibilities. These give the trivialized Frobenius tensor families of [§0.5](#g-isocrystals-and-B-of-G).
- `TauCeti.AlgHom.mapValue` and `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`: coefficient change on points, and points of `G_m` as units.
- `TauCeti.DiagonalizableGroup.weightSpace`, `TauCeti.DiagonalizableGroup.mem_weightSpace`, `TauCeti.DiagonalizableGroup.isInternal_weightSpace`, `TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot` and `TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective`, with Mathlib's `MonoidAlgebra.mapDomainBialgHom`: weight decompositions of comodules over group algebras, their finite support, and bialgebra maps of monoid algebras over a field.
- `TauCeti.ExactStructure` and `TauCeti.ExactStructure.IsConflationExact`: a chosen Quillen exact structure and exact functors.
- Mathlib `CategoryTheory.Functor.Monoidal`, `Functor.Braided`, `Functor.Linear`, `NatTrans.IsMonoidal`, `Equivalence`, `Groupoid` and `Aut.Aut_mul_def` (`Aut` multiplication is reversed composition); `Subgroup`, `MulEquiv`, `Submodule`, `RootPairing`, `Specializes`, `Representation.Coinvariants` with `mk` and `map`, `Algebra.TensorProduct.map` and `congr`.
- Mathlib `WittVector.Isocrystal`, `WittVector.FractionRing.frobenius` and `WittVector.exists_frobenius_solution_fractionRing`: the `p`-typical isocrystals, Frobenius on the Witt fraction field, and the rank-one normal form over an algebraically closed residue field.

Tau Ceti also supplies `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` in `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean`, with `free`, `pullback`, the symmetric monoidal structure and finite biproducts. Its `pullbackId` and `pullbackComp` in `VectorBundle/Functoriality.lean` provide the scheme pullback coherence. These scheme APIs are prerequisites, not new curve or bundle-moduli targets.

### From Tau Ceti roadmaps

- **ReductiveGroups**, Layer 1 (rational representations as comodules, tensor-functor torsor reconstruction over a field, faithful representations) and Layer 7 (Borels, maximal tori, parabolics, Levi factors, based root data with Galois action).
- **ReductiveGroupsPartII**: §RG2.0.4 (`L` and `σ`), §RG2.1.5 (`π₁(G)` with Galois action, inertia coinvariants and Weyl invariance; z-extensions, their existence and the exact sequence of fundamental groups; the representative Kottwitz homomorphism `κ̃`, its surjectivity, naturality and `σ`-equivariance), RG2.3 (smooth affine models and parahoric group schemes, keeping parahorics distinct from `G(O_L)`; Lang's theorem) and RG2.4 (the Iwahori–Weyl group, its lengths and Bruhat order, admissible sets, dominant coinvariant cocharacters, Cartan and Iwasawa decompositions, and the surjectivity `G(E) → (π₁(G)_I)^σ` of §RG2.4.2), with its translation sign as in the Conventions.
- **AlgebraicVectorBundles**, L0A–L0C: finite locally free sheaves on schemes, their local-basis characterization and pullback. The relative-curve comparisons remain VectorBundlesAndIsocrystals VB1–VB2.

### From geometric and arithmetic roadmaps

- **VectorBundlesAndIsocrystals.** VB−1: ramified Witt coefficient rings, equal-characteristic power series and their Frobenius; VB0: finite `E`-isocrystals over `L` as an exact rigid `E`-linear tensor category, Dieudonné–Manin decomposition with slope multiplicities, tensor and dual slopes, the division endomorphism algebra of a simple block and its arithmetic Brauer invariant. VB1: finite locally free bundles on the relative curve as an exact symmetric tensor category with pullback and v-descent, and the exact tensor isocrystal-to-bundle functor normalized by `E(π^m) = O(−m)`. VB2: GAGA on affinoid perfectoid bases, geometric classification of bundles, and the stable-bundle endomorphism comparison. VB3: families of two-term Banach–Colmez spaces (representability, partial properness, properness of the punctured space, cohomological smoothness and dimension in the positive and negative ranges) and properness of projectivized Banach–Colmez spaces and the “Quotients by contracting automorphisms” criterion. VB4: relative HN filtrations with constant polygon and their pro-étale splitting, upper semicontinuity of the HN polygon, the equivalence between bundles with all geometric slopes zero and pro-étale `E`-local systems, and the relative vanishing of positive-slope H¹.
- **RelativeFarguesFontaine.** Layer 1 (relative period annuli and the exhaustion of the period domain), §4.7 (the degree-one divisor space Div¹ and its projection), §§4.12–4.13 (`B_dR⁺` as the completed local ring at an untilt), §7.0 (`torsorTensorDictionary`: scheme and sousperfectoid tensor–torsor comparisons, associated bundles, pullback, change of structure group and faithful tensor generators), and §§7.2 and 7.7 (Beauville–Laszlo gluing of `G`-bundles and the modification of a `G`-bundle by a B_dR⁺-lattice, with base change).
- **HodgeTateAndCanonicalSubgroups.** §2.14, `TauCeti.HodgeTate.filteredFiberFunctor_split`: the integer-filtered fibre-functor carrier, fpqc-local splitting torsor, filtration parabolic, unipotent radical and Levi/type dictionary, with base change. Sections 0.2 and 3.3 use these constructions after clearing rational denominators; affine global splitting and the higher rational-threshold Lie and graded-vector-group API are targets here.
- **DiamondsAndVStacks.** §§D0.25–D0.26 (stackification, groupoid quotients and two-fibre products), §§D1.4 and D1.9 (strictly totally disconnected spaces and universally open covers by them), Layer D2 (pro-étale and v-sites), Layer D3 (effective descent; §D3.10 torsors under locally profinite groups), Layer D4 (diamonds and small v-stacks, §D4.7; underlying spaces and open substacks), §D5.12 (maps representable in locally spatial diamonds) and §D6.5 (étale sites of an analytic adic space over `ℤ_p` and of its diamond).
- **DiamondEtaleCohomology**, §§C1.11–C1.12: base change for qcqs maps of locally spatial diamonds and prime-to-p torsion coefficients, including the bounded-below derived form.
- **VStackSheavesAndLisseCategories.** §§VS0.1–VS0.2: Artin v-stacks, representable diagonals, `ℓ`-cohomological smoothness and its dimension, with smooth descent. The locally profinite classifying-stack theorem is [§0.9](#locally-profinite-classifying); a faithful rational representation embeds each `J_b(E)` as a closed subgroup of `GL_n(E)`. §VS4.0 supplies `BunGeometry`, `BunNewtonGeometry`, `BunAutomorphisms` and `BunCharts` as specified in Scope and ownership. §VS1.3 also supplies sousperfectoid spaces and their smooth section geometry. §VS1.3: the Jacobian criterion for sections of a smooth space over the curve whose tangent bundle has positive HN slopes.
- **GeometricSatakeAndFusion**, GS0: the Schubert bounds `Gr_{≤μ}` over Div¹ for general `E`, with their properness, filtered exhaustion and Galois descent for nonsplit `G`; open Schubert cells, their stabilizers and their cohomological smoothness of dimension `⟨2ρ, μ⟩`, and, for minuscule `μ`, the identification of the cell with the flag variety.
- **EndoscopicTransferAndUnitaryTraceComparison**, Layer 1: Galois cohomology with coefficients in a crossed module (§1.1), abelianized cohomology of a reductive group (§1.5), and Kottwitz's map with its duality (§1.11).
- **IgusaVarietiesAndTorsionConcentration**, IG.0: the quasi-split unitary similitude datum (§IG.0.3) with its integral model, its special-fibre Newton stratification (§IG.0.12), the central-leaf dimension (§IG.0.25) and Igusa-tower dimension (§IG.1.4a). §§IG.3.4–IG.3.5 supply `flagNewtonClass`, `flagNewtonStratum`, their locally closed strata and closed upper unions, the unitary dimension theorem and the ordinary rational-point locus. Sections 3.12–3.15 use these carriers with the order and Schubert-label adapters below. Sections IG.F.6, IG.F.9, IG.F.11 and IG.F.12a supply mixed-characteristic bundle, automorphism, stratum and contracting-chart APIs.
- **PadicHodgeTheory**, §5.5: `tensorIsomTorsor` represents tensor-isomorphism torsors over affine schemes for any coefficient field, with actions and base change. Its `sigmaConjugacy`, Newton map and `kottwitzInvariant` supply the minimal `p`-adic invariant theory, and `localTorsorKottwitz` supplies the torsor comparison over every finite extension of `ℚ_p`. RelativeFarguesFontaine §7.0 supplies relative scheme gluing and analytic torsors; VStackSheavesAndLisseCategories §VS4.0 supplies the general-local-field extensions on these carriers and normalizations.
- **ModularCurves**, §0E: effective faithfully flat descent of affine schemes.
- **SchemeAndStackFoundations**, §§1.15 and 2.3: torsors on the common site carrier and their descent.
- **AlgebraicModuliForArithmeticGeometry**, §3.1: module descent and descent of finite local freeness.

## How to read the build

Layer 0 uses the tensor–torsor dictionary and the representative groupoid supplied by RelativeFarguesFontaine §7.0 and VStackSheavesAndLisseCategories §VS4.0, and adds rational filtered theory and pure inner twisting. Layer 1 develops arithmetic classification, `J_b`, decency and acceptable, ordinary and torus-special classes using the supplied invariant maps and order. Layer 2 uses the supplied bundle stack and geometric classification to prove uniformization, Newton topology and descent for isocrystal families. Layer 3 records the supplied HN, automorphism and flag-stratum APIs, develops filtered relative group schemes and computes stratum dimensions and connected components. Layer 4 records the supplied filtered charts and identifies their images with Newton-order down-sets.

Each target states its hypotheses, its proof route with sources, the API a reusable formalization needs, and its Checks. The API names below specify the library to be built. `Suggested.lean` states the matrix/isocrystal correspondence and the arithmetic Newton classification for `GL_n` over the Witt fraction field, using Mathlib’s native matrices and isocrystals. The latter includes the existence of decent representatives. Its module docstring identifies the missing objects for the general reductive and geometric headline results. The Witt rank-one classification is supplied by Mathlib and is a specialization of the general-rank statement.

## Layer 0: `G`-bundles, `G`-isocrystals and the set B(G)

Use the supplied tensor descriptions of `G`-bundles and `G`-isocrystals and `B(G)` with its representative groupoid. Develop rational filtered tensor theory and pure inner twisting. Families of `G`-isocrystals over perfect schemes are defined here; their descent is proved in Layer 2.

<a id="g-bundle"></a>

### 0.1 `G`-bundles as exact tensor functors

Use `GBundle` from RelativeFarguesFontaine §7.0. For a sousperfectoid `E`-space `X` and a connected reductive group `G` over `E`, a `G`-bundle on `X` is an exact `E`-linear tensor functor from the category `Rep_E(G)` of finite-dimensional rational representations to finite locally free bundles on `X`; its arrows are tensor natural isomorphisms. Exactness means that short exact sequences of representations go to short exact sequences of bundles. An arbitrary functor, or an abstract action of the group `G(E)`, is not a `G`-bundle.

*Supplied construction.* RelativeFarguesFontaine §7.0 uses `Rep_E(G)` from ReductiveGroups Layer 1 and the bundle categories of VectorBundlesAndIsocrystals VB1. The groupoid keeps tensor isomorphisms and the exact structure.

*Remark.* `GL_n` gives rank-n vector bundles and their isomorphisms.

The API:

- `GBundle.trivial`: The standard fibre functor `V↦V⊗_E O_X` defines the trivial `G`-bundle.
- `GBundle.evaluate`: For each rational representation `V`, evaluate a `G`-bundle to a bundle of rank `dim_E V`; tensor and dual comparisons are natural.
- `GBundle.tensorIso`: An isomorphism consists of invertible natural maps preserving the unit and tensor constraints.
- `GBundle.pullback`: For `f:Y→X`, bundle pullback gives `f`* on `G`-bundles, with coherent identity and composition isomorphisms.
- `GBundle.tensorIso_ext`: Two tensor natural isomorphisms are equal if their components agree on every finite rational representation.

**Checks.**

- For `G=G_m`, evaluation at the standard character identifies `G`-bundles with line bundles.
- For `G=1` the `G`-bundle groupoid has one object up to a unique isomorphism.
- For `GL_2` the standard and standard-plus-determinant faithful realizations recover isomorphic torsors; independent unrelated bundles do not define a tensor functor.

Source: [FS](#ref-fs), after III.1.1 p. 88.

*Needs:* RelativeFarguesFontaine §7.0 (`torsorTensorDictionary`); ReductiveGroups Layer 1 (representations and comodules); VectorBundlesAndIsocrystals Layer VB1 (finite locally free bundles on the relative curve); Mathlib `CategoryTheory.Functor.Monoidal`, `CategoryTheory.Functor.Linear`, `CategoryTheory.Functor.Braided`, `CategoryTheory.NatTrans.IsMonoidal`; Tau Ceti `FGPointRepresentationCat`, `FGPointRepresentationCat.instRigidCategory`, `ExactStructure`, `ExactStructure.IsConflationExact`.

<a id="relative-tensor-torsors"></a>

### 0.2 Relative tensor torsors and filtered automorphism groups

Let `G` be a connected reductive group over `E` and `X` an `E`-scheme or a sousperfectoid `E`-space. RelativeFarguesFontaine §7.0, `torsorTensorDictionary`, supplies the scheme and sousperfectoid comparisons, associated bundles, pullback and change of structure group. Item `1` records that supplied API. On schemes, items `2`–`3` use HodgeTateAndCanonicalSubgroups §2.14, `TauCeti.HodgeTate.filteredFiberFunctor_split`, for the integer-filtered carrier, fpqc-local splitting torsor and parabolic/unipotent/Levi and type constructions. The additions here are rational reindexing, affine global splitting and higher raising subgroups; ReductiveGroups Layer 1 supplies the field-valued dictionary.

`1`. *Supplied relative torsor gluing and analytic reconstruction.* For an exact tensor functor `ω: Rep_E(G) → Vect(X)`, the sheaf `Isom^⊗(ω_std ⊗ O_X, ω)` is represented by a `G`-torsor, recovered from `ω` applied to the regular representation written as a filtered colimit of finite subrepresentations; exactness of `ω` makes the resulting algebra faithfully flat. On schemes the torsor is fpqc, hence étale-locally trivial because `G` is smooth. The automorphism sheaf `Aut^⊗(ω)` is represented by the inner form of `G` defined by this torsor, with base change.
`2`. *Rational filtered functors.* Locally clear the finitely many rational jump denominators on a tensor generator and rescale to the supplied integer-filtered carrier; exact tensor generation gives the same denominator on every representation. Transport its splitting torsor and parabolic/unipotent/Levi constructions through this reindexing. Over an affine base the functor splits when its underlying tensor automorphism group is smooth, by Ziegler’s affine splitting theorem. For reductive `G` this gives splittings on affine opens and, after trivializing the underlying torsor, étale-locally. For `λ > 0`, construct the smooth closed subgroups raising every filtration by at least `λ` or more than `λ` and identify their graded quotients as vector groups, as in §3.3.
`3`. *Rational cocharacters.* After reindexing, a supplied integral splitting defines a rational cocharacter of the inner form. Transport the supplied parabolic/type dictionary and its conjugacy description of splittings, compatibly with base change and descent along étale covers.

**Checks.**

- For `G = GL_n`, item `1` is the frame bundle of a rank-n bundle and `Aut^⊗` is `GL` of that bundle.
- For `G = G_m` and a `ℤ`-filtration with a single jump, the filtered automorphism group is all of `G_m` and its unipotent radical is trivial.
- On P¹ over a field, the Euler sequence `0 → O(−1) →` O² `→ O(1) → 0` gives a two-step filtration of the trivial rank-two bundle that splits on each affine chart but not globally, since O² is not isomorphic to `O(−1) ⊕ O(1)`: splitting is only local on a non-affine base.

Source: [SW](#ref-sw), Theorems 19.5.1–19.5.2, pp. 178–180; [Zie15](#ref-zie15), Theorem 1.3, p. 2, §4.3, Theorems 4.14–4.16, pp. 24–25, and Proposition 4.24, Lemma 4.25, Theorem 4.26, pp. 26–27; [FS](#ref-fs), Proposition III.5.2, p. 105.

*Needs:* RelativeFarguesFontaine §7.0 (`torsorTensorDictionary`); HodgeTateAndCanonicalSubgroups §2.14 (`TauCeti.HodgeTate.filteredFiberFunctor_split`); [§0.1](#g-bundle) (`G`-bundles); PadicHodgeTheory §5.5 (`tensorIsomTorsor`); ReductiveGroups Layer 1 (representations and comodules); ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness).

<a id="g-torsors-three-descriptions"></a>

### 0.3 Tannakian description of analytic torsors

Let `X` be a sousperfectoid `E`-space and `G` a connected reductive group over `E`. Geometric `G`-torsors that are étale-locally trivial, `G`-torsors on the étale site of `X`, and `G`-bundles in the sense of [§0.1](#g-bundle) form naturally equivalent groupoids, so their isomorphism classes are `H¹_ét(X, G)`. The scheme-theoretic version of this statement is the fpqc (equivalently fppf) one, with the étale comparison for smooth `G`; the adic comparison is supplied by RelativeFarguesFontaine §7.0 on the same carriers.

*Supplied comparison.* Use the three functors and inverse isomorphisms of RelativeFarguesFontaine §7.0, including its scheme fpqc/étale comparison for smooth `G`.

*Remark.* `GL_n` frame bundles and `G_m` line bundles. The `2020` SW scheme theorem is 19.5.1; the adic theorem is 19.5.2.

Source: [FS](#ref-fs), III.1.1 p. 88; [SW](#ref-sw), Theorems 19.5.1 and 19.5.2, pp. 178–180.

*Needs:* RelativeFarguesFontaine §7.0 (`torsorTensorDictionary`); [§0.1 `G`-bundles as exact tensor functors](#g-bundle); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); ReductiveGroups Layer 7 (structure theory); Mathlib `CategoryTheory.Equivalence`; Tau Ceti `Tannaka.fgPointTensorIsoEquiv`.

<a id="structure-group-and-tensor-descent"></a>

### 0.4 Structure group and tensor descent

For a morphism `f:G→H` of connected reductive `E`-groups, extending a `G`-bundle is precomposition by restriction `Rep(H)→Rep(G)`; it agrees with contracted product of torsors, commutes with base change and respects identity/composition. Tensor isomorphisms descend effectively for étale covers. Reconstruction by any faithful rational representation with its defining tensors gives the same torsor.

*Supplied compatibility.* RelativeFarguesFontaine §7.0 identifies contracted products with tensor restriction and provides effective descent and independence of faithful tensor presentations. Tensor restriction composes contravariantly; torsor extension composes covariantly.

*Remark.* The determinant `GL_n → G_m` sends a rank-n bundle to its determinant line. The construction uses no lattice patching on the curve.

Source: [SW](#ref-sw), Proof 19.5.2 pp. 179–180; [LZ17](#ref-lz17), Corollary 4.9 p. 33.

*Needs:* RelativeFarguesFontaine §7.0 (`torsorTensorDictionary`); [§0.3 Tannakian description of analytic torsors](#g-torsors-three-descriptions); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); ReductiveGroups Layer 1 (representations and comodules); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness).

<a id="g-isocrystals-and-B-of-G"></a>

### 0.5 `G`-isocrystals

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

Use the supplied `GIsocrystal`. `A` `G`-isocrystal is an exact `E`-linear tensor functor `Rep_E(G) → Isoc_E` to finite `E`-isocrystals over `L = Ĕ`, with tensor isomorphisms as arrows. After a trivialization of its underlying `L`-valued fibre functor, its Frobenius is `bσ` for an element `b ∈ G(L)`. Steinberg’s theorem makes such a trivialization exist over `L`; the trivialization is a choice and is not part of the definition.

*Supplied construction.* Use the exact tensor category of finite `E`-isocrystals of VectorBundlesAndIsocrystals VB0, the fibre-functor/torsor dictionary over `L` and Steinberg vanishing; a change of trivialization changes `b` by `σ`-conjugation. In the trivialized presentation, linearize `Φ` by the inverse coefficient Frobenius, apply Tannakian reconstruction on the fixed fibre functor of finite comodules, and reconstruct every tensor arrow. The comparison of the trivialized presentation with the untrivialized category is the Steinberg trivialization above.

*Remark.* Underlying vector spaces are over `L`, not `E`.

The API:

- `GIsocrystal.ofRepresentative`: The object from `b` sends `ρ` to `(Vρ⊗_E L,ρ(b)σ)`.
- `GIsocrystal.forget`: Forget Frobenius to the underlying `L`-fibre functor; retain its tensor constraints.
- `GIsocrystal.changeTrivialization`: A change `g` of trivialization identifies the representatives `b` and `g b σ(g)^−1`.
- `GIsocrystal.map`: A group morphism carries `b` to `f(b)` and agrees with precomposition of rational representations.
- `RepresentativeTensor.coefficientSigma`: For fields `E,L`, a commutative Hopf `E`-algebra `H` and an `E`-algebra automorphism `σ` of `L`, coefficient Frobenius on `L⊗_E M` is the invertible `σ`-semilinear map `σ⊗id_M`, for every finite rational H-comodule `M`.
- `RepresentativeTensor.coefficientSigma_tmul`: Coefficient Frobenius sends `a⊗m` to `σ(a)⊗m`; the representation factor remains fixed.
- `RepresentativeTensor.frobenius`: For a convolution point `b:H→L`, compose `σ⊗id_M` with Tau Ceti’s point action `ρ_M(b)`, obtaining an invertible `σ`-semilinear map on `L⊗_E M`.
- `RepresentativeTensor.frobenius_apply`: The component formula is `Φ_b,M(x)=ρ_M(b)((σ⊗id_M)(x))`, with coefficient Frobenius applied first.
- `RepresentativeTensor.tensorCombine`: Combine `x∈L⊗_E M` and `y∈L⊗_E N` using the inverse base-change distribution isomorphism on `x⊗_L y`. The result lies in `L⊗_E(M⊗_E N)`.
- `RepresentativeTensor.Data`: Trivialized Frobenius data on the fixed scalar-extension fibre functor: invertible `σ`-semilinear components on every finite rational comodule, natural for comodule maps, sending `a⊗1` in the tensor unit to `σ(a)⊗1` and preserving `tensorCombine`. This is the trivialized presentation of a `G`-isocrystal.
- `RepresentativeTensor.ofRepresentative`: The family `Φ_b,M=ρ_M(b)(σ⊗id_M)` satisfies the naturality, unit and tensor equations of Data. Its underlying `L`-fibre functor is the finite-comodule scalar-extension functor.
- `RepresentativeTensor.linearized`: Compose every component of Data with inverse coefficient Frobenius to obtain a tensor automorphism of finite-comodule scalar extension.
- `RepresentativeTensor.linearized_component`: The transported component of the linearized tensor automorphism at `M` sends `x` to Φ_M((σ⊗id_M)⁻¹x).
- `RepresentativeTensor.reconstructedPoint`: Apply the inverse of Tau Ceti’s field-valued Tannakian point/tensor-automorphism equivalence to the linearized family, reconstructing a genuine `E`-algebra point `H→L`.
- `RepresentativeTensor.equivalence`: Representative points and trivialized Frobenius families are equivalent, with inverse reconstructedPoint. The inverse laws recover the point and the entire family, rather than only one faithful representation.
- `RepresentativeTensor.Iso`: An arrow between two trivialized families is a tensor automorphism `η` of scalar extension satisfying `η_MΦ_M=Ψ_Mη_M` on every finite rational comodule.
- `RepresentativeTensor.conjugatorEquiv`: All points `g` with `c=g b σ(g)⁻¹` are equivalent to the Frobenius-compatible tensor arrows from ofRepresentative `b` to ofRepresentative `c`. The forward arrow is Tannakian action by `g`; the inverse reconstructs `g` from the tensor arrow.
- `RepresentativeTensor.changeTrivialization`: For `b,g`, the tensor action by `g` gives a Frobenius-compatible arrow from the family of `b` to the family of `g b σ(g)⁻¹`.
- `RepresentativeTensor.changeTrivialization_component`: The component of that arrow on `L⊗_E M` is exactly the point action `ρ_M(g)`, without an extra coefficient Frobenius.
- `RepresentativeTensor.isoComp`: Compose a tensor arrow `f:F→G` with `g:G→K` by multiplying their tensor automorphisms as `g·f`. This corresponds to the later conjugator on the left.
- `RepresentativeTensor.isoRefl`: The identity tensor automorphism is the identity arrow on each trivialized Frobenius family.
- `RepresentativeTensor.isoInv`: The inverse tensor automorphism reverses a Frobenius-compatible arrow. Together with isoComp and isoRefl these give a Groupoid on Data.

**Checks.**

- For `GL_n` with `E=Q_p` this agrees with finite-dimensional WittVector.Isocrystal over `k=F̄_p`, after fixing the coefficient identification.
- `b=1` gives standard Frobenius on each representation.
- For `G_m` representatives `π^a` and `π^b`, tensoring has slope `a+b` and duality has slope `−a`.
- For every representation `M` and `a∈L, Φ_b,M(a x)=σ(a)Φ_b,M(x)`, rather than `aΦ_b,M(x)`.
- For `b=1` and every finite rational comodule, `Φ_1,M(a⊗m)=σ(a)⊗m`.
- The component on `M⊗N` sends `tensorCombine(x,y)` to `tensorCombine(Φ_M(x),Φ_N(y))` for arbitrary `M,N`.
- If `σ(a)≠a` for some `a∈L`, no `L`-linear map on the scalar-extended tensor-unit representation agrees everywhere with its Frobenius component.
- For `b′=g b σ(g)⁻¹`, the point action `ρ_M(g)` intertwines `Φ_b,M` and `Φ_b′,M` on every `M`.
- For conjugators `g:b→c` and `h:c→d`, the composite tensor arrow acts as `ρ_M(h g)` on every representation; reversing the point multiplication order fails in noncommutative cases.
- Reconstructing a point from an arbitrary Data family and applying ofRepresentative recovers that entire family, including its coherence fields.

Source: [FS](#ref-fs), III.2.1 p. 89; [SW](#ref-sw), Definition 22.4.1 p. 210 (PDF p. 220).

*Needs:* VStackSheavesAndLisseCategories §VS4.0; VectorBundlesAndIsocrystals VB0 (tensor and dual calculus); VectorBundlesAndIsocrystals VB0 (finite isocrystals over `L`); ReductiveGroups Layer 1 (representations and comodules); ReductiveGroups Layer 7 (structure theory); Mathlib `WittVector.Isocrystal`, `CategoryTheory.Functor.Monoidal`, `CategoryTheory.Functor.Linear`, `CategoryTheory.Functor.Braided`, `CategoryTheory.NatTrans.IsMonoidal`; Tau Ceti `FGPointRepresentationCat`, `FGPointRepresentationCat.instRigidCategory`, `ExactStructure`, `ExactStructure.IsConflationExact`, `FGComoduleCat.scalarExtensionMonoidalFunctor`, `Comodule.pointsAction`, `Tannaka.scalarExtensionComponent`, `Tannaka.fgPointTensorIsoEquiv`, `Comodule.rTensor_comp_endOfPoint`, `Comodule.baseChange_comp_endOfPoint`, `Comodule.endOfPoint_tensor`, `Comodule.endOfPoint_trivial`.

<a id="sigma-conjugacy-quotient"></a>

### 0.6 The Kottwitz set B(G)

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`. The abstract group and integral quotient APIs below are targets here.

Use the supplied `SigmaClass`, extending the `p`-adic quotient of PadicHodgeTheory §5.5 to every local coefficient field and to arbitrary groups with automorphism in the algebraic API. Put `B(G) = G(L)/∼`, where `b` ∼ `b′` when `b′ = g b σ(g)⁻¹` for some `g ∈ G(L)`, and `σ` is the arithmetic `q`-Frobenius fixing `E` and its uniformizer. This orbit set is the set of isomorphism classes of `G`-isocrystals; the groupoid of `G`-isocrystals retains their automorphisms.

*Supplied construction.* Twisted conjugation is a group action, so its orbit relation is an equivalence relation. The change-of-trivialization formula of [§0.5](#g-isocrystals-and-B-of-G) identifies the quotient with isomorphism classes of `G`-isocrystals.

*Remark.* Both `g b σ(g)^−1` and `g^−1 b σ(g)` conventions give the same orbit relation.

For `GL_n` over `K = FractionRing (WittVector p k)`, with `k` any perfect field of characteristic `p`, `wittGL_isocrystal_classes` in `Suggested.lean` states the correspondence on native `Matrix.GeneralLinearGroup` and `WittVector.Isocrystal` carriers. Every n-dimensional isocrystal is isomorphic to `(Kⁿ, bσ)`, and the matrices giving its isomorphism class are exactly the `σ`-conjugates of `b`. The concrete structure `wittGLIsocrystal` composes coefficient Frobenius with the matrix action; `wittGLSigmaSetoid` uses the displayed conjugacy convention.

The API:

- `SigmaClass.mk`: Send `b∈G(L)` to its sigma class.
- `SigmaClass.mk_eq_iff`: Two representative classes are equal precisely when a sigma conjugator exists.
- `SigmaClass.map`: A `σ`-compatible group homomorphism gives `B(G)→B(H)`, with identity and composition laws.
- `SigmaClass.lift`: Every function on `G(L)` invariant under twisted conjugation descends uniquely to `B(G)`.
- `SigmaClass.affinePoints`: For a commutative coordinate Hopf algebra `H` over `E` and an `E`-algebra automorphism `σ` of `L`, specialize the quotient to the convolution group of `E`-algebra maps `H → L`. The arithmetic `B(G)` uses the coefficient field `L` and Frobenius of VectorBundlesAndIsocrystals VB0.
- `SigmaClass.equiv`: `A` Frobenius-compatible group equivalence induces an equivalence of sigma-class quotients, carrying the class of `b` to the class of its image.
- `SigmaClass.representativeGroupoid`: Objects are elements `b` of the coefficient point group; arrows `b→c` are all `g` satisfying `c=g b σ(g)^−1`. The composite of `g:b→c` and `h:c→d` has conjugator `h g`, and inverses use `g^−1`.
- `SigmaClass.representative_hom_iff`: A representative `Hom` is nonempty exactly when the two quotient classes agree; this does not make it a singleton.
- `SigmaClass.representativeAut`: The category-theoretic automorphism group of representative `b` identifies multiplicatively with its sigma-stabilizer. Mathlib’s `Aut` multiplication reverses categorical composition, matching the usual stabilizer multiplication.
- `SigmaClass.gmEquiv`: The Laurent-polynomial Hopf points equivalence identifies the split `G_m` sigma quotient with the quotient on `L×`, for any `E`-algebra automorphism of `L`.
- `SigmaClass.wittGmSlopeEquiv`: For a prime `p` and an algebraically closed field `k` of characteristic `p`, the `σ`-classes of units of FractionRing(WittVector `p k`), with Witt Frobenius, are in bijection with `ℤ`. This is the `p`-typical case of the general rank-one classification.
- `SigmaClass.wittGmSlopeEquiv_uniformizer`: In that Witt specialization, the class of `p^m` maps to `m`, for every integer `m`; the normalized valuation is Frobenius-invariant.
- `RepresentativeTensor.representativeFunctor`: Send each twisted-conjugacy representative `b` to its whole Frobenius tensor family and every conjugator `g` to its Tannakian tensor action.
- `RepresentativeTensor.reconstructionFunctor`: Reconstruct both the coefficient point and the actual conjugator of each Frobenius-compatible tensor arrow. Identity and composition agree with the representative groupoid.
- `RepresentativeTensor.categoryEquivalence`: The representative groupoid is equivalent to the groupoid of trivialized Frobenius families on finite rational comodules. Composed with the Steinberg trivialization of [§0.5](#g-isocrystals-and-B-of-G), this identifies it with the groupoid of `G`-isocrystals.

**Checks.**

- For split `G_m`, valuation gives `B(G_m)≅Z`.
- With `σ` the identity the orbit relation is ordinary conjugacy.
- For an abelian group the relation is multiplication by `g/σ(g)`, not equality unless `σ` is trivial.
- For representative objects `b,c`, equality of sigma classes is equivalent to existence of a conjugator arrow.
- For arrows `g:b→c` and `h:c→d`, composition has conjugator `h g`; reversing this order is invalid in a noncommutative point group.
- With identity Frobenius and representative `1`, the automorphism group is the entire point group, rather than the trivial group of a discrete quotient category.
- The split `G_m` quotient equivalence sends a class represented by an actual Laurent-polynomial algebra map to the class of its corresponding unit.
- For the Witt fraction field and every integer `m`, the class of `p^m` has slope `m`.
- The class of `1` in the Witt units quotient has slope zero.
- The classes of `1` and `p` in the Witt units quotient differ; replacing Frobenius or dropping the valuation normalization would miss this control.
- The forward category equivalence sends `b` to the family whose component on every representation is `ρ_M(b)(σ⊗id_M)`.

Source: [He21](#ref-he21), Section 2.1 p. 4; [FS](#ref-fs), Definition III.2.1 and Theorem III.2.2 p. 89; §III.2.2 p. 90.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§0.5 `G`-isocrystals](#g-isocrystals-and-B-of-G); Mathlib `Subgroup`, `MulEquiv`, `CategoryTheory.Groupoid`, `CategoryTheory.Aut.Aut_mul_def`, `WittVector.exists_frobenius_solution_fractionRing`, `WittVector.FractionRing.frobenius`; Tau Ceti `AlgHom.mapValue`, `MultiplicativeGroup.pointsMulEquiv_mapValue`, `FGComoduleCat.scalarExtensionMonoidalFunctor`, `Comodule.pointsAction`, `Tannaka.scalarExtensionComponent`, `Tannaka.fgPointTensorIsoEquiv`.

<a id="pure-inner-twisting"></a>

### 0.7 Pure inner twisting of torsors

For a group sheaf `H` on a site and an H-torsor `T`, put `H_T=Aut_H(T)`. The bitorsor `T` induces an equivalence between H-torsors and H_T-torsors by `S↦Isom_H(S,T)`, with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.

*Proof outline.* Construct the left/right commuting bitorsor actions and the evaluation/counit isomorphisms. Descend the local trivializations to establish quasi-inverse functors.

*Remark.* An untrivialized torsor does not yield a canonical isomorphism `H_T≅H`.

The API is `PureInnerTwist.group` for `H_T`, `PureInnerTwist.equivalence` for the torsor-groupoid equivalence, `PureInnerTwist.baseChange` for its naturality under site pullback, and `PureInnerTwist.trivializes` for the image of `T`, which is the trivial H_T-torsor. Arrows act by inverse precomposition in the `Isom` description.

**Checks.**

- If `T` is the trivial H-torsor with a chosen section, `H_T` identifies with `H` and the equivalence identifies with the identity.
- If `H=1`, both torsor groupoids are terminal and the equivalence has no nontrivial automorphisms.
- For `H=GL_n` and the frame torsor of a rank-n bundle `V, H_T` is `GL(V)`; its automorphism group need not be canonically the constant `GL_n`. Twisting sends that frame torsor to the trivial GL(V)-torsor.

Source: [FS](#ref-fs), III.4.1 p. 100.

*Needs:* [§0.3 Tannakian description of analytic torsors](#g-torsors-three-descriptions); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="families-of-g-isocrystals"></a>

### 0.8 Families of `G`-isocrystals

Define `GIsocrystalFamily`. For a perfect F_q-algebra `R` put `L_R = R((t))` in equal characteristic and `L_R = W_{O_E}(R)[1/π]` in mixed characteristic. A family of `G`-isocrystals over `R` is a `G`-torsor `P` on `Spec L_R` with a Frobenius descent isomorphism `σ*P ≅ P`. These form a groupoid-valued prestack on perfect F_q-schemes, distinct from the groupoid of `G`-isocrystals over `L` and from `Bun_G` on perfectoid spaces.

*Construction.* Take the coefficient rings and their Frobenius from VectorBundlesAndIsocrystals VB−1, “Ramified coefficient rings and coefficient changes”. Form Frobenius-equivariant torsors and their isomorphisms; pullback acts on the torsor and on its descent datum. Torsors over the coefficient rings satisfy arc-descent (Ans22, Lemma 11.3, using Iva23, Proposition 5.10 and the reflection of exactness along arc covers), and the Frobenius isomorphisms with their coherence descend through the fully faithful descent of morphisms.

*Remark.* Family morphisms are not all bundle morphisms: the bundle attached to a family has more automorphisms ([§3.4](#full-automorphism-v-group)).

The API:

- `GIsocrystalFamily.pullback`: Perfect-algebra maps pull back the torsor and Frobenius isomorphism, coherently.
- `GIsocrystalFamily.ofLoopElement`: A loop element `b` defines the trivial torsor with Frobenius `bσ`.
- `GIsocrystalFamily.geometricClass`: A geometric point defines its class in `B(G)`.
- `GIsocrystalFamily.loopQuotient`: After v-stackification the moduli is LG/Ad_σ LG, using v-local triviality of the coefficient-ring torsor.

**Checks.**

- For `R=F̄_q` the geometric classes recover `B(G)`.
- For `G=1` the family groupoid is terminal.
- For a nonbasic `GL_2` class, the automorphisms of the constant family are the locally profinite group `J_b(E)` of [§1.13](#sigma-centralizer-J-b), not the full bundle automorphism group with its positive-slope kernel.

Source: [FS](#ref-fs), I.2 pp. 10–11; [Ans22](#ref-ans22), Lemma 11.3 pp. 34–35 and Theorem 11.4 pp. 35–36.

*Needs:* [§0.5 `G`-isocrystals](#g-isocrystals-and-B-of-G); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals Layers VB−1–VB0 (coefficient rings and finite isocrystals); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="locally-profinite-classifying"></a>

### 0.9 Locally profinite classifying stacks

Prove `LocallyProfiniteClassifying.smooth`. Let `H` be a locally profinite group with a closed topological embedding `H↪GL_n(E)` for a nonarchimedean local field `E` of residue characteristic `p`, and let `ℓ≠p`. Then `[*/H]` is an `ℓ`-cohomologically smooth Artin v-stack of dimension `0`. After base change to `Spd E`, use `(GL_(n,E))^diamond/H` as a separated cohomologically smooth surjective chart of `[Spd E/H]`. Both the chart and this atlas map have dimension `n²` over their respective bases, giving stack dimension `0`.

*Proof outline.* Embed the constant locally profinite diamond `H×Spd E` as a closed subgroup of `(GL_(n,E))^diamond`. The quotient is locally spatial; after a compact open pro-`p` subgroup `K⊂H`, its cover `(GL_(n,E))^diamond/K` is separated étale over that quotient. Use the quotient smoothness theorem and smooth descent to obtain the atlas and compute the dimensions. Descend the Artin and smoothness properties from `Spd E` by VS0.1. The point map is not a smooth chart when `H` contains an infinite compact open subgroup.

**Checks.**

- For `H=E×`, take `n=1`; the quotient chart has dimension `1` and atlas relative dimension `1`, while `[*/E×]` has dimension `0`.
- For `H=1`, the quotient chart is `GL_(n,E)^diamond`, giving the terminal stack of dimension `0`.
- For `H=O_E×`, the point map fails cohomological smoothness because its pullback has the distribution dualizing sheaf of an infinite profinite group. The quotient chart still applies. For discrete `H` the point map is instead separated étale.

Source: [FS](#ref-fs), Example IV.1.9(iv), Remark IV.1.10, p. 110, and proof of Theorem IV.1.19, p. 113.

*Needs:* VStackSheavesAndLisseCategories §§VS0.1–VS0.2 (Artin v-stacks and smooth descent); DiamondsAndVStacks D3–D5 (locally profinite torsors, quotients and relative representability); DiamondSixOperations §S4.2 (cohomological smoothness) and §S5.3 (pro-`p` quotients).


### Examples

- For `G = GL_n`, `G`-bundles are rank-n vector bundles, `G`-isocrystals are n-dimensional isocrystals, and `B(GL_n)` is the set of Newton polygons of height `n`.
- For `G = G_m` and `E = ℚ_p, B(G_m) = ℤ` through the valuation, and the class of `p^m` is `m`.

### Dependencies

ReductiveGroups Layers 1 and 7; VectorBundlesAndIsocrystals VB0–VB1; AlgebraicModuliForArithmeticGeometry Layer 3; DiamondsAndVStacks Layer 3; Mathlib and Tau Ceti as listed above.

## Layer 1: Newton and Kottwitz invariants, centralizers and acceptable classes

Use the Newton and Kottwitz maps and order supplied by VStackSheavesAndLisseCategories §VS4.0 on the fundamental-group and slope-protorus carriers. Construct the algebraic `σ`-centralizers `J_b` and decent representatives. Classify `B(G)` by its two invariants and by straight elements of the Iwahori–Weyl group, define the acceptable sets `B(G, {μ})`, and prove the existence and uniqueness statements for basic, maximal and ordinary classes. The layer ends with torus-special pairs, abelianized classes and the z-extension and centralizer comparisons.

<a id="torus-resolutions-and-lattices"></a>

### 1.1 Torus resolutions, invariant lattices and choice of maximal torus

Prove the following three statements about tori and z-extensions over a nonarchimedean local field `E`; they refine the z-extension and `π₁` statements of ReductiveGroupsPartII §RG2.1.5 and are used throughout Layers 1 and 2.

`1`. *Induced resolutions.* Every `E`-torus `T` admits a surjective `E`-morphism `R → T` from an induced torus `R =` ∏ `Res_{E_i/E} G_m`, split by a splitting field of `T`, whose kernel is again a torus. This is a statement about group schemes, not surjectivity on `E`-points.
`2`. *Invariant lattices.* For a z-extension `1 → Z → G̃ → G → 1` with induced central torus `Z` and a closed subgroup `J` of the Galois group, the map `X_*(T̃)^J → X_*(T)^J` on cocharacter invariants is surjective whenever the continuous cohomology H¹(J, `X_*(Z)`) vanishes, and that vanishing holds for induced `Z` and the subgroups `J` used below (inertia, and decomposition groups of finite unramified extensions). Right exactness of integral coinvariants is a separate fact and does not imply invariant surjectivity.
`3`. *Inner-twist transport.* Prove `PiOneTransport.innerInvariant`: unlike the change-of-maximal-torus identification supplied by ReductiveGroupsPartII §RG2.1.5, this compares `G` with an inner form `G′`. An inner twist induces a canonical Γ-equivariant identification `π₁(G) ≅ π₁(G′)`, independent of the conjugating maximal tori, commuting with inertia and Galois coinvariants. The ambiguity is inner conjugation, whose Weyl action on the coroot quotient is trivial.

**Checks.**

- For the norm-one torus T¹ of an unramified quadratic `E′/E`, the map `Res_{E′/E} G_m →` T¹, `x ↦ x/σ(x)`, is an induced resolution with kernel the torus `G_m`.
- For the z-extension `GL_2 → PGL_2` the kernel is the induced torus `G_m`, and the map on Γ-invariant cocharacters is surjective.
- For the two diagonal tori of `GL_2` related by the Weyl element, the induced identification of `π₁ ≅ ℤ` is the identity.

*Proof outline.* For a finite Galois splitting group `Δ`, choose a surjection from a finite free permutation Δ-lattice onto `X_*(T)`. Its kernel is free over `ℤ`, so duality gives the required exact sequence of tori with connected kernel. Restricting an induced lattice to a closed subgroup remains a sum of permutation lattices; Shapiro reduces H¹ to continuous homomorphisms from a compact group to `ℤ`, which vanish. Apply the long exact cohomology sequence for invariant surjectivity. For inner-twist transport use the trivial Weyl action on the coroot quotient.

Source: [Kot85](#ref-kot85), proof of Lemma 2.2(b), p. 207 (the induced resolution); [Kot97](#ref-kot97), §6.5, equation 6.5.1, p. 287 (its use for z-extensions); [GLX](#ref-glx), proof of Lemma 3.16, pp. 829–830 (invariant lattices); [KMPS](#ref-kmps), Notational conventions, p. 5 (inner-twist invariance).

*Needs:* ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); ReductiveGroupsPartII RG2.1 (z-extensions and their existence, §RG2.1.5); ReductiveGroups Layer 7 (structure theory).

<a id="weil-crossed-module-cohomology"></a>

### 1.2 Weil cohomology of crossed modules with L^sep coefficients

Let `E` be `p`-adic, `L^sep` a separable closure of `L = Ĕ` with its natural continuous action of the Weil group `W_E`, and give `G(L^sep), T(L^sep)` and their subgroups the discrete topology. Define continuous Weil cohomology `H^i(W_E`, −) of these discrete W_E-groups and of two-term crossed modules `[H₁ → H₀]` (in degrees `−1` and `0`), with its long exact sequences and its functoriality in morphisms of crossed modules. Prove:

`1`. quasi-isomorphisms of crossed modules induce bijections, so `[G_sc → G], [T_sc → T] (T` a maximal torus, `T_sc` its preimage) and `[Z_sc → Z]` (the centres) have the same H¹;
`2`. H²(W_E, `T_sc(L^sep)) = 0`, where `T_sc` is the preimage of the maximal torus `T` in `G_sc`; this is the Weil-cohomological vanishing used in the proof of FS Lemma III.2.11, not an assertion that a torus is simply connected;
`3`. the inflation from Weil cohomology to the étale cohomology of the curve used in [§2.9](#diagonalizable-curve-cohomology) and [§2.10](#crossed-module-curve-classes) is natural in the coefficients.

Inertia acts nontrivially on these coefficients (for instance on `μ_p` over `ℚ_p`), so the coefficients are `L^sep`-points and not `L`-points. The statement is for `p`-adic `E`; for the equal-characteristic case of the connected-centre application in [§1.44](#connected-center-basic-inner-forms) the identification H¹(E, `H) ≅ (π₁(H)_Γ)_tors` for connected reductive `H` over `E` (Kottwitz) is proved as part of [§1.44](#connected-center-basic-inner-forms).

**Checks.**

- For `G` a torus, `G_sc = 1` and H¹(W_E, `[1 → T(L^sep)]`) is the Weil cohomology of `T`; for `T = G_m` it is `ℤ`, recovering `B(G_m)`.
- For `G = SL_n` the crossed module `[SL_n → SL_n]` is contractible and its H¹ vanishes.
- For `μ_p` over `ℚ_p` with `p` odd, the `L`-points are trivial, while H¹(W_E, `μ_p(L^sep)`) contains the Kummer class of `p`, so the coefficients must be `L^sep`-points.

Source: [FS](#ref-fs), III.2.4 and Lemma III.2.11, pp. 93–94. The proof of Lemma III.2.11 cites Serre, Chapter II.3.3, example (c), and Chapter III.2.3, Theorem 1′, for the vanishing; the crossed-module comparison is the preceding Borovoi input.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); [§1.1](#torus-resolutions-and-lattices) (torus resolutions); ReductiveGroups Layer 7 (structure theory).

<a id="abelianized-kottwitz-set"></a>

### 1.3 Abelianized Kottwitz set

Define `AbelianizedClass`. For `E` `p`-adic, `B_ab(G)=H^1(W_E,[Gsc(L^sep)→G(L^sep)])` with the natural crossed-module action. The abelianization map comes from `[1→G]→[Gsc→G]`. A maximal torus complex `[Tsc→T]` and center complex `[Zsc→Z]` are homotopy-equivalent coefficient models, not replacements of `G` by an arbitrary abelian group.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

*Construction.* Take continuous crossed-module cohomology and the simply connected cover from EndoscopicTransferAndUnitaryTraceComparison Layer 1 and ReductiveGroups Layer 7; the Weil-group form of this cohomology is [§1.2](#weil-crossed-module-cohomology). Construct the abelianization and compare the torus and centre complexes.

*Remark.* Restriction to `p`-adic `E` keeps finite diagonalizable groups étale.

The API:

- `AbelianizedClass.abelianize`: Send a sigma class to its crossed-module `H^1` class.
- `AbelianizedClass.torusModel`: Replace the crossed module by `[Tsc(L^sep)→T(L^sep)]` for a maximal torus.
- `AbelianizedClass.centerModel`: Replace it by `[Zsc(L^sep)→Z(L^sep)]`.
- `AbelianizedClass.map`: Reductive homomorphisms and compatible simply connected lifts induce the abelianized map.

**Checks.**

- For a torus `Gsc=1, B_ab(T)=B(T)`.
- For simply connected semisimple `G` the abelianized set is `0`.
- For split `PGL_n, B_ab(G)=Z/n`, which cannot be recovered by rationalization.

Source: [FS](#ref-fs), III.2.4.2 pp. 93–94.

*Needs:* [§0.6 The Kottwitz set B(G)](#sigma-conjugacy-quotient); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); [§1.2 Weil cohomology of crossed modules with L^sep coefficients](#weil-crossed-module-cohomology); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); ReductiveGroups Layer 7 (structure theory).

<a id="slope-protorus"></a>

### 1.4 Rational slope protorus

For the slope protorus let `D=D(Q)` be the diagonalizable `E`-protorus with coordinate Hopf algebra `E[Q]`, using the additive group `Q`. It is not a finite-type torus. A homomorphism `D→G` is a Hopf-compatible coordinate map `O(G)→E[Q]`. Its restriction on each finite rational representation gives rational weight subspaces, with only finitely many nonzero weights. Over a splitting field, `Hom(D,T)` is `Hom(X*(T),Q)`, hence `X_*(T)⊗Q` for a finite-rank torus. A rational cocharacter need not be integral. Define `SlopeProtorus.character` for `G_m` by the coordinate map `E[ℤ]→E[ℚ]` sending `[n]` to `[nq]`; the new finite-representation target is a common integral multiple of the rational weights, beyond the library’s finite-support theorem.

*Construction.* Use the group-algebra Hopf structure and the diagonalizable weight theory at the pins, for the multiplicative presentation of the additive group `ℚ`; the direct limit of character lattices identifies the spectrum of `E[ℚ]` with the inverse limit of `G_m` under positive power maps. Restrict the representation comodule along `O(G) → E[ℚ]` and use the internal weight decomposition and its finite-support theorem; clear the finitely many denominators. Over a field, group-algebra morphisms correspond to character homomorphisms. For a split torus this is the rational cocharacter space; for a nonsplit torus keep its Galois action through descent.

*Remark.* Denominator `h` requires an h-fold integral representative.

The API:

- `SlopeProtorus.common_denominator` / `integralMultiple`: Unlike the generic finite-support statement, this produces, for a finite representation, a positive integer `n` with `n·q` integral for every nonzero rational weight submodule; finite support comes from the diagonalizable weight theorem.
- `SlopeProtorus.toTorus`: Over a splitting field, the coordinate maps `E[X*(T)]→E[Q]` identify with additive maps `X*(T)→Q`. For a finite free character lattice this identifies `Hom(D,T)` with `X_*(T)⊗Q`; a nonsplit descent comparison must preserve its Galois action.
- `SlopeProtorus.map`: For `G→H` represented by `O(H)→O(G)`, postcomposition of `D→G` is coordinate-map composition `O(H)→O(G)→E[Q]`.
- `SlopeProtorus.toTorus_generator`: The coordinate map associated to `X*(T)→Q` sends the group-like generator `[m]` to `[ν(m)]`.
- `SlopeProtorus.toMultiplicativeGroup`: The rational slope `q` determines a coordinate map `E[Z]→E[Q]` sending `[n]` to `[n q]`.
- `SlopeProtorus.map_apply`: Coordinate-side postcomposition evaluates as the composite of the two bialgebra maps.
- `SlopeProtorus.half_not_integral`: Over a field `E`, the slope-1/2 coordinate map differs from the coordinate map of every integer slope; compare the image of the generator `[1]`.

**Checks.**

- The actual half-slope coordinate map `E[Z]→E[Q]` sends the generator `[2]` to `[1]`, detecting denominator clearing on Hopf algebra generators.
- The zero-slope coordinate map sends every `[n]` to the unit `[0]`, giving the trivial group homomorphism.
- The half-slope coordinate map differs from every integral-slope map `E[Z]→E[Q]`, including slope one.

Source: [KMPS](#ref-kmps), Notational conventions and 1.1.1 p. 5.

*Needs:* ReductiveGroups Layer 1 (representations and comodules); VectorBundlesAndIsocrystals VB0 (Dieudonné–Manin classification); Mathlib `MonoidAlgebra.mapDomainBialgHom`; Tau Ceti `DiagonalizableGroup.weightSpace`, `DiagonalizableGroup.finite_setOf_weightSpace_ne_bot`, `MonoidAlgebra.mapDomainBialgHom_surjective`.

<a id="newton-orbit-space"></a>

### 1.5 Newton orbit space and rational dominance

Define `NewtonSpace`. `N(G)` is the Γ_E-fixed set of G(Ē)-conjugacy classes of `D→G`. For a quasi-split inner form `G`*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define `ν≤ν′` when `ν′−ν` is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.

*Construction.* Use the quasi-split rational chamber and the action on the based root datum. Compare orbit representatives in that chamber; transport the order across an inner twisting.

*Remark.* On `GL_n` compare descending slopes by partial sums with equal total.

The API:

- `NewtonSpace.dominant`: Choose the unique dominant representative in `G`*.
- `NewtonSpace.le`: Positive-coroot dominance with equal central projection.
- `NewtonSpace.delta`: Project to `(π_1(G)⊗Q)^Γ`.
- `NewtonSpace.transfer`: An inner twisting transports Newton orbit classes, independently of its representative.

**Checks.**

- `(1/2,1/2)≤(1,0)`, with equal total `1`.
- For a torus dominance is equality.
- For `G_m, 0` and `1` are incomparable despite the usual rational-number inequality.

Source: [KMPS](#ref-kmps), 1.1.1 pp. 5–6; [RR96](#ref-rr96), Section 2.1 pp. 165–166 (PDF pp. 14–15).

*Needs:* [§1.4 Rational slope protorus](#slope-protorus); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="levi-descent-and-torus-transfer"></a>

### 1.6 Rational Levi descent, elliptic tori and transfer of maximal tori

Let `G` be a connected reductive group over a nonarchimedean local field `E` with quasi-split inner form `G`*. Prove:

`1`. *Levi descent.* In the quasi-split group `G`*, every Γ-stable conjugacy class of parabolic subgroups contains an `E`-rational parabolic with an `E`-rational Levi factor. In `G` itself a class need not descend; the rational Levi used later is the Newton centralizer of a decent representative.
`2`. *Elliptic tori.* Every inner form of `G` contains a maximal torus that is elliptic modulo `Z(G)`, that is, anisotropic modulo the centre.
`3`. *Transfer of tori.* For an inner twist `ψ: M′ → M` of Levi subgroups and a maximal torus `T′` of `M′`, an `E`-rational embedding `j: T′ → M` which is M-conjugate to `ψ|T′` (a rational transfer) exists when `M` is quasi-split or `T′` is elliptic modulo the centre; geometric conjugacy alone does not give one.

**Checks.**

- For `G = GL_2` and its inner form `D^× (D` the quaternion division algebra), an elliptic maximal torus of `D^×` is `E′^×` for a quadratic `E′/E`, and it transfers to `GL_2`.
- The split diagonal torus of `GL_2` does not transfer to `D^×`: its torus is not elliptic and `D^×` is not quasi-split.
- For `G` split, item `1` is the usual existence of standard Levi subgroups.

Source: [Kot14](#ref-kot14), proof of Proposition 13.1, §13.3, p. 66 (existence of elliptic maximal tori in both characteristics, with the Kneser and DeBacker references); [Dillery23](#ref-dillery23), Theorem 5.3 and the following paragraph, p. 54 (the equal-characteristic existence statement); [Kot85](#ref-kot85), Proposition 5.3, p. 215 (its use in classification); [KMPS](#ref-kmps), §1.1.16 and Corollary 1.1.17, pp. 12–13 (transfer); [Kot97](#ref-kot97), §§4.3–4.4, pp. 268–269 (descent of the Newton Levi).

*Needs:* [§1.5](#newton-orbit-space) (Newton orbits); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="galois-average"></a>

### 1.7 Galois averaging and Hodge invariants

Define `HodgeInvariants`. For a geometric conjugacy class `{μ}`, choose its dominant representative `μ`* in a quasi-split inner form. Put `μ♯=[μ*]` in `π_1(G)_Γ` and `μ◇=|Γ·μ*|^−1 sum` over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives `(π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ` and `δ(μ◇)=average(μ♯⊗1)`; it is not an integral averaging isomorphism.

*Construction.* Choose the finite quotient through which the based-root action and `μ` orbit factor. Average in the rational vector space; change of inner twisting changes the representative by conjugacy. Prove invariance, idempotence and compatibility with the coroot quotient.

*Remark.* Keep `μ♯` integral even when `μ◇` is fractional.

The API:

- `HodgeInvariants.sharp`: Return the full integral Γ-coinvariant class.
- `HodgeInvariants.diamond`: Return the rational dominant orbit `average`.
- `HodgeInvariants.average_eq`: The rational projection of sharp is `delta` of diamond.
- `HodgeInvariants.baseChange`: Restrict the `Γ` action and use the corresponding orbit `average`; ramified degree normalizations must be explicit.

**Checks.**

- For split `GL_2` and `μ=(1,0), μ◇=(1,0)` and `μ♯=1`.
- The zero cocharacter has both invariants `0`.
- For the quadratic norm-one torus `μ=1` has `μ◇=0` and nonzero `μ♯` in `Z/2`.

Source: [KMPS](#ref-kmps), 1.1.5 pp. 7–8.

*Needs:* ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); [§1.5 Newton orbit space and rational dominance](#newton-orbit-space); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory).

<a id="newton-and-kottwitz-maps"></a>

### 1.8 Newton and Kottwitz invariants

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`. The abstract group and integral quotient APIs below are targets here.

Use the supplied `Invariants` over every nonarchimedean local field, with the `p`-adic specialization identified with PadicHodgeTheory §5.5. There are functorial maps `ν: B(G) → N(G)` and `κ: B(G) → π₁(G)_Γ`. The Newton morphism of `b` is the slope grading of its `G`-isocrystal in every rational representation. The Kottwitz invariant is the descent to `σ`-classes of the representative homomorphism `κ̃: G(L) → π₁(G)_I` of ReductiveGroupsPartII §RG2.1.5, which is `σ`-equivariant, followed by the passage to Frobenius coinvariants `(π₁(G)_I)_σ = π₁(G)_Γ`. The two are rationally compatible: `δ(ν_b) = average(κ(b) ⊗ 1)`.

Hypotheses: The integral descent step is stated for an arbitrary group `G` with automorphism `σ`, an abelian group A with automorphism `τ`, and a homomorphism `κ̃: G →` A with `κ̃(σg) = τκ̃(g)`; this abstract statement is the `KottwitzDescent` part of the API below and says nothing about reductive groups by itself.

*Supplied construction.* Build the slope morphism from the category of finite isocrystals, using Dieudonné–Manin, the exact tensor structure and the rational weights of every representation; prove its transformation rule under twisted conjugacy and descend to `N(G)`. Take `κ̃` with its surjectivity, naturality and Frobenius equivariance from §RG2.1.5. For `c = g b σ(g)⁻¹` one has `κ̃(c) = κ̃(b) + κ̃(g) − τκ̃(g)`, and `κ̃(g)` and `τκ̃(g)` agree in integral coinvariants, so the representative formula descends uniquely. For a cyclic `ℤ`-action the relation submodule of the coinvariants is exactly the range of `τ − id`: positive powers give telescoping sums in that range, negative powers reduce to positive ones through `τ⁻¹`, and the generator relation is `τa − a`. For an abelian point group the same equation gives both directions of the quotient equivalence. Naturality follows from the coinvariant map of an integral intertwiner, surjectivity from that of `κ̃`. Finally identify the successive inertia and Frobenius coinvariants with `π₁(G)_Γ` for the local Galois action and check the rational compatibility square.

*Remark.* For `GL_n`, `κ=v(det b)` and `ν` is the descending slope tuple.

The API:

- `Invariants.newton`: Evaluate the Newton class or its chosen dominant representative.
- `Invariants.kottwitz`: Evaluate `κ` in integral Γ-coinvariants.
- `Invariants.representativeKottwitz`: The representative invariant `κ̃` of §RG2.1.5 in integral inertia coinvariants, before the `σ`-quotient.
- `Invariants.map`: Group morphisms commute with `κ` and with the induced conjugacy-class Newton map.
- `Invariants.rationalCompatibility`: The `δ/average` square commutes; it does not recover torsion `κ` from `ν`.
- `KottwitzDescent.cyclicRepresentation`: For an integral abelian group A and additive automorphism `τ`, the multiplicativized integer `n` acts by the `ℤ`-linear automorphism `τ^n`.
- `KottwitzDescent.cyclicRepresentation_generator`: The positive generator acts by `τ`, fixing the arithmetic Frobenius orientation.
- `KottwitzDescent.Target`: The integral coinvariants `Representation.Coinvariants` of the cyclic action on A; torsion is retained.
- `KottwitzDescent.relationMap`: The integral relation map is `τ−id` on the actual `ℤ`-module A.
- `KottwitzDescent.ker_eq_range`: The relation submodule of the cyclic action equals the range of `τ − id`; no rationalization occurs.
- `KottwitzDescent.Data`: A homomorphism `G →` Multiplicative A together with its Frobenius-equivariance equation; for a reductive group this is `κ̃` of §RG2.1.5.
- `KottwitzDescent.representativeClass`: The image of the representative invariant in integral Frobenius coinvariants.
- `KottwitzDescent.representative_twisted`: For `c=g b σ(g)⁻¹`, the additive representative invariant is `κ̃(b)+κ̃(g)−τκ̃(g)`.
- `KottwitzDescent.representativeClass_twisted`: The integral quotient kills the change `κ̃(g) − τκ̃(g)`.
- `KottwitzDescent.classKottwitz`: The descent of the representative invariant to the `σ`-class quotient `SigmaClass`, by twisted-conjugacy invariance.
- `KottwitzDescent.classKottwitz_mk`: On the class represented by `b`, the descended map is the coinvariant class of `κ̃(b)`.
- `KottwitzDescent.classKottwitz_unique`: A function on SigmaClass with the specified representative formula equals classKottwitz.
- `KottwitzDescent.classKottwitz_surjective`: If the representative homomorphism is surjective, so is the descended map on `σ`-classes.
- `KottwitzDescent.intertwiner`: `A` `ℤ`-linear map intertwining `τ` and `υ` induces a `Representation.IntertwiningMap` between the cyclic representations.
- `KottwitzDescent.classKottwitz_natural`: `A` Frobenius-compatible group map and a compatible integral intertwiner commute with the descended maps through `Representation.Coinvariants.map`.
- `KottwitzDescent.identityData`: For Multiplicative A with Frobenius `τ`, the identity homomorphism supplies the representative invariant.
- `KottwitzDescent.abelianEquiv`: The twisted-conjugacy quotient of Multiplicative A is equivalent to the integral τ-coinvariants of A.
- `KottwitzDescent.abelianEquiv_mk`: The abelian equivalence sends the class of a to its integral coinvariant class.
- `KottwitzDescent.identityFrobeniusEquiv`: For identity Frobenius, the integral target is `ℤ`-linearly equivalent to A.
- `KottwitzDescent.identityFrobeniusEquiv_mk`: The identity-action target equivalence sends the class of a to a.
- `KottwitzDescent.signCoinvariantsEquiv`: For `A = ℤ` and `τ(n) = −n`, the integral coinvariants are additively equivalent to ZMod `2`.
- `KottwitzDescent.signCoinvariantsEquiv_mk`: The sign-action equivalence sends the integral class of `n` to its parity in ZMod `2`.

**Checks.**

- `b=π^m` has `ν=m` and `κ=m`.
- Its associated line bundle is `O(−m)`, so degree is `−κ`.
- The two norm-one torus classes have equal Newton `0` and distinct `κ` in `Z/2`.
- With identity Frobenius and the identity representative map on Multiplicative A, the descended value of a is a.
- For every equivariant representative homomorphism, the class represented by `1` maps to zero.
- The classes represented by `b` and `g b σ(g)⁻¹` have equal descended integral invariants.
- For sign Frobenius on Multiplicative `ℤ`, the actual twisted class of `n` maps to `n` modulo `2`.
- Under sign Frobenius, the twisted classes represented by `0` and `1` differ; rationalizing the target would lose this distinction.
- Under sign Frobenius, the twisted classes represented by `2` and `0` agree.
- The sign-action coinvariant class of `1` is nonzero, whereas every fixed integer is zero; fixed points cannot replace coinvariants.

Source: [KMPS](#ref-kmps), 1.1.2 equations 1.1.2.1 and 1.1.2.3 pp. 6–7; [RR96](#ref-rr96), Theorem 1.15 pp. 160–162 (PDF pp. 9–11); [He16](#ref-he16), §2.2 p. 22 and §2.4, Theorem 2.6 pp. 25–26; [Kot14](#ref-kot14), §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§0.6 The Kottwitz set B(G)](#sigma-conjugacy-quotient); [§1.5 Newton orbit space and rational dominance](#newton-orbit-space); ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); [§1.7 Galois averaging and Hodge invariants](#galois-average); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); VectorBundlesAndIsocrystals VB0 (Dieudonné–Manin classification); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); Mathlib `Representation.Coinvariants`, `Representation.Coinvariants.map`.

<a id="decent-representative"></a>

### 1.9 Decent representative

Define `DecentRepresentative`. For a positive integer `r` and `b∈G(L)`, require `rν_b` to be integral and `(bσ)^r=(rν_b)(π)σ^r` in `G(L)⋊`<σ>. Equivalently `b σ(b)⋯σ^(r−1)(b)=(rν_b)(π)`, exactly `r` factors. A decent representative admits finite unramified descent; the definition excludes `r=0`.

*Construction.* State the integral slope homomorphism and the equation in the semidirect product `G(L) ⋊ ⟨σ⟩`, with exactly `r` factors (the printed equation in KMPS `(1.1.2.2)` has `r + 1`; see the source corrections). Finite unramified descent follows from the equation and slope functoriality.

*Remark.* A rank-one element `π^m` is decent with period `1`.

The API:

- `DecentRepresentative.mk`: Package `b, r>0`, integrality of `rν_b` and the r-factor equation.
- `DecentRepresentative.equation`: Expose the semilinear power equation with the chosen uniformizer.
- `DecentRepresentative.multiple`: A decent period `r` may be replaced by a positive multiple, with the matching integral slope.
- `DecentRepresentative.finiteDescent`: Supply the unramified degree-r coefficient field and descended `b` and Newton map.

**Checks.**

- `b=π^m` has period `1` and integral Newton point `m`.
- `b=1` has period `1` and zero Newton point.
- The zero period is excluded, even though its empty-product equality is tautological.

The light predicate `decencyEquation` retains only the positive-period equation `frobeniusNorm σ b r = a`; Newton integrality is the additional condition in `DecentRepresentative`. Prove `frobeniusNorm_twisted` for every group automorphism `σ`, every `b,g` and every natural `r`: the endpoint conjugator is `σ^r(g)`.

Source: [GLX](#ref-glx), Definition 2.3 p. 819; [KMPS](#ref-kmps), Section 1.1.2 equations and decency p. 6; [HV20](#ref-hv20), §1 pp. 899–900; Lemma 5.2 and proof p. 906 (PDF p. 8).

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); ReductiveGroups Layer 7 (structure theory).

<a id="straight-weyl-classification"></a>

### 1.10 Straight Weyl comparison with B(G)

For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from `σ`-straight `σ`-conjugacy classes of Weyl elements to `B(G)` is a bijection and preserves `κ` and dominant Newton points. For `w`, choose `n` killing the finite Weyl/Frobenius action and write `wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n`. The straightness criterion is `length(w)=⟨2ρ_Σ,ν_w^dom⟩`. Affine Weyl groups, lengths and `Adm(μ)` are those of ReductiveGroupsPartII RG2.4.

*Proof outline.* Take the local Iwahori–Weyl datum of RG2.4; choose normalizer representatives individually and use Lang to prove independence of the lift. A group-homomorphic section is not required. Prove independence of an allowed `n` and compatibility of invariant maps. The bijection is [He14](#ref-he14), Theorem 3.7, p. 13. First reduce a Weyl element to minimal length within its Weyl `σ`-conjugacy class by length-nonincreasing simple twisted conjugations. A minimal element can have a finite parahoric factor `u` in a presentation `ux` with `x` straight. Remove that factor at the level of `G(L)`-`σ`-classes by Lang’s theorem on the finite reductive quotient; length-preserving cyclic shifts alone do not produce a straight representative. Prove these distinct steps using He14 Theorems 2.1, 2.3, Lemma 3.2, Theorem 3.5, Proposition 3.6 and Theorem 3.7.

*Remark.* The rational translation normalization divides by `n`, not by the residue-field degree.

**Checks.**

- In affine type A₁ with `σ=id`, a finite simple reflection has length `1` and Newton point `0`, hence is not straight. Length-preserving shifts cannot turn it into a straight element of length `0`.
- A dominant split translation `t_μ` has length `⟨2ρ,μ⟩` and Newton point `μ`; its lift has Kottwitz class `+[μ]` in the arithmetic convention.
- For a torus the affine Weyl reflection group is trivial; the comparison retains the integral translation coinvariants, including their torsion.

Source: [He14](#ref-he14), Theorem 2.1, p. 8, and Theorem 2.3, pp. 9–10, Lemma 3.2, pp. 11–12, Theorem 3.5, p. 12, Proposition 3.6 and Theorem 3.7, p. 13; [KZ](#ref-kz), §2.2.2 pp. 9–10, with `σ`-straight definitions in §§2.1.3–2.1.4 pp. 7–8.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem).

<a id="classification-by-two-invariants"></a>

### 1.11 Kottwitz classification by both invariants

The map `(ν,κ):B(G)→N(G)×π_1(G)_Γ` is injective. For basic classes, `κ` restricts to a bijection `B(G)_basic≅π_1(G)_Γ`; their Newton point is the central rational representative determined by `κ⊗1`. Injectivity of `ν` alone is false.

*Proof outline.* Use He16 §2.2/Theorem 2.6 for injectivity of the pair (integral `κ`, dominant `ν`) over every nonarchimedean local field. Use the local affine datum of RG2.4 and its comparison from the straight-Weyl classification, retaining central torsion. Kot14 §13.1–13.3 and Proposition 13.1 identify the basic local-field set with `π_1(G)_Γ` and compare it with the `σ`-conjugacy presentation. The rational compatibility square then determines its central Newton point. Kot97 and KMPS provide the `p`-adic specializations; they are not by themselves citations for equal characteristic.

*Remark.* Quadratic norm-one torus gives equal `ν` and unequal `κ`.

For `GL_n` over the Witt fraction field with algebraically closed `k`, `wittGL_newton_classification` in `Suggested.lean` states a bijection from the actual `σ`-class quotient to `WittGLNewtonPolygon n`: descending rational tuples whose reduced denominators divide their slope multiplicities. The predicate `wittGLHasNewtonSlopes` identifies its value on `b` by a basis and a positive Frobenius power `Φ_b^r(e_i) = p^{a_i} e_i`, with `a_i = rν_i`. Thus every admissible tuple occurs and two matrices have the same tuple exactly when they are `σ`-conjugate. For `GL_n`, `κ` is the integral sum of these slopes; the basic classes are the constant tuples, giving the basic bijection with `ℤ` in positive rank.

Source: [Kot97](#ref-kot97), Section 4.13 pp. 274–275 (injectivity), Section 4.4 pp. 268–269 (basic bijection), and Section 5.1 pp. 278–280; [KMPS](#ref-kmps), 1.1.2.3 pp. 6–7; [He16](#ref-he16), §2.2 p. 22; §2.4, Theorem 2.6 pp. 25–26; [Kot14](#ref-kot14), §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.10 Straight Weyl comparison with B(G)](#straight-weyl-classification); ReductiveGroups Layer 7 (structure theory).

<a id="existence-of-decent-representative"></a>

### 1.12 Existence of decent representatives

Every class of `B(G)` has a decent representative for some sufficiently divisible positive `r`. In the mixed-characteristic GLX setting `r` can be enlarged so `G` is quasi-split over `E_r` and the representative has the chosen dominant Newton map.

*Proof outline.* Use HV20, Lemma 5.2, for the general local-field statement. Its proof reduces the class, inside its Newton centralizer, to a basic class and chooses a length-zero lift in the normalizer of the Iwahori subgroup; proving that such a decent length-zero normalizer lift exists after enlarging a positive period (HV20, `p. 906`) is part of this target, using the Iwahori–Weyl group of RG2.4. Use the integral, basic and straight-Weyl comparisons, then enlarge the period to clear the slope denominators and the finite descent period. Decency is not deduced from a bare root datum. In the `p`-adic setting of GLX, enlarge the unramified extension further so that `G` becomes quasi-split and conjugate the Newton map into the chosen dominant chamber.

*Remark.* For a coprime slope `a/h` simple block choose a period divisible by `h`.

The defining positive-period basis in `wittGLHasNewtonSlopes`, whose existence is part of `wittGL_newton_classification`, gives this statement for every rank over the Witt fraction field: changing to that basis makes the r-factor Frobenius norm `diag(p^{a_i})`, with integral Newton multiple `(a_i)`. No integrality of the slopes themselves is imposed.

Source: [GLX](#ref-glx), Paragraph 4 after Definition 2.3 p. 819; [Kot85](#ref-kot85), Section 4.3 pp. 213–214; [HV20](#ref-hv20), §1 pp. 899–900; Lemma 5.2 and proof p. 906 (PDF p. 8).

*Needs:* [§1.9 Decent representative](#decent-representative); [§0.6 The Kottwitz set B(G)](#sigma-conjugacy-quotient); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); [§1.10 Straight Weyl comparison with B(G)](#straight-weyl-classification); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

<a id="sigma-centralizer-J-b"></a>

### 1.13 Algebraic sigma-centralizer

Define `SigmaCentralizer`. For `b∈G(L), J_b` is the reductive `E`-group representing `A↦{g∈G(A⊗_E L):g b=b σ(g)}`. Its `L`-base change is the centralizer `M_b` of `ν_b`. It is an inner form of the corresponding Levi in the quasi-split inner form `G`*, and is an inner form of `G`* precisely when `b` is basic. Descent uses the semilinear action Ad(b)σ on `M_b`.

*Construction.* Build `ν_b` from the slope grading of the representations, which gives the Levi centralizer after base change to `L`. Restrict Ad(b)σ to that centralizer; for a decent `b` descent is effective over a finite unramified extension. Represent the fixed-point functor by reductive-group descent (the relative representability statement of [§0.2](#relative-tensor-torsors) and the descent of AlgebraicModuliForArithmeticGeometry Layer 3) and compare its rational points with tensor automorphisms.

*Remark.* For `b = 1, J_b(E) = G(E)`. For a simple rank-h isocrystal of slope `a/h, J_b` is the unit group of its endomorphism division algebra `A_{a/h}`, whose arithmetic Brauer invariant is `−a/h`; multiplicity `m` gives `GL_m(A_{a/h})`. In the bundle-slope notation of VectorBundlesAndIsocrystals, `A_{a/h} = D_{−a/h}`.

The API:

- `SigmaCentralizer.points`: For every `E`-algebra A, membership is exactly `g b=b σ(g)`.
- `SigmaCentralizer.baseChange`: `J_b⊗_E L≅Z_(G_L)(ν_b)`, with the descended semilinear datum.
- `SigmaCentralizer.conjugate`: For `b′=g b σ(g)^−1, h↦g h g^−1` induces `J_b≅J_b′`.
- `SigmaCentralizer.autIsocrystal`: `J_b(E)` is the tensor automorphism group of the `G`-isocrystal defined by `b`.
- `SigmaCentralizer.functorOfPoints`: The group-valued functor on commutative `E`-algebras A: its coefficient group is the convolution group of maps `H → A ⊗_E L`, Frobenius acts as `id_A ⊗ σ`, and `b` enters through the right tensor factor; an algebra map `f: A → B` acts by `f ⊗ id_L`.
- `SigmaCentralizer.naturalConjugacy`: Changing `b` to `g b σ(g)⁻¹` gives a natural isomorphism of these group-valued functors whose component conjugates by the image of `g` in `A ⊗_E L`.
- `SigmaCentralizer.naturalConjugacy_apply`: At every coefficient `E`-algebra A, the natural representative-change map sends `h` to `g_A h g_A^−1`, where `g_A` is the image of `g` in `G(A⊗_E L)`. It uses `g_A` on both sides, rather than `σ(g_A)`.
- `RepresentativeTensor.tensorAut`: The automorphism group of ofRepresentative `b` in the groupoid of trivialized families identifies multiplicatively with the point `σ`-stabilizer `{g` : `g b = b σ(g)}`.
- `RepresentativeTensor.tensorAut_component`: Every tensor automorphism has component equal to the representation action of its reconstructed stabilizer point, on every finite rational comodule.

**Checks.**

- `J_1(E)=G(E)`.
- For the simple `GL_2` slope `1/2` block, `J_b(E)=A_(1/2)^×`; two copies give `GL_2(A_(1/2))`. For the simple `GL_3` slope `1/3` block its division algebra has arithmetic invariant `−1/3=2/3` mod `Z`, detecting the sign hidden by the half-slope case.
- For `GL_2` slopes `0,1`, the algebraic `J_b` is `G_m×G_m`, while the bundle automorphism v-group also has a positive-slope kernel.
- A coefficient map `f:A→B` sends an H-point by postcomposition with `f⊗id_L`, without changing the `L` factor.
- For `b=1` and every `E`-algebra A, the centralizer functor is exactly the id_A⊗`σ`-fixed subgroup of `G(A⊗_E L)`. Arithmetic fixed-field descent to `G(A)` is a separate theorem.
- If `σ` is replaced by the identity and `b=1`, the value at A is the entire coefficient point group. This control must not be mistaken for arithmetic fixed-field descent.
- A tensor automorphism reconstructs a point satisfying `g b=b σ(g)`, preserving the correct placement of Frobenius.
- At identity coefficient Frobenius and `b = 1`, the tensor automorphism group is the entire point group, not a trivial automorphism group of orbit classes.

Source: [Kot97](#ref-kot97), Sections 4.3–4.4 pp. 268–269; [Kisin17](#ref-kisin17), 1.2.12 p. 14; [FS](#ref-fs), Example III.4.4 pp. 101–102.

*Needs:* [§0.5 `G`-isocrystals](#g-isocrystals-and-B-of-G); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.12 Existence of decent representatives](#existence-of-decent-representative); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); [§1.6 Rational Levi descent, elliptic tori and transfer of maximal tori](#levi-descent-and-torus-transfer); ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals VB0 (division endomorphisms of a simple isocrystal); VectorBundlesAndIsocrystals VB0 (arithmetic Brauer invariant and slope normalization); Mathlib `Subgroup`, `Algebra.TensorProduct.map`, `Algebra.TensorProduct.congr`; Tau Ceti `ReductiveAffineGroupSchemeCat`, `AlgHom.mapValue`, `FGComoduleCat.scalarExtensionMonoidalFunctor`, `Comodule.pointsAction`, `Tannaka.scalarExtensionComponent`, `Tannaka.fgPointTensorIsoEquiv`.

<a id="sigma-centralizer-conjugacy"></a>

### 1.14 Change of sigma-centralizer representative

If `b′=g b σ(g)^−1` then conjugation `h↦g h g^−1` induces an `E`-group isomorphism `J_b≅J_b′` and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.

*Proof outline.* Substitute the twisted-conjugacy equation into the pointwise fixed equation. Apply representability and descent to identify the natural functor isomorphism.

*Remark.* The map on `J_b(E)` uses `g`, not `σ(g)`, on both sides.

Source: [KMPS](#ref-kmps), Section 1.1.2 p. 6.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b).

<a id="defect"></a>

### 1.15 Defect of a sigma class

Define `Defect`. For the connected reductive local group `G` and its algebraic sigma-centralizer `J_b, def_G(b)=rank_E G−rank_E J_b` as an integer. The ranks are split ranks over `E`, not absolute ranks over `L` and not dimensions of topological point groups.

*Construction.* Take split ranks from the relative root theory of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1, and apply them to `J_b`. The isomorphisms `J_b ≅ J_{b′}` of [§1.14](#sigma-centralizer-conjugacy) make the integer depend only on `[b]`.

*Remark.* `GL_n` slope blocks give `n−sum` of their division-module multiplicities.

The API:

- `Defect.value`: Return `rank_E G−rank_E J_b` in `Z`.
- `Defect.conjugate`: Sigma conjugate representatives have equal defect.
- `Defect.product`: Defect is additive for products of groups and classes.

**Checks.**

- For split `GL_n` and `b=1` the defect is `0`.
- For split `GL_2` and simple slope `1/2`, ranks `2` and `1` give defect `1`.
- For split `GL_2` slopes `0,1, J_b` is a split rank `2` torus, so defect `0` although `b` is nonbasic.

Source: [He21](#ref-he21), Section 2.2 p. 5.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="finite-frobenius-norm-centralizer"></a>

### 1.16 Finite Frobenius norm centralizer

For the degree-r unramified extension `K_0/Q_p, δ∈G(K_0), σ^r=id`, and `γ=δσ(δ)⋯σ^(r−1)(δ)`, the algebraic twisted centralizer functor defined by `δσ(g)=gδ` becomes `Z_G(γ)` after base change to `K_0`. Extending the coefficient field from degree `r` to degree `rn` defines `I_(p,n)`; after extension to `L` its centralizer is `Z_G(γ^n)`. The norm of `δ^n` is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi `J_δ`.

*Proof outline.* Iterate the twisted equation `r` times to obtain centralization of `γ`. On `Z_G(γ)`, Ad(δ)σ has period `r`; perform finite Galois descent. Compare the point functors after `K_0` base change. For the enlarged coefficient field, `(δσ)^(rn)=γ^nσ^(rn)`; apply the same finite descent.

*Remark.* No general equality `Z_G(γ)=Z_G(ν_b)` is asserted.

Source: [Kisin17](#ref-kisin17), Section 2.1.2 p. 29.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness).

<a id="central-newton-on-J"></a>

### 1.17 Central Newton morphism of the centralizer

Define `CentralNewtonOnJ`. For every `b∈G(L)`, the slope morphism `ν_b`, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an `E`-rational central morphism `ν_(b,J):D→J_b`. No rational representative of `ν_b` inside `G` is needed. For a positive multiple `N` clearing its denominators, `Nν_(b,J)` is an integral cocharacter and `U_π=(Nν_(b,J))(π)` belongs to `J_b(E)`.

*Construction.* The slope decomposition is preserved by every isocrystal automorphism, so `ν_b` is central in the centralizer. The semilinear Frobenius operator commutes with its slope grading; descend that central morphism with the `J_b` group. Clear the finite weight denominators and evaluate the resulting integral cocharacter at `π`.

*Remark.* The construction does not assume that `ν_b` has a rational representative in `G`.

The API:

- `CentralNewtonOnJ.morphism`: Return the `E`-defined central `D→J_b` morphism.
- `CentralNewtonOnJ.integralMultiple`: For sufficiently divisible `N>0` obtain an integral central cocharacter.
- `CentralNewtonOnJ.transport`: Sigma conjugacy transports `ν_(b,J)` through the centralizer isomorphism.

**Checks.**

- For a simple `GL_2` slope `1/2` block, `2ν_(b,J)` is the central scalar cocharacter of `D_(1/2)^×`.
- For `b=1` the morphism is zero and `U_π=1`.
- For `GL_2` slopes `1,0` it is central in `J_b=G_m×G_m`, while its image in `GL_2` is noncentral.

Source: [FS](#ref-fs), Proposition V.3.6 p. 175.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.9 Decent representative](#decent-representative).

<a id="basic-class"></a>

### 1.18 Basic sigma class

Define `Basic`. A class is basic when its Newton morphism factors through `Z(G)`, equivalently every adjoint representation slope is `0`. This definition applies to all connected reductive inner forms, independently of a rational representative choice.

*Construction.* Use centrality of the slope morphism and tensor functoriality to identify the adjoint criterion.

*Remark.* Basic is isoclinic for `GL_n`, not necessarily slope `0`.

The API:

- `Basic.adjoint_iff`: Basic iff the adjoint isocrystal has slope `0`.
- `Basic.ofKottwitz`: Construct the unique basic class with a given integral `κ`.
- `Basic.newton`: Its central rational slope is determined by `κ⊗1`.
- `Basic.innerTransport`: Corresponding basic classes for inner forms have the same integral `κ` and transferred Newton point.

**Checks.**

- The simple `GL_2` slope `1/2` class is basic.
- Every torus class is basic.
- `GL_2` with slopes `1,0` is not basic.

Source: [KMPS](#ref-kmps), 1.1.2 p. 6.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); ReductiveGroups Layer 7 (structure theory).

<a id="basic-inner-form-bundle-equivalence"></a>

### 1.19 Basic inner form equivalence

For basic `b`, the curve group `Aut_G(E_b)` is `J_b×_E X`. Pure inner twisting therefore gives `Bun_G≃Bun_(J_b)`, compatible with perfectoid base change and carrying `E_b` to the trivial J_b-bundle.

*Proof outline.* For a basic slope cocharacter the adjoint isocrystal has only slope `0`; its bundle is the descended `J_b` group. Apply the torsor equivalence relatively.

*Remark.* For nonbasic `b` the curve automorphism group has a nonconstant positive part; this statement does not apply.

Source: [FS](#ref-fs), III.4.2 and III.4.3 pp. 100–101.

*Needs:* [§0.7 Pure inner twisting of torsors](#pure-inner-twisting); [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§1.18 Basic sigma class](#basic-class); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor).

<a id="division-algebra-morita"></a>

### 1.20 Division-algebra Morita comparison

For a simple isocrystal `D(a,h)` of slope `λ=a/h, gcd(a,h)=1` and `h>0`, set `A_λ=End_Φ(D(a,h))`. Under the arithmetic Frobenius and Brauer conventions of VectorBundlesAndIsocrystals VB0, `A_λ≅D_{−λ}` has invariant `−λ` mod `Z`, and `J_b≅A_λ^×`. The associated bundle is `O(−λ)`; the natural `End` comparison identifies `A_λ` with its endomorphism algebra. Twisting gives an equivalence between rank-h vector bundles and locally free rank-one right (`A_λ⊗_E` O_X)-modules via `E↦Hom(E_b,E)`, with right action by precomposition. Its inverse is `M↦M⊗_(A_λ⊗O_X)E_b`, where `E_b` is a left A_λ-module. For `m` copies the automorphism group is `GL_m(A_λ)`. This is a Morita/torsor equivalence.

Hypotheses: The local field and arithmetic Frobenius conventions of VectorBundlesAndIsocrystals VB0 apply; `λ` is the isocrystal slope, so the bundle slope is `−λ`. Right modules use `Hom(E_b, E)`; the functor `Hom(E, E_b)` of FS Example III.4.4 uses left modules.

*Proof outline.* Take the presentation of the simple-block endomorphism algebra and its arithmetic Brauer invariant from VectorBundlesAndIsocrystals VB0 (its parameter is the bundle slope `−λ`) and the stable-bundle endomorphism comparison of VB2. Then apply basic inner twisting ([§1.19](#basic-inner-form-bundle-equivalence)) and the explicit right-module Hom/tensor adjunction.

*Remark.* For isocrystal slope `1/3` the bundle slope is `−1/3` and `inv_E(A_λ)=2/3` mod `Z`, rather than `1/3`. The quaternion slope `1/2` example cannot distinguish the signs. The chosen `Hom` functor is covariant in `E` and right A_λ-linear by precomposition; exchanging the `Hom` arguments exchanges sidedness.

Source: [FS](#ref-fs), Example III.4.4 pp. 101–102.

*Needs:* [§1.19 Basic inner form equivalence](#basic-inner-form-bundle-equivalence); ReductiveGroups Layer 7 (structure theory); VectorBundlesAndIsocrystals VB0 (division endomorphisms of a simple isocrystal); VectorBundlesAndIsocrystals VB0 (arithmetic Brauer invariant and slope normalization); VectorBundlesAndIsocrystals VB2 classification (stable-bundle division endomorphism comparison).

<a id="partial-order-on-B-of-G"></a>

### 1.21 Newton partial order with Kottwitz fibre

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

Use the supplied `NewtonOrder`. Define `[b]≤[c]` iff `κ(b)=κ(c)` and `ν_b≤ν_c` in the coroot order on `N(G)`. Classification by both invariants makes this a partial order. The `ν`-only relation in KMPS is a preorder across all of `B(G)`, and becomes a partial order on each `κ` fibre.

*Supplied construction.* Combine reflexivity/transitivity of the coroot cone with `κ` equality. Use the injectivity of `(ν,κ)` for antisymmetry.

*Remark.* Order orientation is fixed once for specialization, flag stratification and charts.

The API:

- `NewtonOrder.le_iff`: Expose the `κ` equality and Newton dominance.
- `NewtonOrder.partialOrder`: Reflexive, transitive and antisymmetric relation on `B(G)`.
- `NewtonOrder.basic_minimal`: The basic class with `κ=α` lies below every class of `κ=α`.
- `NewtonOrder.representationCriterion`: With `κ` fixed, dominance is equivalent to the Newton-polygon inequalities on every rational representation.

**Checks.**

- Basic slopes `1/2,1/2` are below slopes `1,0` in `κ=1`.
- `GL_1` classes `0` and `1` are incomparable.
- Distinct norm-one torus `κ` classes are incomparable although `ν` is `0` for both.

Source: [FS](#ref-fs), III.2.2 pp. 90–91; [He21](#ref-he21), Section 4.1 p. 7.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); [§1.5 Newton orbit space and rational dominance](#newton-orbit-space).

<a id="representation-detects-dominance"></a>

### 1.22 Representations detect Newton dominance

For Γ-invariant rational cocharacter classes, `ν≤ν′` iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to `B(G)` additionally requires equality of integral `κ`.

Hypotheses: `E` is a nonarchimedean local field of either characteristic. RR96, Lemma 2.2, states the argument in characteristic zero; in positive characteristic the representations used are the highest-weight modules below, which exist in every characteristic.

*Proof outline.* For the forward implication, use Weyl invariance of representation weights and apply the dominant-weight inequality to each exterior power: its largest Newton weight is the corresponding partial sum of slopes, and the determinant controls the total; semisimplicity of representations is not needed. For the converse, over a finite separable splitting field take the highest-weight modules (Weyl or induced modules, which exist over a split reductive group in every characteristic) for positive integral multiples of the fundamental dominant weights, with the highest weights of their exterior powers, and restrict scalars to `E`. Γ-invariance of `ν` makes the conjugate highest-weight evaluations agree, so these representations detect each coroot inequality; central characters in both directions detect equality of central projections. Constructing these modules and their finite separable restriction of scalars in arbitrary characteristic is part of this target. The Weyl `average` of a dominant point is its central projection, which therefore lies below it in the coroot order. On `B(G)`, equality of the integral `κ` is imposed separately.

*Remark.* A faithful representation alone does not establish the full equivalence without a weight-detection argument.

Source: [RR96](#ref-rr96), §2.1 and Lemma 2.2 pp. 165–166; Proposition 2.4 and proof pp. 166–167.

*Needs:* [§1.5 Newton orbit space and rational dominance](#newton-orbit-space); ReductiveGroups Layer 1 (representations and comodules).

<a id="admissible-pair"></a>

### 1.23 Acceptable classes B(G,{μ})

Define `Acceptable` for every nonarchimedean local field, preserving the `p`-adic carrier of PadicHodgeTheory §5.5. For a geometric cocharacter class `{μ}`, set `B(G,{μ})={ [b]` : `κ(b)=μ♯` and `N_ξ(ν_b)≤μ◇` }. `ξ` is an inner twisting to the quasi-split form used for the dominant `average`. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.

*Construction.* Define the subtype of sigma classes satisfying the two invariant conditions. Check independence of Borel, torus and inner twisting via invariant transport.

*Remark.* Apply `μ` inverse in the CS flag convention.

The API:

- `Acceptable.mem_iff`: Membership is full `κ` equality and Newton bound.
- `Acceptable.basic`: The unique basic class of `κ=μ♯` lies in `B(G,{μ})`.
- `Acceptable.finite`: The acceptable subset is finite.
- `Acceptable.torus_iff`: For `T`, membership is `κ_T(b)=μ♯`; the Newton equality follows.
- `Acceptable.product`: Acceptable sets for a product factor with the component bounds.

**Checks.**

- For split `GL_2` and `μ=(1,0)`, basic slopes `1/2,1/2` and ordinary slopes `1,0` occur.
- `B(G,{0})` contains exactly its basic class with `κ=0`.
- For the quadratic norm-one torus `μ=1`, only `κ=1` mod `2` is allowed, though both Newton points equal `μ◇=0`.

Source: [KMPS](#ref-kmps), 1.1.5 conditions 1.1.5.1-2 p. 8; [KZ](#ref-kz), Definition 2.2.3 p. 10.

*Needs:* [§1.7 Galois averaging and Hodge invariants](#galois-average); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.21 Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G).

<a id="levi-newton-formula"></a>

### 1.24 Basic Levi Newton formula

For quasi-split `G/Q_p` and a rational standard Levi `M`, a basic class `b_M` with `κ_M(b_M)=μ_M♯` has Newton point the corresponding element of `(X_*(Z_M)⊗Q)^Γ`. If `μ_M` and `μ` have the same image in `π_1(G)`, its image in `B(G)` is acceptable for `μ` precisely when its `G`-dominant Newton point is bounded by `μ◇`. The M-dominant and `G`-dominant representatives can differ by a Weyl conjugation.

*Proof outline.* Project the basic invariant through the rational center isomorphism for `M`. Use the functorial `π_1` map and take `G`-dominant Newton representatives.

*Remark.* For a nonbasic `G`-class several distinct basic Levi classes can map to it; their Levi `κ` values need not coincide.

Source: [KMPS](#ref-kmps), Lemma 1.1.12 p. 10; [He21](#ref-he21), Section 6.2 p. 13.

*Needs:* [§1.18 Basic sigma class](#basic-class); [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="acceptable-unique-maximum"></a>

### 1.25 Unique maximum of acceptable classes

For a connected reductive group `G` over any nonarchimedean local field `E` with finite residue field, and a geometric conjugacy class `{μ}, B(G,{μ})` has a unique maximum for the fixed-integral-κ Newton order. It is ordinary exactly when its Newton point equals `μ◇`. The general-field assertion is derived from the characteristic-independent root-datum theorem HN18 Theorem `1.1(1)` and the local straight-class/invariant comparison; it is not attributed to HN18 Theorem 0.1 outside that theorem’s `p`-adic scope.

Hypotheses: `G/E` is connected reductive, `E` is a nonarchimedean local field of either characteristic and `{μ}` a geometric conjugacy class of cocharacters; `G` need not be quasi-split. The local affine root datum and its Frobenius action are those of ReductiveGroupsPartII RG2.4. The full integral `κ` fibre is retained; only central inertia torsion is removed for the numerical root-datum computation.

*Proof outline.* Take the local Iwahori–Weyl datum, its Frobenius and the projection of geometric cocharacters from RG2.4. He16 §2.2 permits both characteristics; its §2.4 comparison preserves `κ` and Newton points before the equal-characteristic restriction in §2.5. By [§1.10](#straight-weyl-classification) and the injectivity of [§1.11](#classification-by-two-invariants), the acceptable `B(G)` fibre identifies as a poset with the acceptable Newton values in the corresponding affine datum, at the fixed integral `κ`. For the finite central inertia-torsion subgroup `K` of the Iwahori–Weyl translation lattice, project to the torsion-free datum. Right exactness of `σ`-coinvariants identifies the kernel of the projected `κ` map with the image of `K_σ`. A lift with the wrong integral `κ` is corrected by a central torsion element; its Newton value is unchanged. Thus this numerical projection preserves the acceptable Newton set within the chosen `κ` fibre, without replacing `κ` by its rationalization. The resulting based reduced root datum and finite-order alcove-preserving affine Frobenius satisfy HN18 §1.3–§1.4. Pass to its adjoint datum using §2.1; express the affine action as an alcove stabilizer times a linear diagram action as in §2.2. Apply HN18 Theorem `1.1(1)`. Its proof (§2.3–§2.5) uses the orbit-weight integrality criterion of Lemma 2.5 and the largest allowed orbit-weight bounds to construct a Newton value `ν`. Chai Theorem 6.5 gives the least dominant majorant of those bounds, and Lemma `6.2(i)` shows every acceptable value is `≤ν`. The orbit-weight integrality criterion (HN18, Lemma 2.5) and Chai’s convex-majorant inputs (Theorem 6.5, Lemma `6.2(i)`) are proved as part of this target, for the reduced root datum obtained from RG2.4. Lift back to the chosen integral `κ` as above and then to `B(G)`. Two-invariant injectivity gives a unique class, and order compatibility makes it dominate every acceptable class. This field-independent transfer is our deduction from the cited root-datum theorem, not a claim that the paper’s `p`-adic Appendix A states an equal-characteristic theorem. Compare the resulting Newton value with `μ◇` to characterize ordinary equality. Unique maximality does not assert ordinary existence for nonsplit inner forms.

*Remark.* In a nonsplit inner form maximality alone does not imply ordinary equality.

Source: [HN18](#ref-hn18), §§1.1–1.4 pp. 2–4, Theorem 1.1(1) p. 4; §§2.1–2.5 pp. 4–8; Appendix A pp. 20–22; [He16](#ref-he16), §2.2 pp. 22–24 and §2.4, Theorem 2.6 pp. 25–26; [KZ](#ref-kz), Remark 2.2.5 p. 10.

*Needs:* [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.10 Straight Weyl comparison with B(G)](#straight-weyl-classification); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

<a id="ordinary-class"></a>

### 1.26 Ordinary Newton class

Define `Ordinary`. An acceptable class is μ-ordinary when its transferred dominant Newton point equals `μ◇`. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split `G`; it is not automatic for a general inner form. For either characteristic, every `B(G,{μ})` has a unique maximum, which need not satisfy ordinary equality.

*Construction.* Define ordinarity as equality of `ν` with the Hodge `average`, keeping acceptability. Uniqueness is injectivity of `(ν, κ)`, and existence for quasi-split `G` is KZ’s argument. For general `G`, [§1.25](#acceptable-unique-maximum) supplies a maximum by the characteristic-independent He–Nie root-datum theorem; it is ordinary precisely when its Newton point attains `μ◇`.

*Remark.* Ordinarity of a class and maximality in `B(G, {μ})` are separate statements.

The API:

- `Ordinary.isOrdinary`: Acceptability and equality of transferred Newton with `μ◇`.
- `Ordinary.unique`: At most one acceptable class is ordinary.
- `Ordinary.quasiSplitExists`: Quasi-split `G` admits the ordinary class.
- `Ordinary.maximal`: An ordinary class is the maximum of `B(G,{μ})`.
- `Ordinary.derivedIsogeny`: A morphism inducing an isogeny on derived groups preserves ordinary existence and membership for compatible `μ`.

**Checks.**

- For split `GL_2 μ=(1,0)`, slopes `1,0` are ordinary and `1/2,1/2` are not.
- The unique acceptable torus class is ordinary.
- For `G=D^×` with invariant `1/2` and geometric inverse cocharacter `μ⁻¹=(0,−1)`, the acceptable set has its basic maximum but no ordinary member: after splitting/twisting the hypothetical slopes `1/2,−1/2` each have multiplicity `1`, contrary to their denominator `2`.

Source: [KZ](#ref-kz), Definition 2.2.4 and Remark 2.2.5 p. 10; [KMPS](#ref-kmps), Section 1.3.15 p. 20.

*Needs:* [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); [§1.25 Unique maximum of acceptable classes](#acceptable-unique-maximum).

<a id="acceptable-straight-representatives"></a>

### 1.26a Acceptable straight representatives

Prove `Acceptable.straightRepresentative`. For every connected reductive `G/E` over a nonarchimedean local field, geometric cocharacter class `{μ}` and `[b]∈B(G,{μ})`, there is a `σ`-straight `w∈Adm({μ})` with `[ẇ]=[b]`. Use the local Iwahori–Weyl datum of RG2.4 and its projected cocharacter bound; retain the integral Kottwitz class. No minuscule, quasi-split or unramified restriction is imposed.

*Proof outline.* Prove the affine-datum order comparison and admissible-representative argument of HeKR16 Theorem 3.1 and Proposition 4.1 for this datum. The required combinatorial statements are targets here: Newton dominance at fixed `κ` is equivalent to Bruhat comparison of minimal straight-class representatives, and every acceptable straight class has a minimal representative below an element of `Adm({μ})`. For the latter use the maximum from §1.25 and prove its admissible realization by HN18 Theorem 1.1(2), including the reductions and construction of §§3–6 as part of this target. Then apply the straight-class order comparison and the Bruhat downward closure of `Adm({μ})`. The comparison reduces to the adjoint affine datum and a quasi-split unramified loop group as in HeKR16 §3; this auxiliary equal-characteristic realization is independent of the characteristic of `E`. Lift the Bruhat comparison in a common length-zero component and restore any central inertia torsion in the fixed integral `κ` fibre. Prove compatibility of this lift with the admissible upper translations. Combine with §1.10 to identify `[ẇ]` with `[b]`. HeKR16 §1.1 assumes tame semisimple `G`; the reduction and integral lifting above are part of the general reductive target here, rather than an attribution of that generality to its Proposition 4.1.

**Checks.**

- For split `GL₂` and `μ=(1,0)`, the ordinary class has straight translation `t_(1,0)` in `Adm({μ})` of length `1`.
- The basic `GL₂` class of slopes `(1/2,1/2)` has a length-zero straight representative in `Adm({μ})`; its lift can be `[[0,π],[1,0]]`, with square `π`.
- At `μ=0`, only the neutral class is acceptable and the identity is an admissible straight representative. A finite simple reflection of length `1` and Newton point `0` cannot replace it in `Adm(0)`.

Source: [HeKR16](#ref-hekr16), Theorem 3.1 and proof, pp. 11–12, Proposition 4.1, p. 12; [KZ](#ref-kz), proof of Lemma 2.2.6, p. 10; [HN18](#ref-hn18), Theorem 1.1(1)–(2), p. 4, §§2.3–2.5, pp. 6–8, and §§3–6, pp. 8–20.

*Needs:* [§1.23 Acceptable classes](#admissible-pair); [§1.25 Unique maximum of acceptable classes](#acceptable-unique-maximum); [§1.10 Straight Weyl comparison](#straight-weyl-classification); ReductiveGroupsPartII RG2.4 (local affine datum, admissible sets and Bruhat order).

<a id="ordinary-straight-translation"></a>

### 1.27 Ordinary straight translation and Levi centrality

Every ordinary class has a representative lifting a `σ`-straight translation `t_μ′` with `μ′` in the relative Weyl orbit of the projected `μ`. Such a translation has `μ′` central in the rational Newton Levi. If `μ′=w(μ)` with `μ` the projection of an absolute dominant cocharacter `μ̃`, the compatible absolute lift `w(μ̃)` is central in that Levi. The absolute-to-relative projection and the Frobenius are those of the local root datum of RG2.4.

*Proof outline.* Use the arithmetic convention for `t_{μ′}`: the lift of a split cocharacter is `μ′(π)`, with Kottwitz class `+[μ′]`. ReductiveGroupsPartII RG2.4 labels a translation by the inverse Kottwitz image, so the same point has label `−μ′` and apartment displacement `−μ′` there. Transport the chamber and the Newton normalization `ν_std = −w₀(ν_disp)` before applying its `length` or dominance statements. Apply the straightness equality to compare the coroot pairings with the Newton centralizer. Use the compatible absolute lift and averaging to force the remaining Levi root pairings to vanish. Choose a straight `w∈Adm({μ})` by [§1.26a](#acceptable-straight-representatives). Ordinary equality gives `ℓ(w)=⟨2ρ,μ◇⟩=ℓ(t_μ)`. Since `w≤t_μ′` for some `μ′∈W₀μ`, equality of lengths forces `w` to be that translation.

*Remark.* Centrality is in the Newton Levi, not necessarily in `G`. For split `GL_2`, `diag(π,1)` has arithmetic `κ=1` and dominant Newton point `(1,0)`. Its RG2.4 translation label is `(−1,0)`, whose dominant displacement is `(0,−1)`; applying `−w₀` recovers `(1,0)`.

Source: [KZ](#ref-kz), Lemma 2.2.6 p. 10, using Lemma 2.1.7 p. 8 and Lemma 2.1.9 p. 9 (arXiv v2).

*Needs:* [§1.26a Acceptable straight representatives](#acceptable-straight-representatives); [§1.26 Ordinary Newton class](#ordinary-class); [§1.10 Straight Weyl comparison with B(G)](#straight-weyl-classification); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroups Layer 7 (structure theory).

<a id="ordinary-derived-isogeny"></a>

### 1.28 Ordinary classes under a derived isogeny

If `f:G→G′` induces an isogeny of derived groups and sends `μ` to `μ′`, the ordinary class exists for `(G,μ)` iff it exists for `(G′,μ′)`. For `b∈B(G,{μ}), b` is ordinary iff `f(b)` is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.

*Proof outline.* Compare the dominant Newton points modulo the center using the derived isogeny. The rational `κ` compatibility fixes the central component, so equality lifts. For existence use the compatible straight translation and Kottwitz class.

*Remark.* The morphism need not be an isomorphism on centers; this is why full acceptability is retained.

Source: [KZ](#ref-kz), Lemma 2.2.8 p. 10.

*Needs:* [§1.26 Ordinary Newton class](#ordinary-class); [§1.27 Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory).

<a id="ordinary-integral-conjugacy"></a>

### 1.29 Integral conjugacy of an ordinary admissible element

In the KZ local setup with the specified connected parahoric model, if `b` is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, `b` lies in the double coset of a `σ`-straight translation `t_μ′` for `μ′` in `W_0μ`. It is `σ`-conjugate to the chosen translation lift by an element of `G(O_breveF)`. The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.

Hypotheses: Use KZ §2.1: `F` a nonarchimedean local field, connected reductive `G/F`, a `σ`-stable alcove, its Iwahori model `I`, and a specified connected parahoric model `G_script` with subgroup `W_J`. Require `b` to lie in both the μ-admissible parahoric double-coset union and the ordinary class. Here `G_script(O_breveF)` is the parahoric subgroup, not the rational points of `G`.

*Proof outline.* Use He–Rapoport Theorem `6.1(b)` to `σ`-conjugate `b` by the specified parahoric into an Iwahori cell indexed by a minimal `W_J` coset representative. [HeKR16](#ref-hekr16), Theorem 6.1, p. 15, puts that index in `Adm(μ)`. Use He–Zhou Theorem 4.1 to find a `σ`-straight `x` below that index whose Iwahori cell meets the ordinary class, and He14 Theorem 3.5 to identify its class. The ordinary equality and KZ Lemma 2.2.6 force `x=t_μ′`; admissible `length` comparison forces the original index to equal `x`. Apply He14 Proposition 4.5: the Iwahori double coset of a `σ`-straight lift is a single `σ`-conjugacy orbit under `I(O_breveF)`. Composing the two integral conjugators proves `(2)`. The four cited results of He, He–Rapoport and He–Zhou are inputs whose proofs are part of this target, stated for the parahoric group schemes of ReductiveGroupsPartII RG2.3 and the Iwahori–Weyl group of RG2.4.

*Remark.* A conjugate by an arbitrary `G(L)` element can leave the admissible integral double coset.

Source: [KZ](#ref-kz), Proposition 2.3.3 pp. 11–12; [HeKR16](#ref-hekr16), Theorem 6.1, p. 15. Its parahoric admissible-set identity is proved for the RG2.4 affine datum here, using the root-theoretic argument in that proof; §1.1 of the source assumes tame semisimple `G`.

*Needs:* [§1.27 Ordinary straight translation and Levi centrality](#ordinary-straight-translation); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem).

<a id="product-and-unramified-norm"></a>

### 1.30 Products and unramified restriction of scalars

`B(G₁×G₂)=B(G₁)×B(G₂)`, compatibly with `ν`, `κ`, defect and acceptable bounds. For `E/F` unramified of degree `d` and `G=Res_(E/F)H`, after decomposing `G(F̆)` into `d` factors, `Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1))` gives `B(G,σ)≅B(H,σ_E)`. The bound on `H` is the sum of the component cocharacters, with the chosen factor identifications. `J_b^G≅Res_(E/F)J_Nm(b)^H` and the `F/E` split-rank defects agree.

*Proof outline.* Write the Frobenius cycle on the `d` factors and eliminate `d−1` factors by sigma conjugation. Compare the surviving semilinear operator and centralizer. Use Shapiro on `π_1` and sum the Hodge components; compare `ρ` pairings with the precise normalized Newton tuple.

*Remark.* The defect is not multiplied by `d`: restriction of scalars preserves the local split rank.

Source: [Zhu17](#ref-zhu17), Remark 3.6 and Lemma 3.7 p. 459; [Kot97](#ref-kot97), Section 6.5 equations 6.5.2-6.5.3 p. 288.

*Needs:* [§1.15 Defect of a sigma class](#defect); [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); ReductiveGroups Layer 7 (structure theory).

<a id="basic-levi-fibre-uniqueness"></a>

### 1.31 Levi fibre over a basic `G`-class

For a basic `G`-class and a `σ`-stable standard Levi, its intersection with the Levi has at most one Levi `σ`-conjugacy class. For a nonbasic `G`-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the `G`-dominant vector and Levi `κ` must be checked separately.

*Proof outline.* Use the basic central Newton vector and the integral Levi invariant compatibility. Apply the corrected GHN basic-only uniqueness statement cited by He. For nonbasic classes the Levi invariant does not determine the class, and no uniqueness is asserted there.

*Remark.* In `GL_3`, different allocations of slopes to unequal Levi blocks can give different Levi `κ` while mapping to the same `G`-class.

Source: [He21](#ref-he21), Theorem 6.3 footnote and Section 6.2 pp. 13–14.

*Needs:* [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); [§1.24 Basic Levi Newton formula](#levi-newton-formula); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

<a id="gl-minuscule-quasisplit-centralizer"></a>

### 1.32 Quasi-split centralizer in the GL minuscule case

For `GL_n` over a `p`-adic field `L` and `μ(t)=diag(t` repeated `n−q,1` repeated `q`), exactly one class in `B(GL_n/L,{μ^−1})` has quasi-split `J_b`: the ordinary class `diag(π^−1` repeated `n−q,1` repeated `q`). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.

*Proof outline.* Acceptability confines slopes to `[−1,0]`. A nonintegral slope introduces a nontrivial division algebra factor in `J_b` and prevents quasi-splitness. `κ` fixes the multiplicities of the integral slopes−1 and `0`. For `Res` use the single-embedding norm-bound normalization from the source.

*Remark.* For an arbitrary cocharacter with more integral slopes, a quasi-split centralizer need not select the ordinary class.

Source: [CS17](#ref-cs17), Lemma 5.5.8 and preceding footnote p. 748.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§1.26 Ordinary Newton class](#ordinary-class); [§1.30 Products and unramified restriction of scalars](#product-and-unramified-norm); VectorBundlesAndIsocrystals VB0 (Dieudonné–Manin classification); ReductiveGroups Layer 7 (structure theory).

<a id="admissible-finiteness-and-basic"></a>

### 1.33 Finiteness and the basic acceptable member

`B(G,{μ})` is finite and has exactly one basic member, characterized by `κ=μ♯`. That member is its minimum for the Newton order. For `μ=0` it is the only member. For tori the whole acceptable set is this singleton.

*Proof outline.* Choose a faithful rational representation. Its Newton slopes lie in the bounded majorization interval given by `μ◇`, with fixed total, and each rational slope denominator divides its multiplicity by Dieudonné–Manin. Thus only finitely many `GL_n` slope tuples occur. The torus weight map is injective, so passage to Weyl orbits has finite fibres. At fixed integral `κ`, injectivity of `(ν,κ)` converts this finite set of Newton points into finiteness of `B(G,{μ})`. Use the general-field classification and linear slope inputs; Kot97/KMPS state the `p`-adic case. The unique basic class of `κ=μ♯` exists by the basic bijection. Its Newton point is the Weyl `average`, hence below every acceptable dominant point by the coroot-cone argument. For `μ=0` the only dominant point below zero with central projection zero is zero. For tori the coroot order is equality.

*Remark.* Zero bound cannot contain a noncentral positive-coroot displacement with the same central projection.

Source: [Kot97](#ref-kot97), Section 6.4 and 6.6 pp. 287–288; [KMPS](#ref-kmps), Lemma 1.1.6 p. 8; [RR96](#ref-rr96), Proposition 2.4(iii) and proof pp. 166–167; [Kot14](#ref-kot14), §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.18 Basic sigma class](#basic-class); [§1.22 Representations detect Newton dominance](#representation-detects-dominance); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); VectorBundlesAndIsocrystals VB0 (Dieudonné–Manin classification).

<a id="rational-newton-witness"></a>

### 1.34 Rational Newton representative

Define `RationalNewtonWitness`. A rational-Newton witness for `[b]` is an `E`-rational homomorphism `ν_G([b]):D→G` in the G(L)-conjugacy class of `ν_b`, with a specified conjugator. It exists when `G` is quasi-split or `[b]` is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.

*Construction.* Record the actual representative and conjugacy equation. For quasi-split groups choose the Γ-fixed dominant member; for basic classes descend the central morphism.

*Remark.* Galois invariance of an orbit is weaker than having a rational representative in `G`.

The API:

- `RationalNewtonWitness.quasiSplit`: Build the unique B-dominant rational representative for quasi-split `G`.
- `RationalNewtonWitness.basic`: A basic class has a central rational representative.
- `RationalNewtonWitness.levi`: Return `Z_G(ν_G([b]))` as an `E`-defined Levi.
- `RationalNewtonWitness.centralOnJ`: Transport the central Newton morphism to `J_b`, retaining the inner identification.

**Checks.**

- The slope `1,0` map has the diagonal rational representative.
- A basic witness centralizes all of `G`.
- An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

Source: [KMPS](#ref-kmps), 1.1.3 condition 1.1.3.1 p. 7.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.18 Basic sigma class](#basic-class); ReductiveGroups Layer 7 (structure theory).

<a id="minuscule-basic-levi-lift"></a>

### 1.35 Minuscule basic Levi lifting

For a connected reductive `G/Q_p`, a rational Levi `M` containing a maximal torus `T`, a `G`-minuscule `μ∈X_*(T)`, and basic `b_M` whose image lies in `B(G,{μ})`, some `w` in the absolute Weyl group `W(G,T)` makes `b_M∈B(M,{wμ})`. For quasi-split `G` the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to `G`*.

The proof includes the exactness statement that the kernel of `π₁(M)_Γ → π₁(G)_Γ` is torsion-free for the Levi subgroups used (KMPS, Proposition `1.1.13`), the unramified replacement of the based-root averaging datum, and the local Cartan inputs (Wintenberger’s realization, the Iwasawa reduction and Mazur’s inequality) in the form required by ReductiveGroupsPartII RG2.4. The Weyl element is taken in `W(G,T)`, with `T` a maximal torus of `M` and hence of `G; W(M,T)` may be too small and the quotient `N_G(M)/M` need not contain it (see the source corrections).

*Proof outline.* Use Wintenberger Cartan realization, Iwasawa reduction and Mazur inequality in the unramified case. Require equality of the integral `π_1(G)` class in the Satake reduction; minuscule dominance alone is insufficient. Use the torsion-free kernel of `π_1(M)_Γ→π_1(G)_Γ` and the matching Galois averages for the unramified replacement. Transport a rational parabolic and its rational Levi by the inner twisting; basic `κ` and `ν` are compatible.

*Remark.* `GL_3` with `M=GL_1×GL_2, μ=(0,1,0), b_M=diag(p,1,1)` needs the absolute Weyl swap; `N_G(M)/M` is trivial.

Source: [KMPS](#ref-kmps), Proposition 1.1.13 and Corollary 1.1.15 pp. 10–12; [KMPS](#ref-kmps), Corollary 1.1.15 p. 11.

*Needs:* [§1.24 Basic Levi Newton formula](#levi-newton-formula); [§1.34 Rational Newton representative](#rational-newton-witness); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="torus-norm-description"></a>

### 1.36 Torus norm and Newton average

For a torus `T/E, κ:B(T)≅X_*(T)_Γ` and `ν` of the class `κ^−1([λ])` is the rational `Γ-average` of `λ`. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.

*Proof outline.* Apply the valuation/cocharacter description over a splitting extension. Use norm maps and Shapiro to descend the cocharacter class. Identify Newton slopes through all characters with the normalized Galois `average`.

*Remark.* For a quadratic norm-one torus, two integral `κ` classes have Newton `0`.

Source: [KMPS](#ref-kmps), 1.1.2.4 p. 7; [Kot85](#ref-kot85), Sections 2.4-2.8 pp. 208–210; [Kot14](#ref-kot14), §12.13 p. 63; Lemma 12.12 and §13.2 p. 65.

*Needs:* [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); [§1.7 Galois averaging and Hodge invariants](#galois-average); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory).

<a id="torus-special-pair"></a>

### 1.37 Torus-special acceptable pair

Define `TorusSpecial`. For `T⊂G` a maximal torus over `Q_p`, an acceptable pair `([b],{μ})` is T-special if there exists `μ_T∈X_*(T)` in `{μ}` such that the unique class of `B(T)` with `κ_T=[μ_T]` maps to `[b]`. For tori admissibility is determined by `κ`, and the Newton point is the Galois `average` of `μ_T`. This packages local specialness, not a global CM point.

*Construction.* Use the torus Kottwitz bijection to define the class from the cocharacter. State its image equality in `B(G)` as the witness, rather than asserting arbitrary torus specialness.

*Remark.* The witness fixes both the cocharacter orbit and full `κ`.

The API:

- `TorusSpecial.mk`: Package `μ_T`, its conjugacy class and its torus-class image equation.
- `TorusSpecial.witness`: Recover `μ_T` and the `B(T)` class.
- `TorusSpecial.newton`: The mapped class has Newton orbit the image of `average(μ_T)`.
- `TorusSpecial.ellipticBasic`: For elliptic `T` a basic acceptable pair has a T-special witness.

**Checks.**

- For `G=T=G_m, μ=m` gives the class of `p^m`.
- The trivial class with `μ=0` is T-special.
- For `GL_2`, the basic slope `1/2` class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

Source: [KMPS](#ref-kmps), Definition 1.1.7 p. 8.

*Needs:* [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.36 Torus norm and Newton average](#torus-norm-description); ReductiveGroups Layer 7 (structure theory).

<a id="elliptic-torus-basic-image"></a>

### 1.38 Elliptic tori and basic acceptable classes

If `T⊂G` is elliptic modulo `Z(G)`, the image of `B(T)→B(G)` is exactly `B(G)_basic`. For every basic acceptable pair `([b],{μ})` and every `μ_T∈X_*(T)` in `{μ}`, the image of `κ_T^−1([μ_T])` is `[b]`. Thus every such pair is T-special; this argument requires no minuscule hypothesis.

*Proof outline.* Ellipticity makes the rational `average` of every cocharacter central in `G`, so the image is basic. The integral cocharacter quotient maps surjectively to `π_1(G)_Γ`, giving surjectivity onto basic classes. For `μ_T` in the given geometric orbit the image `κ` is `μ♯`; basic-class uniqueness identifies it with `[b]`.

*Remark.* A split nonelliptic torus in `GL_2` also produces nonbasic classes.

Source: [Kot85](#ref-kot85), Proposition 5.3 p. 215; [KMPS](#ref-kmps), Lemma 1.1.8 p. 8.

*Needs:* [§1.37 Torus-special acceptable pair](#torus-special-pair); [§1.18 Basic sigma class](#basic-class); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); [§1.6 Rational Levi descent, elliptic tori and transfer of maximal tori](#levi-descent-and-torus-transfer); ReductiveGroups Layer 7 (structure theory).

<a id="transferred-torus-specialness"></a>

### 1.39 Specialness for a transferred centralizer torus

Under a rational Newton witness, a `G`-minuscule acceptable pair and a rational transfer `j:T′→M_[b]` of a maximal torus of `J_b`, the pair is j(T′)-special. There is `μ_T′` in the prescribed geometric class whose Galois `average` equals the central morphism `ν_(b,J)`. Such a transfer exists if `G` is quasi-split or `T′` is elliptic; geometric conjugacy alone is not a transfer.

*Proof outline.* Conjugate the Newton representative and transferred torus together; centralize its maximal split subtorus to obtain a rational Levi `M`. The explicit representative `mh·b·σ(mh)^−1` lies in `M(L)` and is basic there. Apply the Levi lift of [§1.35](#minuscule-basic-levi-lift), with its absolute Weyl element, and the elliptic-torus specialness theorem in `M`. Transport the `average` equality through the chosen `J_b` inner identification.

*Remark.* The statement retains the rational transfer witness in the non-quasi-split case.

Source: [KMPS](#ref-kmps), Section 1.1.16 and Corollary 1.1.17 pp. 12–13.

*Needs:* [§1.34 Rational Newton representative](#rational-newton-witness); [§1.35 Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [§1.37 Torus-special acceptable pair](#torus-special-pair); [§1.38 Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); [§1.6 Rational Levi descent, elliptic tori and transfer of maximal tori](#levi-descent-and-torus-transfer); ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

<a id="abelianization-identification"></a>

### 1.40 Abelianized classes equal fundamental coinvariants

For `p`-adic `E` there is a canonical `B_ab(G)≅π_1(G)_Γ` under which `B(G)→B_ab(G)` is `κ`. In a maximal-torus model this is `coker(B(Tsc)→B(T))`, using `H^2(W_E,Tsc(L^sep))=0` and the torus Kottwitz descriptions.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

*Proof outline.* Apply the cohomology sequence of the two-term torus complex, the vanishing H²(W_E, `T_sc(L^sep)) = 0` of [§1.2](#weil-crossed-module-cohomology), and identify the cokernel with the coinvariants of the coroot quotient.

*Remark.* Finite `π_1` torsion survives the comparison.

Source: [FS](#ref-fs), Lemma III.2.11 p. 94.

*Needs:* [§1.3 Abelianized Kottwitz set](#abelianized-kottwitz-set); [§1.36 Torus norm and Newton average](#torus-norm-description); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.2 Weil cohomology of crossed modules with L^sep coefficients](#weil-crossed-module-cohomology); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

<a id="rational-kottwitz-surjectivity"></a>

### 1.41 Rational Kottwitz images of centralizers

For the unramified `Q_p` model of Kisin17 Lemma 4.6.4, the invariant map `J_b(Q_p)→π_1(G)^Γ` is surjective for every `b`. In the basic tame setting of vH24, the corresponding statement follows by inner-form compatibility with the rational quotient. The surjectivity `G(E) → (π₁(G)_I)^σ` for `G` itself is ReductiveGroupsPartII §RG2.4.2. Its target is Frobenius invariants in inertia coinvariants, distinct from `π_1(G)_Γ`.

Hypotheses: Use Kisin17’s unramified reductive model over `Z_p` for the every-b statement. The separate basic tame application retains the `p`-adic parahoric hypotheses of vH24. No equal-characteristic rational-point extension is asserted.

*Proof outline.* Use §RG2.4.2 for the rational-point quotient of `G`; the target here is its compatibility with the invariant of the centralizer under the stated local hypotheses. Under Kisin’s unramified hypothesis on `G`, use his local abelianized H⁰ comparison and the surjection of Levi invariants, with the vanishing of H¹ for simply connected groups over local fields from EndoscopicTransferAndUnitaryTraceComparison Layer 1. The statement for `J_b` is not asserted beyond these group hypotheses.

*Remark.* A ramified torus can have different invariant and coinvariant groups.

Source: [Kot97](#ref-kot97), Section 7.7 pp. 300–301; [Kisin17](#ref-kisin17), Lemma 4.6.4 p. 93; [vH24](#ref-vh24), Lemma 3.4.2 pp. 33–34 and Corollary 3.4.6 proof p. 37.

*Needs:* [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

<a id="component-kottwitz-coset"></a>

### 1.42 Component Kottwitz coset

Define `ComponentCoset`. For `b∈G(L)` and a geometric cocharacter bound `μ`, let `μ_I` be its image in `π₁(G)_I` and set `c_(b,μ)={x∈π₁(G)_I:(σ−1)x=μ_I−κ̃(b)}`. Compatibility means that `μ_I` and `κ̃(b)` have equal images in `π₁(G)_Γ`; it makes this a nonempty affine coset under `(π₁(G)_I)^σ`. This is an affine set of components, with no distinguished origin before a choice. Only when `μ` is defined over `L` can one replace `μ_I` by `κ̃(μ(π))`.

*Construction.* Take the kernel/cokernel sequence of `σ−1` on inertia coinvariants. Full `κ` equality says the difference lies in its image; a chosen solution identifies the fibre with the kernel.

*Remark.* The fibre over a difference is an affine coset of the Frobenius-fixed subgroup, with no chosen origin; an empty fibre is allowed.

The API:

- `ComponentCoset.mem_iff`: A component `x` solves the stated difference equation.
- `ComponentCoset.nonempty`: The Γ-coinvariant compatibility is equivalent to nonemptiness.
- `ComponentCoset.translate`: Invariant classes act freely and transitively on the fibre.

**Checks.**

- For `σ=id` a nonempty coset requires difference `0` and equals the entire lattice.
- On `Z` with `σ=−id`, the equation `−2x=2` has unique solution `x=−1`.
- On the same lattice difference `1` has no solution; its full coinvariant compatibility fails.
- For `E=ℚ₃`, `π=3`, `E′=E(√3)` and `T=Res¹_(E′/E) G_m`, inertia acts by `−1` on `X_*(T)=ℤ`. A geometric generator `μ` has image `μ_I=1` in `π₁(T)_I=ℤ/2`, on which Frobenius is trivial. With `a=√3`, the induced-torus resolution sends `a` to `a/τ(a)=−1`, where `τ(a)=−a`; its normalized valuation is `1`, so `b=−1∈T(E)` has `κ̃(b)=1`. Thus the compatible component coset is all of `ℤ/2`. In split coordinates `μ(3)=(3,3⁻¹)` is exchanged with its inverse by inertia and is not in `T(L)`; in the norm-one description its proposed coordinate `3` has norm `9`.

Source: the affine-fibre description is the elementary kernel-and-fibre deduction from the integral Kottwitz maps and component condition in [GLX](#ref-glx), Section 1.1 equations (1.3)–(1.4), p. 807, and Section 2.2, p. 818; it is not a separate theorem stated there. The inertia class and torus normalization are [Kot97](#ref-kot97), §§7.2–7.3, pp. 293–296.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); ReductiveGroupsPartII §RG2.1.5 (the geometric cocharacter class map, inertia coinvariants and torus Kottwitz normalization).

<a id="z-extension-bounded-lifting"></a>

### 1.43 Bounded lifting through a z-extension

For `E` a finite extension of `Q_p` and a z-extension `1→Z→G̃→G→1` with induced torus `Z`, every cocharacter class `μ` lifts after choosing maximal tori. Given `b∈B(G,{μ})` and a chosen lift `μ̃`, there is `b̃∈B(G̃,{μ̃})` above `b`; the induced map of component cosets is surjective. Projection to the adjoint group gives `B(G,{μ})≅B(Gad,{μad})` with the fixed central invariant.

Hypotheses: `E` is a finite extension of `ℚ_p`: the bounded-class, component-coset and adjoint statements are asserted in the scope of Kot97 §6.5 and GLX Lemma 3.16. z-extensions are those of ReductiveGroupsPartII §RG2.1.5.

*Proof outline.* Lift `μ` using the exact cocharacter sequence of the induced torus. Use the adjoint acceptable-set bijection to choose `b̃` with the specified `κ` and Newton bound. Lift differences in the affine coset using invariant-lattice surjectivity and `H^1(E,Z)=0`.

*Remark.* An arbitrary central torus lacks the induced-torus cohomological vanishing used here.

The API includes `ComponentCoset.liftZExtension`: over a finite extension of `ℚ_p`, a z-extension and compatible lifts `b̃∈B(G̃,{μ̃})` of `b∈B(G,{μ})` induce a surjection `c_(b̃,μ̃)→c_(b,μ)`.

**Checks.**

- For `G` with simply connected derived group, the identity z-extension induces the identity on each component coset.
- For `G_m×G_m→G_m` projecting to the second factor, with trivial `b̃` and zero `μ̃`, the component map is the surjection `ℤ²→ℤ`.
- For `GL₂→PGL₂`, with trivial `b̃` and zero `μ̃`, the component map is `ℤ→ℤ/2`, reduction modulo `2`; integral torsion remains in the target.

Source: [GLX](#ref-glx), Lemma 3.16 p. 829; [Kot97](#ref-kot97), Section 6.5 equation 6.5.1 p. 287.

*Needs:* [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.42 Component Kottwitz coset](#component-kottwitz-coset); [§1.41 Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="connected-center-basic-inner-forms"></a>

### 1.44 Basic classes and adjoint torsors with connected center

If `Z(G)` is a connected torus, `B(G)_basic→B(Gad)_basic≅H^1(E,Gad)` is surjective. The map sends a basic class to the inner form `J_b`. The assertion does not assume this surjectivity for groups with disconnected center.

*Proof outline.* Apply Kottwitz central-torus extension surjectivity to `1→Z(G)→G→Gad→1`. Use its restriction to the basic subsets; for an adjoint group basic Newton is `0` and basic classes identify with `H^1`.

*Remark.* For `SL_n`, the finite center prevents invoking this connected-torus proposition.

Source: [Kot14](#ref-kot14), Proposition 10.4, pp. 50–51 (central-torus surjectivity), §1.3.3, p. 3 (the zero-Newton fibre is H¹), and Proposition 13.1, §13.3, pp. 65–66 (basic classification over nonarchimedean local fields). For `p`-adic E, the torsor identification is PadicHodgeTheory §5.5 `localTorsorKottwitz`; for equal-characteristic E and a general connected reductive H the same zero-Newton description, the basic κ bijection and rational Newton compatibility identify H¹(E,H) with (π₁(H)_Γ)_tors; this supplies the equal-characteristic cohomological identification used above.

*Needs:* [§1.18 Basic sigma class](#basic-class); [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

<a id="general-levi-newton-comparison"></a>

### 1.45 Newton comparison for a Levi representative

Let `M_J` be a `σ`-stable standard Levi of a quasi-split based local group `G` and let `b_M∈M_J(L)` map to `b∈B(G)`. Its M_J-dominant Newton point `ν_M` is Weyl-conjugate to `ν_G` and `ν_G−ν_M` is a nonnegative rational sum of simple `G`-coroots. If `κ_M(b_M)=κ_M(t^λσ(η))` in the situation of He §6.2, then `λ◇−ν_M` belongs to the rational span of the J-coroots. This comparison does not require `b` or `b_M` to be basic.

*Proof outline.* Newton functoriality identifies the geometric orbit; choose the dominant representatives in the two chambers. Use Weyl chamber dominance for the first difference and the fundamental-group projection for the J-coroot span conclusion.

*Remark.* The separate basic-Levi uniqueness theorem retains its basic hypothesis.

Source: [He21](#ref-he21), Section 6.2 p. 13.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.5 Newton orbit space and rational dominance](#newton-orbit-space); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### Examples

- For split `GL_2` and `μ = (1, 0): B(GL_2, {μ})` consists of the basic class of slope `(1/2, 1/2)` and the ordinary class of slopes `(1, 0)`; the ordinary class is the maximum, and `J_b` is `D^× (D` the quaternion division algebra) for the basic class and `G_m × G_m` for the ordinary one.
- For the unramified norm-one torus, `B(T) = ℤ/2`: both classes have Newton point `0` and are separated only by `κ`.
- For a quaternion division algebra `D, B(D^×)` is in bijection with `B(GL_2)` by `b ↦ bΠ (Π² = π)`, which shifts both slopes by `1/2`; ordinary classes need not exist for inner forms that are not quasi-split.

### Dependencies

Layer 0; ReductiveGroupsPartII §§RG2.1.5, RG2.3, RG2.4; ReductiveGroups Layer 7; VectorBundlesAndIsocrystals VB0 and VB2; EndoscopicTransferAndUnitaryTraceComparison Layer 1.

## Layer 2: the stack Bun_G, its points, uniformization and topology

Use the small v-stack `Bun_G`, its geometric classification by `B(G)`, HN semicontinuity and local constancy of `κ` supplied by VStackSheavesAndLisseCategories §VS4.0. Prove Beauville–Laszlo uniformization, the v-descent of families of `G`-isocrystals and the identification of the topology of `|Bun_G|` with the Newton order in both characteristics. The étale and Weil cohomology comparisons on the curve needed for the abelianized invariant come first.

<a id="curve-etale-base-site"></a>

### 2.1 Curve-to-base étale site morphism

Define `CurveEtaleBase`. For `S∈Perf_k`, define `τ:(X_S)_et→S_et` through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection `Div^1×S→S`. Equivalently `τ`* sends étale `T/S` to `X_T/X_S`. This is a site morphism; no geometric projection `X_S→S` is postulated.

The proof includes the two étale-site equivalences for general `E`. DiamondsAndVStacks §D6.5 gives the comparison between an analytic adic space over `ℤ_p` and its diamond; for `E` of equal characteristic the relative curve is an analytic adic space over `F_q((t))` and the corresponding comparison is proved here by the same argument. The equivalence between the étale sites of the curve and of Div¹ (RelativeFarguesFontaine §4.7) is also proved here (FS, proof of Proposition III.2.12).

*Construction.* Compose the inverse of the étale-site equivalences `(X_S)_ét ≅ (X_S^♦)_ét ≅ (Div¹_S)_ét` with the continuous functor induced by the divisor projection Div¹ `× S → S`, and check that finite limits and covers are preserved.

*Remark.* There is no geometric projection `X_S → S`; this is why the morphism is constructed on étale sites.

The API:

- `CurveEtaleBase.pullback`: On an étale `T→S, τ`* is `X_T→X_S`.
- `CurveEtaleBase.baseChange`: The square for `S′→S` commutes up to the natural site equivalence.
- `CurveEtaleBase.pushforward`: Use the induced adjoint sheaf pushforward and derived pushforward.
- `CurveEtaleBase.constantComparison`: The structural `E`-map induces `RΓ_et(Spa E,F)→Rτ*(F|X_S)`.

**Checks.**

- For geometric `S`, the comparison is the curve/local-field cohomology comparison.
- The zero finite sheaf has zero derived pushforward.
- For `T=S⊔S` in `S_et, τ*(T)` is `X_S⊔X_S` over `X_S`, with the two inclusions preserved. This checks the actual inverse-image site functor.

Source: [FS](#ref-fs), III.2.4.2 p. 94.

*Needs:* RelativeFarguesFontaine §4.7 (degree-one divisor moduli Div¹); DiamondsAndVStacks Layer 2 (pro-étale and v-sites); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); DiamondsAndVStacks §D6.5 (étale sites of an analytic adic space and of its diamond).

<a id="curve-torsion-cohomology"></a>

### 2.2 Constant torsion cohomology on the curve

For `p`-adic `E, S∈Perf_k` and a locally constant finite abelian sheaf `F` on `Spa(E)_et, Rτ*(F|X_S)` is the constant complex `RΓ_et(Spa E,F)`. For algebraically closed perfectoid `C` the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and `p` coefficients use Artin–Schreier after tilting.

The proof includes the computation at a geometric point `C`: for a finite étale `E`-sheaf `F, H^i_ét(X_C, F)` agrees with `H^i(W_E, F)` by the punctured-period-domain exhaustion of RelativeFarguesFontaine Layer 1 and continuous finite-extension descent (FS, proof of Proposition III.2.12). Prime-to-p torsion uses the qcqs base change of DiamondEtaleCohomology §§C1.11–C1.12; `p`-power torsion is treated separately, by tilting and the Artin–Schreier sequence, which is part of this target.

*Proof outline.* Apply proper base change along `Div^1_S→S` and reduce to geometric `S`. After tilting to equal characteristic, annihilate cohomology on finite separable extensions using Kummer or Artin–Schreier. Use Galois descent and the continuous direct limit over finite field extensions.

*Remark.* The argument is an actual cohomology computation, not a field in the definition of `τ`.

Source: [FS](#ref-fs), Proposition III.2.12(i) pp. 94–95.

*Needs:* [§2.1 Curve-to-base étale site morphism](#curve-etale-base-site); DiamondEtaleCohomology §§C1.11–C1.12 (qcqs prime-to-p base change, after Scholze, *Étale cohomology of diamonds*, Corollary `16.10`); RelativeFarguesFontaine Layer 1 (relative period annuli and their exhaustion, §§1.2, `1.15`); DiamondsAndVStacks §D6.5 (étale sites of an analytic adic space and of its diamond).

<a id="bun-g-as-v-stack"></a>

### 2.3 Moduli v-stack Bun_G

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunGeometry`.

Use the supplied `Bun`. For `S∈Perf_k, Bun_G(S)` is the groupoid of `G`-bundles on `X_S`, with pullback along perfectoid maps. Effective v-descent for vector bundles and the rational tensor description make it a v-stack. On affinoid `S` the algebraic and adic curve descriptions agree by GAGA. The moduli keeps bundle isomorphisms, rather than quotienting them out.

*Supplied construction.* Apply v-descent for bundle evaluations and tensor constraints. Use GAGA on each affinoid curve to identify the scheme and adic torsor groupoids.

*Remark.* Pullback preserves the unit and composition coherences.

The API:

- `Bun.objects`: Evaluate to the `G`-bundle groupoid on `X_S`.
- `Bun.pullback`: For `T→S`, the curve map `X_T→X_S` induces bundle pullback `Bun_G(S)→Bun_G(T)`, with coherent identities and compositions.
- `Bun.ofIsocrystal`: An exact tensor `G`-isocrystal gives the constant bundle `E_b` on every `X_S`.
- `Bun.isomSheaf`: The diagonal fibre is the v-sheaf `Isom` of two `G`-bundles.
- `Bun.gaga`: For affinoid `S` compare algebraic and analytic curve torsor categories.
- `Bun.pullback_id`: Pullback of `G`-bundles along `id_S` is naturally tensor-isomorphic to the identity functor, with its unit coherence.
- `Bun.pullback_comp`: For `U→T→S`, pullback along the composite is naturally tensor-isomorphic to successive pullback, with the associativity coherence.

**Checks.**

- For `GL_n`, objects are rank-n vector bundles with all bundle isomorphisms.
- For `G=1, Bun_G` is the terminal v-stack.
- For `GL_2` slopes `0,1`, bundle automorphisms include positive-slope sections, so the isocrystal-to-bundle functor is not fully faithful on the ungraded categories.

Source: [FS](#ref-fs), Definition III.1.2 p. 88.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§0.1 `G`-bundles as exact tensor functors](#g-bundle); [§0.3 Tannakian description of analytic torsors](#g-torsors-three-descriptions); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals VB2 (GAGA for the relative schematic curve); DiamondsAndVStacks §D4.7 (small v-sheaves and small v-stacks); DiamondsAndVStacks §§D0.25–D0.26 (stackification, groupoid quotients and two-fibre products).

<a id="bun-g-smallness"></a>

### 2.4 Smallness of Bun_G

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunGeometry`.

`Bun_G` is a small v-stack. For an ω_1-cofiltered inverse system of affinoid perfectoids with limit `S, Bun_G(S)` is the filtered colimit of the groupoids `Bun_G(S_i)`, and its `Isom` sheaves have the same limit property. Hence bundles and arrows descend to topologically countably generated coefficient algebras, giving a set-sized cover.

*Supplier proof route.* Descend Cauchy sequences and interval period-ring elements through the ω_1-cofiltered limit. Descend vector bundles, tensor data and arrows. Take the disjoint union over a set of countably generated perfectoid algebras and bundle objects.

*Remark.* A claim of an arbitrary filtered-limit equivalence would be stronger than the source.

Source: [FS](#ref-fs), Proposition III.1.3 pp. 88–89.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.3 Moduli v-stack Bun_G](#bun-g-as-v-stack); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals VB2 (GAGA for the relative schematic curve); RelativeFarguesFontaine Layer 1 (relative period annuli and their exhaustion, §§1.2, `1.15`); DiamondsAndVStacks §D4.7 (small v-sheaves and small v-stacks).

<a id="points-are-B-of-G"></a>

### 2.5 Geometric classification of `G`-bundles

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

For complete algebraically closed nonarchimedean `C/k, b↦E_b` gives a bijection `B(G)→Bun_G(C)/≅` and consequently `B(G)≅|Bun_G|`. The slope grading identifies isocrystals with HN-graded bundles; positive-slope `H^1` vanishing splits the filtered tensor functor. It does not identify the ungraded groupoids or all their morphisms.

The equal-characteristic exactness argument for the HN-filtered tensor functor uses the reductive invariant-theory input of Ans19, Theorem 3.11 (Haboush’s theorem on geometric reductivity), which is part of the supplier contract.

*Supplier proof route.* Lift the bundle tensor functor canonically to HN-filtered bundles; verify exactness, including the equal-characteristic argument of Ans19. Identify the graded slope category with `Isoc_E` through VectorBundlesAndIsocrystals VB2 and VB0. The torsor of tensor splittings is unipotent with positive vector-bundle graded pieces; `H^1` vanishing trivializes it. Use the geometric-point equivalence relation for small v-stacks to identify `|Bun_G|`.

*Remark.* `GL_n` recovers the vector-bundle slope multiset; positive `Hom` spaces remain in the ungraded bundle category.

Source: [FS](#ref-fs), Theorem III.2.2 pp. 89–90; [Ans19](#ref-ans19), Theorem 3.11 and proof pp. 14–16.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.3 Moduli v-stack Bun_G](#bun-g-as-v-stack); [§0.6 The Kottwitz set B(G)](#sigma-conjugacy-quotient); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); VectorBundlesAndIsocrystals VB0 (Dieudonné–Manin classification); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor); VectorBundlesAndIsocrystals VB2 classification (geometric classification of bundles); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); ReductiveGroups Layer 7 (structure theory); VectorBundlesAndIsocrystals VB4 (relative vanishing of positive-slope H¹).

<a id="hn-sign-and-semicontinuity"></a>

### 2.6 HN sign and semicontinuity

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

For `E_b`, its bundle HN class is `ν_b*=w_0(−ν_b)` and `c_1(E_b)=−κ(b)`. The HN class `ν`* on `|Bun_G|` is upper semicontinuous: specialization can increase the upper-concave HN polygon. The reductive order is detected on rational representations ([§1.22](#representation-detects-dominance)), and on each representation the HN polygon is upper semicontinuous (VectorBundlesAndIsocrystals VB4).

*Supplier proof route.* Apply the linear slope sign convention under each representation. Use RR96’s representation criterion to pass from the vector-bundle HN polygons to the reductive class.

*Remark.* For `b=π^m` in `G_m, E_b=O(−m)`, fixing both the Newton and degree signs.

Source: [FS](#ref-fs), Theorem III.2.3 and preceding paragraph p. 91.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§1.22 Representations detect Newton dominance](#representation-detects-dominance); VectorBundlesAndIsocrystals VB4 (semicontinuity of the HN polygon); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor).

<a id="strictly-disconnected-torsors"></a>

### 2.7 Pro-étale torsors on strictly disconnected bases

Every pro-étale H-torsor on a strictly totally disconnected perfectoid `S` is trivial when `H` is a first-countable locally profinite group. Such torsors on arbitrary `S` are represented by perfectoid spaces as the inverse limit over compact open subgroups. First countability supplies the countable nested system used to choose compatible sections.

*Proof outline.* Reduce to a compact open subgroup after splitting the étale quotient cover. Choose a countable cofinal system of open normal subgroups and compatible sections of the finite étale quotients. Use separated étale descent and the perfectoid inverse-limit construction.

*Remark.* A generic torsor on an arbitrary perfectoid base need not be globally trivial.

Source: [FS](#ref-fs), Remark III.2.5 and Lemma III.2.6 p. 92.

*Needs:* DiamondsAndVStacks Layer 2 (pro-étale and v-sites); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); DiamondsAndVStacks §D1.4 (strictly totally disconnected perfectoid spaces); DiamondsAndVStacks §D1.9 (universally open strictly totally disconnected covers); DiamondsAndVStacks §D3.10 (torsors under locally profinite groups).

<a id="geometrically-trivial-locus"></a>

### 2.8 Geometrically trivial open locus

`Bun_G^1` is open and `[*/G(E)]→Bun_G^1` is an equivalence, where `G(E)` has its locally profinite topology and torsors are pro-étale. Prove openness before `κ`-local-constancy: on strictly disconnected bases the `ν=0` locus yields `E`-local systems; their continuous fibre functor is a reductive torsor over `C^0(π_0S,E)`, whose triviality is open by henselian local rings.

*Proof outline.* Use the equivalence of VectorBundlesAndIsocrystals VB4 between bundles that are trivial at every geometric point and pro-étale `E`-local systems. On a strictly disconnected base trivialize each local system, preserving its tensor structure. Henselian continuity makes triviality of the fibre-functor torsor an open condition. Identify the automorphism sheaf of the trivial bundle with the constant locally profinite `G(E)` sheaf.

*Remark.* The entire `ν=0` locus can contain nontrivial torsion `κ`; it is not automatically `Bun_G^1`.

Source: [FS](#ref-fs), Theorem III.2.4 pp. 91–92.

*Needs:* [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§2.7 Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); VectorBundlesAndIsocrystals Layer VB4 (families, slope filtrations and local systems); ReductiveGroups Layer 7 (structure theory); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals VB4 (slope-zero bundles and local systems).

<a id="diagonalizable-curve-cohomology"></a>

### 2.9 Diagonalizable Weil–curve comparison

For `p`-adic `E` and a diagonalizable algebraic `E`-group `D` of finite type, the pro-étale sheaf associated to `T/S↦H^1_et(X_T,D)` is constant with value `H^1(W_E,D(L^sep))`. For algebraically closed perfectoid `C, H^i(W_E,D(L^sep))≅H^i_et(X_C,D), 0≤i≤2`. The natural map comes from the curve étale site to discrete W_E-sets. Use `1→D^0→D→π_0(D)→1` and retain all finite component contributions.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

The comparison morphism comes from the morphism of [§2.1](#curve-etale-base-site) and the Weil-cohomology inputs of [§1.2](#weil-crossed-module-cohomology); its identification with the curve cohomology in degrees `0 ≤ i ≤ 2` uses [§2.2](#curve-torsion-cohomology).

*Proof outline.* For tori apply geometric classification and translate the neutral fibre using the Picard stack. Use torsion comparison for finite `π_0(D)`, which is étale in characteristic `0`. Use the Weil-torus `H^2` vanishing and compare the long exact sequences through degree `2`.

*Remark.* The proof is not applied to `μ_p` in equal characteristic. For `E=Q_p` with `p` odd, `μ_p(L)={1}`, while `μ_p(L^sep)` has `p` elements with its natural nontrivial inertia action. The coefficient functor must retain this action.

**Checks.**

- For `D=G_m`, the comparison identifies the curve Picard classes with integral rank-one Weil classes.
- For `D=μ_p`, the coefficient group is `μ_p(L^sep)` with its inertia action, including `p=2`; finite type does not mean prime-to-`p` torsion.
- The infinite product `D=∏_(n≥1) μ_(p^n)` is excluded: a tuple of primitive roots has no open inertia stabilizer, so its discrete coefficient action is not continuous. The slope protorus of §1.4 is likewise outside this finite-type comparison.

Source: [FS](#ref-fs), Proposition III.2.12(ii), comparison morphism and Remark III.2.14 pp. 94–97.

*Needs:* [§2.2 Constant torsion cohomology on the curve](#curve-torsion-cohomology); [§2.8 Geometrically trivial open locus](#geometrically-trivial-locus); [§1.36 Torus norm and Newton average](#torus-norm-description); [§1.2 Weil cohomology of crossed modules with L^sep coefficients](#weil-crossed-module-cohomology); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

<a id="crossed-module-curve-classes"></a>

### 2.10 Constant crossed-module curve classes

For `p`-adic `E`, the pro-étale sheaf associated to `T/S↦H^1_et(X_T,[Gsc→G])` is constant with value `B_ab(G)`. The comparison identifies the curve abelianization of a bundle with its `κ` class.

*Proof outline.* Use the homotopy-equivalent center complex `[Zsc→Z]`, whose centers are finite-type diagonalizable groups. Apply diagonalizable comparisons in degrees `1` and `2` to its long exact sequence. Compare the curve and Weil abelianization maps; this is the second, `p`-adic-only proof of `κ`-local-constancy.

*Remark.* The first uniformization proof of `κ`-local-constancy remains independent of this second comparison proof.

Source: [FS](#ref-fs), Proposition III.2.13 p. 96.

*Needs:* [§1.40 Abelianized classes equal fundamental coinvariants](#abelianization-identification); [§2.9 Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [§1.2 Weil cohomology of crossed modules with L^sep coefficients](#weil-crossed-module-cohomology); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

<a id="grassmannian-point-lifting"></a>

### 2.11 Grassmannian point lifting

For strictly totally disconnected `S=Spa(R,R+)` over `Spa(E)` and `s∈S, Gr_G(R)→Gr_G(K(s))` is surjective. Split `G` after a finite field extension embedded in `R`, use the Cartan decomposition, and lift `G(B_dR^+(K(s)))` through successive nilpotent thickenings by smoothness and `Lie` algebra surjectivity.

The lifting uses only the Schubert bounds of GeometricSatakeAndFusion GS0; the identification of connected components of the Grassmannian is not needed here.

*Proof outline.* Use the clopen-component argument to get `R→K(s)` surjective. Lift group points using henselian smooth lifting. Lift the positive period-ring points by the complete filtration and successive `Lie` corrections.

*Remark.* This supplies relative lifting from the fixed-point uniformization theorem.

Source: [FS](#ref-fs), Lemma III.3.2 p. 98.

*Needs:* GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); DiamondsAndVStacks Layer 2 (pro-étale and v-sites); RelativeFarguesFontaine §§4.12–4.13 (the completed local ring `B_dR⁺` at an untilt); DiamondsAndVStacks §D1.4 (strictly totally disconnected perfectoid spaces); DiamondsAndVStacks §D1.9 (universally open strictly totally disconnected covers).

<a id="beauville-laszlo-surjectivity"></a>

### 2.12 Beauville–Laszlo uniformization

The modification map `BL:Gr_G→Bun_G` is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every `G`-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.

*Proof outline.* Apply Anschütz’s geometric-point modification theorem for arbitrary connected reductive `G`. Lift the modification by the Grassmannian point-lifting lemma. On its open trivial locus split the locally profinite torsor and choose a trivialization. Descend the local modifications along the pro-étale cover.

*Remark.* The gluing map itself is that of RelativeFarguesFontaine §7.7; the target here is its v-surjectivity onto `Bun_G`.

Source: [FS](#ref-fs), Proposition III.3.1 p. 98; [Ans19](#ref-ans19), Theorem 6.5 p. 30.

*Needs:* [§2.8 Geometrically trivial open locus](#geometrically-trivial-locus); [§2.11 Grassmannian point lifting](#grassmannian-point-lifting); [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§2.7 Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice); ReductiveGroups Layer 7 (structure theory).

<a id="central-torus-grassmannian-surjectivity"></a>

### 2.13 Central-torus Grassmannian surjectivity

For a central extension `G̃→G` with torus kernel `Z`, `Gr_G̃→Gr_G` is surjective as a v-sheaf. After a finite splitting extension, lift the dominant cocharacter through the split torus lattice sequence. The corresponding map of bounded Schubert closures is surjective on geometric points and quasicompact, hence a v-cover. Schubert bounds and properness are those of GeometricSatakeAndFusion GS0.

*Proof outline.* Pass v-locally to a finite splitting extension and lift the dominant cocharacter through the exact split torus lattice sequence. On a geometric point with complete algebraically closed coefficient field `C`, the split torus kernel has `H¹(B_dR(C),Z)=0` by Hilbert 90. Lift the group point and use the Cartan decomposition to obtain a lift in the specified bounded Schubert closure. The source Schubert closure is quasicompact and the target quasiseparated over `Spd(E)`, because both are proper. The geometrically surjective bounded map is therefore a quasicompact v-cover. Use the Schubert exhaustion to cover the full Grassmannian.

*Remark.* Unlike rational-point z-extension lifting, this geometric statement needs a torus kernel but not an induced torus.

Source: [FS](#ref-fs), Lemma III.3.5 p. 99.

*Needs:* [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness); ReductiveGroups Layer 7 (structure theory).

<a id="central-torus-bundle-surjectivity"></a>

### 2.14 Central-torus bundle surjectivity

For a central extension `G̃→G` with torus kernel `Z, Bun_G̃→Bun_G` is a v-surjection. `Bun_Z` acts by central tensor product and `Bun_G` is its quotient stack; the action is a quasi-torsor before surjectivity is proved.

*Proof outline.* Lift a bundle to a Grassmannian point by BL, then lift that point along the central-torus map. Identify its ambiguity with a Z-bundle via the contracted product and descend.

*Remark.* No circular use of `κ`-local-constancy is made in this proof.

Source: [FS](#ref-fs), Lemma III.2.10 and proof after III.3.5 pp. 93,99.

*Needs:* [§2.12 Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [§2.13 Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [§0.4 Structure group and tensor descent](#structure-group-and-tensor-descent); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="semicontinuity-and-local-constancy"></a>

### 2.15 Local constancy of bundle Kottwitz invariant

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

`κ:|Bun_G|→π_1(G)_Γ` is locally constant, with the discrete topology on its integral target. Together with HN semicontinuity this makes `|Bun_G|→B(G)` continuous for the Newton-order topology. The proof for every local `E` uses central-torus bundle surjectivity, z-extensions and induced tori; the crossed-module proof is a second proof for `p`-adic `E`.

*Supplier proof route.* Reduce by a z-extension to simply connected derived group, then to G/Gder. Resolve that torus by an induced torus and use central-torus bundle surjectivity. For induced tori integral `κ` is torsion-free and determined by `ν`; the torus order is equality, so semicontinuity implies local constancy.

*Remark.* The norm-one torus torsion classes show why directly using `ν` for all tori fails.

Source: [FS](#ref-fs), Theorem III.2.7 and first proof pp. 92–93.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.14 Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§1.1 Torus resolutions, invariant lattices and choice of maximal torus](#torus-resolutions-and-lattices); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

<a id="family-kottwitz-local-constancy"></a>

### 2.16 Kottwitz invariant in isocrystal families

For an F_q-scheme `S` with a `G`-isocrystal family, the function `s↦κ(E_s)` in `π_1(G)_Γ` is locally constant. Perfectifying `S` preserves the relevant topology. Analytify the family to the curve and apply bundle `κ`-local-constancy; this proves the assertion of FS III.2.8 for families; the descent statement of [§2.17](#isocrystal-family-v-descent) does not use it.

*Proof outline.* After perfection write a Frobenius family on `Spec R` and associate the map `Spd(R,R)→Bun_G`, as in FS III.2.8. Pull back the clopen `κ` fibres along that map. Apply SW Proposition 18.3.1, the bijection between clopen subsets of `Spd(R,R)` and `Spec R`; this proves scheme-topological local constancy. No commuting support or valuation map is assumed.

*Remark.* The local constancy of `κ` on `Bun_G` does not use this corollary.

Source: [FS](#ref-fs), Corollary III.2.8 pp. 92–93; [SW](#ref-sw), Proposition 18.3.1 §18.3.

*Needs:* [§0.8 Families of `G`-isocrystals](#families-of-g-isocrystals); [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="isocrystal-family-v-descent"></a>

### 2.17 Isocrystal-family v-descent and strata

The `G`-isocrystal family prestack is a v-stack on perfect F_q-schemes. It has locally closed geometric-class strata indexed by `B(G)`, each equivalent to `[*/J_b(E)]` for the locally profinite rational-point group. This is the family stack statement of FS `I.2.1`; the algebraic classifying stack `[*/J_b]` and the bundle stratum with its full automorphisms are different objects.

Prove `GIsocrystalFamily.newtonClosed`: for each `b∈B(G)`, the substack where every geometric fibre has `κ=κ(b)` and `ν≤ν_b` is a perfectly finitely presented closed substack. On a perfect affine chart its ideal is the perfection of a finitely generated ideal. Reduce the Newton inequalities to finitely many representations, as in RR96 Theorem 3.6(ii), then use the linear Newton-polygon closed-locus theorem; in equal characteristic use the argument of HV11 Theorem 7.3. Integral `κ` is locally constant by §2.16, so its fibre is open and closed. The combined statement for the family stack is GIZ26 Theorem 6.8. Finite generation, rather than closedness alone, is needed for the Bézout-ring step in §2.20.

*Proof outline.* Use Iva23, Lemma 5.9 and Proposition 5.10, for arc-descent of vector bundles over the coefficient rings in both characteristics; Ans22, Lemma 11.3, extends it to `G`-torsors by exact tensor reconstruction, exactness being reflected because the coefficient-ring map meets every maximal ideal (Iva23, Corollary `5.6`). Descend the Frobenius isomorphism by full faithfulness. Arc-descent gives v-descent, independently of `κ`-local-constancy. Ans22, Theorem 11.4, trivializes the underlying coefficient-ring torsor v-locally: its proof reduces to absolutely integrally closed valuation rings of finite rank and uses Steinberg’s theorem in rank `0`, the extension of torsors over the punctured period ring in rank `1`, and valuation-ring excision and induction in higher rank; these three inputs are part of this target. The resulting presentation is LG/Ad_σ LG. Only after descent, use Newton semicontinuity and the local constancy of `κ` ([§2.16](#family-kottwitz-local-constancy)) to construct the locally closed loci of constant class. Cover such a locus in the v-topology by spectra of products of perfect normal valuation rings, and choose the connected smooth affine O_E-model of ReductiveGroupsPartII RG2.3 required by HK22 §2.1. On each normal piece follow HK22 (v5), Proposition 2.10 and Theorem 2.11: separate the least slope by `Φ = π^{−r}φ^s` and construct an effective lattice. The lattice bound of its Lemma 2.9 must include the Frobenius denominator `d` of the initial rank-h lattice: the minimal effective over-lattice `Σ_{i<h} Φ^i M₀` lies in `π^{−d(h−1)} M₀` (Zin01, Lemma `9`), and no bound depends on the Newton polygon alone. Local freeness over a general perfect base uses the proper lattice-moduli cover. For an effective local shtuka, HK22 Lemma 2.8 represents finite-level fixed sections by affine étale schemes; constant slope-zero multiplicity makes them finite étale, and the inverse limit trivializes the étale part on a profinite étale cover. Induct through the least slopes as in Proposition 2.10. For `G`, reconstruct its defining tensor line `i₀:L₀↪t(V₀)` in a faithful representation. Prove `GIsocrystalFamily.tensorOrbit_lift` as follows. Put `H=Hom_Φ(L₀,t(V₀))`, a finite-dimensional `E`-space, and `A=Aut_Φ(V₀)×Aut_Φ(L₀)`, acting by `(j,l)·i=t(j)∘i∘l⁻¹`. These automorphism groups are the algebraic centralizers of the corresponding linear isocrystals. The stabilizer of `i₀` in A is `J_b`, by the tensor description, and is smooth by [§1.13](#sigma-centralizer-J-b). The locally closed algebraic orbit `O=A·i₀` is therefore `A/J_b`, and `A→O` is smooth. Its map on `E`-points has local continuous sections through every point in its image: factor a smooth morphism locally as an étale map followed by an affine-space projection, then apply Hensel lifting and continuity of simple roots. This is the local argument in the proof of Conrad Lemma `A.2.1`; it does not require all `O(E)` to lie in one rational orbit. The continuous embedding family on the profinite normal chart takes values in `A(E)·i₀` by the constant-isogeny-class hypothesis. Pull back these local sections and refine by clopen neighbourhoods; changing both trivializations by `(j,l)` makes `i` constant. Keeping the line automorphism `l` is essential to the smooth-stabilizer argument in positive characteristic. The `Isom` sheaf is thus a torsor for the locally profinite `J_b(E)`, and v-descent identifies the stratum with `[*/J_b(E)]` over any perfect base. The theorem of HK22 needs normality, and no profinite étale trivialization over a non-normal perfect base is asserted. The construction gives neither the algebraic classifying stack `[*/J_b]` nor the positive-kernel automorphism group of a curve bundle.

*Remark.* Over perfect normal charts the stratum is trivialized profinite étale locally; over a general perfect base only v-locally. A rank-two slope-zero shear with off-diagonal coefficient `π^{−N}` needs a lattice denominator `c ≥ N`, so the Newton polygon alone does not bound the effective lattice; and an ambient linear lift of a tensor-line embedding need not preserve the tensors (for the norm-one torus, the map `(x₀, x₁) ↦ (2x₀, x₁ − x₀/2)` is invertible but is not of the form `(t x₀, t⁻¹ x₁)`).

For a commutative ring `R`, a field `K` with an `R`-algebra structure, a field
automorphism `σ` and `a, scale∈K` such that `scale·a` is outside the image of `R`,
there is no `R`-submodule `M⊂K²` containing `(0,1)`, stable under
`(x₀,x₁)↦(σ(x₀)+aσ(x₁),σ(x₁))`, with `scale·x₀` in the image of `R` for every
`x∈M`: the image of `(0,1)` violates that bound. Over `ℚ`, the invertible shear
`(x₀,x₁)↦(2x₀,x₁−x₀/2)` sends `(1,1)` to `(2,1/2)` and differs from every
diagonal action `(t x₀,t⁻¹ x₁)` for `t∈ℚˣ`. These tests distinguish the lattice
denominator and tensor-preservation requirements of the family theorem.

**Checks.**

- For `G=1` the stabilizer equals A on the trivial pair, so the orbit is a point and the lift is constant.
- For the norm-one torus the displayed ambient matrix does not preserve the tensor; the lift must lie in `A(E)` and preserve the pair after both trivializations are changed.
- In characteristic `p`, acting on a tensor line by the pth power can give the nonsmooth stabilizer `μ_p` if its basis is fixed. Retaining `Aut_Φ(L₀)` replaces that stabilizer by the graph of the character and makes the smooth-orbit argument applicable.

Source: [FS](#ref-fs), Theorem I.2.1, p. 11; [Iva23](#ref-iva23), Corollary 5.6, p. 13, Lemmas 5.8–5.9 and Proposition 5.10, pp. 14–15; [Ans22](#ref-ans22), Lemmas 11.2–11.3 and Theorem 11.4, pp. 34–36; [HK22](#ref-hk22), v5, Lemmas 2.8–2.9, pp. 7–8, Proposition 2.10, p. 8, and Theorem 2.11, p. 9; [Zin01](#ref-zin01), Lemma 9 and its proof, pp. 11–12 of the author copy; [Conrad12](#ref-conrad12), proof of Lemma A.2.1, p. 62 (the local continuous-section argument for a smooth map); [GIZ26](#ref-giz26), Theorem 6.8, p. 41; [RR96](#ref-rr96), Theorem 3.6(ii) and proof, pp. 171–172; [HV11](#ref-hv11), Theorem 7.3, p. 28 of arXiv v3.

*Needs:* [§0.8 Families of `G`-isocrystals](#families-of-g-isocrystals); [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); [§2.16 Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals Layers VB−1–VB0 (coefficient rings and finite isocrystals); DiamondsAndVStacks Layer 2 (pro-étale and v-sites); ReductiveGroups Layer 1 (representations and comodules); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem); Mathlib `Submodule`.

<a id="grassmannian-kottwitz-sign"></a>

### 2.18 Grassmannian components and Kottwitz sign

For split `G`, the decomposition `Gr_G=∐_(α∈π_1G) Gr_G^α` has each component a filtered union of proper Schubert closures with `[μ]=α`. On the modification map in GS0 indexing, `κ(BL(x))=α` (followed by Γ-coinvariants for nonsplit `G`). For nonsplit `G`, use geometric `π_1` with Galois descent and then its Γ-coinvariant image in `Bun_G`. A component decomposition alone does not prove uniformization or bundle connectedness.

*Proof outline.* The decomposition of the Grassmannian into components indexed by `π₁(G)`, its Schubert exhaustion and nonsplit descent are proved here from the Schubert bounds of GeometricSatakeAndFusion GS0 (Zhu17, Proposition 1.21; FS III.3.6): over a splitting field, the component of a point is the class in `π₁` of the relative position of its geometric points, and the components are connected because each is a filtered union of the connected Schubert closures it contains; Galois descent passes to inertia and Galois coinvariants. Evaluate on the GS0 cocharacter lattice `μ(ξ)` to fix the positive Kottwitz sign, and use the local constancy of `κ` ([§2.15](#semicontinuity-and-local-constancy)) and connectedness of the Schubert pieces to extend the equality.

*Remark.* For `G_m`, the lattice `ξ^m B_dR⁺` produces `O(−m)` with `κ=m`. Its CS Schubert label is `−m` while its GS label is `m`.

**Checks.**

- The lattice `ξ B_dR⁺` has GS component `1`, bundle `O(−1)` and Kottwitz invariant `1`.
- The lattice `ξ⁻¹ B_dR⁺` has GS component `−1`, bundle `O(1)` and Kottwitz invariant `−1`; inverting the label changes both signs.
- For `GL₂`, `diag(ξ,1)(B_dR⁺)²` has determinant component `1` and bundle `O(−1)⊕O`, with isocrystal slopes `(1,0)`.

Source: [FS](#ref-fs), Proposition III.3.6(i),(iii), pp. 99–100, for the component decomposition and exhaustion; [Zhu17](#ref-zhu17), Proposition 1.21 p. 427. The positive sign here follows from RelativeFarguesFontaine §7.7, `modify_gm_degree`, and the GS lattice identification in GeometricSatakeAndFusion GS0. FS III.3.6(ii) states the negative sign in its presentation.

*Needs:* [§1.8 Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice).

<a id="valuation-boundary-comparison"></a>

### 2.19 Period-space descent and the valuation boundary

For a perfect F_q-algebra A, let `S=Spec` A and give `W_{O_E}(A)` the π-adic topology. Define `BoundaryPeriodSpace` on open v-subsheaves `F` of S^diamond by taking the open subspace `Y_F` of `Spa(W_{O_E}(A)[1/π],W_{O_E}(A))` whose diamond is `F×Spd(E)`. This is a period-space construction with the outer boundary retained; the usual relative period domain removes that boundary. It is independent of the affine presentation of `F` and commutes with open restriction, fibre products and Čech nerves.

The construction uses ramified Witt vectors in mixed characteristic and `A[[π]]` in equal characteristic. Choose the perfectoid extension `E_infinity` used in GIZ26 §3.1; the displayed spaces become perfectoid after completed base change to `E_infinity`. The conservative, faithful base-change functor of its Proposition 3.13 permits gluing the open subspaces. No construction of meromorphic bundles or of a shtuka stack is involved.

The API:

- `BoundaryPeriodSpace.schematic`: For `F=(Spec` A)^diamond, `Y_F` is `Spa(W_{O_E}(A)[1/π],W_{O_E}(A))`, with π-adic coefficients.
- `BoundaryPeriodSpace.adic`: For a perfectoid pair `(R,R⁺), F=Spd(R⁺,R⁺)` with the adic topology gives `Y_F=Spa(A_inf(R⁺),A_inf(R⁺))` minus `V(π)`, denoted `Y_(0,infinity]`. For `F=Spa(R,R⁺)`, remove `V(π[ϖ])` instead, giving `Y_(0,infinity)`. Here `ϖ` is a pseudouniformizer of `R`.
- `BoundaryVectorBundles.vDescent`: Finite locally free bundles on E_infinity-sousperfectoid spaces satisfy effective v-descent as exact `E`-linear tensor categories. This is the vector-bundle form of GIZ26 Corollary 3.10; prove it directly by the vector-bundle descent argument of SW19.5.3 after perfectoid base change, and descend morphisms, locally free modules and exactness. Perfect complexes of arbitrary amplitude are not needed.
- `BoundaryVectorBundles.compare`: The v-descent limit of `Vect(Y_X)`, over affinoid perfectoid `X→F`, is naturally equivalent to `Vect(Y_F)`, preserving exact sequences, tensors, duals and Frobenius pullback. Apply the preceding v-descent theorem to the affinoid perfectoid covering sieve of `F` and the Čech-compatible construction of `Y_F`. This is GIZ26 Theorem 3.16, and uses descent, rather than a slope-extension assertion.
- `BoundaryPhi.restrict`: For `R⁺=R^circ` and either characteristic of `E`, restriction of Frobenius-equivariant bundles from `Y_(0,infinity]` to `Y_(0,infinity)` is fully faithful. For `R=C` an algebraically closed perfectoid field it is an equivalence. Iterate Frobenius to reduce to `Y_[r,infinity]` for `r>0`, and the bounded Frobenius-fixed-section argument of PR24 Proposition 2.1.3. Keep the hypothesis `R⁺=R^circ`. The extension to the coefficient ring `O_E` follows PR24 Remark 2.1.10 and GIZ26's use of the same argument for general `E`.
- `BoundaryGFamily.constantClass`: Let `V` be a perfect rank-one valuation ring over `F_q`, choose a nonzero nonunit `ϖ∈V`, and write `Vhat` for its ϖ-adic completion and `K=Vhat[1/ϖ]`. A schematic `G`-isocrystal family over `V` gives, by analytification, a Bun_G-family on `Spd(V,V)`, where `V` here has the discrete topology. If its residue-field class is `b`, the restriction to the open subsheaf `Spd(Vhat,Vhat)` has constant geometric class `b`. To prove this, use `BoundaryVectorBundles.compare` to realize the restricted exact tensor family as Frobenius-equivariant bundles on `Y_{K,(0,infinity]}`. Apply `BoundaryPhi.restrict` and geometric vector-bundle classification (FS II.2.14) to obtain the residue-class comparison in the proof of GIZ26 Theorem 7.18, `p. 52`. Extend isomorphisms representation by representation through full faithfulness; uniqueness preserves the tensor and unit constraints. The input family is already exact, so this argument does not infer exactness merely from a fully faithful functor. This is a statement about the family induced by the schematic isocrystal, not an assertion that every open-period-space bundle admits a boundary extension.

**Checks.**

- For `F=Spd(R⁺,R⁺)` with its adic topology, a point with `[ϖ]=0` and `π≠0` belongs to `Y_F`; it is excluded for `F=Spa(R,R⁺)`. Giving both `F` the same period domain loses the valuation-boundary point.
- For the constant rank-one isocrystal `π^mσ` over `V`, the induced boundary family has bundle `O(−m)` at both points of `Spd(Vhat,Vhat)`, for `m=0` and `m=1`. The construction therefore preserves the fixed slope sign at the boundary.
- `BoundaryPhi.restrict` requires `R⁺=R^circ`: for a proper valuation subring `C⁺⊊O_C` the boundary category can depend on `C⁺` while the open category does not (PR24, `p. 19`). No equivalence for that pair is asserted.
- For `G=1` the constant-class assertion gives the unique bundle; for an unramified norm-one torus it retains the chosen integral `κ` class, even when both classes have Newton point zero. The tensor comparison, rather than equality of representation slopes alone, is needed for the latter test.

Source: [GIZ26](#ref-giz26), §3.1, pp. 13–17, Corollary 3.10, p. 15, Proposition 3.13 and Lemma 3.14, pp. 15–16, Remark 3.15 and Theorem 3.16, p. 17, and the schematic-to-Bun direction in the proof of Theorem 7.18, p. 52; [PR24](#ref-pr24), Proposition 2.1.3, pp. 18–22, Remark 2.1.4, p. 19, and Remark 2.1.10, p. 26; [SW](#ref-sw), Proposition 19.5.3, pp. 180–181; [FS](#ref-fs), Theorem II.2.14, p. 70.

*Needs:* [§0.8 Families of `G`-isocrystals](#families-of-g-isocrystals); [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§2.16 Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy) (the family analytification); RelativeFarguesFontaine Layer 1 (period spaces, coefficient rings, perfectoid base change); VectorBundlesAndIsocrystals VB1–VB2 (the exact tensor bundle category and geometric classification); DiamondsAndVStacks Layers 2–4 (v-descent, small v-sheaves and open subsheaves).

<a id="newton-topology-homeomorphism"></a>

### 2.20 Newton topology theorem in both characteristics

For every nonarchimedean local field `E` and connected reductive `G/E`, the geometric-class bijection `|Bun_G|→B(G)` is a homeomorphism for the topology whose closed subsets are upward closed in the fixed-κ Newton order. Equivalently, `[b]≤[b′]` iff `E_b′` lies in the closure of `E_b`.

Hypotheses: `E` is a nonarchimedean local field of either characteristic, with finite residue field; `G/E` is connected reductive, with no quasi-split or unramified hypothesis. Use GIZ26 arXiv v3: its §2 and Remark 2.1 allow both characteristics. He16 §2.5 restricts the schematic closure discussion to equal characteristic; use Vie21 for the mixed-characteristic route.

*Proof outline.* Geometric point classification, HN semicontinuity and integral `κ`-local-constancy give a continuous bijection to the reversed Newton topology, hence one implication on specialization. In mixed characteristic, use Vie21 Theorem 1.1 with its finite-Q_p-extension hypothesis.

In equal characteristic, He16 Theorems 1.29 and 2.12 identify schematic specialization with fixed integral `κ` and Newton dominance. Use the straight-class and affine Bruhat inputs of [§1.10](#straight-weyl-classification) and ReductiveGroupsPartII RG2.4, retaining inertia torsion. On finite bounded loci the topology is determined by specialization, as in GIZ26 Lemma 7.17. For a covering relation `b≤b′`, realize the schematic specialization by a perfect rank-one valuation ring `V`, with closed class `b` and generic class `b′`: the proof of GIZ26 Theorem 7.18, pp. `51–52`, passes to a product comb, applies `GIsocrystalFamily.newtonClosed` to obtain a finitely generated defining ideal, makes it principal by Proposition 2.17, and cuts a valuation-ring component around a nonzero nonunit. Proposition 2.17 itself asserts the Bézout property, not this rank-one realization.

Analytify that family on `Spd(V,V)`. By `BoundaryGFamily.constantClass` the completed open subsheaf `Spd(Vhat,Vhat)` lies in `Bun_G^b`. Its v-sheaf closure is `Spd(V,V)`, which also contains the discrete generic-field locus of class `b′`. Thus `E_b′` lies in the closure of `E_b`. Iterate along the finite bounded specialization chains. This gives the missing implication; the reverse implication already follows from HN semicontinuity and `κ`-local-constancy. The meromorphic comparison of GIZ26 Theorem 7.13 and its parahoric shtuka-stack constructions are unnecessary for this proof.

**Checks.**

- In the `GL_2` fibre `κ=1`, slopes `(1/2,1/2)≤(1,0)`; the ordinary bundle point is in the closure of the basic point. Reversing this direction fails the rank-two extension example.
- For `G_m`, equal `κ` forces equal class, so each Newton point is open and closed.
- The two norm-one-torus classes have equal Newton point but different integral `κ`; neither specializes to the other.

Source: [GIZ26](#ref-giz26), §2 and Remark 2.1, pp. 6–7, Proposition 2.17, p. 11, Lemma 7.17, pp. 50–51, and only the schematic-to-Bun direction of Theorem 7.18, pp. 51–52; [He16](#ref-he16), §1.10.5, Theorem 1.29, pp. 20–21, §§2.2 and 2.4–2.6, pp. 22, 25–28, Theorem 2.12, p. 28; [Vie21](#ref-vie21), Theorem 1.1 and topology convention, p. 2; [FS](#ref-fs), Conjecture III.2.15, p. 97.

*Needs:* [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [§2.19 Period-space descent and the valuation boundary](#valuation-boundary-comparison); [§1.21 Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G); [§2.17 Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [§1.10 Straight Weyl comparison with B(G)](#straight-weyl-classification); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

<a id="modification-newton-bound"></a>

### 2.21 Newton bound for a modification

For `G/Q_p` and any geometric cocharacter class `μ` in GS0 indexing, a geometric point of `Gr^GS_(G,μ)` modifying the trivial bundle determines `b∈B(G,{μ})`. For `GL_n` its bundle Newton tuple is dominated by `(−μ)^dom` with total degree `−Σμ_i`; translate through `ν_bundle=w_0(−ν_isocrystal)`. The full `κ` equality is `μ♯`. In CS indexing the same cell has label `η=(−μ)^dom` and the bound is `B(G,{η⁻¹})`.

*Proof outline.* For `GL_n` use exterior powers to reduce to a bound on the first slope and determinant degree. Compute the determinant line modification to establish the equality of totals. Use RR96’s representation criterion for `G` and the component-sign comparison for `κ`.

*Remark.* The inverse bound in CS17 is transported through `Gr^CS_η=Gr^GS_((−η)^dom)`; it is the direct bound for the GS label.

**Checks.**

- For `GL₂` and GS label `(1,0)`, ordinary slopes are `(1,0)` and basic slopes are `(1/2,1/2)`, both with `κ=1`.
- The lattice `ξ B_dR⁺` for `G_m` gives `O(−1)`, hence isocrystal slope `1`, rather than the inverse-bound slope `−1` for the same GS label.
- For `GL₂`, slopes `(2,−1)` have the required total but exceed `(1,0)` at the first partial sum and cannot occur in that cell.

Source: [CS17](#ref-cs17), Proposition 3.5.3 and Lemma 3.5.4 pp. 687–689, after the CS-to-GS label conversion in the Conventions.

*Needs:* [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); [§1.22 Representations detect Newton dominance](#representation-detects-dominance); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice); GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness).

<a id="minuscule-modification-image"></a>

### 2.22 Minuscule modification image

For minuscule `μ` over `Q_p` in GS0 indexing, the map from the flag variety `Fℓ^GS_(G,μ)≅Gr^GS_(G,μ)` to `B(G,{μ})` is surjective on geometric classes. This is stronger than the invariant containment for all `μ` and uses the Rapoport existence result recalled by CS17 Remark 3.5.8.

*Proof outline.* Use the minuscule identification of the Schubert cell with the flag variety from GeometricSatakeAndFusion GS0. Every acceptable class occurs by Rapoport, *Accessible and weakly accessible period domains*, appendix to Scholze, *On the p-adic cohomology of the Lubin–Tate tower*, Proposition A.9. The Newton bound gives a nonempty weakly admissible locus; the admissible locus has the same classical points and is therefore nonempty. At an admissible point the inverse modification is semistable. The integral equality `κ(b)=μ^♮` makes its Kottwitz invariant zero, so the basic classification identifies it with the trivial bundle. Reversing this modification realizes `b` from the trivial bundle. Both parts of acceptability enter this existence argument, which is part of the target.

*Remark.* A nonempty acceptable index set alone does not produce a flag point.

**Checks.**

- For `GL₂` with GS label `(1,0)`, both the ordinary class `(1,0)` and basic class `(1/2,1/2)` occur on the flag line.
- A central minuscule cocharacter gives a point and its unique acceptable class.
- The class `(2,−1)` has no point for GS bound `(1,0)` despite its matching Kottwitz invariant; surjectivity is only onto the acceptable set.

Source: [Rap15](#ref-rap15), Proposition A.9, p. 42; [CS17](#ref-cs17), Remark 3.5.8 p. 689, after the CS-to-GS label conversion.

*Needs:* [§2.21 Newton bound for a modification](#modification-newton-bound); [§1.23 Acceptable classes B(G,{μ})](#admissible-pair); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness).

<a id="de-rham-quotient-group-class"></a>

### 2.23 Class from a de Rham quotient-group lattice

In Liu–Zhu Corollary 4.9, the tensor functor has domain `Rep_(Q_p)(G^c)`, where `G^c=G/Z_G^s`. At a classical point embedded into `C_p`, its de Rham comparison defines compatible `B_dR^+` lattices. The Fargues tensor modification construction therefore gives a class in `B(G^c_(Q_p))`. Producing a class in `B(G_(Q_p))` requires a chosen compatible lift or additional `G`-level tensor data. No canonical lift is claimed.

*Proof outline.* Apply the de Rham comparison at the point in every rational representation of `G^c`, use the exact tensor lattice-to-bundle functor of RelativeFarguesFontaine §7.7, and classify the resulting bundle. The class lies in `B(G^c)`; a central-torus v-surjectivity statement gives local existence of lifts but no canonical lift to `G`.

*Remark.* The class is defined for the quotient group `G^c` (Liu–Zhu, Remark 4.1(iii)); a class for `G` needs extra tensor data or the hypothesis `G = G^c`.

Source: [LZ17](#ref-lz17), Corollary 4.9 and Remark 4.1(iii) pp. 33–34.

*Needs:* [§0.3 Tannakian description of analytic torsors](#g-torsors-three-descriptions); [§2.5 Geometric classification of `G`-bundles](#points-are-B-of-G); [§2.14 Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice).

### Examples

- For `G = GL_2`, the points of `|Bun_G|` of degree `d` are the semistable bundle (`O(d/2)` for `d` odd, `O(d/2)²` for `d` even) and the bundles `O(a) ⊕ O(d −` a) with a > `d/2`. The semistable point is open, and every other point of degree `d` lies in its closure.
- For `G = G_m, Bun_G = ⊔_{d ∈ ℤ} [*/E^×]` and each point is open and closed.

### Dependencies

Layers 0–1; VectorBundlesAndIsocrystals VB1–VB4; RelativeFarguesFontaine Layers 1, 4 and 7; GeometricSatakeAndFusion GS0; DiamondsAndVStacks Layers 0–6; DiamondEtaleCohomology §§C1.11–C1.12.

## Layer 3: automorphism groups, Newton strata and the smooth Artin stack

Use the HN-graded, full-automorphism and stratum contracts of VStackSheavesAndLisseCategories §VS4.0 and the flag-stratum contracts of IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5. Develop filtered relative automorphism group schemes, compute stratum dimensions, and deduce the connected components `π₁(G)_Γ` from the supplied smooth Artin structure.

<a id="hn-graded-g-bundles"></a>

### 3.1 HN-graded `G`-bundles

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

Use the supplied `HNGraded`. Bun_G^(HN-split)(S) consists of exact rational tensor functors into Q-graded bundles on `X_S` with weight-λ piece everywhere semistable of bundle slope `λ`. For `b`, use the slope-reversed grading of `E_b`. Forgetting the grading lands in `Bun_G`. For this standard graded bundle `E_b`, the graded automorphism group scheme is the constant curve group `J_b×X_S`; a form of `E_b` has the corresponding twisted automorphism group.

*Supplied construction.* Use the tensor-compatible HN graded category, keeping the bundle slope sign. Identify its automorphism group from the slope-centralizer of the isocrystal.

*Remark.* Weights refer to bundle slopes, not the original isocrystal slopes.

The API:

- `HNGraded.forget`: Forget grading to `Bun_G`.
- `HNGraded.ofClass`: `E_b` has its canonical Q-grading from the isocrystal, with slope reversal.
- `HNGraded.automorphisms`: At a geometric point, graded automorphisms of `E_b^gr` are `J_b(E)`. Over `S`, the automorphism v-sheaf is the constant locally profinite group sheaf `J_b(E)`, with sections given by continuous maps `|S|→J_b(E)`.
- `HNGraded.classifying`: `Bun_G^(HN-split)≃∐_(b∈B(G))[*/J_b(E)]`. This equivalence uses HNGradedClassification.

**Checks.**

- For `O⊕O(1)`, graded automorphisms are `E××E×`.
- For a basic object no positive grading-changing kernel occurs.
- For `O⊕O(1)`, ungraded automorphisms also contain `BC(O(1))`, which grading removes.

Source: [FS](#ref-fs), Proposition III.4.7 pp. 102–103.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.3 Moduli v-stack Bun_G](#bun-g-as-v-stack); [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting).

<a id="hn-graded-classification"></a>

### 3.2 Classification of HN-graded bundles

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

The natural map `∐_b[*/J_b(E)]→Bun_G^(HN-split)` is an equivalence. The graded fibre is locally isomorphic to `E_b^gr` and its `Isom` torsor is a J_b-bundle geometrically trivial at the chosen point; openness and locally profinite torsor triviality make it locally constant.

*Supplier proof route.* Use local constancy of the filtration type and relative HN graded semistability. Apply the trivial-locus theorem to the `J_b Isom` torsor. Descend the local objects with their graded automorphisms.

*Remark.* This is an equivalence of graded groupoids, stronger than geometric point classification.

Source: [FS](#ref-fs), Proposition III.4.7 pp. 102–103.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§3.1 HN-graded `G`-bundles](#hn-graded-g-bundles); [§2.8 Geometrically trivial open locus](#geometrically-trivial-locus); [§2.7 Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); VectorBundlesAndIsocrystals VB4 (slope-zero bundles and local systems); VectorBundlesAndIsocrystals VB4 (relative vanishing of positive-slope H¹).

<a id="filtered-automorphism-group-scheme"></a>

### 3.3 Filtered torsor automorphism group schemes

Define the rational-threshold API `FilteredAutomorphism` using HodgeTateAndCanonicalSubgroups §2.14, `TauCeti.HodgeTate.filteredFiberFunctor_split`, for the integer-filtered carrier, splitting torsor and parabolic/unipotent/Levi constructions. For a reductive `G/K`, scheme `X/K` and Q-filtered `G`-fibre functor `E`, let `H=Aut_G(E)`, its inner group over `X`. For `λ≥0`, `H^≥λ` consists of automorphisms whose difference from `1` raises every represented filtration by at least `λ`. Rational reindexing identifies `H^≥0` with the supplied parabolic and `H^>0` with its unipotent radical. The higher raising groups are smooth, `Lie H^≥λ=(ad E)^≥λ`, and for `λ>0` the quotient `H^≥λ/H^>λ` is the vector group `(ad E)^≥λ/(ad E)^>λ`.

Hypotheses: The underlying functor is an exact K-linear tensor fibre functor for finite rational representations of a reductive `G/K`, associated to a `G`-torsor on `X`. The descending `ℚ`-filtration is exhaustive, separated and locally has finitely many jumps on each representation; its steps are subbundles with locally free graded pieces, and it is exact and tensor-compatible. Splitting is asserted on affine open charts, followed by étale trivialization of the smooth underlying torsor; no global splitting over an arbitrary scheme is assumed.

*Construction.* On an affine chart, choose a tensor generator and clear its finitely many rational weight denominators as in [§0.2](#relative-tensor-torsors). Exact tensor generation extends the same denominator to all representations. Rescale to the supplied `ℤ`-filtered carrier, including a chosen threshold `λ` in the denominator. The underlying automorphism group is an inner form of reductive `G`, hence smooth. Zie15 Theorem `1.3/4.15` gives a section of the supplied splitting torsor on that affine chart. Trivialize the `G`-torsor étale locally; the supplied splitting/cocharacter dictionary then gives a rational cocharacter `D→G`. Transport the supplied parabolic and radical, and use root weights to represent the higher raising subgroups and identify their `Lie` algebras with the filtered adjoint subbundles. At `λ>0`, the map `g↦g−1` on associated gradeds is additive: the product error raises the filtration by `2λ>λ`. Zie15 Proposition 4.24 and Lemma 4.25 give the vector-group quotient after rescaling; its `Lie` bundle identifies it with `gr^λ(ad E)`. At `λ=0` retain the supplied reductive Levi quotient. Descend the higher subgroup schemes and their Lie/graded identifications along the étale charts, compatibly with arbitrary scheme pullback and independently of the denominator.

*Remark.* Subgroups of points over a field do not represent this relative group scheme. The splitting input is the affine one for smooth groups, not an fpqc-local splitting, and no global splitting on a non-affine `X` is asserted.

The API:

- `FilteredAutomorphism.raising_iff`: For every rational representation and `λ′, (γ−1)E^≥λ′⊂E^≥(λ′+λ)`.
- `FilteredAutomorphism.parabolic`: Rational reindexing identifies `H^≥0` with the supplied filtration-preserving parabolic.
- `FilteredAutomorphism.unipotent`: Rational reindexing identifies `H^>0` with the supplied unipotent radical.
- `FilteredAutomorphism.graded`: For `λ>0` the quotient is the stated additive vector group.
- `FilteredAutomorphism.pullback`: Scheme pullback commutes with `H`, its filtration and vector-group quotients.
- `FilteredAutomorphism.localSplit`: There is an affine open cover on which the filtered fibre functor splits; after an étale trivialization of its underlying torsor the splitting is a rational cocharacter `D→G`. This assertion is compatible with restriction and does not assert a global splitting on `X`.

**Checks.**

- For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
- For the trivial filtration `H^≥0=H` and `H^>0=1`.
- At `λ=0` the reductive Levi quotient is not generally an additive vector group.
- For `GL_2` with ordered basis of weights `0,3/2`, `H^≥0` is lower triangular and `H^>0` is its one-dimensional lower unipotent radical. `H^≥1/H^>1` is trivial, `H^≥(3/2)/H^>(3/2)` is `G_a`, and `H^≥2` is trivial. Clearing denominator `2` preserves these thresholds.
- On `P^1_K`, the Euler filtration `0→O(−1)→O^2→O(1)→0` defines a filtered `GL_2` fibre functor with smooth underlying group, but no global splitting: `O^2` is not `O(−1)⊕O(1)`. It splits on affine opens. Thus the affine hypothesis cannot be dropped.

Source: [FS](#ref-fs), Proposition III.5.2 p. 105; [Zie15](#ref-zie15), Theorem 1.3 p. 2; §4.3, Theorems 4.14–4.16 pp. 24–25 and Proposition 4.24/Lemma 4.25/Theorem 4.26 pp. 26–27.

*Needs:* HodgeTateAndCanonicalSubgroups §2.14 (`TauCeti.HodgeTate.filteredFiberFunctor_split`); [§0.7 Pure inner twisting of torsors](#pure-inner-twisting); [§0.2 Relative tensor torsors and filtered automorphism groups](#relative-tensor-torsors); ReductiveGroups Layer 7 (structure theory); ReductiveGroups Layer 1 (representations and comodules); Tau Ceti `Cocharacter.parabolic`, `Cocharacter.leviGroupExtension`, `FGPointRepresentationCat`, `FGPointRepresentationCat.instRigidCategory`.

<a id="full-automorphism-v-group"></a>

### 3.4 Full bundle automorphism v-group

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunAutomorphisms`.

Use the supplied `FullAutomorphism`. For `b, J̃_b(S)=Aut_(X_S)(E_b)`. Every automorphism preserves HN; its action on the associated graded gives a split exact sequence `1→J̃_b^>0→J̃_b→J_b(E)→1`, with `J̃_b=J̃_b^>0⋊J_b(E)`. For positive bundle slope `λ` the graded quotient is `BC((ad E_b)^λ)`; it corresponds to the isocrystal slope `−λ`. The connected kernel is generally nonzero for nonbasic `b`.

*Supplied construction.* Take global sections of the filtered relative automorphism group. Use `H^1` vanishing of positive bundle pieces to make the quotient maps surjective. The canonical graded isocrystal action splits the projection; identify `π_0` with `J_b(E)`.

*Remark.* The `GL_2 O⊕O(1)` kernel is `BC(O(1))`.

The API:

- `FullAutomorphism.projection`: Return the action on the HN graded object in `J_b(E)`.
- `FullAutomorphism.section`: The isocrystal automorphism action splits the projection.
- `FullAutomorphism.kernel`: Kernel consists of strictly HN-raising automorphisms.
- `FullAutomorphism.graded`: For `λ>0`, the filtration quotient is `BC` of the bundle-slope `λ` adjoint piece.
- `FullAutomorphism.semidirect`: Identify `J̃_b` with its positive kernel semidirect `J_b(E)`.

**Checks.**

- With column vectors ordered as `O, O(1), Aut(O⊕O(1))` consists of matrices `[[a,0],[s,d]]`, where `a,d∈E×` and `s∈BC(O(1))`; the upper-right entry vanishes because `H⁰(O(−1))=0`.
- For basic `b` all adjoint slopes are `0`, so the positive kernel is trivial.
- For the nonbasic example `J_b(E)=E××E×` alone misses the lower-left sections; diagonal conjugation multiplies `s` by `d/a`.

Source: [FS](#ref-fs), Proposition III.5.1 pp. 104–105.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§3.2 Classification of HN-graded bundles](#hn-graded-classification); [§3.3 Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [§1.13 Algebraic sigma-centralizer](#sigma-centralizer-J-b); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); VectorBundlesAndIsocrystals VB4 (slope-zero bundles and local systems); VectorBundlesAndIsocrystals VB4 (relative vanishing of positive-slope H¹); DiamondsAndVStacks §D5.12 (maps representable in locally spatial diamonds).

<a id="positive-automorphism-kernel"></a>

### 3.5 Positive automorphism kernel geometry

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunAutomorphisms`.

`J̃_b^>0` is a successive extension of positive Banach–Colmez spaces, represented by a locally spatial diamond. For `ℓ≠p` it is cohomologically smooth of dimension `sum_(λ>0)` λ·rank((ad `E_b)^λ)=⟨2ρ,ν_b⟩`. Its connectedness identifies `π_0 J̃_b=J_b(E)`. All dimensions use the isocrystal dominant `ν_b` with the slope reversal already incorporated.

The connectedness of the positive kernel and the passage from the linear Banach–Colmez statements of VectorBundlesAndIsocrystals VB3 to the filtered reductive extension tower are part of the supplier contract.

*Supplier proof route.* Induct over the finite positive filtration and use `BC` positive-slope smoothness, connectedness and `H^1` vanishing. Apply additivity of `ℓ`-dimension to the extension tower. Compute the positive adjoint root weights as the `2ρ` pairing.

*Remark.* For `O⊕O(1)`, the kernel dimension is `1`; its quotient classifying stack has dimension−1.

Source: [FS](#ref-fs), Proposition III.5.1 pp. 104–105.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§3.4 Full bundle automorphism v-group](#full-automorphism-v-group); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); VectorBundlesAndIsocrystals VB3 (dimension in the positive range); DiamondsAndVStacks §D5.12 (maps representable in locally spatial diamonds).

<a id="quasi-split-opposite-parabolic"></a>

### 3.6 Quasi-split opposite-parabolic automorphisms

For quasi-split `G` and a dominant rational `ν_b, M_b=Z_G(ν_b), P_b^−` is the parabolic with nonpositive `ν_b` weights. The curve group `Q=E_(b_M)×^(M_b)P_b^−` has `J̃_b(S)=Q(X_S)` and positive kernel `Γ(X_S,R_uQ)`. The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.

*Proof outline.* Use the rational Newton representative to put `b` in its Levi. Identify the HN-preserving inner parabolic with the twist of `P_b^−`. Take curve sections and compare its unipotent root bundles with the positive HN pieces.

*Remark.* For `GL_2` and column vectors ordered as `O, O(1)`, the positive section is the lower-left `O(1)` entry. Reversing the summand order puts it above the diagonal; the bundle slopes are `(0,1)`, whereas the isocrystal slopes before dominant reordering are `(0,−1)`.

Source: [FS](#ref-fs), III.5.1.1 pp. 105–106.

*Needs:* [§3.4 Full bundle automorphism v-group](#full-automorphism-v-group); [§1.34 Rational Newton representative](#rational-newton-witness); ReductiveGroups Layer 7 (structure theory); VectorBundlesAndIsocrystals VB1 (the exact tensor isocrystal-to-bundle functor).

<a id="semistable-locus-and-basic-strata"></a>

### 3.7 Semistable locus and basic strata

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunNewtonGeometry`.

Use the supplied `Semistable`. Bun_G^ss is the full substack where every geometric fibre has central Newton morphism. It is open; `κ` decomposes it into open and closed basic strata and Bun_G^ss≃∐_(b basic)[*/J_b(E)]. Each basic stratum is neutralized by its chosen `E_b`; the locally profinite topology on `J_b(E)` is retained.

*Supplied construction.* Centrality is a minimality condition and hence an open HN locus. Use the basic `κ` bijection to decompose it into its discrete classes. Apply basic inner twisting to the geometrically trivial locus in `Bun_(J_b)`.

*Remark.* Basic does not imply isomorphism to the trivial `G`-bundle.

The API:

- `Semistable.mem_iff`: Every geometric Newton class is basic.
- `Semistable.openImmersion`: The inclusion `Bun_G^ss→Bun_G` is open.
- `Semistable.basicDecomposition`: Decompose as the disjoint union of basic rational-point classifying stacks.
- `Semistable.component`: The `κ` index identifies the basic summand.

**Checks.**

- The bundle of the basic slope `1/2` block is semistable of bundle slope−1/2.
- For a torus `Bun_T` is entirely semistable.
- `O⊕O(1)` is not semistable.

Source: [FS](#ref-fs), Theorem III.4.5 p. 102.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§1.18 Basic sigma class](#basic-class); [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [§2.8 Geometrically trivial open locus](#geometrically-trivial-locus); [§1.19 Basic inner form equivalence](#basic-inner-form-bundle-equivalence).

<a id="torus-picard-stack"></a>

### 3.8 Torus bundle Picard stack

Define `TorusPicard`. For a torus `T, Bun_T` is a Picard stack fitting into `0→[*/T(E)]→Bun_T→X_*(T)_Γ→0`. Every `κ`-fibre is a T(E)-banded gerbe neutralized by a choice of representative `b` of its class. A multiplicative splitting exists when a group section of `T(L)→B(T)` is chosen, for example when `B(T)` is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.

*Construction.* Use contracted product of commuting torus torsors for the Picard operation. Identify the neutral fibre and other fibres by translation with `E_b`. A group section gives coherent multiplicative neutralizations; without it retain the extension.

*Remark.* A set-wise neutralization of each fibre is weaker than a Picard splitting.

The API:

- `TorusPicard.tensor`: Contracted product adds the `κ` classes.
- `TorusPicard.kottwitz`: `Bun_T→X_*(T)_Γ` is a Picard-stack morphism.
- `TorusPicard.fibre`: A chosen `b` of `κ=β` neutralizes the fibre as `[*/T(E)]`.
- `TorusPicard.splitOfSection`: A group section of `T(L)→B(T)` gives the Picard product decomposition.

**Checks.**

- Line bundles form `∐_(d∈Z)[*/E×]`, with tensor product adding degrees.
- The trivial torus has the terminal Picard stack.
- For the norm-one torus, the two `κ` fibres do not by themselves specify a canonical multiplicative splitting.

Source: [FS](#ref-fs), Example III.4.6 p. 102.

*Needs:* [§3.7 Semistable locus and basic strata](#semistable-locus-and-basic-strata); [§1.36 Torus norm and Newton average](#torus-norm-description); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="stratum-is-classifying-stack"></a>

### 3.9 Full classifying-stack description of a stratum

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunAutomorphisms`.

For every `b, Bun_G^b` is the locally closed full substack of bundles geometrically isomorphic to `E_b` and `Bun_G^b≃[*/J̃_b]`. The map to `[*/J_b(E)]` has the canonical section induced by the semidirect splitting. For basic `b` the kernel vanishes; for nonbasic `b` it must be retained.

*Supplier proof route.* Constant HN type gives a relative filtered tensor functor. Use the graded classification to trivialize its graded `Isom` torsor locally. Positive filtered `H^1` vanishing lifts a graded isomorphism to a filtered one. Thus *`→Bun_G^b` is a v-surjection whose relation is exactly `J̃_b`.

*Remark.* A positive-dimensional stabilizer changes both the stratum geometry and its dimension.

Source: [FS](#ref-fs), Proposition III.5.3 p. 106.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [§3.4 Full bundle automorphism v-group](#full-automorphism-v-group); [§3.2 Classification of HN-graded bundles](#hn-graded-classification); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="automorphism-torsor-reduction"></a>

### 3.10 Reduction of full automorphism torsors

Over affinoid perfectoid `S`, every J̃_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from `H^1_v` vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.

*Proof outline.* Reduce successive positive extensions using affinoid `v-H^1` vanishing. Apply perfectoid representability of locally profinite torsors.

*Remark.* Different reductions can have positive-kernel automorphisms; they are not identified.

Source: [FS](#ref-fs), Remark III.5.4 p. 106.

*Needs:* [§3.4 Full bundle automorphism v-group](#full-automorphism-v-group); [§2.7 Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals VB4 (slope-zero bundles and local systems).

<a id="stratum-dimension"></a>

### 3.11 Cohomological dimension of Newton strata

For `ℓ≠p, Bun_G^b` is a cohomologically smooth Artin v-stack of `ℓ`-dimension `−⟨2ρ,ν_b⟩`. The fibre over `[*/J_b(E)]` has the smooth cover * of relative dimension `⟨2ρ,ν_b⟩`; the rational-point classifying stack has dimension `0`.

*Proof outline.* Use the full kernel and its positive `BC` filtration to compute the dimension of the relative classifying stack. Add the dimension `0` of `[*/J_b(E)]`, from [§0.9](#locally-profinite-classifying), applied to a faithful closed embedding of `J_b(E)`.

*Remark.* The `O⊕O(1)` stratum has dimension−1 despite its algebraic `J_b` being a torus.

Source: [FS](#ref-fs), Proposition IV.1.22 p. 113.

*Needs:* [§0.9 Locally profinite classifying stacks](#locally-profinite-classifying); [§3.9 Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [§3.5 Positive automorphism kernel geometry](#positive-automorphism-kernel); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

<a id="flag-newton-strata"></a>

### 3.12 Newton strata of a minuscule flag variety

Use `FlagNewton` as the adapter to IgusaVarietiesAndTorsionConcentration §IG.3.4, `flagNewtonClass` and `flagNewtonStratum`. For `G/Q_p`, minuscule GS label `μ` and its reflex field `E_μ`, let `Fℓ^GS_(G,μ)` be the adic/diamond flag variety and `E(x)` the modification of the trivial `G`-bundle at the untilt. Define `Fℓ_(G,μ)^b` as its fibre over `Bun_G^b`. The supplied point map is independent of algebraically closed residue-field extension and is constant along rank-one generalization. Use Igusa’s CS label `η=(−μ)^dom`; its bound `B(G,{η⁻¹})` is `B(G,{μ})`. The image equality uses §2.22.

*Supplier contract and adapter.* Use Igusa §IG.3.4’s strata, base-change and rank-one generalization APIs on the GS minuscule cell via the label conversion. Identify its Newton order with §1.21: upper unions are closed in this order. The supplier’s name `flagNewtonClass_lowerSemicontinuous` uses the source terminology; the closed-upper-union assertion fixes the orientation here.

*Remark.* The strata are defined on the flag variety itself, through the minuscule identification of GeometricSatakeAndFusion GS0.

The API:

- `FlagNewton.classAt`: Map a flag point to its bundle sigma class.
- `FlagNewton.stratum`: Take the locally closed fibre over `Bun_G^b`.
- `FlagNewton.upperUnion`: For `b` define the union over `b′≥b`.
- `FlagNewton.acceptableImage`: The image equals `B(G,{μ})` in GS indexing, or `B(G,{η⁻¹})` for its CS label `η`.
- `FlagNewton.baseChange`: Pullback along algebraically closed field extension preserves class and strata.

**Checks.**

- For split `GL_2` and GS `μ=(1,0)`, the ordinary stratum has slopes `(1,0)` and the basic stratum slopes `(1/2,1/2)`; both have `κ=1`.
- A central minuscule `μ` gives a zero-dimensional flag variety with its single acceptable class.
- For CS label `η=(1,0)`, the GS label is `(0,−1)` and the strata have ordinary slopes `(0,−1)` and basic slopes `(−1/2,−1/2)`, with `κ=−1`. Identifying the two labels without conversion reverses `κ`.

Source: [CS17](#ref-cs17), Definition 3.5.6 pp. 689–690.

*Needs:* IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5; [§2.22 Minuscule modification image](#minuscule-modification-image); [§3.9 Full classifying-stack description of a stratum](#stratum-is-classifying-stack); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness); DiamondsAndVStacks Layer 4 (diamonds, small v-stacks, underlying spaces).

<a id="flag-strata-semicontinuity"></a>

### 3.13 Closed upper flag Newton unions

The flag Newton strata are locally closed and partially proper, their upper unions `Fℓ^≥b` are closed, and the basic stratum is open. The bundle HN polygon is upper semicontinuous under specialization, with `κ=μ♯` for the GS label, equivalently `κ=(η⁻¹)♯` for Igusa’s CS label. CS17, Proposition 3.5.7, prints “lower semicontinuous”; with the order on `B(G)` fixed above the correct statement is upper semicontinuity with closed upper unions (see the source corrections).

*Supplier contract.* IgusaVarietiesAndTorsionConcentration §IG.3.4 supplies the locally closed strata, partial properness and closed upper unions. Transport the cocharacter label by §3.12 and the order by §1.21; no second stratification is constructed.

*Remark.* No general dimension formula is asserted for every reductive minuscule flag datum.

Source: [CS17](#ref-cs17), Proposition 3.5.7 and Corollary 3.5.9 pp. 689–690.

*Needs:* IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5; [§3.12 Newton strata of a minuscule flag variety](#flag-newton-strata); [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); [§1.33 Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); DiamondsAndVStacks Layer 4 (diamonds, small v-stacks, underlying spaces).

<a id="unitary-flag-stratum-dimension"></a>

### 3.14 Unitary flag Newton dimensions

For the CS24 Section 2.1 quasi-split unitary similitude datum on `F^(2n)` with its standard skew-hermitian form, self-dual O_F-lattice and signatures(n,n), at `p` unramified in `F`, let `d=n²[F⁺:ℚ]`. Its flag strata have Krull dimension `d−d_b`, where `d_b=⟨2ρ,ν_b⟩` is the dimension of the corresponding Igusa variety in IgusaVarietiesAndTorsionConcentration IG.0. This is the specific unitary dimension statement of Theorem 2.7.3, not a general dimension formula deduced solely from upper semicontinuity.

*Supplier contract and adapter.* IgusaVarietiesAndTorsionConcentration §IG.3.5 supplies this unitary dimension theorem, including the local period-fibre and central-leaf comparisons, with the unitary datum of §IG.0.3. If `η` is its CS cocharacter, use GS label `μ=(−η)^dom`. Its bundle class `b` is unchanged, so `d_b=⟨2ρ,ν_b⟩` and the Krull dimension `d−d_b` are unchanged. This does not assert a dimension formula for all reductive minuscule flag data.

*Remark.* The dimensions concern `|Fℓ^b|`, not the negative `ℓ`-dimension of `Bun_G^b`.

**Checks.**

- In this unitary datum the ordinary class has `d_b=d`, so its flag locus has dimension `0`.
- A basic class has `d_b=0`, giving the open flag stratum of dimension `d`.
- The formula compares Krull dimensions on the flag with `dim_ℓ Bun_G^b=−d_b`; these are distinct dimension functions.

Source: [CS24](#ref-cs24), Section 2.1 pp. 11–12 and Theorem 2.7.3 p. 33.

*Needs:* IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5; [§3.13 Closed upper flag Newton unions](#flag-strata-semicontinuity); [§3.11 Cohomological dimension of Newton strata](#stratum-dimension); IgusaVarietiesAndTorsionConcentration Layer IG.0 (the unitary similitude datum, §IG.0.3, its Newton stratification, §IG.0.12, and the central-leaf and Igusa dimensions, §§IG.0.25 and IG.1.4a); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness).

<a id="unitary-ordinary-flag-locus"></a>

### 3.15 Unitary ordinary flag locus

In the unramified quasi-split unitary similitude datum of [§3.14](#unitary-flag-stratum-dimension), the reflex field is `ℚ` and the largest acceptable element is ordinary. Its flag stratum is `Fℓ(ℚ_p)`, the constant locally profinite diamond of rational points; hence its Krull dimension is `0`. The supplied equality includes every unramified `p` in this datum; CGH20’s completely split case alone does not supply that range.

*Supplier contract and adapter.* IgusaVarietiesAndTorsionConcentration §IG.3.5 supplies the whole-sub-v-sheaf equality with `Fℓ(ℚ_p)` for this unramified unitary datum, including the closed PEL flag and Hodge–Tate compatibility. Transport the flags through the CS-to-GS convention of §3.14. The largest acceptable class, rational-point locus and dimension `0` agree under this identification.

*Remark.* The corresponding basic flag stratum is the open one; ordinary is the maximum index, not the basic index.

**Checks.**

- For the balanced rank-two split unitary case with `F⁺=ℚ`, the ordinary flag locus is the rational-point locus on the flag line.
- A balanced inert unramified prime is included; the rational-point equality is not restricted to completely split primes.
- The basic flag stratum is open while the ordinary rational-point locus is the maximum-index stratum, closed of dimension `0`.

Source: [CS24](#ref-cs24), after Theorem 2.7.3, p. 33; [Wed99](#ref-wed99), Theorem 1.6.3, pp. 584–585, §§2.3.1–2.3.2, pp. 588–589; [CGH20](#ref-cgh20), arXiv v2, Proposition 3.3.2, pp. 30–31; [Sch15](#ref-sch15), Lemma 3.3.6 and Remark 3.3.7, pp. 1006–1007, Lemmas 3.3.15 and 3.3.19, pp. 1011, 1013.

*Needs:* IgusaVarietiesAndTorsionConcentration §§IG.3.4–IG.3.5; [§3.14 Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [§1.26 Ordinary Newton class](#ordinary-class); IgusaVarietiesAndTorsionConcentration Layer IG.0 (the unitary similitude datum, §IG.0.3, its Newton stratification, §IG.0.12, and the central-leaf and Igusa dimensions, §§IG.0.25 and IG.1.4a); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem); DiamondsAndVStacks Layer 4 (diamonds, small v-stacks, underlying spaces).

<a id="isom-sheaf-representability"></a>

### 3.16 Locally spatial Isom diagonal

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunGeometry`.

For `G`-bundles E1,E2 over `X_S`, Isom_G(E1,E2) is a locally spatial diamond over `S`. For vector bundles the surjection locus and isomorphism locus are open subdiamonds of BC(E1∨⊗E2). For general reductive `G`, a Chevalley faithful representation with its stabilizer line presents `Isom_G` as finite closed compatibility conditions inside products of these linear `Isom` diamonds.

*Supplier proof route.* For a linear map the support of the cokernel is closed and has closed image in `S`; surjectivity is its open complement. Isomorphisms require both a map and its dual to be surjective. Apply the actual rational Chevalley stabilizer presentation and stability of locally spatial diamonds under finite limits.

*Remark.* The faithful representation includes its defining tensor constraints; arbitrary `GL_n` isomorphisms need not preserve `G`.

Source: [FS](#ref-fs), Lemma IV.1.20 and proof of IV.1.19 pp. 112–113.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.3 Moduli v-stack Bun_G](#bun-g-as-v-stack); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); ReductiveGroups Layer 7 (structure theory); ReductiveGroups Layer 1 (representations and comodules); DiamondsAndVStacks Layer 4 (diamonds, small v-stacks, underlying spaces); DiamondsAndVStacks §D5.12 (maps representable in locally spatial diamonds).

<a id="bun-g-is-smooth-artin"></a>

### 3.17 Cohomological smoothness of Bun_G

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

For `ℓ≠p`, `Bun_G` is an `ℓ`-cohomologically smooth Artin v-stack of `ℓ`-dimension `0`. The disjoint union over Galois cocharacter orbits of `[G(E)\Gr_(G,μbar)]` maps to `Bun_G` by a separated cohomologically smooth surjection. These are open Schubert cells, not their generally singular closures.

*Supplier proof route.* The diagonal is locally spatial by the `Isom` theorem. After an untilt, each fibre is the open locus of fixed-relative-position modifications that are geometrically trivial. Use GS0 open-cell cohomological smoothness, and independent BL uniformization for surjectivity. The source quotient is smooth over `[*/G(E)]` with dimension `⟨2ρ,μ⟩`, and the map has the same relative dimension; subtract them to obtain dimension `0`. Artin descent and separatedness use VStackSheavesAndLisseCategories VS0, and the locally profinite classifying-stack charts use [§0.9](#locally-profinite-classifying); no Satake equivalence, Jacobian criterion or sheaf category on `Bun_G` is used.

*Remark.* For infinite locally profinite `G(E)`, `*→[*/G(E)]` is not used as a cohomologically smooth atlas.

Source: [FS](#ref-fs), Theorem IV.1.19 pp. 112–113.

*Needs:* [§0.9 Locally profinite classifying stacks](#locally-profinite-classifying); VStackSheavesAndLisseCategories §VS4.0; [§2.4 Smallness of Bun_G](#bun-g-smallness); [§2.12 Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [§2.8 Geometrically trivial open locus](#geometrically-trivial-locus); [§3.16 Locally spatial Isom diagonal](#isom-sheaf-representability); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

<a id="connected-components"></a>

### 3.18 Connected components of Bun_G

`κ` induces `π_0(Bun_G)≅π_1(G)_Γ`. Every nonempty open substack contains a basic point: restrict to a finite `T_0` Newton region, take an open point, and compare the whole-stack dimension `0` with the stratum dimension `−⟨2ρ,ν_b⟩` to force central `ν_b`.

*Proof outline.* Use the finite `T_0` open-point lemma with the discrete `κ` coordinate. An open stratum has the ambient dimension `0`, so its positive-root pairing vanishes and `b` is basic. The basic `κ` bijection makes each fibre connected; two disjoint nonempty open pieces would each have to contain its unique basic point.

*Remark.* Torsion components such as split `PGL_n’s Z/n` are included.

Source: [FS](#ref-fs), Corollary IV.1.23 and Lemma IV.1.24 pp. 113–114.

*Needs:* [§2.15 Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [§3.17 Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [§3.11 Cohomological dimension of Newton strata](#stratum-dimension); [§3.7 Semistable locus and basic strata](#semistable-locus-and-basic-strata); [§1.11 Kottwitz classification by both invariants](#classification-by-two-invariants); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

### Examples

- For `G = GL_2` and `E_b = O ⊕ O(1)`, the full automorphism group is `(E^× × E^×)` ⋉ `BC(O(1))`, the stratum is `[*/J̃_b]` of dimension `−1`, and `Bun_G` has dimension `0` at the basic point.
- For the minuscule flag variety P¹ of `GL_2` with `μ = (1, 0)`, for `E = ℚ_p` the basic stratum is Drinfeld's upper half plane `Ω =` P¹ ∖ P¹(ℚ_p) and the ordinary stratum is P¹(ℚ_p).

### Dependencies

Layers 0–2; VectorBundlesAndIsocrystals VB3–VB4; DiamondsAndVStacks Layers 3–5; VStackSheavesAndLisseCategories VS0; GeometricSatakeAndFusion GS0; IgusaVarietiesAndTorsionConcentration IG.0 for the unitary targets.

## Layer 4: filtered charts and specialization

Use the filtered chart `M_b`, its negative Banach–Colmez tower, split section, contraction and smooth map to `Bun_G` from VStackSheavesAndLisseCategories §VS4.0, `BunCharts`. Identify its open image with the Newton-order down-set of `b` using §2.20, and compute the rank-two extension chart.

<a id="filtered-bundle-chart"></a>

### 4.1 Opposite filtered-bundle chart

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

Use the supplied `FilteredChart`. `M(S)` consists of `G`-bundles `E` on `X_S` with an increasing, separated and exhaustive `ℚ`-filtration on every rational representation, exact and tensor-compatible, whose weight-λ graded piece is semistable of bundle slope `λ`. This is opposite to the decreasing HN filtration. The associated graded map to Bun_G^(HN-split) decomposes `M=∐_b M_b` and gives `q_b:M_b→[*/J_b(E)]` and `π_b:M_b→Bun_G`.

*Supplied construction.* Form filtered tensor objects with coherent pullback; v-descent follows from bundle/filtration descent. Take the semistable graded condition and use the graded classification to define the components.

*Remark.* The `GL_n` graded slopes increase with filtration index.

The API:

- `FilteredChart.graded`: `q_b` records the graded J_b(E)-torsor.
- `FilteredChart.forget`: `π_b` forgets the filtration.
- `FilteredChart.split`: A graded object gives the split filtered chart section.
- `FilteredChart.pullback`: Pullback preserves filtration subbundles, exactness and graded slopes.
- `FilteredChart.gradedFraming`: `M̃_b=M_b×_[*/J_b(E)]`* is the chart with a graded trivialization.

**Checks.**

- For graded `O` and `O(1)`, objects are `0→O→E→O(1)→0` and the framed chart is `BC(O(−1)[1])`.
- For basic `b` the adjoint Newton slopes are all zero, the opposite unipotent group is trivial, and `M_b=[*/J_b(E)]`. For `G=G_m×G_m`, a central Newton vector `(0,1)` is basic although the direct sum of the two standard characters has two slopes.
- The HN filtration of `O⊕O(1)` begins with `O(1)`; the chart extension filtration begins with `O`.

Source: [FS](#ref-fs), Definition V.3.2 and Example V.3.3 pp. 173–174.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§2.3 Moduli v-stack Bun_G](#bun-g-as-v-stack); [§3.2 Classification of HN-graded bundles](#hn-graded-classification); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); DiamondsAndVStacks Layer 3 (effective descent and morphisms of stacks).

<a id="quasi-split-parabolic-chart"></a>

### 4.2 Quasi-split parabolic chart

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

For quasi-split `G` and a rational dominant Newton representative, let `M_b=Z_G(ν_b)` and `P_b` be its parabolic with nonnegative `ν_b` weights. Then `M_b(chart)=Bun_(P_b)×_(Bun_(M_b))Bun_(M_b)^(b_M)`, with the Levi basic summand identified as `[*/J_b(E)]`. Use the source’s positive Newton parabolic; it is opposite to the curve-HN automorphism parabolic.

*Supplier proof route.* A filtered fibre functor of the fixed type is the corresponding `P_b` reduction. The graded semistable condition is precisely the basic Levi bundle condition. Transport the diagram through the rational cocharacter filtration dictionary.

*Remark.* For a nonsplit inner form this particular rational parabolic presentation is not asserted.

Source: [FS](#ref-fs), Example V.3.4 p. 174.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.1 Opposite filtered-bundle chart](#filtered-bundle-chart); [§1.34 Rational Newton representative](#rational-newton-witness); [§3.7 Semistable locus and basic strata](#semistable-locus-and-basic-strata); ReductiveGroups Layer 7 (structure theory).

<a id="chart-over-classifying-stack"></a>

### 4.3 Negative Banach–Colmez tower of a chart

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

`q_b:M_b→[*/J_b(E)]` is partially proper, representable in locally spatial diamonds, and `ℓ`-cohomologically smooth of relative dimension `⟨2ρ,ν_b⟩` for `ℓ≠p`. After graded framing it is a successive torsor under negative Banach–Colmez v-sheaves, namely `H^1` of the negative curve-slope pieces of the opposite unipotent group. The framed v-sheaf itself is not an absolute diamond; its punctured complement is locally spatial, and the representability assertion is relative.

*Supplier proof route.* The framed chart is the `H^<0` torsor moduli on the curve. Filter `H^<0` by its negative vector-bundle quotients, giving the `H^1` extension tower. Use the partial properness, representability and smoothness of families of Banach–Colmez spaces (VectorBundlesAndIsocrystals VB3) and add dimensions.

*Remark.* Absolute `M̃_b` need not be a diamond even though `M̃_b→`* is representable in locally spatial diamonds.

Source: [FS](#ref-fs), Proposition V.3.5 p. 174.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.1 Opposite filtered-bundle chart](#filtered-bundle-chart); [§3.3 Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

<a id="section-and-spatial-complement"></a>

### 4.4 Split section and spatial chart complement

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

The split section `[*/J_b(E)]→M_b` is closed and is exactly the locus whose underlying bundle is geometrically `E_b`. Its framed preimage is the origin. The open complement `M̃_b°=M̃_b` minus {origin} is a spatial diamond. The unsplit extensions satisfy `[b′]≤[b]` and can be strictly smaller.

Passing from the linear properness and spatiality of VectorBundlesAndIsocrystals VB3 to the whole filtered reductive extension tower is part of the supplier contract.

*Supplier proof route.* An extension is Newton-bounded by its split graded object, so the equal-class locus is closed. There the opposite filtration and HN filtration are transverse, giving a graded splitting. At the first nonzero extension step, the punctured negative `BC` space is an absolute diamond; combine the finite tower and the properness argument to get spatiality.

*Remark.* For the `GL_2` example, the origin gives `O⊕O(1)`; nonzero extension gives the rank `2 O(1/2)` block.

Source: [FS](#ref-fs), Proposition V.3.6 pp. 175–176.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.3 Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [§3.2 Classification of HN-graded bundles](#hn-graded-classification); [§2.6 HN sign and semicontinuity](#hn-sign-and-semicontinuity); VectorBundlesAndIsocrystals VB3 (properness of projectivized Banach–Colmez spaces); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); DiamondsAndVStacks §D5.12 (maps representable in locally spatial diamonds).

<a id="contracting-chart-action"></a>

### 4.5 Contracting chart action and proper quotient

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

For sufficiently divisible `N>0`, the central Newton morphism in `J_b` gives `U_π=ν_(b,J)^N(π)∈J_b(E)`. It contracts the framed extension tower to the origin. On `M̃_b°` the Z-action has the source’s escaping property and `M̃_b°/U_π^Z→`* is proper. This is ordinary properness, not merely partial properness.

*Supplier proof route.* Choose a finite descent coefficient field and an integral Newton multiple. At the first nonzero negative extension piece, `U_π` acts by a positive power of `π`; negative iterations escape each quasicompact open. Apply VectorBundlesAndIsocrystals VB3, “Quotients by contracting automorphisms”, and its properness of projectivized Banach–Colmez spaces to the tower; the escaping criterion for the `ℤ`-action and the properness of the quotient for the whole reductive tower (FS `V.3.6`) are supplied by `BunCharts` from those linear statements.

*Remark.* The quotient is proper only after removal of the fixed origin.

Source: [FS](#ref-fs), Proposition V.3.6 pp. 175–176.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.4 Split section and spatial chart complement](#section-and-spatial-complement); [§1.9 Decent representative](#decent-representative); [§1.17 Central Newton morphism of the centralizer](#central-newton-on-J); VectorBundlesAndIsocrystals VB3 (properness of projectivized Banach–Colmez spaces); VectorBundlesAndIsocrystals Layer VB4 (families, slope filtrations and local systems); DiamondsAndVStacks Layer 4 (diamonds, small v-stacks, underlying spaces); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces).

<a id="chart-jacobian-positivity"></a>

### 4.6 Positive tangent criterion for the filtered chart

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`.

After `S→Bun_G` corresponds to `E`, the fibre `M×_(Bun_G)S` is the open subfunctor of sections of `E×^GFl→X_S` having semistable graded pieces of their specified slopes. `Fl` is the disjoint union of projective filtration varieties. Along these sections its tangent bundle has a finite filtration with semistable positive-slope quotients, so the section lies in the cohomologically smooth locus of the Jacobian criterion (VStackSheavesAndLisseCategories §VS1.3).

*Supplier proof route.* Work componentwise on the projective filtration varieties. Their associated flag bundles admit the projective embeddings required by the Jacobian criterion. Identify rational tensor filtrations with sections of the flag scheme. Use semistable openness on each graded piece. Calculate tangent root weights and convert to positive bundle slopes. Apply the actual Jacobian section-space theorem, including its smooth quasi-projective curve scheme hypotheses.

*Remark.* Positivity of the tangent slopes is exactly the hypothesis of the Jacobian criterion.

Source: [FS](#ref-fs), Proof of Theorem V.3.7 p. 177.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.1 Opposite filtered-bundle chart](#filtered-bundle-chart); [§3.7 Semistable locus and basic strata](#semistable-locus-and-basic-strata); ReductiveGroups Layer 7 (structure theory); ReductiveGroups Layer 1 (representations and comodules); VStackSheavesAndLisseCategories §VS1.3 (Jacobian criterion); VectorBundlesAndIsocrystals VB4 (relative HN filtration and pro-étale splitting).

<a id="chart-to-bun-g"></a>

### 4.7 Smooth specialization neighborhoods

*Supplier contract:* VStackSheavesAndLisseCategories §VS4.0, `BunCharts`. Its identification with the Newton-order down-set uses the topology theorem of §2.20 here.

`π_b:M_b→Bun_G` is separated, partially proper, representable in locally spatial diamonds and `ℓ`-cohomologically smooth of relative dimension `⟨2ρ,ν_b⟩`. Its open image is exactly the points whose corresponding bundles specialize to `E_b`; in the fixed-κ order this is `{[b′]:[b′]≤[b]}`. The charts cover `Bun_G`, since every `b` lies in its own chart image.

*Supplier proof route.* Apply the section-space Jacobian criterion for representability, partial properness, separatedness and smoothness. Subtract `dim Bun_G=0` from `dim M_b` to compute relative dimension. The split section contains the b-stratum; openness of the image includes every generalization of `b`. The contracting action degenerates every chart point to the split section, proving the reverse inclusion. Apply the Newton topology theorem to identify the generalizations of `b` with the down-set `[b′]≤[b]` in its integral `κ` fibre; openness alone does not identify this set with the combinatorial order.

*Remark.* For `κ=1` in `GL_2`, the chart of slopes `1,0` contains its basic generalization `1/2,1/2`.

Source: [FS](#ref-fs), Theorem V.3.7 p. 177.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; [§4.6 Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [§4.3 Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [§4.5 Contracting chart action and proper quotient](#contracting-chart-action); [§3.17 Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [§2.20 Newton topology theorem in both characteristics](#newton-topology-homeomorphism); VStackSheavesAndLisseCategories §VS1.3 (Jacobian criterion); VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent); DiamondsAndVStacks §D5.12 (maps representable in locally spatial diamonds).

<a id="gl2-extension-chart"></a>

### 4.8 Rank-two extension chart

For graded bundle `O⊕O(1), M̃_b=BC(O(−1)[1])` parametrizes framed extensions `0→O→E→O(1)→0. E` is either split or the simple rank `2` slope `1/2` bundle. The fibres of `π_b` are open subspaces of (`BC(E)` minus `{0})/E×` of nowhere-vanishing sections giving the prescribed quotient.

*Proof outline.* Identify `Ext^1` with the negative `BC H^1` of `O(−1)`. Use the rank `2` bundle classification and determinant degree `1`. Describe a filtration by a nowhere-vanishing section, and use that saturation of a section is an open condition.

*Remark.* The split point has full positive automorphism kernel; the framed chart extension direction has negative slope.

Source: [FS](#ref-fs), Example V.3.1 p. 173.

*Needs:* [§4.7 Smooth specialization neighborhoods](#chart-to-bun-g); VectorBundlesAndIsocrystals VB3 (families of two-term Banach–Colmez spaces); VectorBundlesAndIsocrystals VB3 (properness of projectivized Banach–Colmez spaces); VectorBundlesAndIsocrystals VB2 classification (geometric classification of bundles); VectorBundlesAndIsocrystals Layer VB4 (families, slope filtrations and local systems).

### Examples

- For `G = GL_2` and `E_b = O ⊕ O(1)`, the framed chart of [§4.8](#gl2-extension-chart) is the negative Banach–Colmez space `BC(O(−1)[1])` of extensions `0 → O → ℰ → O(1) → 0`: its split point is `E_b` itself and every other point is the stable bundle `O(1/2)`, whose point in `|Bun_GL₂|` specializes to that of `E_b`.

### Dependencies

Layers 0–3; VectorBundlesAndIsocrystals VB3–VB4; VStackSheavesAndLisseCategories VS0 and §VS1.3; DiamondsAndVStacks Layers 4–5.

## Worked examples

These examples fix the conventions of the roadmap.

- *Twisted conjugacy.* For a group automorphism `σ`, `sigmaSetoid` records the existence of a twisted conjugator and `SigmaClass` is the quotient set; it forgets stabilizers. `SigmaCentralizer.points` keeps them as a subgroup: for `b = 1` it is the `σ`-fixed subgroup, and if moreover `σ = id` it is the whole group. Under `b ↦ g b σ(g)⁻¹` the stabilizer is transported by `h ↦ g h g⁻¹`.
- *Finite norms.* `N₀(b) = 1, N₁(b) = b` and `N₂(b) = b σ(b)`. The conjugation formula for `N_r` ends with `σ^r(g)⁻¹`, so a decency equation needs `r > 0`; in rank one, `b = π` gives `N_r(b) = π^r`, not `π^{r+1}`. `decencyEquation` records only the positive-period equation.
- *Rank one over the Witt vectors.* Over the fraction field of the Witt vectors of an algebraically closed field of characteristic `p`, valuation sends the class of `p^m` to `m`; it separates `1` from `p` and `p` from `p⁻¹`.
- *Numerical `GL_n` data.* `GLnSlopeData` requires decreasing rational slopes, an integral total `κ` and denominator divisibility of each slope multiplicity. Dominance fixes `κ` and compares initial partial sums; basic means constant slope; acceptability is dominance by the chosen bound and ordinarity attains it. The empty tuple has `κ = 0` and is basic and ordinary; no rank-one datum has slope `1/2`: its sole slope has integral total and denominator dividing its multiplicity `1`.
- *The slope protorus.* The coordinate Hopf algebra of `D` is `E[ℚ]`; the character of slope `q` sends the monomial of `n ∈ ℤ` to that of `nq`. At `q = 1/2` the generator indexed by `2` goes to the one indexed by `1`, and at `q = 0` everything goes to the unit; the half character differs from every integral one. A finite representation has finitely many weights and hence a common denominator.
- *Integral descent of `κ`.* For `KottwitzDescent.Data`, an equivariant homomorphism composed with integral cyclic coinvariants descends uniquely to `σ`-classes; for an abelian group, twisted conjugacy is exactly the quotient by the range of `τ − id`. `ComponentCoset` is the solution set of `τx − x = d`: it is a translate of the fixed subgroup when nonempty. For `τ = id` and `d = 0` it is all of `ℤ`; for `τ = −id` and `d = 2` it is `{−1}`, and for `d = 1` it is empty. The sign-action coinvariants keep the nonzero class of `1` and kill `2`: their integral quotient is `ℤ/2`, with no rationalization.

### Numerical slopes

Define `GLnSlopeData n` to record a function `Fin n → ℚ`,
antitone in the standard order, an integer `κ` equal to its sum, and the condition
that the reduced denominator of every slope divides its multiplicity. Its API
includes the projections `slopes`, `descending`, `kottwitz`, `total_eq` and
`denominatorMultiplicity`; these data classify the numerical polygons of
`GL_n`-isocrystals.

**Checks.**

- The slopes `(1/2, 1/2)` with `κ=1` satisfy all fields; a single slope `1/2`
  fails the multiplicity and integral-total conditions.
- The integral-total tuple `(1/3, 1/3, 1/3)` is allowed, with total `κ=1`
  and denominator `3` dividing multiplicity `3`; `(2/3, 1/3)` has
  integral total `1` but fails denominator divisibility; integral total alone is insufficient.
- The decreasing-order condition rejects `(0, 1)`, although its total and
  denominator conditions hold; rank zero has the empty tuple and forces `κ=0`.

Define `GLnSlopeData.dominance x y` by equal integral `κ` and the inequalities
between initial sums of lengths `0≤k≤n`. Prove `dominance_antisymm` for every
natural `n` and `x,y` with dominance in both directions: `x=y`. The API also includes
reflexivity, transitivity and the partial-sum criterion, with no rank restriction.

**Checks.**

- `(1/2, 1/2)` is below `(1, 0)`, and the reverse inequality fails at `k=1`.
- Slopes `(0)` and `(1)` are incomparable because their integral `κ` values are `0` and `1`.
- At rank zero dominance holds for the unique empty datum; at `k=n` its
  inequality is equality because the integral totals agree.

Define `GLnSlopeData.basic x` by equality of every pair of slopes. Its API
identifies positive-rank basic data with constant slope `κ/n`, while rank zero
is handled without division.

**Checks.**

- `(1/2, 1/2)` is basic, although its slope is nonzero.
- `(1, 0)` is not basic, even though both slopes are integral.
- Every rank-one datum is basic, and the rank-zero datum is basic by the empty
  universal quantifier.

Define `GLnSlopeData.acceptable x mu` as dominance by the numerical bound mu.
Its API is the dominance criterion, reflexivity at the bound and preservation
under equality of the bound. This numerical predicate records the split linear
inequalities; `Acceptable` in §1.23 retains the full reductive invariant theory.

**Checks.**

- Both `(1/2, 1/2)` and `(1, 0)` are acceptable for the bound `(1, 0)`.
- `(2, −1)` fails that bound at its first partial sum despite having `κ=1`.
- The zero datum is acceptable for the zero bound in every rank, including zero;
  changing the total `κ` makes acceptability fail.

Define `GLnSlopeData.ordinary x mu` as acceptability and equality of the entire
slope functions. Its API includes uniqueness at a fixed bound, equality of `κ`
and the implication to acceptability. In particular equality of total alone is
insufficient.

**Checks.**

- `(1, 0)` is ordinary for itself, and `(1/2, 1/2)` is acceptable but not ordinary
  for that bound.
- The basic datum `(1/2, 1/2)` is ordinary for its own bound: numerical
  ordinarity does not itself impose integral Hodge slopes.
- The empty datum is ordinary for the empty bound, with `κ=0`.

The explicit data `GLnSlopeData.half`, `GLnSlopeData.split` and
`GLnSlopeData.zero n` satisfy these conditions. Their API exposes their slope
values and `κ` values and the comparison and basicness tests above.

**Checks for `half`.**

- Both slopes are `1/2` and their sum is `1`, giving `κ=1`.
- Its denominator `2` divides multiplicity `2`; deleting one slope makes the datum
  invalid.
- It is basic and lies strictly below `split`.

**Checks for `split`.**

- Its first slope is `1` and its second is `0`, giving `κ=1`.
- It is not basic, and both reduced denominators are `1`.
- It is ordinary for itself and fails dominance by `half` at the first slope.

**Checks for `zero`.**

- Every slope is zero, the sum and `κ` are zero, and the denominator `1` divides
  each multiplicity.
- At rank zero it has no slope entries and its basicness and ordinarity still
  hold; no expression `κ/n` is used at this boundary.
- At positive rank the slope at index `0` distinguishes it from every nonzero constant
  basic datum, so basicness alone
  does not identify it with such a datum.

These are numerical consequences of Dieudonné–Manin and the order conventions
of [KMPS](#ref-kmps), §§1.1.1–1.1.5, pp.5–8, and [FS](#ref-fs), §III.2.2,
pp.90–91; VectorBundlesAndIsocrystals VB0 supplies the linear classification.
They accompany the general reductive targets of Layer 1.

### Algebraic conventions

`twistedConjugate σ g b` is `g b σ(g)⁻¹`. Its API consists of the unit action,
the composition law `twistedConjugate_comp` with later conjugator on the left,
and the inverse-action law. `sigmaSetoid σ` uses the existence of such a conjugator as its relation;
`SigmaClass` and `SigmaClass.mk` are its quotient and representative map, with
the quotient API of §0.6.

**Checks.**

- Acting by `1` fixes every `b`; for identity `σ` the action is ordinary conjugation.
- Acting first by `g` and then by `h` agrees with acting by `h g`;
  the inverse action uses `g⁻¹`. In the permutation group on three points,
  reversing that product fails.
- With identity `σ` in an abelian group, the setoid relates `b` and `c` exactly when
  `b=c`. Its quotient therefore retains every group element; with `b=1` its
  representative stabilizer is still the entire group.

`frobeniusNorm` has the API of the zero, successor and twisted-conjugate
formulas, and `decencyEquation` requires a strictly positive period together
with equality of that norm to the prescribed element, as in §1.9.

**Checks.**

- The empty norm is `1`, the one-factor norm is `b`, and the two-factor norm is
  `bσ(b)`; replacing the last by `b²` fails for nonfixed `b`.
- For fixed `b=π` each Frobenius iterate is `π`, so the `r`-factor norm is `π^r`,
  including `r=0`.
- The decency predicate is false at period zero, is `b=a` at period one, and at
  period two is `bσ(b)=a`; it asserts no Newton integrality.

`KottwitzDescent.cyclicRepresentation`, `Target` and `Data` have the integral
action, coinvariant and equivariance API of §1.8. `Data` consists of an actual
homomorphism and its Frobenius-equivariance equation, rather than a reductive
classification assumption.

**Checks.**

- The positive cyclic generator acts by `τ`, its inverse by `τ⁻¹` and the identity
  automorphism gives the trivial action on every integer power.
- The identity homomorphism on `Multiplicative A` with Frobenius `τ` supplies
  `Data`; a homomorphism that fails Frobenius equivariance cannot supply it.
- The target for identity `τ` is `A`. For sign `τ` on `ℤ` it is `ℤ/2`, so `1` survives
  while `2` vanishes; rational coinvariants would fail this test. The actual twisted-conjugacy quotient
  retains this distinction: `0` and `1` have different classes, while `2` and `0`
  have the same class.

For the Witt specialization the coefficient field is exactly
`FractionRing (WittVector p k)`, Frobenius on its units is induced by
`Units.mapEquiv` from Witt Frobenius, and the uniformizer is the nonzero field
element `p` as a unit. The normalized valuation identifies its twisted-conjugacy
classes with `ℤ`.

**Checks.**

- The uniformizer is fixed by arithmetic Frobenius, so its integer powers define
  the normalized representatives of the rank-one classification.
- On coefficients the Frobenius action agrees with the `p`-power action on the
  residue field, while fixing `p`; it is not the field map `x↦x^p` in characteristic
  zero.
- The quotient classes of `1, p` and `p⁻¹` have slopes `0, 1` and `−1` respectively;
  these classes are distinct, including when `p=2`.

These checks specialize the twisted-conjugacy convention of [FS](#ref-fs),
§III.2.2, pp.90–91; the Witt rank-one normal form uses Mathlib's
`WittVector.exists_frobenius_solution_fractionRing`. The slope-protorus
coordinate algebra `SlopeProtorus.coordinates` is the existing group algebra
`MonoidAlgebra E (Multiplicative ℚ)` bundled by `CommHopfAlgCat.of`, without a
finite-type assertion. Its generator `[0]` is `1`, its coproduct sends `[q]` to
`[q]⊗[q]`, and its antipode sends `[q]` to `[−q]`; imposing finite-type torus
hypotheses would exclude its rational character group. The character maps and
their three tests are in §1.4.

## Source corrections

The following corrections to the sources are used in the statements above. Each concerns the version cited in the References.

`1`. *Liu–Zhu, Remark 4.1(iii).* The de Rham tensor data there are indexed by representations of the quotient `G^c`, so they determine a class in `B(G^c)`. A class in `B(G)` needs additional lifting data, or the hypothesis `G = G^c` ([§2.23](#de-rham-quotient-group-class)).
`2`. *Gleason–Lim–Xu, proof of Lemma 3.16, equation `(3.23)`.* The valuation quotient of a torus `T` is `X_*(T)_I`, not `π₁(G)_I`: for split `SL_2, π₁(G) = 0` while the diagonal torus has valuation lattice `ℤ`, and `diag(p, p⁻¹)` lies in the kernel of the map to `π₁(G)` without lying in `T(O_L)`. Rational surjectivity of the Kottwitz map needs the separate theorem ([§1.41](#rational-kottwitz-surjectivity)).
`3`. *Caraiani–Scholze `2017`, Proposition `3.5.7(1)`.* With the order on `B(G)` fixed on `p. 677`, the Newton map is upper semicontinuous and the upper unions are closed, in agreement with their Corollary 3.5.9; the printed word “lower” is reversed ([§3.13](#flag-strata-semicontinuity)).
`4`. *Kisin–Madapusi–Shin, `(1.1.2.2)`.* The decency equation has exactly `r` factors `b, σ(b)`, …, `σ^{r−1}(b)`; with `r + 1` factors, `b = p` in rank one would give `p^{r+1}` on the left and `p^r` on the right ([§1.9](#decent-representative)).
`5`. *Kisin–Madapusi–Shin, Corollary `1.1.15`.* The cocharacter is moved by `W(G,T)`, where `T` is a maximal torus of `M`, as in Proposition 1.1.13; `W(M,T)` may be too small, and the quotient `N_G(M)/M` need not contain the required element. For `GL_3, M = GL_1 × GL_2, μ = (0, 1, 0)` and `b_M = diag(p, 1, 1)`, the quotient `N_G(M)/M` is trivial but an absolute Weyl transposition is needed ([§1.35](#minuscule-basic-levi-lift)).
`6`. *Kisin–Madapusi–Shin, §1.3.15.* The ordinary class is unique when it exists and exists for quasi-split groups; for a general inner form its existence is an extra hypothesis. For `D^×` with `D` a quaternion division algebra, `b ↦ bΠ (Π² = p)` identifies `B(D^×)` with `B(GL_2)` shifting both slopes by `1/2`, and the ordinary slopes `(0, −1)` would become `(1/2, −1/2)`, each with multiplicity one, which violates the denominator condition, so `D^×` has no ordinary class for this `μ` ([§1.26](#ordinary-class)).
`7`. *Kisin–Zhou, §2.2.3.* Dominance in the rational cocharacter space uses positive coroots, not positive roots ([§1.5](#newton-orbit-space)).
`8`. *Hamacher–Kim, proof of Lemma 2.9 (arXiv v5).* The bound on the minimal effective over-lattice must include the Frobenius denominator `d` of the chosen lattice: for rank `h` it lies in `π^{−d(h−1)}M₀` (Zink, Lemma `9`). A rank-two slope-zero shear with coefficient `π^{−N}` shows that no bound depending on the Newton polygon alone exists ([§2.17](#isocrystal-family-v-descent)).
`9`. *Hamacher–Kim, proof of Theorem 2.11 (arXiv v5).* A local section of the ambient GL(H)-action does not give a lift preserving the defining tensor line. The smooth-orbit argument retains both `Aut_Φ(V₀)` and `Aut_Φ(L₀)`, whose pair stabilizer is `J_b`, as in [§2.17](#isocrystal-family-v-descent).
`10`. *Kisin–Zhou, §2.2.2.* The `σ`-conjugacy class of `w` is `{u⁻¹ w σ(u)}` with `u` varying; the printed formula lets the last factor depend on the fixed element. For `w = 1` and `σ = id` in a nontrivial Weyl group the printed set is the whole group, while the class of the identity is a point ([§1.10](#straight-weyl-classification)).

## Downstream consumers

IgusaVarietiesAndTorsionConcentration supplies the flag and mixed-characteristic bundle interfaces listed above. RelativeFarguesFontaine §7.0 supplies the tensor–torsor dictionary, and VStackSheavesAndLisseCategories §VS4.0 supplies the bundle, stratum, automorphism and chart geometry. This roadmap develops the general arithmetic classification and Newton-order comparisons on those carriers. EndoscopicTransferAndUnitaryTraceComparison supplies the local cohomological inputs and has the compatible specializations of the invariant theory listed above. Downstream, the consumer HeckeStacksAndLocalShtukas uses uniformization, the smooth Artin structure and the strata, and the consumer ExcursionOperatorsAndSpectralAction uses the stack, its topology and the parabolic charts.

## References

Page numbers are the printed pages of the version listed, unless a PDF page is named.

- <a id="ref-fs"></a>**[FS]** Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. [https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).
- <a id="ref-sw"></a>**[SW]** Peter Scholze, Jared Weinstein, *Berkeley Lectures on `p`-adic Geometry*. [https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf).
- <a id="ref-kot85"></a>**[Kot85]** Robert Kottwitz, *Isocrystals with additional structure*. [https://www.numdam.org/article/CM_1985__56_2_201_0.pdf](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf).
- <a id="ref-kot97"></a>**[Kot97]** Robert Kottwitz, *Isocrystals with additional structure II*. [https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf).
- <a id="ref-rr96"></a>**[RR96]** Michael Rapoport, Melanie Richartz, *On the classification and specialization of F-isocrystals with additional structure*. [https://www.numdam.org/article/CM_1996__103_2_153_0.pdf](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf).
- <a id="ref-kot14"></a>**[Kot14]** Robert Kottwitz, *B(G) for all local and global fields*. [https://arxiv.org/pdf/1401.5728](https://arxiv.org/pdf/1401.5728).
- <a id="ref-ans19"></a>**[Ans19]** Johannes Anschütz, *Reductive group schemes over the Fargues-Fontaine curve*. [https://arxiv.org/pdf/1703.00700](https://arxiv.org/pdf/1703.00700).
- <a id="ref-kmps"></a>**[KMPS]** Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, *Honda-Tate theory for Shimura varieties*. [https://math.berkeley.edu/~swshin/HT.pdf](https://math.berkeley.edu/~swshin/HT.pdf).
- <a id="ref-kz"></a>**[KZ]** Mark Kisin, Rong Zhou, *Independence of l for Frobenius conjugacy classes attached to abelian varieties*. [https://arxiv.org/pdf/2103.09945v2](https://arxiv.org/pdf/2103.09945v2).
- <a id="ref-cs17"></a>**[CS17]** Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf).
- <a id="ref-rap15"></a>**[Rap15]** Michael Rapoport, *Accessible and weakly accessible period domains*, appendix to Peter Scholze, *On the p-adic cohomology of the Lubin–Tate tower*. [Author PDF](https://www.math.uni-bonn.de/people/scholze/pAdicCohomLT.pdf), Proposition A.9, p. 42.
- <a id="ref-cs24"></a>**[CS24]** Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*. [https://arxiv.org/pdf/1909.01898v2](https://arxiv.org/pdf/1909.01898v2).
- <a id="ref-zhu17"></a>**[Zhu17]** Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf).
- <a id="ref-glx"></a>**[GLX]** Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne-Lusztig varieties*. [https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf).
- <a id="ref-hk"></a>**[HK]** Sean Howe, Christian Klevdal, *Admissible pairs and `p`-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*. [https://arxiv.org/pdf/2308.11064v2](https://arxiv.org/pdf/2308.11064v2).
- <a id="ref-lz17"></a>**[LZ17]** Ruochuan Liu, Xinwen Zhu, *Rigidity and a Riemann-Hilbert correspondence for `p`-adic local systems*. [https://arxiv.org/pdf/1602.06282v3](https://arxiv.org/pdf/1602.06282v3).
- <a id="ref-kisin17"></a>**[Kisin17]** Mark Kisin, *Mod p points on Shimura varieties of abelian type*. [https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1).
- <a id="ref-vh24"></a>**[vH24]** Pol van Hoften, *Mod p points on Shimura varieties of parahoric level*. [https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf).
- <a id="ref-he21"></a>**[He21]** Xuhua He, *Cordial elements and dimensions of affine Deligne-Lusztig varieties*. [https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf).
- <a id="ref-vie21"></a>**[Vie21]** Eva Viehmann, *On Newton strata in the B_dR^+-Grassmannian*. [https://arxiv.org/pdf/2101.07510](https://arxiv.org/pdf/2101.07510).
- <a id="ref-hn18"></a>**[HN18]** Xuhua He, Sian Nie, *On the acceptable elements*. [https://arxiv.org/pdf/1408.5836](https://arxiv.org/pdf/1408.5836).
- <a id="ref-giz26"></a>**[GIZ26]** Ian Gleason, Alexander B. Ivanov, Felix Zillinger, *Meromorphic vector bundles on the Fargues–Fontaine curve*. [https://arxiv.org/pdf/2307.00887v3](https://arxiv.org/pdf/2307.00887v3). arXiv:2307.00887v3, 14 May 2026; 62-page PDF, printed pages equal PDF pages.
- <a id="ref-he14"></a>**[He14]** Xuhua He, *Geometric and homological properties of affine Deligne–Lusztig varieties*. [arXiv:1201.4901v2](https://arxiv.org/pdf/1201.4901v2), Theorem 3.5, Proposition 3.6 and Theorem 3.7, pp. 12–13.
- <a id="ref-hekr16"></a>**[HeKR16]** Xuhua He, *Kottwitz–Rapoport conjecture on unions of affine Deligne–Lusztig varieties*. [arXiv:1408.5838v2](https://arxiv.org/pdf/1408.5838v2), Proposition 4.1, p. 12, and Theorem 6.1, p. 15.
- <a id="ref-he16"></a>**[He16]** Xuhua He, *Hecke algebras and `p`-adic groups*. [https://arxiv.org/pdf/1511.01386v3](https://arxiv.org/pdf/1511.01386v3). arXiv:1511.01386v3, 21 November 2016; survey version.
- <a id="ref-zie15"></a>**[Zie15]** Paul Ziegler, *Graded and filtered fiber functors on Tannakian categories*. [https://arxiv.org/pdf/1111.1981v4](https://arxiv.org/pdf/1111.1981v4). arXiv:1111.1981v4; printed pages equal PDF pages.
- <a id="ref-iva23"></a>**[Iva23]** Alexander B. Ivanov, *Arc-descent for the perfect loop functor and `p`-adic Deligne–Lusztig spaces*. [https://arxiv.org/pdf/2003.04399v3](https://arxiv.org/pdf/2003.04399v3). arXiv:2003.04399v3, 3 September 2021; printed pages equal PDF pages.
- <a id="ref-ans22"></a>**[Ans22]** Johannes Anschütz, *Extending torsors on the punctured Spec(A_inf)*. [https://arxiv.org/pdf/1804.06356v2](https://arxiv.org/pdf/1804.06356v2). arXiv:1804.06356v2, 21 October 2020; printed pages equal PDF pages.
- <a id="ref-hk22"></a>**[HK22]** Paul Hamacher, Wansu Kim, *Point counting on Igusa varieties for function fields*. [https://arxiv.org/pdf/2208.01069v5](https://arxiv.org/pdf/2208.01069v5). arXiv:2208.01069v5, 21 August 2025; from PDF page 2 onward, printed page = PDF page − 1. The normal-base hypothesis differs from v1.
- <a id="ref-wed99"></a>**[Wed99]** Torsten Wedhorn, *Ordinariness in good reductions of Shimura varieties of PEL-type*. [https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf). Published Ann. Sci. École Norm. Sup. 32 (1999), 575–618; printed page = PDF page + 573.
- <a id="ref-cgh20"></a>**[CGH20]** Ana Caraiani, Daniel R. Gulotta, Chi-Yun Hsu, Christian Johansson, Lucia Mocz, Emanuel Reinecke, Sheng-Chi Shih, *Shimura varieties at level Gamma_1(p^infinity) and Galois representations*. [https://arxiv.org/pdf/1804.00136v2](https://arxiv.org/pdf/1804.00136v2). arXiv:1804.00136v2, 25 July 2019; printed pages equal PDF pages.
- <a id="ref-sch15"></a>**[Sch15]** Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Published Annals of Mathematics 182 (2015), 945–1066; printed page = PDF page + 944.
- <a id="ref-zin01"></a>**[Zin01]** Thomas Zink, *On the slope filtration*. [https://www.math.uni-bielefeld.de/~zink/slopes.pdf](https://www.math.uni-bielefeld.de/~zink/slopes.pdf). 19-page Bielefeld author copy, PDF creation date 23 January 2002. Author page numbers equal PDF pages; not the pagination of Duke Math. J. 109 (2001), 79–95.
- <a id="ref-hv20"></a>**[HV20]** Paul Hamacher, Eva Viehmann, *Finiteness properties of affine Deligne–Lusztig varieties*. [https://ems.press/content/serial-article-files/26546?nt=1](https://ems.press/content/serial-article-files/26546?nt=1). Documenta Mathematica 25 (2020), 899–910; published version.

- <a id="ref-dillery23"></a>**[Dillery23]** Peter Dillery, *Rigid inner forms over local function fields*. Advances in Mathematics 430 (2023), 109204. [Published author-access PDF](https://par.nsf.gov/servlets/purl/10531660), pp. 54–55 for the local cohomological inputs.
- <a id="ref-conrad12"></a>**[Conrad12]** Brian Conrad, *Finiteness theorems for algebraic groups over function fields*. [Author copy](https://virtualmath1.stanford.edu/~conrad/papers/cosetfinite.pdf), proof of Lemma A.2.1, p. 62.

- <a id="ref-pr24"></a>**[PR24]** Georgios Pappas, Michael Rapoport, *`p`-adic shtukas and the theory of global and local Shimura varieties*. Cambridge Journal of Mathematics 12 (2024), 1–164. [Published public PDF](https://par.nsf.gov/servlets/purl/10507906); printed pages equal PDF pages.
- <a id="ref-hv11"></a>**[HV11]** Urs Hartl, Eva Viehmann, *The Newton stratification on deformations of local `G`-shtukas*. [arXiv:0810.0821v3](https://arxiv.org/pdf/0810.0821v3); Theorem 7.3, p. 28 of this version.
