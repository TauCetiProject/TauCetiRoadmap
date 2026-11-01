# Roadmap: reductive bundles, B(G) and Newton strata

**Summary.** For connected reductive groups over every nonarchimedean local field, this roadmap develops the arithmetic classification of `B(G)`, its acceptable and ordinary classes, algebraic `σ`-centralizers and Newton topology. It proves Beauville–Laszlo uniformization, isocrystal-family descent, stratum dimensions and connected components, using the tensor–torsor dictionary and bundle geometry supplied by RelativeFarguesFontaine and VStackSheavesAndLisseCategories. Its chart comparison identifies the supplied open images with Newton-order down-sets.

## Scope and ownership

This roadmap owns, over every nonarchimedean local field `E` with finite residue field:

- rational filtered tensor theory, pure inner twisting and families of `G`-isocrystals (Layer 0);
- the arithmetic classification of `B(G)`, basic, decent, acceptable and ordinary classes, the algebraic `σ`-centralizers `J_b` and their defect, and comparisons with straight elements, torus classes and abelianized cohomology (Layer 1);
- Newton topology, Beauville–Laszlo uniformization and descent for families of `G`-isocrystals over perfect schemes (Layer 2);
- filtered relative automorphism group schemes, stratum dimensions and connected components, together with the supplier comparisons below (Layer 3); the locally profinite classifying-stack theorem is §0.9;
- the Newton-order interpretation of the supplied chart images and the rank-two extension calculation (Layer 4).

VStackSheavesAndLisseCategories §VS4.0 owns the bundle stack, geometric classification, Newton order, HN filtrations, full stratum automorphisms and contracting charts for every local coefficient field and nonsplit reductive group. RelativeFarguesFontaine §7.0 owns the scheme and sousperfectoid tensor–torsor dictionary, associated bundles and change of structure group. HodgeTateAndCanonicalSubgroups §2.14 owns integer-filtered fibre functors and their parabolic, unipotent and Levi theory; §§0.2 and 3.3 add rational reindexing, affine splitting and higher raising subgroups. IgusaVarietiesAndTorsionConcentration §§3.4–3.5 owns the modification bound for arbitrary cocharacters over ℚ_p, the minuscule flag stratification, closed upper unions, unitary dimension theorem and ordinary rational-point locus. Sections 2.21 and 3.12 add the CS-to-GS label comparisons; §3.12 identifies the flag image with the arithmetic acceptable set and imposes no additional partial-properness contract on those flag strata.

The linear theory belongs to VectorBundlesAndIsocrystals: finite isocrystals and their slope blocks, bundles on the relative curve and their HN theory, the isocrystal-to-bundle functor, geometric classification of vector bundles, Banach–Colmez spaces and relative slope filtrations. Lattice gluing of `G`-bundles at an untilt divisor (Beauville–Laszlo gluing) belongs to RelativeFarguesFontaine Layer 7; this roadmap proves that the resulting modification map is a v-cover of `Bun_G`. Modification spaces, Schubert bounds and open Schubert cells belong to GeometricSatakeAndFusion GS0. Artin v-stacks, smooth descent and the Jacobian criterion belong to VStackSheavesAndLisseCategories VS0–VS1, and its VS4.0 supplies the bundle geometry. Sheaf categories belong to VStackSheavesAndLisseCategories VS3–VS5; Hecke stacks, local shtukas and the spectral action are developed downstream, by the consumers HeckeStacksAndLocalShtukas and ExcursionOperatorsAndSpectralAction.

Reductive groups over a field, their rational representations as comodules and their structure theory are Tau Ceti's ReductiveGroups, Layers 1 and 7. The integral algebraic fundamental group `π₁(G)`, z-extensions, the representative Kottwitz homomorphism `κ̃: G(L) → π₁(G)_I` with its Frobenius equivariance, parahoric group schemes, Lang's theorem, the Iwahori–Weyl group with lengths and admissible sets, and the surjectivity `G(E) → (π₁(G)_I)^σ` belong to ReductiveGroupsPartII §§RG2.1.5, RG2.3 and RG2.4; this roadmap descends `κ̃` to `σ`-classes and proves the applications to centralizers. Scheme bundle foundations are AlgebraicVectorBundles; Tau Ceti supplies `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, its symmetric monoidal category, free sheaves and pullbacks. The weight-space construction after corestriction, its membership criterion and finite-support theorem are already `TauCeti.DiagonalizableGroup.weightSpace`, `mem_weightSpace` and `finite_setOf_weightSpace_ne_bot`; the rational-slope additions below are common-denominator bounds and coordinate-map comparisons. Crossed-module Galois cohomology, Tate–Nakayama and abelianization of reductive groups belong to EndoscopicTransferAndUnitaryTraceComparison Layer 1.

PadicHodgeTheory §5.5 supplies the minimal `p`-adic invariant theory and the affine tensor-isomorphism torsor. VStackSheavesAndLisseCategories §VS4.0 extends the invariant maps to general local fields; RelativeFarguesFontaine §7.0 glues the affine scheme comparison. The arithmetic classification below uses these supplied constructions. Two neighbouring roadmaps state the special case `E = ℚ_p` of part of this theory in the form their arguments use: IgusaVarietiesAndTorsionConcentration §§0.1–0.2 (`B(G)`, the Newton and Kottwitz maps, the order and `B(G, μ)`) and EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.5 (`G`-isocrystals, Newton and Kottwitz invariants with the PEL sign, decent representatives and `J_b`). The supplied definitions and the arithmetic targets here cover every nonarchimedean local field and specialise to those statements at `E = ℚ_p`; EndoscopicTransfer writes `σ`-conjugacy as `b ↦ g⁻¹ b σ(g)`, which has the same orbits.

Tau Ceti’s `Representation.coinvariantsKer_eq_range_of_forall_mem_zpowers` supplies the integral cyclic coinvariant-kernel calculation; §1.8 adds its twisted-conjugacy descent and comparison with reductive invariants. DiamondsAndVStacks §D3.10 owns representability of locally profinite torsors over perfectoid bases and their inverse-limit presentations; §2.7 adds first-countable triviality on strictly totally disconnected bases.

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
[`Units.mapEquiv`](https://github.com/leanprover-community/mathlib4/blob/f6090c7095e1e56b3464c1daba5f24631f1290d2/Mathlib/Algebra/Group/Units/Equiv.lean),
with `Units.coe_mapEquiv` for its value. The sign automorphism of an additive
commutative group is `AddEquiv.neg` in that same module. These supply the Witt
unit Frobenius and the sign action in the integral component examples directly.

Mathlib at `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`:

- `Representation.coinvariantsKer_eq_range_of_forall_mem_zpowers` in `TauCeti/RepresentationTheory/Coinvariants.lean`: for a representation over any commutative ring of a group generated by g, the coinvariant kernel is the range of ρ(g)−id, without a finiteness hypothesis. Section 1.8 specializes to the ℤ-module A and the group `Multiplicative ℤ`, with its positive generator acting by τ.
- `TauCeti.ReductiveAffineGroupSchemeCat` and `TauCeti.AffineGroupSchemeCat`: reductive affine group schemes of finite type over a field, through the Hopf-algebra equivalence, and affine group objects over `Spec` of a commutative ring. Neither supplies local Newton theory.
- `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.leviGroupExtension`: the dynamic parabolic, unipotent and Levi point groups of a cocharacter; HodgeTateAndCanonicalSubgroups §2.14 supplies the relative filtration groups, with rational-threshold comparisons here.
- `TauCeti.FGPointRepresentationCat` and its `instRigidCategory`: finite rational representations as finite comodules, rigid symmetric monoidal. `TauCeti.Tannaka.fgPointTensorIsoEquiv`: over a field, algebra-valued points are tensor automorphisms of scalar extension on finite comodules. `TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`, `TauCeti.Comodule.pointsAction`, `TauCeti.Tannaka.scalarExtensionComponent`, `TauCeti.Comodule.rTensor_comp_endOfPoint`, `TauCeti.Comodule.baseChange_comp_endOfPoint`, `TauCeti.Comodule.endOfPoint_tensor` and `TauCeti.Comodule.endOfPoint_trivial`: scalar extension of comodules and the action of points on it, with its tensor, unit and base-change compatibilities. These give the trivialized Frobenius tensor families of VStackSheavesAndLisseCategories §VS4.0.
- `TauCeti.AlgHom.mapValue` and `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`: coefficient change on points, and points of `G_m` as units.
- `TauCeti.DiagonalizableGroup.weightSpace`, `TauCeti.DiagonalizableGroup.mem_weightSpace`, `TauCeti.DiagonalizableGroup.isInternal_weightSpace`, `TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot` and `TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective`, with Mathlib's `MonoidAlgebra.mapDomainBialgHom`: weight decompositions of comodules over group algebras, their finite support, and bialgebra maps of monoid algebras over a field.
- `TauCeti.ExactStructure` and `TauCeti.ExactStructure.IsConflationExact`: a chosen Quillen exact structure and exact functors.
- Mathlib `CategoryTheory.Functor.Monoidal`, `Functor.Braided`, `Functor.Linear`, `NatTrans.IsMonoidal`, `Equivalence`, `Groupoid` and `Aut.Aut_mul_def` (`Aut` multiplication is reversed composition); `Subgroup`, `MulEquiv`, `Submodule`, `RootPairing`, `Specializes`, `Representation.Coinvariants` with `mk` and `map`, `Algebra.TensorProduct.map` and `congr`.
- Mathlib `WittVector.Isocrystal`, `WittVector.FractionRing.frobenius` and `WittVector.exists_frobenius_solution_fractionRing`: the `p`-typical isocrystals, Frobenius on the Witt fraction field, and the rank-one normal form over an algebraically closed residue field.

Tau Ceti also supplies `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` in `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean`, with `free`, `pullback`, the symmetric monoidal structure and finite biproducts. Its `pullbackId` and `pullbackComp` in `VectorBundle/Functoriality.lean` provide the scheme pullback coherence. These scheme APIs are prerequisites, not new curve or bundle-moduli targets.

### From Tau Ceti roadmaps

- **ReductiveGroups**, Layer 1 (rational representations as comodules, tensor-functor torsor reconstruction over a field, faithful representations) and Layer 7 (Borels, maximal tori, parabolics, Levi factors, based root data with Galois action).
- **ReductiveGroupsPartII**: §RG2.0.4 (`L` and `σ`), §RG2.1.5 (`π₁(G)` with Galois action, inertia coinvariants and Weyl invariance; z-extensions, their existence and the exact sequence of fundamental groups; the representative Kottwitz homomorphism `κ̃`, its surjectivity, naturality and `σ`-equivariance), RG2.3 (smooth affine models and parahoric group schemes, keeping parahorics distinct from `G(O_L)`; Lang's theorem) and RG2.4 (the Iwahori–Weyl group, its lengths and Bruhat order, admissible sets, dominant coinvariant cocharacters, Cartan and Iwasawa decompositions, and the surjectivity `G(E) → (π₁(G)_I)^σ` of §RG2.4.2), with its translation sign as in the Conventions.
- **AlgebraicVectorBundles**, L0A–L0C: finite locally free sheaves on schemes, their local-basis characterization and pullback. The relative-curve comparisons remain VectorBundlesAndIsocrystals Layers 2–4 (analytic bundles, algebraization and geometric classification).

### From geometric and arithmetic roadmaps

- **VectorBundlesAndIsocrystals.** Layer 0, “Ramified coefficient rings and coefficient changes”: ramified Witt rings, equal-characteristic power series and Frobenius. Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”, “Dieudonné–Manin classification of finite isocrystals”, “Tensor and dual calculus for isocrystals”, “Division endomorphisms of a simple isocrystal” and “Arithmetic Brauer invariant and slope normalization”: the exact tensor coefficient category, slope decomposition and division algebras. Layer 2, “Finite locally free bundles on the curve”, “V-descent of bundles and their derived cohomology” and “The exact tensor isocrystal-to-bundle functor”: relative bundles and the normalization E(π^m)=O(−m). Layer 3, “GAGA for the relative schematic curve”, and Layer 4, “Geometric classification of vector bundles” and “Stable-bundle division endomorphism comparison”: algebraization, classification and endomorphisms. Layer 5, “Two-term Banach–Colmez geometry”, “Ordinary Banach–Colmez properness” and “Quotients by contracting automorphisms”: relative representability, partial properness, cohomological smoothness and dimension, and properness of the punctured scalar quotient. Layer 6, “Upper semicontinuity of geometric HN polygons”, “Relative HN filtration and pro-étale splitting”, “Slope-zero bundles and E-local systems” and “Slope-dependent cohomology vanishing”: the family inputs.
- **RelativeFarguesFontaine.** Layer 1 (relative period annuli and the exhaustion of the period domain), §4.7 (the degree-one divisor space Div¹ and its projection), §§4.12–4.13 (`B_dR⁺` as the completed local ring at an untilt), §7.0 (`torsorTensorDictionary`: scheme and sousperfectoid tensor–torsor comparisons, associated bundles, pullback, change of structure group and faithful tensor generators), and §§7.2 and 7.7 (Beauville–Laszlo gluing of `G`-bundles and the modification of a `G`-bundle by a B_dR⁺-lattice, with base change).
- **HodgeTateAndCanonicalSubgroups.** §2.14, `TauCeti.HodgeTate.filteredFiberFunctor_split`: the integer-filtered fibre-functor carrier, fpqc-local splitting torsor, filtration parabolic, unipotent radical and Levi/type dictionary, with base change. Sections 0.2 and 3.3 use these constructions after clearing rational denominators; affine global splitting and the higher rational-threshold Lie and graded-vector-group API are targets here.
- **DiamondsAndVStacks.** §§D0.25–D0.26 (stackification, groupoid quotients and two-fibre products), §§D1.4 and D1.9 (strictly totally disconnected spaces and universally open covers by them), Layer D2 (pro-étale and v-sites), Layer D3 (effective descent; §D3.10 representability of locally profinite torsors over charted perfectoid bases, separated étale open-subgroup quotients, finite étale finite-index transition maps and their inverse-limit identification), Layer D4 (diamonds and small v-stacks, §D4.7; underlying spaces and open substacks), §D5.12 (maps representable in locally spatial diamonds) and §D6.5 (étale sites of an analytic adic space over `ℤ_p` and of its diamond).
- **DiamondEtaleCohomology**, §§C1.11–C1.12: base change for qcqs maps of locally spatial diamonds and prime-to-p torsion coefficients, including the bounded-below derived form.
- **VStackSheavesAndLisseCategories.** §§VS0.1–VS0.2: Artin v-stacks, representable diagonals, cohomological smoothness, dimension and smooth descent. §VS1.3: sousperfectoid section spaces and the positive-tangent Jacobian criterion. §VS4.0, “The stack of bundles” (`BunGeometry`): the groupoid of exact tensor bundles, effective v-descent, smallness, pullback, structure-group change and locally spatial isomorphism sheaves. “Newton geometry” (`BunNewtonGeometry`): general-local-field isocrystals and B(G), functorial Newton and integral Kottwitz maps, their rational compatibility, the fixed-κ dominance order, geometric classification, HN filtration and splitting, semicontinuity, κ-local constancy, locally closed strata and the open basic locus. “Full stratum automorphisms” (`BunAutomorphisms`): the equivalence Bun_G^b≃[*/J̃_b], its split projection to J_b(E), and the connected positive Banach–Colmez kernel of dimension ⟨2ρ,ν_b⟩. “Filtered charts and contraction” (`BunCharts`): the opposite rational filtration moduli, q_b:M_b→[*/J_b(E)], π_b:M_b→Bun_G and the graded framed fibre M̃_b; the negative Banach–Colmez tower, split section, spatial punctured complement, contraction by a sufficiently divisible central Newton multiple and proper punctured quotient. Both chart maps are partially proper, representable in locally spatial diamonds and cohomologically smooth of relative dimension ⟨2ρ,ν_b⟩; π_b has open image the generalizations of b. This supplies the smooth Artin structure on Bun_G. These contracts are over perfectoid spaces over an algebraically closed field over 𝔽_q, with ℓ≠p for cohomological assertions. The arithmetic interpretation of that image is §4.7, using §2.20 and the central Newton morphism of §1.17.
- **GeometricSatakeAndFusion**, GS0: the Schubert bounds `Gr_{≤μ}` over Div¹ for general `E`, with their properness, filtered exhaustion and Galois descent for nonsplit `G`; open Schubert cells, their stabilizers and their cohomological smoothness of dimension `⟨2ρ, μ⟩`, and, for minuscule `μ`, the identification of the cell with the flag variety.
- **EndoscopicTransferAndUnitaryTraceComparison**, Layer 1: Galois cohomology with coefficients in a crossed module (§1.1), abelianized cohomology of a reductive group (§1.5), and Kottwitz's map with its duality (§1.11).
- **IgusaVarietiesAndTorsionConcentration.** §3.4: for connected reductive G/ℚ_p and minuscule CS cocharacter η, the flag point map to B(G), invariance under geometric base extension and rank-one generalization, locally closed Newton strata, basic openness and closed upper unions. Its bound B(G,{η⁻¹}) holds on the de Rham Grassmannian for arbitrary η; §2.21 compares it with the GS label μ=(−η)^dom, and §3.12 specializes that comparison to minuscule flags. §3.5: for the unramified unitary similitude datum of §0.3, with signatures (n,n) and d=n²[F⁺:ℚ], the Krull dimension d−⟨2ρ,ν_b⟩ and the ordinary rational-point locus Fℓ(ℚ_p), of dimension zero. The integral model and special-fibre Newton stratification are §§0.3 and 0.12; central-leaf and Igusa dimensions are §§0.25 and 1.4a. These flag assertions are distinct from the bundle and chart contracts of VStackSheavesAndLisseCategories §VS4.0.
- **PadicHodgeTheory**, §5.5: `tensorIsomTorsor` represents tensor-isomorphism torsors over affine schemes for any coefficient field, with actions and base change. Its `sigmaConjugacy`, Newton map and `kottwitzInvariant` supply the minimal `p`-adic invariant theory, and `localTorsorKottwitz` supplies the torsor comparison over every finite extension of `ℚ_p`. RelativeFarguesFontaine §7.0 supplies relative scheme gluing and analytic torsors; VStackSheavesAndLisseCategories §VS4.0 supplies the general-local-field extensions on these carriers and normalizations.
- **ModularCurves**, §0E: effective faithfully flat descent of affine schemes.
- **SchemeAndStackFoundations**, §§1.15 and 2.3: torsors on the common site carrier and their descent.
- **AlgebraicModuliForArithmeticGeometry**, §3.1: module descent and descent of finite local freeness.

## How to read the build

Layer 0 uses the tensor–torsor dictionary and the representative groupoid supplied by RelativeFarguesFontaine §7.0 and VStackSheavesAndLisseCategories §VS4.0, and adds rational filtered theory and pure inner twisting. Layer 1 develops arithmetic classification, `J_b`, decency and acceptable, ordinary and torus-special classes using the supplied invariant maps and order. Layer 2 uses the supplied bundle stack and geometric classification to prove uniformization, Newton topology and descent for isocrystal families. Layer 3 develops filtered relative group schemes, compares flag labels and computes stratum dimensions and connected components. Layer 4 identifies chart images with Newton-order down-sets and computes the rank-two extension example.

Each target states its hypotheses, its proof route with sources, the API a reusable formalization needs, and its Checks. `Suggested.lean` states the matrix/isocrystal correspondence and the arithmetic Newton classification for `GL_n` over the Witt fraction field, using Mathlib’s native matrices and isocrystals. The latter includes the existence of decent representatives. Its module docstring identifies the missing objects for the general reductive and geometric headline results. The Witt rank-one classification is supplied by Mathlib and is a specialization of the general-rank statement.

## Layer 0: `G`-bundles, `G`-isocrystals and the set B(G)

Use the supplied tensor descriptions of `G`-bundles and `G`-isocrystals and `B(G)` with its representative groupoid. Develop rational filtered tensor theory and pure inner twisting. Families of `G`-isocrystals over perfect schemes are defined here; their descent is proved in Layer 2.

### 0.2 Relative tensor torsors and filtered automorphism groups

Let G be connected reductive over E and let X be an E-scheme. Extend the integer-filtered fibre-functor theory to rational filtrations by reindexing, and prove affine splitting and the higher raising-subgroup comparisons below. These additions differ from the tensor–torsor dictionary and the integer-filtered parabolic theory in the supplier contracts.

*Rational filtered functors.* Locally clear the finitely many rational jump denominators on a tensor generator and rescale to the supplied integer-filtered carrier; exact tensor generation gives the same denominator on every representation. Transport its splitting torsor and parabolic/unipotent/Levi constructions through this reindexing. Over an affine base the functor splits when its underlying tensor automorphism group is smooth, by Ziegler’s affine splitting theorem. For reductive `G` this gives splittings on affine opens and, after trivializing the underlying torsor, étale-locally. For `λ > 0`, construct the smooth closed subgroups raising every filtration by at least `λ` or more than `λ` and identify their graded quotients as vector groups, as in §3.3.
*Rational cocharacters.* After reindexing, a supplied integral splitting defines a rational cocharacter of the inner form. Transport the supplied parabolic/type dictionary and its conjugacy description of splittings, compatibly with base change and descent along étale covers.

The API:

- Common-denominator reindexing commutes with scheme pullback and preserves the filtration parabolic and unipotent radical.
- A rationally filtered fibre functor with smooth underlying tensor automorphism group splits on an affine base.
- For a positive rational threshold, the higher raising subgroups and their vector-group quotients agree under any two common-denominator reindexings.

**Checks.**

- For GL₂ with rational weights 0 and 3/2, multiplying indices by 2 gives weights 0 and 3; the positive root subgroup is unchanged, while its threshold is multiplied by 2.
- For `G = G_m` and a `ℤ`-filtration with a single jump, the filtered automorphism group is all of `G_m` and its unipotent radical is trivial.
- On P¹ over a field, the Euler sequence `0 → O(−1) →` O² `→ O(1) → 0` gives a two-step filtration of the trivial rank-two bundle that splits on each affine chart but not globally, since O² is not isomorphic to `O(−1) ⊕ O(1)`: splitting is only local on a non-affine base.

Source: SW, Theorems 19.5.1–19.5.2, pp. 178–180; Zie15, Theorem 1.3, p. 2, §4.3, Theorems 4.14–4.16, pp. 24–25, and Proposition 4.24, Lemma 4.25, Theorem 4.26, pp. 26–27; FS, Proposition III.5.2, p. 105.

*Needs:* RelativeFarguesFontaine §7.0 (`torsorTensorDictionary`); HodgeTateAndCanonicalSubgroups §2.14 (`TauCeti.HodgeTate.filteredFiberFunctor_split`); PadicHodgeTheory §5.5 (`tensorIsomTorsor`); ReductiveGroups Layer 1 (representations and comodules); ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness).

### 0.6 The Kottwitz set B(G)

For an arbitrary group H with automorphism σ, form its twisted-conjugacy quotient and representative groupoid, with arrows g:b→c satisfying c=g b σ(g)⁻¹ and composition h∘g represented by hg. This extends the reductive coefficient-point quotient to arbitrary groups and automorphism-compatible homomorphisms. Identify the specialization on G(L) with B(G). The quotient keeps isomorphism classes; the groupoid also keeps stabilizers.

For p prime and `GL_n` over `K = FractionRing (WittVector p k)`, with `k` any perfect field of characteristic `p`, `wittGL_isocrystal_classes` in `Suggested.lean` states the correspondence on native `Matrix.GeneralLinearGroup` and `WittVector.Isocrystal` carriers. Every n-dimensional isocrystal is isomorphic to `(Kⁿ, bσ)`, and the matrices giving its isomorphism class are exactly the `σ`-conjugates of `b`. The coordinatewise semilinear equivalence `wittCoefficientFrobenius` applies arithmetic Witt Frobenius to each coordinate. The concrete structure `wittGLIsocrystal` composes it with the matrix action; `wittGLSigmaSetoid` uses the displayed conjugacy convention.

The API:

- Send `b∈G(L)` to its sigma class.
- Two representative classes are equal precisely when a sigma conjugator exists.
- A `σ`-compatible group homomorphism gives `B(G)→B(H)`, with identity and composition laws.
- Every function on `G(L)` invariant under twisted conjugation descends uniquely to `B(G)`.
- For a commutative coordinate Hopf algebra `H` over `E` and an `E`-algebra automorphism `σ` of `L`, specialize the quotient to the convolution group of `E`-algebra maps `H → L`. The arithmetic `B(G)` uses the coefficient field `L` and Frobenius of VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”.
- A Frobenius-compatible group equivalence induces an equivalence of sigma-class quotients, carrying the class of `b` to the class of its image.
- Objects are elements `b` of the coefficient point group; arrows `b→c` are all `g` satisfying `c=g b σ(g)^−1`. The composite of `g:b→c` and `h:c→d` has conjugator `h g`, and inverses use `g^−1`.
- A representative `Hom` is nonempty exactly when the two quotient classes agree; this does not make it a singleton.
- The category-theoretic automorphism group of representative `b` identifies multiplicatively with its sigma-stabilizer. Mathlib’s `Aut` multiplication reverses categorical composition, matching the usual stabilizer multiplication.
- The Laurent-polynomial Hopf points equivalence identifies the split `G_m` sigma quotient with the quotient on `L×`, for any `E`-algebra automorphism of `L`.

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

Source: He21, Section 2.1 p. 4; FS, Definition III.2.1 and Theorem III.2.2 p. 89; §III.2.2 p. 90.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; Mathlib `Subgroup`, `MulEquiv`, `CategoryTheory.Groupoid`, `CategoryTheory.Aut.Aut_mul_def`, `WittVector.exists_frobenius_solution_fractionRing`, `WittVector.FractionRing.frobenius`; Tau Ceti `AlgHom.mapValue`, `MultiplicativeGroup.pointsMulEquiv_mapValue`, `FGComoduleCat.scalarExtensionMonoidalFunctor`, `Comodule.pointsAction`, `Tannaka.scalarExtensionComponent`, `Tannaka.fgPointTensorIsoEquiv`.

### 0.7 Pure inner twisting of torsors

For a group sheaf `H` on a site and an H-torsor `T`, put `H_T=Aut_H(T)`. The bitorsor `T` induces an equivalence between H-torsors and H_T-torsors by `S↦Isom_H(S,T)`, with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.

*Proof outline.* Construct the left/right commuting bitorsor actions and the evaluation/counit isomorphisms. Descend the local trivializations to establish quasi-inverse functors.

*Remark.* An untrivialized torsor does not yield a canonical isomorphism `H_T≅H`.

The API:

- The inner automorphism group represents H-equivariant automorphisms of T.
- The torsor-groupoid equivalence commutes with site pullback.
- The image of T is the trivial H_T-torsor; arrows act by inverse precomposition in the Isom description.

**Checks.**

- If `T` is the trivial H-torsor with a chosen section, `H_T` identifies with `H` and the equivalence identifies with the identity.
- If `H=1`, both torsor groupoids are terminal and the equivalence has no nontrivial automorphisms.
- For `H=GL_n` and the frame torsor of a rank-n bundle `V, H_T` is `GL(V)`; its automorphism group need not be canonically the constant `GL_n`. Twisting sends that frame torsor to the trivial GL(V)-torsor.

Source: FS, III.4.1 p. 100.

*Needs:* RelativeFarguesFontaine §7.0 (tensor–torsor dictionary); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks).

### 0.8 Families of `G`-isocrystals

Define families of G-isocrystals as follows. For a perfect F_q-algebra `R` put `L_R = R((t))` in equal characteristic and `L_R = W_{O_E}(R)[1/π]` in mixed characteristic. A family of `G`-isocrystals over `R` is a `G`-torsor `P` on `Spec L_R` with a Frobenius descent isomorphism `σ*P ≅ P`. These form a groupoid-valued prestack on perfect F_q-schemes. Write its geometric base change for the restriction to perfect F̄_q-schemes. The neutral fixed-class comparison with the constant locally profinite J_b(E) in §2.17 is on this geometric base; the arithmetic prestack retains its Frobenius descent data.

*Construction.* Take the coefficient rings and their Frobenius from VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”. Form Frobenius-equivariant torsors and their isomorphisms; pullback acts on the torsor and on its descent datum. Torsors over the coefficient rings satisfy arc-descent (Ans22, Lemma 11.3, using Iva23, Proposition 5.10 and the reflection of exactness along arc covers), and the Frobenius isomorphisms with their coherence descend through the fully faithful descent of morphisms.

*Remark.* Family morphisms are not all bundle morphisms: the bundle attached to a family has more automorphisms (VStackSheavesAndLisseCategories §VS4.0).

The API:

- Perfect-algebra maps pull back the torsor and Frobenius isomorphism, coherently.
- A loop element `b` defines the trivial torsor with Frobenius `bσ`.
- A geometric point defines its class in `B(G)`.
- After v-stackification the moduli is LG/Ad_σ LG, using v-local triviality of the coefficient-ring torsor.

**Checks.**

- For `R=F̄_q` the geometric classes recover `B(G)`.
- For `G=1` the family groupoid is terminal.
- Over F̄_q, for a nonbasic `GL_2` class, the automorphisms of the constant family are the locally profinite group `J_b(E)` of §1.13, not the full bundle automorphism group with its positive-slope kernel.

Source: FS, I.2 pp. 10–11; Ans22, Lemma 11.3 pp. 34–35 and Theorem 11.4 pp. 35–36.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”, and Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”; DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks).

### 0.9 Locally profinite classifying stacks

Prove the following classifying-stack smoothness theorem. Let `H` be a locally profinite group with a closed topological embedding `H↪GL_n(E)` for a nonarchimedean local field `E` of residue characteristic `p`, and let `ℓ≠p`. Then `[*/H]` is an `ℓ`-cohomologically smooth Artin v-stack of dimension `0`. After base change to `Spd E`, use `(GL_(n,E))^diamond/H` as a separated cohomologically smooth surjective chart of `[Spd E/H]`. Both the chart and this atlas map have dimension `n²` over their respective bases, giving stack dimension `0`.

*Proof outline.* Embed the constant locally profinite diamond `H×Spd E` as a closed subgroup of `(GL_(n,E))^diamond`. The quotient is locally spatial; after a compact open pro-`p` subgroup `K⊂H`, its cover `(GL_(n,E))^diamond/K` is separated étale over that quotient. Use the quotient smoothness theorem and smooth descent to obtain the atlas and compute the dimensions. Descend the Artin and smoothness properties from `Spd E` by VS0.1. The point map is not a smooth chart when `H` contains an infinite compact open subgroup.

**Checks.**

- For `H=E×`, take `n=1`; the quotient chart has dimension `1` and atlas relative dimension `1`, while `[*/E×]` has dimension `0`.
- For `H=1`, the quotient chart is `GL_(n,E)^diamond`, giving the terminal stack of dimension `0`.
- For `H=O_E×`, the point map fails cohomological smoothness because its pullback has the distribution dualizing sheaf of an infinite profinite group. The quotient chart still applies. For discrete `H` the point map is instead separated étale.

Source: FS, Example IV.1.9(iv), Remark IV.1.10, p. 110, and proof of Theorem IV.1.19, p. 113.

*Needs:* VStackSheavesAndLisseCategories §§VS0.1–VS0.2 (Artin v-stacks and smooth descent); DiamondsAndVStacks D3–D5 (locally profinite torsors, quotients and relative representability); DiamondSixOperations §S4.2 (cohomological smoothness) and §S5.3 (pro-`p` quotients).

### Examples

- For `G = GL_n`, `G`-bundles are rank-n vector bundles, `G`-isocrystals are n-dimensional isocrystals, and `B(GL_n)` is the set of Newton polygons of height `n`.
- For `G = G_m` and `E = ℚ_p, B(G_m) = ℤ` through the valuation, and the class of `p^m` is `m`.

### Dependencies

ReductiveGroups Layers 1 and 7; VectorBundlesAndIsocrystals Layers 1–2 (finite isocrystals and analytic bundles); AlgebraicModuliForArithmeticGeometry Layer 3; DiamondsAndVStacks Layer D3; Mathlib and Tau Ceti as listed above.

## Layer 1: Newton and Kottwitz invariants, centralizers and acceptable classes

Use the Newton and Kottwitz maps and order supplied by VStackSheavesAndLisseCategories §VS4.0 on the fundamental-group and slope-protorus carriers. Construct the algebraic `σ`-centralizers `J_b` and decent representatives. Classify `B(G)` by its two invariants and by straight elements of the Iwahori–Weyl group, define the acceptable sets `B(G, {μ})`, and prove the existence and uniqueness statements for basic, maximal and ordinary classes. The layer ends with torus-special pairs, abelianized classes and the z-extension and centralizer comparisons.

### 1.1 Torus resolutions, invariant lattices and choice of maximal torus

Prove the following three statements about tori and z-extensions over a nonarchimedean local field `E`; they refine the z-extension and `π₁` statements of ReductiveGroupsPartII §RG2.1.5 and are used throughout Layers 1 and 2.

`1`. *Induced resolutions.* Every `E`-torus `T` admits a surjective `E`-morphism `R → T` from an induced torus `R =` ∏ `Res_{E_i/E} G_m`, split by a splitting field of `T`, whose kernel is again a torus. This is a statement about group schemes, not surjectivity on `E`-points.
`2`. *Invariant lattices.* For a z-extension `1 → Z → G̃ → G → 1` with induced central torus `Z` and a closed subgroup `J` of the Galois group, the map `X_*(T̃)^J → X_*(T)^J` on cocharacter invariants is surjective whenever the continuous cohomology H¹(J, `X_*(Z)`) vanishes, and that vanishing holds for induced `Z` and the subgroups `J` used below (inertia, and decomposition groups of finite unramified extensions). Right exactness of integral coinvariants is a separate fact and does not imply invariant surjectivity.
`3`. *Inner-twist transport.* Prove the inner-twist identification of algebraic fundamental groups: unlike the change-of-maximal-torus identification supplied by ReductiveGroupsPartII §RG2.1.5, this compares `G` with an inner form `G′`. An inner twist induces a canonical Γ-equivariant identification `π₁(G) ≅ π₁(G′)`, independent of the conjugating maximal tori, commuting with inertia and Galois coinvariants. The ambiguity is inner conjugation, whose Weyl action on the coroot quotient is trivial.

**Checks.**

- For the norm-one torus T¹ of an unramified quadratic `E′/E`, the map `Res_{E′/E} G_m →` T¹, `x ↦ x/σ(x)`, is an induced resolution with kernel the torus `G_m`.
- For the z-extension `GL_2 → PGL_2` the kernel is the induced torus `G_m`, and the map on Γ-invariant cocharacters is surjective.
- For the two diagonal tori of `GL_2` related by the Weyl element, the induced identification of `π₁ ≅ ℤ` is the identity.

*Proof outline.* For a finite Galois splitting group `Δ`, choose a surjection from a finite free permutation Δ-lattice onto `X_*(T)`. Its kernel is free over `ℤ`, so duality gives the required exact sequence of tori with connected kernel. Restricting an induced lattice to a closed subgroup remains a sum of permutation lattices; Shapiro reduces H¹ to continuous homomorphisms from a compact group to `ℤ`, which vanish. Apply the long exact cohomology sequence for invariant surjectivity. For inner-twist transport use the trivial Weyl action on the coroot quotient.

Source: Kot85, proof of Lemma 2.2(b), p. 207 (the induced resolution); Kot97, §6.5, equation 6.5.1, p. 287 (its use for z-extensions); GLX, proof of Lemma 3.16, pp. 829–830 (invariant lattices); KMPS, Notational conventions, p. 5 (inner-twist invariance).

*Needs:* ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); ReductiveGroupsPartII RG2.1 (z-extensions and their existence, §RG2.1.5); ReductiveGroups Layer 7 (structure theory).

### 1.2 Weil cohomology of crossed modules with L^sep coefficients

Let `E` be `p`-adic, `L^sep` a separable closure of `L = Ĕ` with its natural continuous action of the Weil group `W_E`, and give `G(L^sep), T(L^sep)` and their subgroups the discrete topology. Define continuous Weil cohomology `H^i(W_E`, −) of these discrete W_E-groups and of two-term crossed modules `[H₁ → H₀]` (in degrees `−1` and `0`), with its long exact sequences and its functoriality in morphisms of crossed modules. Prove:

`1`. quasi-isomorphisms of crossed modules induce bijections, so `[G_sc → G], [T_sc → T] (T` a maximal torus, `T_sc` its preimage) and `[Z_sc → Z]` (the centres) have the same H¹;
`2`. H²(W_E, `T_sc(L^sep)) = 0`, where `T_sc` is the preimage of the maximal torus `T` in `G_sc`; this is the Weil-cohomological vanishing used in the proof of FS Lemma III.2.11, not an assertion that a torus is simply connected;
`3`. the inflation from Weil cohomology to the étale cohomology of the curve used in §2.9 and §2.10 is natural in the coefficients.

Inertia acts nontrivially on these coefficients (for instance on `μ_p` over `ℚ_p`), so the coefficients are `L^sep`-points and not `L`-points. The statement is for `p`-adic `E`; for the equal-characteristic case of the connected-centre application in §1.44 the identification H¹(E, `H) ≅ (π₁(H)_Γ)_tors` for connected reductive `H` over `E` (Kottwitz) is proved as part of §1.44.

**Checks.**

- For `G` a torus, `G_sc = 1` and H¹(W_E, `[1 → T(L^sep)]`) is the Weil cohomology of `T`; for `T = G_m` it is `ℤ`, recovering `B(G_m)`.
- For `G = SL_n` the crossed module `[SL_n → SL_n]` is contractible and its H¹ vanishes.
- For `μ_p` over `ℚ_p` with `p` odd, the `L`-points are trivial, while H¹(W_E, `μ_p(L^sep)`) contains the Kummer class of `p`, so the coefficients must be `L^sep`-points.

Source: FS, III.2.4 and Lemma III.2.11, pp. 93–94. The proof of Lemma III.2.11 cites Serre, Chapter II.3.3, example (c), and Chapter III.2.3, Theorem 1′, for the vanishing; the crossed-module comparison is the preceding Borovoi input.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); §1.1 (torus resolutions); ReductiveGroups Layer 7 (structure theory).

### 1.3 Abelianized Kottwitz set

Define abelianized isocrystal classes. For `E` `p`-adic, `B_ab(G)=H^1(W_E,[Gsc(L^sep)→G(L^sep)])` with the natural crossed-module action. The abelianization map comes from `[1→G]→[Gsc→G]`. A maximal torus complex `[Tsc→T]` and center complex `[Zsc→Z]` are homotopy-equivalent coefficient models, not replacements of `G` by an arbitrary abelian group.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

*Construction.* Take continuous crossed-module cohomology and the simply connected cover from EndoscopicTransferAndUnitaryTraceComparison Layer 1 and ReductiveGroups Layer 7; the Weil-group form of this cohomology is §1.2. Construct the abelianization and compare the torus and centre complexes.

*Remark.* Restriction to `p`-adic `E` keeps finite diagonalizable groups étale.

The API:

- Send a sigma class to its crossed-module `H^1` class.
- Replace the crossed module by `[Tsc(L^sep)→T(L^sep)]` for a maximal torus.
- Replace it by `[Zsc(L^sep)→Z(L^sep)]`.
- Reductive homomorphisms and compatible simply connected lifts induce the abelianized map.

**Checks.**

- For a torus `Gsc=1, B_ab(T)=B(T)`.
- For simply connected semisimple `G` the abelianized set is `0`.
- For split `PGL_n, B_ab(G)=Z/n`, which cannot be recovered by rationalization.

Source: FS, III.2.4.2 pp. 93–94.

*Needs:* §0.6 The Kottwitz set B(G); §1.1 Torus resolutions, invariant lattices and choice of maximal torus; §1.2 Weil cohomology of crossed modules with L^sep coefficients; EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); ReductiveGroups Layer 7 (structure theory).

### 1.4 Rational slope protorus

For the slope protorus let `D=D(Q)` be the diagonalizable `E`-protorus with coordinate Hopf algebra `E[Q]`, using the additive group `Q`. It is not a finite-type torus. A homomorphism `D→G` is a Hopf-compatible coordinate map `O(G)→E[Q]`. Its restriction on each finite rational representation gives rational weight subspaces, with only finitely many nonzero weights. Over a splitting field, `Hom(D,T)` is `Hom(X*(T),Q)`, hence `X_*(T)⊗Q` for a finite-rank torus. A rational cocharacter need not be integral. Define the slope character for `G_m` by the coordinate map `E[ℤ]→E[ℚ]` sending `[n]` to `[nq]`; the new finite-representation target is a common integral multiple of the rational weights, beyond the library’s finite-support theorem.

*Construction.* Use the group-algebra Hopf structure and the diagonalizable weight theory at the pins, for the multiplicative presentation of the additive group `ℚ`; the direct limit of character lattices identifies the spectrum of `E[ℚ]` with the inverse limit of `G_m` under positive power maps. Restrict the representation comodule along `O(G) → E[ℚ]` and use the internal weight decomposition and its finite-support theorem; clear the finitely many denominators. Over a field, group-algebra morphisms correspond to character homomorphisms. For a split torus this is the rational cocharacter space; for a nonsplit torus keep its Galois action through descent.

*Remark.* Denominator `h` requires an h-fold integral representative.

The API:

- Unlike the generic finite-support statement, this produces, for a finite representation, a positive integer `n` with `n·q` integral for every nonzero rational weight submodule; finite support comes from the diagonalizable weight theorem.
- Over a splitting field, the coordinate maps `E[X*(T)]→E[Q]` identify with additive maps `X*(T)→Q`. For a finite free character lattice this identifies `Hom(D,T)` with `X_*(T)⊗Q`; a nonsplit descent comparison must preserve its Galois action.
- For `G→H` represented by `O(H)→O(G)`, postcomposition of `D→G` is coordinate-map composition `O(H)→O(G)→E[Q]`.
- The coordinate map associated to `X*(T)→Q` sends the group-like generator `[m]` to `[ν(m)]`.
- The rational slope `q` determines a coordinate map `E[Z]→E[Q]` sending `[n]` to `[n q]`.
- Coordinate-side postcomposition evaluates as the composite of the two bialgebra maps.
- Over a field `E`, the slope-1/2 coordinate map differs from the coordinate map of every integer slope; compare the image of the generator `[1]`.

**Checks.**

- The actual half-slope coordinate map `E[Z]→E[Q]` sends the generator `[2]` to `[1]`, detecting denominator clearing on Hopf algebra generators.
- The zero-slope coordinate map sends every `[n]` to the unit `[0]`, giving the trivial group homomorphism.
- The half-slope coordinate map differs from every integral-slope map `E[Z]→E[Q]`, including slope one.

Source: KMPS, Notational conventions and 1.1.1 p. 5.

*Needs:* ReductiveGroups Layer 1 (representations and comodules); VectorBundlesAndIsocrystals Layer 1, “Dieudonné–Manin classification of finite isocrystals”; Mathlib `MonoidAlgebra.mapDomainBialgHom`; Tau Ceti `DiagonalizableGroup.weightSpace`, `DiagonalizableGroup.finite_setOf_weightSpace_ne_bot`, `MonoidAlgebra.mapDomainBialgHom_surjective`.

### 1.5 Newton orbit space and rational dominance

Define the rational Newton orbit space as follows. `N(G)` is the Γ_E-fixed set of G(Ē)-conjugacy classes of `D→G`. For a quasi-split inner form `G`*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define `ν≤ν′` when `ν′−ν` is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.

*Construction.* Use the quasi-split rational chamber and the action on the based root datum. Compare orbit representatives in that chamber; transport the order across an inner twisting.

*Remark.* On `GL_n` compare descending slopes by partial sums with equal total.

The API:

- Choose the unique dominant representative in `G`*.
- Positive-coroot dominance with equal central projection.
- Project to `(π_1(G)⊗Q)^Γ`.
- An inner twisting transports Newton orbit classes, independently of its representative.

**Checks.**

- `(1/2,1/2)≤(1,0)`, with equal total `1`.
- For a torus dominance is equality.
- For `G_m, 0` and `1` are incomparable despite the usual rational-number inequality.

Source: KMPS, 1.1.1 pp. 5–6; RR96, Section 2.1 pp. 165–166 (PDF pp. 14–15).

*Needs:* §1.4 Rational slope protorus; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.6 Rational Levi descent, elliptic tori and transfer of maximal tori

Let `G` be a connected reductive group over a nonarchimedean local field `E` with quasi-split inner form `G`*. Prove:

`1`. *Levi descent.* In the quasi-split group `G`*, every Γ-stable conjugacy class of parabolic subgroups contains an `E`-rational parabolic with an `E`-rational Levi factor. In `G` itself a class need not descend; the rational Levi used later is the Newton centralizer of a decent representative.
`2`. *Elliptic tori.* Every inner form of `G` contains a maximal torus that is elliptic modulo `Z(G)`, that is, anisotropic modulo the centre.
`3`. *Transfer of tori.* For an inner twist `ψ: M′ → M` of Levi subgroups and a maximal torus `T′` of `M′`, an `E`-rational embedding `j: T′ → M` which is M-conjugate to `ψ|T′` (a rational transfer) exists when `M` is quasi-split or `T′` is elliptic modulo the centre; geometric conjugacy alone does not give one.

**Checks.**

- For `G = GL_2` and its inner form `D^× (D` the quaternion division algebra), an elliptic maximal torus of `D^×` is `E′^×` for a quadratic `E′/E`, and it transfers to `GL_2`.
- The split diagonal torus of `GL_2` does not transfer to `D^×`: its torus is not elliptic and `D^×` is not quasi-split.
- For `G` split, item `1` is the usual existence of standard Levi subgroups.

Source: Kot14, proof of Proposition 13.1, §13.3, p. 66 (existence of elliptic maximal tori in both characteristics, with the Kneser and DeBacker references); Dillery23, Theorem 5.3 and the following paragraph, arXiv v4, p. 44 (the equal-characteristic existence statement); Kot85, Proposition 5.3, p. 215 (its use in classification); KMPS, §1.1.16 and Corollary 1.1.17, pp. 12–13 (transfer); Kot97, §§4.3–4.4, pp. 268–269 (descent of the Newton Levi).

*Needs:* §1.5 (Newton orbits); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.7 Galois averaging and Hodge invariants

Define the Hodge invariants. For a geometric conjugacy class `{μ}`, choose its dominant representative `μ`* in a quasi-split inner form. Put `μ♯=[μ*]` in `π_1(G)_Γ` and `μ◇=|Γ·μ*|^−1 sum` over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives `(π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ` and `δ(μ◇)=average(μ♯⊗1)`; it is not an integral averaging isomorphism.

*Construction.* Choose the finite quotient through which the based-root action and `μ` orbit factor. Average in the rational vector space; change of inner twisting changes the representative by conjugacy. Prove invariance, idempotence and compatibility with the coroot quotient.

*Remark.* Keep `μ♯` integral even when `μ◇` is fractional.

The API:

- Return the full integral Γ-coinvariant class.
- Return the rational dominant orbit `average`.
- The rational projection of sharp is `delta` of diamond.
- Restrict the `Γ` action and use the corresponding orbit `average`; ramified degree normalizations must be explicit.

**Checks.**

- For split `GL_2` and `μ=(1,0), μ◇=(1,0)` and `μ♯=1`.
- The zero cocharacter has both invariants `0`.
- For the quadratic norm-one torus `μ=1` has `μ◇=0` and nonzero `μ♯` in `Z/2`.

Source: KMPS, 1.1.5 pp. 7–8.

*Needs:* ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); §1.5 Newton orbit space and rational dominance; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory).

### 1.8 Newton and Kottwitz invariants

Extend integral Kottwitz descent to an arbitrary group with automorphism and an equivariant homomorphism to an integral abelian group. Unlike the reductive invariant maps in the supplier contracts, this construction does not require an algebraic group or a coefficient field.

Hypotheses: The integral descent step is stated for an arbitrary group `G` with automorphism `σ`, an abelian group A with automorphism `τ`, and a homomorphism `κ̃: G →` A with `κ̃(σg) = τκ̃(g)`; this abstract statement is the integral equivariant descent part of the API below and says nothing about reductive groups by itself.

*Construction.* For `c = g b σ(g)⁻¹` one has `κ̃(c) = κ̃(b) + κ̃(g) − τκ̃(g)`, and `κ̃(g)` and `τκ̃(g)` agree in integral coinvariants, so the representative formula descends uniquely. Apply `Representation.coinvariantsKer_eq_range_of_forall_mem_zpowers` to the ℤ-module A with the action of `Multiplicative ℤ` generated by τ to express equality in the integral coinvariants through the range of τ−id. For an abelian point group the same equation gives both directions of the quotient equivalence. Naturality follows from the coinvariant map of an integral intertwiner, surjectivity from that of `κ̃`. The application to the reductive representative map agrees with the invariant in the supplier contract by its representative formula.

*Remark.* For `GL_n`, `κ=v(det b)` and `ν` is the descending slope tuple.

The API:

- For an integral abelian group A and additive automorphism `τ`, the multiplicativized integer `n` acts by the `ℤ`-linear automorphism `τ^n`.
- The positive generator acts by `τ`, fixing the arithmetic Frobenius orientation.
- The integral coinvariants `Representation.Coinvariants` of the cyclic action on A; torsion is retained.
- The integral relation map is `τ−id` on the actual `ℤ`-module A.
- A homomorphism `G →` Multiplicative A together with its Frobenius-equivariance equation; for a reductive group this is `κ̃` of §RG2.1.5.
- The image of the representative invariant in integral Frobenius coinvariants.
- For `c=g b σ(g)⁻¹`, the additive representative invariant is `κ̃(b)+κ̃(g)−τκ̃(g)`.
- The integral quotient kills the change `κ̃(g) − τκ̃(g)`.
- The descent of the representative invariant to the twisted-conjugacy quotient, by twisted-conjugacy invariance.
- On the class represented by `b`, the descended map is the coinvariant class of `κ̃(b)`.
- A function on the twisted-conjugacy quotient with the specified representative formula equals the descended map.
- If the representative homomorphism is surjective, so is the descended map on `σ`-classes.
- A ℤ-linear map intertwining `τ` and `υ` induces a `Representation.IntertwiningMap` between the cyclic representations.
- A Frobenius-compatible group map and a compatible integral intertwiner commute with the descended maps through `Representation.Coinvariants.map`.
- For Multiplicative A with Frobenius `τ`, the identity homomorphism supplies the representative invariant.
- The twisted-conjugacy quotient of Multiplicative A is equivalent to the integral τ-coinvariants of A.
- The abelian equivalence sends the class of a to its integral coinvariant class.
- For identity Frobenius, the integral target is `ℤ`-linearly equivalent to A.
- The identity-action target equivalence sends the class of a to a.
- For `A = ℤ` and `τ(n) = −n`, the integral coinvariants are additively equivalent to ZMod `2`.
- The sign-action equivalence sends the integral class of `n` to its parity in ZMod `2`.

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

Source: KMPS, 1.1.2 equations 1.1.2.1 and 1.1.2.3 pp. 6–7; RR96, Theorem 1.15 pp. 160–162 (PDF pp. 9–11); He16, §2.2 p. 22 and §2.4, Theorem 2.6 pp. 25–26; Kot14, §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §0.6 The Kottwitz set B(G); §1.5 Newton orbit space and rational dominance; ReductiveGroupsPartII §RG2.1.5 (the integral fundamental group and its Galois action); §1.7 Galois averaging and Hodge invariants; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; VectorBundlesAndIsocrystals Layer 1, “Dieudonné–Manin classification of finite isocrystals”; ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); Mathlib `Representation.Coinvariants`, `Representation.Coinvariants.map`; Tau Ceti `Representation.coinvariantsKer_eq_range_of_forall_mem_zpowers`.

### 1.9 Decent representative

Define a decent representative. For a positive integer `r` and `b∈G(L)`, require `rν_b` to be integral and `(bσ)^r=(rν_b)(π)σ^r` in `G(L)⋊`<σ>. Equivalently `b σ(b)⋯σ^(r−1)(b)=(rν_b)(π)`, exactly `r` factors. A decent representative admits finite unramified descent; the definition excludes `r=0`.

*Construction.* State the integral slope homomorphism and the equation in the semidirect product `G(L) ⋊ ⟨σ⟩`, with exactly `r` factors (the printed equation in KMPS `(1.1.2.2)` has `r + 1`; see the source corrections). Finite unramified descent follows from the equation and slope functoriality.

*Remark.* A rank-one element `π^m` is decent with period `1`.

The API:

- Package `b, r>0`, integrality of `rν_b` and the r-factor equation.
- Expose the semilinear power equation with the chosen uniformizer.
- A decent period `r` may be replaced by a positive multiple, with the matching integral slope.
- Supply the unramified degree-r coefficient field and descended `b` and Newton map.

**Checks.**

- `b=π^m` has period `1` and integral Newton point `m`.
- `b=1` has period `1` and zero Newton point.
- The zero period is excluded, even though its empty-product equality is tautological.

For an arbitrary group with automorphism σ, also consider the positive-period Frobenius norm relation N_r(b)=a with r>0. For a decent representative one additionally requires rν_b to be integral and fixes a=(rν_b)(π). Prove the twisted-conjugation formula for that norm for every group automorphism `σ`, every `b,g` and every natural `r`: the endpoint conjugator is `σ^r(g)`.

Source: GLX, Definition 2.3 p. 819; KMPS, Section 1.1.2 equations and decency p. 6; HV20, §1 pp. 899–900; Lemma 5.2 and proof p. 906 (PDF p. 8).

*Needs:* §1.8 Newton and Kottwitz invariants; ReductiveGroups Layer 7 (structure theory).

### 1.10 Straight Weyl comparison with B(G)

For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from `σ`-straight `σ`-conjugacy classes of Weyl elements to `B(G)` is a bijection and preserves `κ` and dominant Newton points. For `w`, choose `n` killing the finite Weyl/Frobenius action and write `wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n`. The straightness criterion is `length(w)=⟨2ρ_Σ,ν_w^dom⟩`. Affine Weyl groups, lengths and `Adm(μ)` are those of ReductiveGroupsPartII RG2.4.

*Proof outline.* Take the local Iwahori–Weyl datum of RG2.4; choose normalizer representatives individually and use Lang to prove independence of the lift. A group-homomorphic section is not required. Prove independence of an allowed `n` and compatibility of invariant maps. The bijection is He14, Theorem 3.7, p. 13. First reduce a Weyl element to minimal length within its Weyl `σ`-conjugacy class by length-nonincreasing simple twisted conjugations. A minimal element can have a finite parahoric factor `u` in a presentation `ux` with `x` straight. Remove that factor at the level of `G(L)`-`σ`-classes by Lang’s theorem on the finite reductive quotient; length-preserving cyclic shifts alone do not produce a straight representative. Prove these distinct steps using He14 Theorems 2.1, 2.3, Lemma 3.2, Theorem 3.5, Proposition 3.6 and Theorem 3.7.

*Remark.* The rational translation normalization divides by `n`, not by the residue-field degree.

**Checks.**

- In affine type A₁ with `σ=id`, a finite simple reflection has length `1` and Newton point `0`, hence is not straight. Length-preserving shifts cannot turn it into a straight element of length `0`.
- A dominant split translation `t_μ` has length `⟨2ρ,μ⟩` and Newton point `μ`; its lift has Kottwitz class `+[μ]` in the arithmetic convention.
- For a torus the affine Weyl reflection group is trivial; the comparison retains the integral translation coinvariants, including their torsion.

Source: He14, Theorem 2.1, p. 8, and Theorem 2.3, pp. 9–10, Lemma 3.2, pp. 11–12, Theorem 3.5, p. 12, Proposition 3.6 and Theorem 3.7, p. 13; KZ, §2.2.2 pp. 9–10, with `σ`-straight definitions in §§2.1.3–2.1.4 pp. 7–8.

*Needs:* §1.8 Newton and Kottwitz invariants; ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem).

### 1.11 Kottwitz classification by both invariants

The map `(ν,κ):B(G)→N(G)×π_1(G)_Γ` is injective. For basic classes, `κ` restricts to a bijection `B(G)_basic≅π_1(G)_Γ`; their Newton point is the central rational representative determined by `κ⊗1`. Injectivity of `ν` alone is false.

*Proof outline.* Use He16 §2.2/Theorem 2.6 for injectivity of the pair (integral `κ`, dominant `ν`) over every nonarchimedean local field. Use the local affine datum of RG2.4 and its comparison from the straight-Weyl classification, retaining central torsion. Kot14 §13.1–13.3 and Proposition 13.1 identify the basic local-field set with `π_1(G)_Γ` and compare it with the `σ`-conjugacy presentation. The rational compatibility square then determines its central Newton point. Kot97 and KMPS provide the `p`-adic specializations; they are not by themselves citations for equal characteristic.

*Remark.* Quadratic norm-one torus gives equal `ν` and unequal `κ`.

For `GL_n` over the Witt fraction field with algebraically closed `k`, `wittGL_newton_classification` in `Suggested.lean` states a bijection from the actual `σ`-class quotient to `WittGLNewtonPolygon n`: descending rational tuples whose reduced denominators divide their slope multiplicities. The predicate `wittGLHasNewtonSlopes` identifies its value on `b` by a basis and a positive Frobenius power `Φ_b^r(e_i) = p^{a_i} e_i`, with `a_i = rν_i`. Thus every admissible tuple occurs and two matrices have the same tuple exactly when they are `σ`-conjugate. For `GL_n`, `κ` is the integral sum of these slopes; the basic classes are the constant tuples, giving the basic bijection with `ℤ` in positive rank.

Source: Kot97, Section 4.13 pp. 274–275 (injectivity), Section 4.4 pp. 268–269 (basic bijection), and Section 5.1 pp. 278–280; KMPS, 1.1.2.3 pp. 6–7; He16, §2.2 p. 22; §2.4, Theorem 2.6 pp. 25–26; Kot14, §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* §1.8 Newton and Kottwitz invariants; §1.10 Straight Weyl comparison with B(G); ReductiveGroups Layer 7 (structure theory).

### 1.12 Existence of decent representatives

Every class of `B(G)` has a decent representative for some sufficiently divisible positive `r`. In the mixed-characteristic GLX setting `r` can be enlarged so `G` is quasi-split over `E_r` and the representative has the chosen dominant Newton map.

*Proof outline.* Use HV20, Lemma 5.2, for the general local-field statement. Its proof reduces the class, inside its Newton centralizer, to a basic class and chooses a length-zero lift in the normalizer of the Iwahori subgroup; proving that such a decent length-zero normalizer lift exists after enlarging a positive period (HV20, `p. 906`) is part of this target, using the Iwahori–Weyl group of RG2.4. Use the integral, basic and straight-Weyl comparisons, then enlarge the period to clear the slope denominators and the finite descent period. Decency is not deduced from a bare root datum. In the `p`-adic setting of GLX, enlarge the unramified extension further so that `G` becomes quasi-split and conjugate the Newton map into the chosen dominant chamber.

*Remark.* For a coprime slope `a/h` simple block choose a period divisible by `h`.

The defining positive-period basis in `wittGLHasNewtonSlopes`, whose existence is part of `wittGL_newton_classification`, gives this statement for every rank over the Witt fraction field: changing to that basis makes the r-factor Frobenius norm `diag(p^{a_i})`, with integral Newton multiple `(a_i)`. No integrality of the slopes themselves is imposed.

Source: GLX, Paragraph 4 after Definition 2.3 p. 819; Kot85, Section 4.3 pp. 213–214; HV20, §1 pp. 899–900; Lemma 5.2 and proof p. 906 (PDF p. 8).

*Needs:* §1.9 Decent representative; §0.6 The Kottwitz set B(G); §1.11 Kottwitz classification by both invariants; §1.10 Straight Weyl comparison with B(G); ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### 1.13 Algebraic sigma-centralizer

Define the algebraic sigma-centralizer. For `b∈G(L), J_b` is the reductive `E`-group representing `A↦{g∈G(A⊗_E L):g b=b σ(g)}`. Its `L`-base change is the centralizer `M_b` of `ν_b`. It is an inner form of the corresponding Levi in the quasi-split inner form `G`*, and is an inner form of `G`* precisely when `b` is basic. Descent uses the semilinear action Ad(b)σ on `M_b`.

*Construction.* Build `ν_b` from the slope grading of the representations, which gives the Levi centralizer after base change to `L`. Restrict Ad(b)σ to that centralizer; for a decent `b` descent is effective over a finite unramified extension. Represent the fixed-point functor by reductive-group descent (the tensor–torsor representability statement of RelativeFarguesFontaine §7.0 and the descent of AlgebraicModuliForArithmeticGeometry Layer 3) and compare its rational points with tensor automorphisms.

*Remark.* For `b = 1, J_b(E) = G(E)`. For a simple rank-h isocrystal of slope `a/h, J_b` is the unit group of its endomorphism division algebra `A_{a/h}`, whose arithmetic Brauer invariant is `−a/h`; multiplicity `m` gives `GL_m(A_{a/h})`. In the bundle-slope notation of VectorBundlesAndIsocrystals, `A_{a/h} = D_{−a/h}`.

The API:

- For every `E`-algebra A, membership is exactly `g b=b σ(g)`.
- `J_b⊗_E L≅Z_(G_L)(ν_b)`, with the descended semilinear datum.
- For `b′=g b σ(g)^−1, h↦g h g^−1` induces `J_b≅J_b′`.
- `J_b(E)` is the tensor automorphism group of the `G`-isocrystal defined by `b`.
- The group-valued functor on commutative `E`-algebras A: its coefficient group is the convolution group of maps `H → A ⊗_E L`, Frobenius acts as `id_A ⊗ σ`, and `b` enters through the right tensor factor; an algebra map `f: A → B` acts by `f ⊗ id_L`.
- Changing `b` to `g b σ(g)⁻¹` gives a natural isomorphism of these group-valued functors whose component conjugates by the image of `g` in `A ⊗_E L`.
- At every coefficient `E`-algebra A, the natural representative-change map sends `h` to `g_A h g_A^−1`, where `g_A` is the image of `g` in `G(A⊗_E L)`. It uses `g_A` on both sides, rather than `σ(g_A)`.

**Checks.**

- `J_1(E)=G(E)`.
- For the simple `GL_2` slope `1/2` block, `J_b(E)=A_(1/2)^×`; two copies give `GL_2(A_(1/2))`. For the simple `GL_3` slope `1/3` block its division algebra has arithmetic invariant `−1/3=2/3` mod `Z`, detecting the sign hidden by the half-slope case.
- For `GL_2` slopes `0,1`, the algebraic `J_b` is `G_m×G_m`, while the bundle automorphism v-group also has a positive-slope kernel.
- A coefficient map `f:A→B` sends an H-point by postcomposition with `f⊗id_L`, without changing the `L` factor.
- For `b=1` and every `E`-algebra A, the centralizer functor is exactly the id_A⊗`σ`-fixed subgroup of `G(A⊗_E L)`. Arithmetic fixed-field descent to `G(A)` is a separate theorem.
- If `σ` is replaced by the identity and `b=1`, the value at A is the entire coefficient point group. This control must not be mistaken for arithmetic fixed-field descent.
- A tensor automorphism reconstructs a point satisfying `g b=b σ(g)`, preserving the correct placement of Frobenius.
- At identity coefficient Frobenius and `b = 1`, the tensor automorphism group is the entire point group, not a trivial automorphism group of orbit classes.

Source: Kot97, Sections 4.3–4.4 pp. 268–269; Kisin17, 1.2.12 p. 14; FS, Example III.4.4 pp. 101–102.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §1.8 Newton and Kottwitz invariants; §1.12 Existence of decent representatives; §0.2 Relative tensor torsors and filtered automorphism groups; §1.6 Rational Levi descent, elliptic tori and transfer of maximal tori; ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals Layer 1, “Division endomorphisms of a simple isocrystal”; VectorBundlesAndIsocrystals Layer 1, “Arithmetic Brauer invariant and slope normalization”; Mathlib `Subgroup`, `Algebra.TensorProduct.map`, `Algebra.TensorProduct.congr`; Tau Ceti `ReductiveAffineGroupSchemeCat`, `AlgHom.mapValue`, `FGComoduleCat.scalarExtensionMonoidalFunctor`, `Comodule.pointsAction`, `Tannaka.scalarExtensionComponent`, `Tannaka.fgPointTensorIsoEquiv`.

### 1.14 Change of sigma-centralizer representative

If `b′=g b σ(g)^−1` then conjugation `h↦g h g^−1` induces an `E`-group isomorphism `J_b≅J_b′` and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.

*Proof outline.* Substitute the twisted-conjugacy equation into the pointwise fixed equation. Apply representability and descent to identify the natural functor isomorphism.

*Remark.* The map on `J_b(E)` uses `g`, not `σ(g)`, on both sides.

Source: KMPS, §1.1.4, p. 7.

*Needs:* §1.13 Algebraic sigma-centralizer.

### 1.15 Defect of a sigma class

Define the defect as follows. For the connected reductive local group `G` and its algebraic sigma-centralizer `J_b, def_G(b)=rank_E G−rank_E J_b` as an integer. The ranks are split ranks over `E`, not absolute ranks over `L` and not dimensions of topological point groups.

*Construction.* Take split ranks from the relative root theory of ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.1, and apply them to `J_b`. The isomorphisms `J_b ≅ J_{b′}` of §1.14 make the integer depend only on `[b]`.

*Remark.* `GL_n` slope blocks give `n−sum` of their division-module multiplicities.

The API:

- Return `rank_E G−rank_E J_b` in `Z`.
- Sigma conjugate representatives have equal defect.
- Defect is additive for products of groups and classes.

**Checks.**

- For split `GL_n` and `b=1` the defect is `0`.
- For split `GL_2` and simple slope `1/2`, ranks `2` and `1` give defect `1`.
- For split `GL_2` slopes `0,1, J_b` is a split rank `2` torus, so defect `0` although `b` is nonbasic.

Source: He21, Section 2.2 p. 5.

*Needs:* §1.13 Algebraic sigma-centralizer; ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.16 Finite Frobenius norm centralizer

For the degree-r unramified extension `K_0/Q_p, δ∈G(K_0), σ^r=id`, and `γ=δσ(δ)⋯σ^(r−1)(δ)`, the algebraic twisted centralizer functor defined by `δσ(g)=gδ` becomes `Z_G(γ)` after base change to `K_0`. Extending the coefficient field from degree `r` to degree `rn` defines `I_(p,n)`; after extension to `L` its centralizer is `Z_G(γ^n)`. The norm of `δ^n` is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi `J_δ`.

*Proof outline.* Iterate the twisted equation `r` times to obtain centralization of `γ`. On `Z_G(γ)`, Ad(δ)σ has period `r`; perform finite Galois descent. Compare the point functors after `K_0` base change. For the enlarged coefficient field, `(δσ)^(rn)=γ^nσ^(rn)`; apply the same finite descent.

*Remark.* No general equality `Z_G(γ)=Z_G(ν_b)` is asserted.

Source: Kisin17, Section 2.1.2 p. 29.

*Needs:* §1.13 Algebraic sigma-centralizer; §0.2 Relative tensor torsors and filtered automorphism groups; ReductiveGroups Layer 7 (structure theory); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness).

### 1.17 Central Newton morphism of the centralizer

Define the central Newton morphism of J_b. For every `b∈G(L)`, the slope morphism `ν_b`, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an `E`-rational central morphism `ν_(b,J):D→J_b`. No rational representative of `ν_b` inside `G` is needed. For a positive multiple `N` clearing its denominators, `Nν_(b,J)` is an integral cocharacter and `U_π=(Nν_(b,J))(π)` belongs to `J_b(E)`.

*Construction.* The slope decomposition is preserved by every isocrystal automorphism, so `ν_b` is central in the centralizer. The semilinear Frobenius operator commutes with its slope grading; descend that central morphism with the `J_b` group. Clear the finite weight denominators and evaluate the resulting integral cocharacter at `π`.

*Remark.* The construction does not assume that `ν_b` has a rational representative in `G`.

The API:

- Return the `E`-defined central `D→J_b` morphism.
- For sufficiently divisible `N>0` obtain an integral central cocharacter.
- Sigma conjugacy transports `ν_(b,J)` through the centralizer isomorphism.

**Checks.**

- For a simple `GL_2` slope `1/2` block, `2ν_(b,J)` is the central scalar cocharacter of `D_(1/2)^×`.
- For `b=1` the morphism is zero and `U_π=1`.
- For `GL_2` slopes `1,0` it is central in `J_b=G_m×G_m`, while its image in `GL_2` is noncentral.

Source: FS, Proposition V.3.6 p. 175.

*Needs:* §1.13 Algebraic sigma-centralizer; §1.8 Newton and Kottwitz invariants; §1.9 Decent representative.

### 1.18 Basic sigma class

Define basic classes as follows. A class is basic when its Newton morphism factors through `Z(G)`, equivalently every adjoint representation slope is `0`. This definition applies to all connected reductive inner forms, independently of a rational representative choice.

*Construction.* Use centrality of the slope morphism and tensor functoriality to identify the adjoint criterion.

*Remark.* Basic is isoclinic for `GL_n`, not necessarily slope `0`.

The API:

- Basic iff the adjoint isocrystal has slope `0`.
- Construct the unique basic class with a given integral `κ`.
- Its central rational slope is determined by `κ⊗1`.
- Corresponding basic classes for inner forms have the same integral `κ` and transferred Newton point.

**Checks.**

- The simple `GL_2` slope `1/2` class is basic.
- Every torus class is basic.
- `GL_2` with slopes `1,0` is not basic.

Source: KMPS, 1.1.2 p. 6.

*Needs:* §1.8 Newton and Kottwitz invariants; §1.11 Kottwitz classification by both invariants; ReductiveGroups Layer 7 (structure theory).

### 1.19 Basic inner form equivalence

For basic `b`, the curve group `Aut_G(E_b)` is `J_b×_E X`. Pure inner twisting therefore gives `Bun_G≃Bun_(J_b)`, compatible with perfectoid base change and carrying `E_b` to the trivial J_b-bundle.

*Proof outline.* For a basic slope cocharacter the adjoint isocrystal has only slope `0`; its bundle is the descended `J_b` group. Apply the torsor equivalence relatively.

*Remark.* For nonbasic `b` the curve automorphism group has a nonconstant positive part; this statement does not apply.

Source: FS, III.4.2 and III.4.3 pp. 100–101.

*Needs:* §0.7 Pure inner twisting of torsors; §1.13 Algebraic sigma-centralizer; §1.18 Basic sigma class; VectorBundlesAndIsocrystals Layer 2, “The exact tensor isocrystal-to-bundle functor”.

### 1.20 Division-algebra Morita comparison

For a simple isocrystal `D(a,h)` of slope `λ=a/h, gcd(a,h)=1` and `h>0`, set `A_λ=End_Φ(D(a,h))`. Under the arithmetic Frobenius and Brauer conventions of VectorBundlesAndIsocrystals Layer 1, “Arithmetic Brauer invariant and slope normalization”, `A_λ≅D_{−λ}` has invariant `−λ` mod `Z`, and `J_b≅A_λ^×`. The associated bundle is `O(−λ)`; the natural `End` comparison identifies `A_λ` with its endomorphism algebra. Twisting gives an equivalence between rank-h vector bundles and locally free rank-one right (`A_λ⊗_E` O_X)-modules via `E↦Hom(E_b,E)`, with right action by precomposition. Its inverse is `M↦M⊗_(A_λ⊗O_X)E_b`, where `E_b` is a left A_λ-module. For `m` copies the automorphism group is `GL_m(A_λ)`. This is a Morita/torsor equivalence.

Hypotheses: The local field and arithmetic Frobenius conventions of VectorBundlesAndIsocrystals Layer 1, “Arithmetic Brauer invariant and slope normalization”, apply; `λ` is the isocrystal slope, so the bundle slope is `−λ`. Right modules use `Hom(E_b, E)`; the functor `Hom(E, E_b)` of FS Example III.4.4 uses left modules.

*Proof outline.* Take the presentation of the simple-block endomorphism algebra and its arithmetic Brauer invariant from VectorBundlesAndIsocrystals Layer 1, “Arithmetic Brauer invariant and slope normalization”, (its parameter is the bundle slope `−λ`) and the stable-bundle endomorphism comparison of VectorBundlesAndIsocrystals Layer 4, “Stable-bundle division endomorphism comparison”. Then apply basic inner twisting (§1.19) and the explicit right-module Hom/tensor adjunction.

*Remark.* For isocrystal slope `1/3` the bundle slope is `−1/3` and `inv_E(A_λ)=2/3` mod `Z`, rather than `1/3`. The quaternion slope `1/2` example cannot distinguish the signs. The chosen `Hom` functor is covariant in `E` and right A_λ-linear by precomposition; exchanging the `Hom` arguments exchanges sidedness.

Source: FS, Example III.4.4 pp. 101–102.

*Needs:* §1.19 Basic inner form equivalence; ReductiveGroups Layer 7 (structure theory); VectorBundlesAndIsocrystals Layer 1, “Division endomorphisms of a simple isocrystal”; VectorBundlesAndIsocrystals Layer 1, “Arithmetic Brauer invariant and slope normalization”; VectorBundlesAndIsocrystals Layer 4, “Stable-bundle division endomorphism comparison”.

### 1.22 Representations detect Newton dominance

For Γ-invariant rational cocharacter classes, `ν≤ν′` iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to `B(G)` additionally requires equality of integral `κ`.

Hypotheses: `E` is a nonarchimedean local field of either characteristic. RR96, Lemma 2.2, states the argument in characteristic zero; in positive characteristic the representations used are the highest-weight modules below, which exist in every characteristic.

*Proof outline.* For the forward implication, use Weyl invariance of representation weights and apply the dominant-weight inequality to each exterior power: its largest Newton weight is the corresponding partial sum of slopes, and the determinant controls the total; semisimplicity of representations is not needed. For the converse, over a finite separable splitting field take the highest-weight modules (Weyl or induced modules, which exist over a split reductive group in every characteristic) for positive integral multiples of the fundamental dominant weights, with the highest weights of their exterior powers, and restrict scalars to `E`. Γ-invariance of `ν` makes the conjugate highest-weight evaluations agree, so these representations detect each coroot inequality; central characters in both directions detect equality of central projections. Constructing these modules and their finite separable restriction of scalars in arbitrary characteristic is part of this target. The Weyl `average` of a dominant point is its central projection, which therefore lies below it in the coroot order. On `B(G)`, equality of the integral `κ` is imposed separately.

*Remark.* A faithful representation alone does not establish the full equivalence without a weight-detection argument.

Source: RR96, §2.1 and Lemma 2.2 pp. 165–166; Proposition 2.4 and proof pp. 166–167.

*Needs:* §1.5 Newton orbit space and rational dominance; ReductiveGroups Layer 1 (representations and comodules).

### 1.23 Acceptable classes B(G,{μ})

Define the acceptable subset for every nonarchimedean local field, preserving the `p`-adic carrier of PadicHodgeTheory §5.5. For a geometric cocharacter class `{μ}`, set `B(G,{μ})={ [b]` : `κ(b)=μ♯` and `N_ξ(ν_b)≤μ◇` }. `ξ` is an inner twisting to the quasi-split form used for the dominant `average`. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.

*Construction.* Define the subtype of sigma classes satisfying the two invariant conditions. Check independence of Borel, torus and inner twisting via invariant transport.

*Remark.* Apply `μ` inverse in the CS flag convention.

The API:

- Membership is full `κ` equality and Newton bound.
- The unique basic class of `κ=μ♯` lies in `B(G,{μ})`.
- The acceptable subset is finite.
- For `T`, membership is `κ_T(b)=μ♯`; the Newton equality follows.
- Acceptable sets for a product factor with the component bounds.

**Checks.**

- For split `GL_2` and `μ=(1,0)`, basic slopes `1/2,1/2` and ordinary slopes `1,0` occur.
- `B(G,{0})` contains exactly its basic class with `κ=0`.
- For the quadratic norm-one torus `μ=1`, only `κ=1` mod `2` is allowed, though both Newton points equal `μ◇=0`.

Source: KMPS, 1.1.5 conditions 1.1.5.1-2 p. 8; KZ, Definition 2.2.3 p. 10.

*Needs:* §1.7 Galois averaging and Hodge invariants; §1.8 Newton and Kottwitz invariants; VStackSheavesAndLisseCategories §VS4.0.

### 1.24 Basic Levi Newton formula

For quasi-split `G/Q_p` and a rational standard Levi `M`, a basic class `b_M` with `κ_M(b_M)=μ_M♯` has Newton point the corresponding element of `(X_*(Z_M)⊗Q)^Γ`. If `μ_M` and `μ` have the same image in `π_1(G)`, its image in `B(G)` is acceptable for `μ` precisely when its `G`-dominant Newton point is bounded by `μ◇`. The M-dominant and `G`-dominant representatives can differ by a Weyl conjugation.

*Proof outline.* Project the basic invariant through the rational center isomorphism for `M`. Use the functorial `π_1` map and take `G`-dominant Newton representatives.

*Remark.* For a nonbasic `G`-class several distinct basic Levi classes can map to it; their Levi `κ` values need not coincide.

Source: KMPS, Lemma 1.1.12 p. 10; He21, Section 6.2 p. 13.

*Needs:* §1.18 Basic sigma class; §1.23 Acceptable classes B(G,{μ}); §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.25 Unique maximum of acceptable classes

For a connected reductive group `G` over any nonarchimedean local field `E` with finite residue field, and a geometric conjugacy class `{μ}, B(G,{μ})` has a unique maximum for the fixed-integral-κ Newton order. It is ordinary exactly when its Newton point equals `μ◇`. The general-field assertion is derived from the characteristic-independent root-datum theorem HN18 Theorem `1.1(1)` and the local straight-class/invariant comparison; it is not attributed to HN18 Theorem 0.1 outside that theorem’s `p`-adic scope.

Hypotheses: `G/E` is connected reductive, `E` is a nonarchimedean local field of either characteristic and `{μ}` a geometric conjugacy class of cocharacters; `G` need not be quasi-split. The local affine root datum and its Frobenius action are those of ReductiveGroupsPartII RG2.4. The full integral `κ` fibre is retained; only central inertia torsion is removed for the numerical root-datum computation.

*Proof outline.* Take the local Iwahori–Weyl datum, its Frobenius and the projection of geometric cocharacters from RG2.4. He16 §2.2 permits both characteristics; its §2.4 comparison preserves `κ` and Newton points before the equal-characteristic restriction in §2.5. By §1.10 and the injectivity of §1.11, the acceptable `B(G)` fibre identifies as a poset with the acceptable Newton values in the corresponding affine datum, at the fixed integral `κ`. For the finite central inertia-torsion subgroup `K` of the Iwahori–Weyl translation lattice, project to the torsion-free datum. Right exactness of `σ`-coinvariants identifies the kernel of the projected `κ` map with the image of `K_σ`. A lift with the wrong integral `κ` is corrected by a central torsion element; its Newton value is unchanged. Thus this numerical projection preserves the acceptable Newton set within the chosen `κ` fibre, without replacing `κ` by its rationalization. The resulting based reduced root datum and finite-order alcove-preserving affine Frobenius satisfy HN18 §1.3–§1.4. Pass to its adjoint datum using §2.1; express the affine action as an alcove stabilizer times a linear diagram action as in §2.2. Apply HN18 Theorem `1.1(1)`. Its proof (§2.3–§2.5) uses the orbit-weight integrality criterion of Lemma 2.5 and the largest allowed orbit-weight bounds to construct a Newton value `ν`. Chai00, Theorem 6.5, gives the least dominant majorant of those bounds, and Lemma `6.2(i)` shows every acceptable value is `≤ν`. The orbit-weight integrality criterion (HN18, Lemma 2.5) and Chai00’s convex-majorant inputs (Theorem 6.5, Lemma `6.2(i)`) are proved as part of this target, for the reduced root datum obtained from RG2.4. Lift back to the chosen integral `κ` as above and then to `B(G)`. Two-invariant injectivity gives a unique class, and order compatibility makes it dominate every acceptable class. This field-independent transfer is our deduction from the cited root-datum theorem, not a claim that the paper’s `p`-adic Appendix A states an equal-characteristic theorem. Compare the resulting Newton value with `μ◇` to characterize ordinary equality. Unique maximality does not assert ordinary existence for nonsplit inner forms.

*Remark.* In a nonsplit inner form maximality alone does not imply ordinary equality.

Source: HN18, §§1.1–1.4 pp. 2–4, Theorem 1.1(1) p. 4; §§2.1–2.5 pp. 4–8; Appendix A pp. 20–22; Chai00, Lemma 6.2(i), p. 981, and Theorem 6.5 with proof, pp. 981–982; He16, §2.2 pp. 22–24 and §2.4, Theorem 2.6 pp. 25–26; KZ, Remark 2.2.5 p. 10.

*Needs:* §1.23 Acceptable classes B(G,{μ}); §1.10 Straight Weyl comparison with B(G); §1.11 Kottwitz classification by both invariants; ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### 1.26 Ordinary Newton class

Define ordinary classes as follows. An acceptable class is μ-ordinary when its transferred dominant Newton point equals `μ◇`. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split `G`; it is not automatic for a general inner form. For either characteristic, every `B(G,{μ})` has a unique maximum, which need not satisfy ordinary equality.

*Construction.* Define ordinarity as equality of `ν` with the Hodge `average`, keeping acceptability. Uniqueness is injectivity of `(ν, κ)`, and existence for quasi-split `G` is KZ’s argument. For general `G`, §1.25 supplies a maximum by the characteristic-independent He–Nie root-datum theorem; it is ordinary precisely when its Newton point attains `μ◇`.

*Remark.* Ordinarity of a class and maximality in `B(G, {μ})` are separate statements.

The API:

- Acceptability and equality of transferred Newton with `μ◇`.
- At most one acceptable class is ordinary.
- Quasi-split `G` admits the ordinary class.
- An ordinary class is the maximum of `B(G,{μ})`.
- A morphism inducing an isogeny on derived groups preserves ordinary existence and membership for compatible `μ`.

**Checks.**

- For split `GL_2 μ=(1,0)`, slopes `1,0` are ordinary and `1/2,1/2` are not.
- The unique acceptable torus class is ordinary.
- For `G=D^×` with invariant `1/2` and geometric inverse cocharacter `μ⁻¹=(0,−1)`, the acceptable set has its basic maximum but no ordinary member: after splitting/twisting the hypothetical slopes `1/2,−1/2` each have multiplicity `1`, contrary to their denominator `2`.

Source: KZ, Definition 2.2.4 and Remark 2.2.5 p. 10; KMPS, Section 1.3.15 p. 20.

*Needs:* §1.23 Acceptable classes B(G,{μ}); §1.11 Kottwitz classification by both invariants; §1.25 Unique maximum of acceptable classes.

### 1.26a Acceptable straight representatives

Prove the following straight-representative theorem. For every connected reductive `G/E` over a nonarchimedean local field, geometric cocharacter class `{μ}` and `[b]∈B(G,{μ})`, there is a `σ`-straight `w∈Adm({μ})` with `[ẇ]=[b]`. Use the local Iwahori–Weyl datum of RG2.4 and its projected cocharacter bound; retain the integral Kottwitz class. No minuscule, quasi-split or unramified restriction is imposed.

*Proof outline.* Prove the affine-datum order comparison and admissible-representative argument of HeKR16 Theorem 3.1 and Proposition 4.1 for this datum. The required combinatorial statements are targets here: Newton dominance at fixed `κ` is equivalent to Bruhat comparison of minimal straight-class representatives, and every acceptable straight class has a minimal representative below an element of `Adm({μ})`. For the latter use the maximum from §1.25 and prove its admissible realization by HN18 Theorem 1.1(2), including the reductions and construction of §§3–6 as part of this target. Then apply the straight-class order comparison and the Bruhat downward closure of `Adm({μ})`. The comparison reduces to the adjoint affine datum and a quasi-split unramified loop group as in HeKR16 §3; this auxiliary equal-characteristic realization is independent of the characteristic of `E`. Lift the Bruhat comparison in a common length-zero component and restore any central inertia torsion in the fixed integral `κ` fibre. Prove compatibility of this lift with the admissible upper translations. Combine with §1.10 to identify `[ẇ]` with `[b]`. HeKR16 §1.1 assumes tame semisimple `G`; the reduction and integral lifting above are part of the general reductive target here, rather than an attribution of that generality to its Proposition 4.1.

**Checks.**

- For split `GL₂` and `μ=(1,0)`, the ordinary class has straight translation `t_(1,0)` in `Adm({μ})` of length `1`.
- The basic `GL₂` class of slopes `(1/2,1/2)` has a length-zero straight representative in `Adm({μ})`; its lift can be `[[0,π],[1,0]]`, with square `π`.
- At `μ=0`, only the neutral class is acceptable and the identity is an admissible straight representative. A finite simple reflection of length `1` and Newton point `0` cannot replace it in `Adm(0)`.

Source: HeKR16, Theorem 3.1 and proof, pp. 11–12, Proposition 4.1, p. 12; KZ, proof of Lemma 2.2.6, p. 10; HN18, Theorem 1.1(1)–(2), p. 4, §§2.3–2.5, pp. 6–8, and §§3–6, pp. 8–20.

*Needs:* §1.23 Acceptable classes; §1.25 Unique maximum of acceptable classes; §1.10 Straight Weyl comparison; ReductiveGroupsPartII RG2.4 (local affine datum, admissible sets and Bruhat order).

### 1.27 Ordinary straight translation and Levi centrality

Every ordinary class has a representative lifting a `σ`-straight translation `t_μ′` with `μ′` in the relative Weyl orbit of the projected `μ`. Such a translation has `μ′` central in the rational Newton Levi. If `μ′=w(μ)` with `μ` the projection of an absolute dominant cocharacter `μ̃`, the compatible absolute lift `w(μ̃)` is central in that Levi. The absolute-to-relative projection and the Frobenius are those of the local root datum of RG2.4.

*Proof outline.* Use the arithmetic convention for `t_{μ′}`: the lift of a split cocharacter is `μ′(π)`, with Kottwitz class `+[μ′]`. ReductiveGroupsPartII RG2.4 labels a translation by the inverse Kottwitz image, so the same point has label `−μ′` and apartment displacement `−μ′` there. Transport the chamber and the Newton normalization `ν_std = −w₀(ν_disp)` before applying its `length` or dominance statements. Apply the straightness equality to compare the coroot pairings with the Newton centralizer. Use the compatible absolute lift and averaging to force the remaining Levi root pairings to vanish. Choose a straight `w∈Adm({μ})` by §1.26a. Ordinary equality gives `ℓ(w)=⟨2ρ,μ◇⟩=ℓ(t_μ)`. Since `w≤t_μ′` for some `μ′∈W₀μ`, equality of lengths forces `w` to be that translation.

*Remark.* Centrality is in the Newton Levi, not necessarily in `G`. For split `GL_2`, `diag(π,1)` has arithmetic `κ=1` and dominant Newton point `(1,0)`. Its RG2.4 translation label is `(−1,0)`, whose dominant displacement is `(0,−1)`; applying `−w₀` recovers `(1,0)`.

Source: KZ, Lemma 2.2.6 p. 10, using Lemma 2.1.7 p. 8 and Lemma 2.1.9 p. 9 (arXiv v2).

*Needs:* §1.26a Acceptable straight representatives; §1.26 Ordinary Newton class; §1.10 Straight Weyl comparison with B(G); §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroups Layer 7 (structure theory).

### 1.28 Ordinary classes under a derived isogeny

If `f:G→G′` induces an isogeny of derived groups and sends `μ` to `μ′`, the ordinary class exists for `(G,μ)` iff it exists for `(G′,μ′)`. For `b∈B(G,{μ}), b` is ordinary iff `f(b)` is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.

*Proof outline.* Compare the dominant Newton points modulo the center using the derived isogeny. The rational `κ` compatibility fixes the central component, so equality lifts. For existence use the compatible straight translation and Kottwitz class.

*Remark.* The morphism need not be an isomorphism on centers; this is why full acceptability is retained.

Source: KZ, Lemma 2.2.8 p. 10.

*Needs:* §1.26 Ordinary Newton class; §1.27 Ordinary straight translation and Levi centrality; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory).

### 1.29 Integral conjugacy of an ordinary admissible element

In the KZ local setup with the specified connected parahoric model, if `b` is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, `b` lies in the double coset of a `σ`-straight translation `t_μ′` for `μ′` in `W_0μ`. It is `σ`-conjugate to the chosen translation lift by an element of `G(O_breveF)`. The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.

Hypotheses: Use KZ §2.1: `F` a nonarchimedean local field, connected reductive `G/F`, a `σ`-stable alcove, its Iwahori model `I`, and a specified connected parahoric model `G_script` with subgroup `W_J`. Require `b` to lie in both the μ-admissible parahoric double-coset union and the ordinary class. Here `G_script(O_breveF)` is the parahoric subgroup, not the rational points of `G`.

*Proof outline.* Use He–Rapoport Theorem `6.1(b)` to `σ`-conjugate `b` by the specified parahoric into an Iwahori cell indexed by a minimal `W_J` coset representative. HeKR16, Theorem 6.1, p. 15, puts that index in `Adm(μ)`. Use He–Zhou Theorem 4.1 to find a `σ`-straight `x` below that index whose Iwahori cell meets the ordinary class, and He14 Theorem 3.5 to identify its class. The ordinary equality and KZ Lemma 2.2.6 force `x=t_μ′`; admissible `length` comparison forces the original index to equal `x`. Apply He14 Proposition 4.5: the Iwahori double coset of a `σ`-straight lift is a single `σ`-conjugacy orbit under `I(O_breveF)`. Composing the two integral conjugators proves `(2)`. The four cited results of He, He–Rapoport and He–Zhou are inputs whose proofs are part of this target, stated for the parahoric group schemes of ReductiveGroupsPartII RG2.3 and the Iwahori–Weyl group of RG2.4.

*Remark.* A conjugate by an arbitrary `G(L)` element can leave the admissible integral double coset.

Source: KZ, Proposition 2.3.3 pp. 11–12; HeKR16, Theorem 6.1, p. 15. Its parahoric admissible-set identity is proved for the RG2.4 affine datum here, using the root-theoretic argument in that proof; §1.1 of the source assumes tame semisimple `G`.

*Needs:* §1.27 Ordinary straight translation and Levi centrality; ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem).

### 1.30 Products and unramified restriction of scalars

`B(G₁×G₂)=B(G₁)×B(G₂)`, compatibly with `ν`, `κ`, defect and acceptable bounds. For `E/F` unramified of degree `d` and `G=Res_(E/F)H`, after decomposing `G(F̆)` into `d` factors, `Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1))` gives `B(G,σ)≅B(H,σ_E)`. The bound on `H` is the sum of the component cocharacters, with the chosen factor identifications. `J_b^G≅Res_(E/F)J_Nm(b)^H` and the `F/E` split-rank defects agree.

*Proof outline.* Write the Frobenius cycle on the `d` factors and eliminate `d−1` factors by sigma conjugation. Compare the surviving semilinear operator and centralizer. Use Shapiro on `π_1` and sum the Hodge components; compare `ρ` pairings with the precise normalized Newton tuple.

*Remark.* The defect is not multiplied by `d`: restriction of scalars preserves the local split rank.

Source: Zhu17, Remark 3.6 and Lemma 3.7 p. 459; Kot97, Section 6.5 equations 6.5.2-6.5.3 p. 288.

*Needs:* §1.15 Defect of a sigma class; §1.23 Acceptable classes B(G,{μ}); ReductiveGroups Layer 7 (structure theory).

### 1.31 Levi fibre over a basic `G`-class

For a basic `G`-class and a `σ`-stable standard Levi, its intersection with the Levi has at most one Levi `σ`-conjugacy class. For a nonbasic `G`-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the `G`-dominant vector and Levi `κ` must be checked separately.

*Proof outline.* Use the basic central Newton vector and the integral Levi invariant compatibility. Apply the corrected GHN basic-only uniqueness statement cited by He. For nonbasic classes the Levi invariant does not determine the class, and no uniqueness is asserted there.

*Remark.* In `GL_3`, different allocations of slopes to unequal Levi blocks can give different Levi `κ` while mapping to the same `G`-class.

Source: He21, Theorem 6.3 footnote and Section 6.2 pp. 13–14.

*Needs:* §1.11 Kottwitz classification by both invariants; §1.24 Basic Levi Newton formula; ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### 1.32 Quasi-split centralizer in the GL minuscule case

For `GL_n` over a `p`-adic field `L` and `μ(t)=diag(t` repeated `n−q,1` repeated `q`), exactly one class in `B(GL_n/L,{μ^−1})` has quasi-split `J_b`: the ordinary class `diag(π^−1` repeated `n−q,1` repeated `q`). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.

*Proof outline.* Acceptability confines slopes to `[−1,0]`. A nonintegral slope introduces a nontrivial division algebra factor in `J_b` and prevents quasi-splitness. `κ` fixes the multiplicities of the integral slopes−1 and `0`. For `Res` use the single-embedding norm-bound normalization from the source.

*Remark.* For an arbitrary cocharacter with more integral slopes, a quasi-split centralizer need not select the ordinary class.

Source: CS17, Lemma 5.5.8 and preceding footnote p. 748.

*Needs:* §1.13 Algebraic sigma-centralizer; §1.26 Ordinary Newton class; §1.30 Products and unramified restriction of scalars; VectorBundlesAndIsocrystals Layer 1, “Dieudonné–Manin classification of finite isocrystals”; ReductiveGroups Layer 7 (structure theory).

### 1.33 Finiteness and the basic acceptable member

`B(G,{μ})` is finite and has exactly one basic member, characterized by `κ=μ♯`. That member is its minimum for the Newton order. For `μ=0` it is the only member. For tori the whole acceptable set is this singleton.

*Proof outline.* Choose a faithful rational representation. Its Newton slopes lie in the bounded majorization interval given by `μ◇`, with fixed total, and each rational slope denominator divides its multiplicity by Dieudonné–Manin. Thus only finitely many `GL_n` slope tuples occur. The torus weight map is injective, so passage to Weyl orbits has finite fibres. At fixed integral `κ`, injectivity of `(ν,κ)` converts this finite set of Newton points into finiteness of `B(G,{μ})`. Use the general-field classification and linear slope inputs; Kot97/KMPS state the `p`-adic case. The unique basic class of `κ=μ♯` exists by the basic bijection. Its Newton point is the Weyl `average`, hence below every acceptable dominant point by the coroot-cone argument. For `μ=0` the only dominant point below zero with central projection zero is zero. For tori the coroot order is equality.

*Remark.* Zero bound cannot contain a noncentral positive-coroot displacement with the same central projection.

Source: Kot97, Section 6.4 and 6.6 pp. 287–288; KMPS, Lemma 1.1.6 p. 8; RR96, Proposition 2.4(iii) and proof pp. 166–167; Kot14, §13.1–13.3 and Proposition 13.1 pp. 65–66.

*Needs:* §1.23 Acceptable classes B(G,{μ}); §1.18 Basic sigma class; §1.22 Representations detect Newton dominance; §1.11 Kottwitz classification by both invariants; VectorBundlesAndIsocrystals Layer 1, “Dieudonné–Manin classification of finite isocrystals”.

### 1.34 Rational Newton representative

Define an E-rational Newton representative. A rational-Newton witness for `[b]` is an `E`-rational homomorphism `ν_G([b]):D→G` in the G(L)-conjugacy class of `ν_b`, with a specified conjugator. It exists when `G` is quasi-split or `[b]` is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.

*Construction.* Record the actual representative and conjugacy equation. For quasi-split groups choose the Γ-fixed dominant member; for basic classes descend the central morphism.

*Remark.* Galois invariance of an orbit is weaker than having a rational representative in `G`.

The API:

- Build the unique B-dominant rational representative for quasi-split `G`.
- A basic class has a central rational representative.
- Return `Z_G(ν_G([b]))` as an `E`-defined Levi.
- Transport the central Newton morphism to `J_b`, retaining the inner identification.

**Checks.**

- The slope `1,0` map has the diagonal rational representative.
- A basic witness centralizes all of `G`.
- An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

Source: KMPS, 1.1.3 condition 1.1.3.1 p. 7.

*Needs:* §1.8 Newton and Kottwitz invariants; §1.18 Basic sigma class; ReductiveGroups Layer 7 (structure theory).

### 1.35 Minuscule basic Levi lifting

For a connected reductive `G/Q_p`, a rational Levi `M` containing a maximal torus `T`, a `G`-minuscule `μ∈X_*(T)`, and basic `b_M` whose image lies in `B(G,{μ})`, some `w` in the absolute Weyl group `W(G,T)` makes `b_M∈B(M,{wμ})`. For quasi-split `G` the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to `G`*.

The proof includes the exactness statement that the kernel of `π₁(M)_Γ → π₁(G)_Γ` is torsion-free for the Levi subgroups used (KMPS, Proposition `1.1.13`), the unramified replacement of the based-root averaging datum, and the local Cartan inputs (Wintenberger’s realization, the Iwasawa reduction and Mazur’s inequality) in the form required by ReductiveGroupsPartII RG2.4. The Weyl element is taken in `W(G,T)`, with `T` a maximal torus of `M` and hence of `G; W(M,T)` may be too small and the quotient `N_G(M)/M` need not contain it (see the source corrections).

*Proof outline.* Use Wintenberger Cartan realization, Iwasawa reduction and Mazur inequality in the unramified case. Require equality of the integral `π_1(G)` class in the Satake reduction; minuscule dominance alone is insufficient. Use the torsion-free kernel of `π_1(M)_Γ→π_1(G)_Γ` and the matching Galois averages for the unramified replacement. Transport a rational parabolic and its rational Levi by the inner twisting; basic `κ` and `ν` are compatible.

*Remark.* `GL_3` with `M=GL_1×GL_2, μ=(0,1,0), b_M=diag(p,1,1)` needs the absolute Weyl swap; `N_G(M)/M` is trivial.

Source: KMPS, Proposition 1.1.13 and Corollary 1.1.15 pp. 10–12; KMPS, Corollary 1.1.15 p. 11.

*Needs:* §1.24 Basic Levi Newton formula; §1.34 Rational Newton representative; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.36 Torus norm and Newton average

For a torus `T/E, κ:B(T)≅X_*(T)_Γ` and `ν` of the class `κ^−1([λ])` is the rational `Γ-average` of `λ`. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.

*Proof outline.* Apply the valuation/cocharacter description over a splitting extension. Use norm maps and Shapiro to descend the cocharacter class. Identify Newton slopes through all characters with the normalized Galois `average`.

*Remark.* For a quadratic norm-one torus, two integral `κ` classes have Newton `0`.

Source: KMPS, equation (1.1.2.4), p. 6; Kot85, Sections 2.4-2.8 pp. 208–210; Kot14, §12.13 p. 63; Lemma 12.12 and §13.2 p. 65.

*Needs:* §1.11 Kottwitz classification by both invariants; §1.7 Galois averaging and Hodge invariants; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory).

### 1.37 Torus-special acceptable pair

Define a torus-special acceptable pair. For `T⊂G` a maximal torus over `Q_p`, an acceptable pair `([b],{μ})` is T-special if there exists `μ_T∈X_*(T)` in `{μ}` such that the unique class of `B(T)` with `κ_T=[μ_T]` maps to `[b]`. For tori admissibility is determined by `κ`, and the Newton point is the Galois `average` of `μ_T`. This packages local specialness, not a global CM point.

*Construction.* Use the torus Kottwitz bijection to define the class from the cocharacter. State its image equality in `B(G)` as the witness, rather than asserting arbitrary torus specialness.

*Remark.* The witness fixes both the cocharacter orbit and full `κ`.

The API:

- Package `μ_T`, its conjugacy class and its torus-class image equation.
- Recover `μ_T` and the `B(T)` class.
- The mapped class has Newton orbit the image of `average(μ_T)`.
- For elliptic `T` a basic acceptable pair has a T-special witness.

**Checks.**

- For `G=T=G_m, μ=m` gives the class of `p^m`.
- The trivial class with `μ=0` is T-special.
- For `GL_2`, the basic slope `1/2` class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

Source: KMPS, Definition 1.1.7 p. 8.

*Needs:* §1.23 Acceptable classes B(G,{μ}); §1.36 Torus norm and Newton average; ReductiveGroups Layer 7 (structure theory).

### 1.38 Elliptic tori and basic acceptable classes

If `T⊂G` is elliptic modulo `Z(G)`, the image of `B(T)→B(G)` is exactly `B(G)_basic`. For every basic acceptable pair `([b],{μ})` and every `μ_T∈X_*(T)` in `{μ}`, the image of `κ_T^−1([μ_T])` is `[b]`. Thus every such pair is T-special; this argument requires no minuscule hypothesis.

*Proof outline.* Ellipticity makes the rational `average` of every cocharacter central in `G`, so the image is basic. The integral cocharacter quotient maps surjectively to `π_1(G)_Γ`, giving surjectivity onto basic classes. For `μ_T` in the given geometric orbit the image `κ` is `μ♯`; basic-class uniqueness identifies it with `[b]`.

*Remark.* A split nonelliptic torus in `GL_2` also produces nonbasic classes.

Source: Kot85, Proposition 5.3 p. 215; KMPS, Lemma 1.1.8 p. 8.

*Needs:* §1.37 Torus-special acceptable pair; §1.18 Basic sigma class; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; §1.6 Rational Levi descent, elliptic tori and transfer of maximal tori; ReductiveGroups Layer 7 (structure theory).

### 1.39 Specialness for a transferred centralizer torus

Under a rational Newton witness, a `G`-minuscule acceptable pair and a rational transfer `j:T′→M_[b]` of a maximal torus of `J_b`, the pair is j(T′)-special. There is `μ_T′` in the prescribed geometric class whose Galois `average` equals the central morphism `ν_(b,J)`. Such a transfer exists if `G` is quasi-split or `T′` is elliptic; geometric conjugacy alone is not a transfer.

*Proof outline.* Conjugate the Newton representative and transferred torus together; centralize its maximal split subtorus to obtain a rational Levi `M`. The explicit representative `mh·b·σ(mh)^−1` lies in `M(L)` and is basic there. Apply the Levi lift of §1.35, with its absolute Weyl element, and the elliptic-torus specialness theorem in `M`. Transport the `average` equality through the chosen `J_b` inner identification.

*Remark.* The statement retains the rational transfer witness in the non-quasi-split case.

Source: KMPS, Section 1.1.16 and Corollary 1.1.17 pp. 12–13.

*Needs:* §1.34 Rational Newton representative; §1.35 Minuscule basic Levi lifting; §1.37 Torus-special acceptable pair; §1.38 Elliptic tori and basic acceptable classes; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; §1.6 Rational Levi descent, elliptic tori and transfer of maximal tori; ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

### 1.40 Abelianized classes equal fundamental coinvariants

For `p`-adic `E` there is a canonical `B_ab(G)≅π_1(G)_Γ` under which `B(G)→B_ab(G)` is `κ`. In a maximal-torus model this is `coker(B(Tsc)→B(T))`, using `H^2(W_E,Tsc(L^sep))=0` and the torus Kottwitz descriptions.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

*Proof outline.* Apply the cohomology sequence of the two-term torus complex, the vanishing H²(W_E, `T_sc(L^sep)) = 0` of §1.2, and identify the cokernel with the coinvariants of the coroot quotient.

*Remark.* Finite `π_1` torsion survives the comparison.

Source: FS, Lemma III.2.11 p. 94.

*Needs:* §1.3 Abelianized Kottwitz set; §1.36 Torus norm and Newton average; §1.8 Newton and Kottwitz invariants; §1.2 Weil cohomology of crossed modules with L^sep coefficients; EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

### 1.41 Rational Kottwitz images of centralizers

For the unramified `Q_p` model of Kisin17 Lemma 4.6.4, the invariant map `J_b(Q_p)→π_1(G)^Γ` is surjective for every `b`. In the basic tame setting of vH24, the corresponding statement follows by inner-form compatibility with the rational quotient. The surjectivity `G(E) → (π₁(G)_I)^σ` for `G` itself is ReductiveGroupsPartII §RG2.4.2. Its target is Frobenius invariants in inertia coinvariants, distinct from `π_1(G)_Γ`.

Hypotheses: Use Kisin17’s unramified reductive model over `Z_p` for the every-b statement. The separate basic tame application retains the `p`-adic parahoric hypotheses of vH24. No equal-characteristic rational-point extension is asserted.

*Proof outline.* Use §RG2.4.2 for the rational-point quotient of `G`; the target here is its compatibility with the invariant of the centralizer under the stated local hypotheses. Under Kisin’s unramified hypothesis on `G`, use his local abelianized H⁰ comparison and the surjection of Levi invariants, with the vanishing of H¹ for simply connected groups over local fields from EndoscopicTransferAndUnitaryTraceComparison Layer 1. The statement for `J_b` is not asserted beyond these group hypotheses.

*Remark.* A ramified torus can have different invariant and coinvariant groups.

Source: Kot97, Section 7.7 pp. 300–301; Kisin17, Lemma 4.6.4 p. 93; vH24, Lemma 3.4.2 pp. 33–34 and Corollary 3.4.6 proof p. 37.

*Needs:* §1.13 Algebraic sigma-centralizer; §1.8 Newton and Kottwitz invariants; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### 1.42 Component Kottwitz coset

Define the component coset. For `b∈G(L)` and a geometric cocharacter bound `μ`, let `μ_I` be its image in `π₁(G)_I` and set `c_(b,μ)={x∈π₁(G)_I:(σ−1)x=μ_I−κ̃(b)}`. Compatibility means that `μ_I` and `κ̃(b)` have equal images in `π₁(G)_Γ`; it makes this a nonempty affine coset under `(π₁(G)_I)^σ`. This is an affine set of components, with no distinguished origin before a choice. Only when `μ` is defined over `L` can one replace `μ_I` by `κ̃(μ(π))`.

*Construction.* Take the kernel/cokernel sequence of `σ−1` on inertia coinvariants. Full `κ` equality says the difference lies in its image; a chosen solution identifies the fibre with the kernel.

*Remark.* The fibre over a difference is an affine coset of the Frobenius-fixed subgroup, with no chosen origin; an empty fibre is allowed.

The API:

- A component `x` solves the stated difference equation.
- The Γ-coinvariant compatibility is equivalent to nonemptiness.
- Invariant classes act freely and transitively on the fibre.

**Checks.**

- For `σ=id` a nonempty coset requires difference `0` and equals the entire lattice.
- On `Z` with `σ=−id`, the equation `−2x=2` has unique solution `x=−1`.
- On the same lattice difference `1` has no solution; its full coinvariant compatibility fails.
- For `E=ℚ₃`, `π=3`, `E′=E(√3)` and `T=Res¹_(E′/E) G_m`, inertia acts by `−1` on `X_*(T)=ℤ`. A geometric generator `μ` has image `μ_I=1` in `π₁(T)_I=ℤ/2`, on which Frobenius is trivial. With `a=√3`, the induced-torus resolution sends `a` to `a/τ(a)=−1`, where `τ(a)=−a`; its normalized valuation is `1`, so `b=−1∈T(E)` has `κ̃(b)=1`. Thus the compatible component coset is all of `ℤ/2`. In split coordinates `μ(3)=(3,3⁻¹)` is exchanged with its inverse by inertia and is not in `T(L)`; in the norm-one description its proposed coordinate `3` has norm `9`.

Source: the affine-fibre description is the elementary kernel-and-fibre deduction from the integral Kottwitz maps and component condition in GLX, Section 1.1 equations (1.3)–(1.4), p. 807, and Section 2.2, p. 818; it is not a separate theorem stated there. The inertia class and torus normalization are Kot97, §§7.2–7.3, pp. 293–296.

*Needs:* §1.8 Newton and Kottwitz invariants; §1.23 Acceptable classes B(G,{μ}); ReductiveGroupsPartII §RG2.1.5 (the geometric cocharacter class map, inertia coinvariants and torus Kottwitz normalization).

### 1.43 Bounded lifting through a z-extension

For `E` a finite extension of `Q_p` and a z-extension `1→Z→G̃→G→1` with induced torus `Z`, every cocharacter class `μ` lifts after choosing maximal tori. Given `b∈B(G,{μ})` and a chosen lift `μ̃`, there is `b̃∈B(G̃,{μ̃})` above `b`; the induced map of component cosets is surjective. Projection to the adjoint group gives `B(G,{μ})≅B(Gad,{μad})` with the fixed central invariant.

Hypotheses: `E` is a finite extension of `ℚ_p`: the bounded-class, component-coset and adjoint statements are asserted in the scope of Kot97 §6.5 and GLX Lemma 3.16. z-extensions are those of ReductiveGroupsPartII §RG2.1.5.

*Proof outline.* Lift `μ` using the exact cocharacter sequence of the induced torus. Use the adjoint acceptable-set bijection to choose `b̃` with the specified `κ` and Newton bound. Lift differences in the affine coset using invariant-lattice surjectivity and `H^1(E,Z)=0`.

*Remark.* An arbitrary central torus lacks the induced-torus cohomological vanishing used here.

The API includes the component-coset lifting map: over a finite extension of `ℚ_p`, a z-extension and compatible lifts `b̃∈B(G̃,{μ̃})` of `b∈B(G,{μ})` induce a surjection `c_(b̃,μ̃)→c_(b,μ)`.

**Checks.**

- For `G` with simply connected derived group, the identity z-extension induces the identity on each component coset.
- For `G_m×G_m→G_m` projecting to the second factor, with trivial `b̃` and zero `μ̃`, the component map is the surjection `ℤ²→ℤ`.
- For `GL₂→PGL₂`, with trivial `b̃` and zero `μ̃`, the component map is `ℤ→ℤ/2`, reduction modulo `2`; integral torsion remains in the target.

Source: GLX, Lemma 3.16 p. 829; Kot97, Section 6.5 equation 6.5.1 p. 287.

*Needs:* §1.23 Acceptable classes B(G,{μ}); §1.42 Component Kottwitz coset; §1.41 Rational Kottwitz images of centralizers; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5).

### 1.44 Basic classes and adjoint torsors with connected center

If `Z(G)` is a connected torus, `B(G)_basic→B(Gad)_basic≅H^1(E,Gad)` is surjective. The map sends a basic class to the inner form `J_b`. The assertion does not assume this surjectivity for groups with disconnected center.

*Proof outline.* Apply Kottwitz central-torus extension surjectivity to `1→Z(G)→G→Gad→1`. Use its restriction to the basic subsets; for an adjoint group basic Newton is `0` and basic classes identify with `H^1`.

*Remark.* For `SL_n`, the finite center prevents invoking this connected-torus proposition.

Source: Kot14, Proposition 10.4, pp. 50–51 (central-torus surjectivity), §1.3.3, p. 3 (the zero-Newton fibre is H¹), and Proposition 13.1, §13.3, pp. 65–66 (basic classification over nonarchimedean local fields). For `p`-adic E, the torsor identification is PadicHodgeTheory §5.5 `localTorsorKottwitz`; for equal-characteristic E and a general connected reductive H the same zero-Newton description, the basic κ bijection and rational Newton compatibility identify H¹(E,H) with (π₁(H)_Γ)_tors; this supplies the equal-characteristic cohomological identification used above.

*Needs:* §1.18 Basic sigma class; §1.13 Algebraic sigma-centralizer; §1.1 Torus resolutions, invariant lattices and choice of maximal torus; ReductiveGroups Layer 7 (structure theory); EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

### 1.45 Newton comparison for a Levi representative

Let `M_J` be a `σ`-stable standard Levi of a quasi-split based local group `G` and let `b_M∈M_J(L)` map to `b∈B(G)`. Its M_J-dominant Newton point `ν_M` is Weyl-conjugate to `ν_G` and `ν_G−ν_M` is a nonnegative rational sum of simple `G`-coroots. If `κ_M(b_M)=κ_M(t^λσ(η))` in the situation of He §6.2, then `λ◇−ν_M` belongs to the rational span of the J-coroots. This comparison does not require `b` or `b_M` to be basic.

*Proof outline.* Newton functoriality identifies the geometric orbit; choose the dominant representatives in the two chambers. Use Weyl chamber dominance for the first difference and the fundamental-group projection for the J-coroot span conclusion.

*Remark.* The separate basic-Levi uniqueness theorem retains its basic hypothesis.

Source: He21, Section 6.2 p. 13.

*Needs:* §1.8 Newton and Kottwitz invariants; §1.5 Newton orbit space and rational dominance; ReductiveGroupsPartII RG2.1 (root data, `π₁`, z-extensions and the Kottwitz homomorphism, §RG2.1.5); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### Examples

- For split `GL_2` and `μ = (1, 0): B(GL_2, {μ})` consists of the basic class of slope `(1/2, 1/2)` and the ordinary class of slopes `(1, 0)`; the ordinary class is the maximum, and `J_b` is `D^× (D` the quaternion division algebra) for the basic class and `G_m × G_m` for the ordinary one.
- For the unramified norm-one torus, `B(T) = ℤ/2`: both classes have Newton point `0` and are separated only by `κ`.
- For a quaternion division algebra `D, B(D^×)` is in bijection with `B(GL_2)` by `b ↦ bΠ (Π² = π)`, which shifts both slopes by `1/2`; ordinary classes need not exist for inner forms that are not quasi-split.

### Dependencies

Layer 0; ReductiveGroupsPartII §§RG2.1.5, RG2.3, RG2.4; ReductiveGroups Layer 7; VectorBundlesAndIsocrystals Layer 1, “Endomorphisms and arithmetic invariants”, and Layer 4, “Stable blocks, fixed-slope categories and base change”; EndoscopicTransferAndUnitaryTraceComparison Layer 1.

## Layer 2: the stack Bun_G, its points, uniformization and topology

Use the small v-stack `Bun_G`, its geometric classification by `B(G)`, HN semicontinuity and local constancy of `κ` supplied by VStackSheavesAndLisseCategories §VS4.0. Prove Beauville–Laszlo uniformization, the v-descent of families of `G`-isocrystals and the identification of the topology of `|Bun_G|` with the Newton order in both characteristics. The étale and Weil cohomology comparisons on the curve needed for the abelianized invariant come first.

### 2.1 Curve-to-base étale site morphism

Define the curve-to-base étale-site morphism. For `S∈Perf_k`, define `τ:(X_S)_et→S_et` through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection `Div^1×S→S`. Equivalently `τ`* sends étale `T/S` to `X_T/X_S`. This is a site morphism; no geometric projection `X_S→S` is postulated.

The proof includes the two étale-site equivalences for general `E`. DiamondsAndVStacks §D6.5 gives the comparison between an analytic adic space over `ℤ_p` and its diamond; for `E` of equal characteristic the relative curve is an analytic adic space over `F_q((t))` and the corresponding comparison is proved here by the same argument. The equivalence between the étale sites of the curve and of Div¹ (RelativeFarguesFontaine §4.7) is also proved here (FS, proof of Proposition III.2.12).

*Construction.* Compose the inverse of the étale-site equivalences `(X_S)_ét ≅ (X_S^♦)_ét ≅ (Div¹_S)_ét` with the continuous functor induced by the divisor projection Div¹ `× S → S`, and check that finite limits and covers are preserved.

*Remark.* There is no geometric projection `X_S → S`; this is why the morphism is constructed on étale sites.

The API:

- On an étale `T→S, τ`* is `X_T→X_S`.
- The square for `S′→S` commutes up to the natural site equivalence.
- Use the induced adjoint sheaf pushforward and derived pushforward.
- The structural `E`-map induces `RΓ_et(Spa E,F)→Rτ*(F|X_S)`.

**Checks.**

- For geometric `S`, the comparison is the curve/local-field cohomology comparison.
- The zero finite sheaf has zero derived pushforward.
- For `T=S⊔S` in `S_et, τ*(T)` is `X_S⊔X_S` over `X_S`, with the two inclusions preserved. This checks the actual inverse-image site functor.

Source: FS, III.2.4.2 p. 94.

*Needs:* RelativeFarguesFontaine §4.7 (degree-one divisor moduli Div¹); DiamondsAndVStacks Layer D2 (pro-étale and v-sites); DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks); DiamondsAndVStacks §D6.5 (étale sites of an analytic adic space and of its diamond).

### 2.2 Constant torsion cohomology on the curve

For `p`-adic `E, S∈Perf_k` and a locally constant finite abelian sheaf `F` on `Spa(E)_et, Rτ*(F|X_S)` is the constant complex `RΓ_et(Spa E,F)`. For algebraically closed perfectoid `C` the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and `p` coefficients use Artin–Schreier after tilting.

The proof includes the computation at a geometric point `C`: for a finite étale `E`-sheaf `F, H^i_ét(X_C, F)` agrees with `H^i(W_E, F)` by the punctured-period-domain exhaustion of RelativeFarguesFontaine Layer 1 and continuous finite-extension descent (FS, proof of Proposition III.2.12). Prime-to-p torsion uses the qcqs base change of DiamondEtaleCohomology §§C1.11–C1.12; `p`-power torsion is treated separately, by tilting and the Artin–Schreier sequence, which is part of this target.

*Proof outline.* Apply proper base change along `Div^1_S→S` and reduce to geometric `S`. After tilting to equal characteristic, annihilate cohomology on finite separable extensions using Kummer or Artin–Schreier. Use Galois descent and the continuous direct limit over finite field extensions.

*Remark.* The argument is an actual cohomology computation, not a field in the definition of `τ`.

Source: FS, Proposition III.2.12(i) pp. 94–95.

*Needs:* §2.1 Curve-to-base étale site morphism; DiamondEtaleCohomology §§C1.11–C1.12 (qcqs prime-to-p base change, after Scholze, *Étale cohomology of diamonds*, Corollary `16.10`); RelativeFarguesFontaine Layer 1 (relative period annuli and their exhaustion, §§1.2, `1.15`); DiamondsAndVStacks §D6.5 (étale sites of an analytic adic space and of its diamond).

### 2.7 Pro-étale torsors on strictly disconnected bases

Every pro-étale H-torsor on a strictly totally disconnected perfectoid S is trivial when H is a first-countable locally profinite group, in the charted perfectoid universe of DiamondsAndVStacks D1.11 with H a small group. First countability supplies the countable nested system used to choose compatible sections.

*Proof outline.* Use the represented open-subgroup quotients and inverse-limit identification of DiamondsAndVStacks §D3.10. Split the étale quotient cover for a compact open subgroup K, reducing the torsor to K. Choose a countable cofinal nested system of open normal subgroups of K and compatible sections of its finite étale quotients; their limit is a section of the torsor.

*Remark.* A generic torsor on an arbitrary perfectoid base need not be globally trivial.

**Checks.**

- For the trivial ℤ_p-torsor S×ℤ_p, the quotients by pⁿℤ_p are S×ℤ/pⁿ and their inverse limit is S×ℤ_p; compatible zero sections give its zero section, not a section of only one finite quotient.
- For a discrete group H, including S₃, the identity subgroup is compact open and the torsor is an étale cover of S; a section trivializes it as S×H, with six points in each S₃-fibre.
- For H=1 the torsor and its section are S and id_S; uniqueness of a section fails for a trivial ℤ_p-torsor on a nonempty S, which has the distinct constant sections 0 and 1.

Source: FS, Lemma III.2.6, p. 92; Remark III.2.5 supplies the inverse-limit description used in the proof.

*Needs:* DiamondsAndVStacks Layer D2 (pro-étale and v-sites); DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks); DiamondsAndVStacks §D1.4 (strictly totally disconnected perfectoid spaces); DiamondsAndVStacks §D1.9 (universally open strictly totally disconnected covers); DiamondsAndVStacks §D3.10 (torsors under locally profinite groups).

### 2.8 Geometrically trivial open locus

`Bun_G^1` is open and `[*/G(E)]→Bun_G^1` is an equivalence, where `G(E)` has its locally profinite topology and torsors are pro-étale. Prove openness before `κ`-local-constancy: on strictly disconnected bases the `ν=0` locus yields `E`-local systems; their continuous fibre functor is a reductive torsor over `C^0(π_0S,E)`, whose triviality is open by henselian local rings.

*Proof outline.* Use the equivalence of VectorBundlesAndIsocrystals Layer 6, “Slope-zero bundles and E-local systems”, between bundles that are trivial at every geometric point and pro-étale `E`-local systems. On a strictly disconnected base trivialize each local system, preserving its tensor structure. Henselian continuity makes triviality of the fibre-functor torsor an open condition. Identify the automorphism sheaf of the trivial bundle with the constant locally profinite `G(E)` sheaf.

*Remark.* The entire `ν=0` locus can contain nontrivial torsion `κ`; it is not automatically `Bun_G^1`.

Source: FS, Theorem III.2.4 pp. 91–92.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §2.7 Pro-étale torsors on strictly disconnected bases; VectorBundlesAndIsocrystals Layer 6, “Geometric family filtrations and cohomology”; ReductiveGroups Layer 7 (structure theory); DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals Layer 6, “Slope-zero bundles and E-local systems”.

### 2.9 Diagonalizable Weil–curve comparison

For `p`-adic `E` and a diagonalizable algebraic `E`-group `D` of finite type, the pro-étale sheaf associated to `T/S↦H^1_et(X_T,D)` is constant with value `H^1(W_E,D(L^sep))`. For algebraically closed perfectoid `C, H^i(W_E,D(L^sep))≅H^i_et(X_C,D), 0≤i≤2`. The natural map comes from the curve étale site to discrete W_E-sets. Use `1→D^0→D→π_0(D)→1` and retain all finite component contributions.

Hypotheses: `E` is `p`-adic and `D/E` is diagonalizable of finite type throughout the sheaf and degree-`0`-through-`2` comparisons; `L^sep` denotes a separable algebraic closure of `L=Ĕ` (the overline of `Ĕ` in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only `L`-rational points.

The comparison morphism comes from the morphism of §2.1 and the Weil-cohomology inputs of §1.2; its identification with the curve cohomology in degrees `0 ≤ i ≤ 2` uses §2.2.

*Proof outline.* For tori apply geometric classification and translate the neutral fibre using the Picard stack. Use torsion comparison for finite `π_0(D)`, which is étale in characteristic `0`. Use the Weil-torus `H^2` vanishing and compare the long exact sequences through degree `2`.

*Remark.* The proof is not applied to `μ_p` in equal characteristic. For `E=Q_p` with `p` odd, `μ_p(L)={1}`, while `μ_p(L^sep)` has `p` elements with its natural nontrivial inertia action. The coefficient functor must retain this action.

**Checks.**

- For `D=G_m`, the comparison identifies the curve Picard classes with integral rank-one Weil classes.
- For `D=μ_p`, the coefficient group is `μ_p(L^sep)` with its inertia action, including `p=2`; finite type does not mean prime-to-`p` torsion.
- The infinite product `D=∏_(n≥1) μ_(p^n)` is excluded: a tuple of primitive roots has no open inertia stabilizer, so its discrete coefficient action is not continuous. The slope protorus of §1.4 is likewise outside this finite-type comparison.

Source: FS, Proposition III.2.12(ii), comparison morphism and Remark III.2.14 pp. 94–97.

*Needs:* §2.2 Constant torsion cohomology on the curve; §2.8 Geometrically trivial open locus; §1.36 Torus norm and Newton average; §1.2 Weil cohomology of crossed modules with L^sep coefficients; EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

### 2.10 Constant crossed-module curve classes

For `p`-adic `E`, the pro-étale sheaf associated to `T/S↦H^1_et(X_T,[Gsc→G])` is constant with value `B_ab(G)`. The comparison identifies the curve abelianization of a bundle with its `κ` class.

*Proof outline.* Use the homotopy-equivalent center complex `[Zsc→Z]`, whose centers are finite-type diagonalizable groups. Apply diagonalizable comparisons in degrees `1` and `2` to its long exact sequence. Compare the curve and Weil abelianization maps; this is the second, `p`-adic-only proof of `κ`-local-constancy.

*Remark.* The first uniformization proof of `κ`-local-constancy remains independent of this second comparison proof.

Source: FS, Proposition III.2.13 p. 96.

*Needs:* §1.40 Abelianized classes equal fundamental coinvariants; §2.9 Diagonalizable Weil–curve comparison; §1.2 Weil cohomology of crossed modules with L^sep coefficients; EndoscopicTransferAndUnitaryTraceComparison Layer 1 (crossed-module Galois cohomology and abelianization, §§1.1, 1.5, `1.11`).

### 2.11 Grassmannian point lifting

For strictly totally disconnected `S=Spa(R,R+)` over `Spa(E)` and `s∈S, Gr_G(R)→Gr_G(K(s))` is surjective. Split `G` after a finite field extension embedded in `R`, use the Cartan decomposition, and lift `G(B_dR^+(K(s)))` through successive nilpotent thickenings by smoothness and `Lie` algebra surjectivity.

The lifting uses only the Schubert bounds of GeometricSatakeAndFusion GS0; the identification of connected components of the Grassmannian is not needed here.

*Proof outline.* Use the clopen-component argument to get `R→K(s)` surjective. Lift group points using henselian smooth lifting. Lift the positive period-ring points by the complete filtration and successive `Lie` corrections.

*Remark.* This supplies relative lifting from the fixed-point uniformization theorem.

Source: FS, Lemma III.3.2 p. 98.

*Needs:* GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition); DiamondsAndVStacks Layer D2 (pro-étale and v-sites); RelativeFarguesFontaine §§4.12–4.13 (the completed local ring `B_dR⁺` at an untilt); DiamondsAndVStacks §D1.4 (strictly totally disconnected perfectoid spaces); DiamondsAndVStacks §D1.9 (universally open strictly totally disconnected covers).

### 2.12 Beauville–Laszlo uniformization

The modification map `BL:Gr_G→Bun_G` is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every `G`-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.

*Proof outline.* Apply Anschütz’s geometric-point modification theorem for arbitrary connected reductive `G`. Lift the modification by the Grassmannian point-lifting lemma. On its open trivial locus split the locally profinite torsor and choose a trivialization. Descend the local modifications along the pro-étale cover.

*Remark.* The gluing map itself is that of RelativeFarguesFontaine §7.7; the target here is its v-surjectivity onto `Bun_G`.

Source: FS, Proposition III.3.1 p. 98; Ans19, Theorem 6.5 p. 30.

*Needs:* §2.8 Geometrically trivial open locus; §2.11 Grassmannian point lifting; VStackSheavesAndLisseCategories §VS4.0; §2.7 Pro-étale torsors on strictly disconnected bases; RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice); ReductiveGroups Layer 7 (structure theory).

### 2.13 Central-torus Grassmannian surjectivity

For a central extension `G̃→G` with torus kernel `Z`, `Gr_G̃→Gr_G` is surjective as a v-sheaf. After a finite splitting extension, lift the dominant cocharacter through the split torus lattice sequence. The corresponding map of bounded Schubert closures is surjective on geometric points and quasicompact, hence a v-cover. Schubert bounds and properness are those of GeometricSatakeAndFusion GS0.

*Proof outline.* Pass v-locally to a finite splitting extension and lift the dominant cocharacter through the exact split torus lattice sequence. On a geometric point with complete algebraically closed coefficient field `C`, the split torus kernel has `H¹(B_dR(C),Z)=0` by Hilbert 90. Lift the group point and use the Cartan decomposition to obtain a lift in the specified bounded Schubert closure. The source Schubert closure is quasicompact and the target quasiseparated over `Spd(E)`, because both are proper. The geometrically surjective bounded map is therefore a quasicompact v-cover. Use the Schubert exhaustion to cover the full Grassmannian.

*Remark.* Unlike rational-point z-extension lifting, this geometric statement needs a torus kernel but not an induced torus.

Source: FS, Lemma III.3.5 p. 99.

*Needs:* §1.1 Torus resolutions, invariant lattices and choice of maximal torus; GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness); ReductiveGroups Layer 7 (structure theory).

### 2.14 Central-torus bundle surjectivity

For a central extension `G̃→G` with torus kernel `Z, Bun_G̃→Bun_G` is a v-surjection. `Bun_Z` acts by central tensor product and `Bun_G` is its quotient stack; the action is a quasi-torsor before surjectivity is proved.

*Proof outline.* Lift a bundle to a Grassmannian point by BL, then lift that point along the central-torus map. Identify its ambiguity with a Z-bundle via the contracted product and descend.

*Remark.* No circular use of `κ`-local-constancy is made in this proof.

Source: FS, Lemma III.2.10 and proof after III.3.5 pp. 93,99.

*Needs:* §2.12 Beauville–Laszlo uniformization; §2.13 Central-torus Grassmannian surjectivity; RelativeFarguesFontaine §7.0 (tensor–torsor dictionary); DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks).

### 2.16 Kottwitz invariant in isocrystal families

For an F_q-scheme `S` with a `G`-isocrystal family, the function `s↦κ(E_s)` in `π_1(G)_Γ` is locally constant. Perfectifying `S` preserves the relevant topology. Analytify the family to the curve and apply bundle `κ`-local-constancy; this proves the assertion of FS III.2.8 for families; the descent statement of §2.17 does not use it.

*Proof outline.* After perfection write a Frobenius family on `Spec R` and associate the map `Spd(R,R)→Bun_G`, as in FS III.2.8. Pull back the clopen `κ` fibres along that map. Apply SW Proposition 18.3.1, the bijection between clopen subsets of `Spd(R,R)` and `Spec R`; this proves scheme-topological local constancy. No commuting support or valuation map is assumed.

*Remark.* The local constancy of `κ` on `Bun_G` does not use this corollary.

Source: FS, Corollary III.2.8 pp. 92–93; SW, Proposition 18.3.1 §18.3.

*Needs:* §0.8 Families of `G`-isocrystals; VStackSheavesAndLisseCategories §VS4.0; VectorBundlesAndIsocrystals Layer 2, “The exact tensor isocrystal-to-bundle functor”; DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks).

### 2.17 Isocrystal-family v-descent and strata

The G-isocrystal family prestack is a v-stack on perfect F_q-schemes, with locally closed loci of fixed geometric class. After base change to F̄_q, its stratum indexed by b∈B(G) is equivalent to [*/J_b(E)] for the constant locally profinite rational-point group, using a representative over L to choose the neutral object. This is the family stack statement of FS `I.2.1`; the algebraic classifying stack `[*/J_b]` and the bundle stratum with its full automorphisms are different objects.

Prove the Newton closed-locus theorem: for each `b∈B(G)`, the substack where every geometric fibre has `κ=κ(b)` and `ν≤ν_b` is a perfectly finitely presented closed substack. On a perfect affine chart its ideal is the perfection of a finitely generated ideal. Reduce the Newton inequalities to finitely many representations, as in RR96 Theorem 3.6(ii), then use the linear Newton-polygon closed-locus theorem; in equal characteristic use the argument of HV11 Theorem 7.3. Integral `κ` is locally constant by §2.16, so its fibre is open and closed. The combined statement for the family stack is GIZ26 Theorem 6.8. Finite generation, rather than closedness alone, is needed for the Bézout-ring step in §2.20.

*Proof outline.* Use Iva23, Lemma 5.9 and Proposition 5.10, for arc-descent of vector bundles over the coefficient rings in both characteristics; Ans22, Lemma 11.3, extends it to `G`-torsors by exact tensor reconstruction, exactness being reflected because the coefficient-ring map meets every maximal ideal (Iva23, Corollary `5.6`). Descend the Frobenius isomorphism by full faithfulness. Arc-descent gives v-descent, independently of `κ`-local-constancy. Ans22, Theorem 11.4, trivializes the underlying coefficient-ring torsor v-locally: its proof reduces to absolutely integrally closed valuation rings of finite rank and uses Steinberg’s theorem in rank `0`, the extension of torsors over the punctured period ring in rank `1`, and valuation-ring excision and induction in higher rank; these three inputs are part of this target. The resulting presentation is LG/Ad_σ LG. Only after descent, use Newton semicontinuity and the local constancy of `κ` (§2.16) to construct the locally closed loci of constant class. For the neutral-stratum comparison, first base change to F̄_q. Cover such a geometric locus in the v-topology by spectra of products of perfect normal valuation rings over F̄_q, and choose the connected smooth affine O_E-model of ReductiveGroupsPartII RG2.3 required by HK22 §2.1. On each normal piece follow HK22 (v5), Proposition 2.10 and Theorem 2.11: separate the least slope by `Φ = π^{−r}φ^s` and construct an effective lattice. The lattice bound of its Lemma 2.9 must include the Frobenius denominator `d` of the initial rank-h lattice: the minimal effective over-lattice `Σ_{i<h} Φ^i M₀` lies in `π^{−d(h−1)} M₀` (Zin01, Lemma `9`), and no bound depends on the Newton polygon alone. Local freeness over a general perfect base uses the proper lattice-moduli cover. For an effective local shtuka, HK22 Lemma 2.8 represents finite-level fixed sections by affine étale schemes; constant slope-zero multiplicity makes them finite étale, and the inverse limit trivializes the étale part on a profinite étale cover. Induct through the least slopes as in Proposition 2.10. For `G`, reconstruct its defining tensor line `i₀:L₀↪t(V₀)` in a faithful representation. Prove the tensor-orbit lifting theorem as follows. Put `H=Hom_Φ(L₀,t(V₀))`, a finite-dimensional `E`-space, and `A=Aut_Φ(V₀)×Aut_Φ(L₀)`, acting by `(j,l)·i=t(j)∘i∘l⁻¹`. These automorphism groups are the algebraic centralizers of the corresponding linear isocrystals. The stabilizer of `i₀` in A is `J_b`, by the tensor description, and is smooth by §1.13. The locally closed algebraic orbit `O=A·i₀` is therefore `A/J_b`, and `A→O` is smooth. Its map on `E`-points has local continuous sections through every point in its image: factor a smooth morphism locally as an étale map followed by an affine-space projection, then apply Hensel lifting and continuity of simple roots. This is the local argument in the proof of Conrad Lemma `A.2.1`; it does not require all `O(E)` to lie in one rational orbit. The continuous embedding family on the profinite normal chart takes values in `A(E)·i₀` by the constant-isogeny-class hypothesis. Pull back these local sections and refine by clopen neighbourhoods; changing both trivializations by `(j,l)` makes `i` constant. Keeping the line automorphism `l` is essential to the smooth-stabilizer argument in positive characteristic. The `Isom` sheaf is thus a torsor for the locally profinite `J_b(E)`, and v-descent identifies the geometric stratum with [*/J_b(E)] over perfect F̄_q-bases. This does not identify the arithmetic stratum over F_q with a constant neutral stack. The theorem of HK22 needs normality, and no profinite étale trivialization over a non-normal perfect base is asserted. The construction gives neither the algebraic classifying stack `[*/J_b]` nor the positive-kernel automorphism group of a curve bundle.

*Remark.* Over perfect normal F̄_q-charts the geometric stratum is trivialized profinite étale locally; over a general perfect F̄_q-base only v-locally. A rank-two slope-zero shear with off-diagonal coefficient `π^{−N}` needs a lattice denominator `c ≥ N`, so the Newton polygon alone does not bound the effective lattice; and an ambient linear lift of a tensor-line embedding need not preserve the tensors (for the norm-one torus, the map `(x₀, x₁) ↦ (2x₀, x₁ − x₀/2)` is invertible but is not of the form `(t x₀, t⁻¹ x₁)`).

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
- Over R=𝔽₃ with E=ℚ₃, b=[[0,3],[1,0]] has b²=3I and slopes (1/2,1/2). Here σ=id, and Xb=bX forces X=[[a,3d],[d,a]], so the automorphisms are the commutative group ℚ₃(√3)×. Every matrix in this geometric slope stratum is nonscalar, and its centralizer algebra in M₂(ℚ₃) is commutative; triviality of GL₂-torsors over ℚ₃ excludes a hidden object with quaternion automorphisms. Thus the arithmetic stratum cannot be the neutral stack of D× for the quaternion division algebra D/ℚ₃.
- Over F̄₃ choose i in the unramified quadratic extension with i²=−1 and σ(i)=−i. Put j=diag(i,−i). Both b and j satisfy g b=b σ(g), while b²=3I, j²=−I and bj=−jb. These noncommuting automorphisms recover the quaternion algebra on the geometric base and distinguish it from the arithmetic centralizer.
- For the norm-one torus the displayed ambient matrix does not preserve the tensor; the lift must lie in `A(E)` and preserve the pair after both trivializations are changed.
- In characteristic `p`, acting on a tensor line by the pth power can give the nonsmooth stabilizer `μ_p` if its basis is fixed. Retaining `Aut_Φ(L₀)` replaces that stabilizer by the graph of the character and makes the smooth-orbit argument applicable.

Source: FS, Theorem I.2.1, p. 11; Iva23, Corollary 5.6, p. 13, Lemmas 5.8–5.9 and Proposition 5.10, pp. 14–15; Ans22, Lemmas 11.2–11.3 and Theorem 11.4, pp. 34–36; HK22, v5, Lemmas 2.8–2.9, pp. 7–8, Proposition 2.10, p. 8, and Theorem 2.11, p. 9; Zin01, Lemma 9 and its proof, pp. 11–12 of the author copy; Conrad12, proof of Lemma A.2.1, p. 62 (the local continuous-section argument for a smooth map); GIZ26, Theorem 6.8, p. 41; RR96, Theorem 3.6(ii) and proof, pp. 171–172; HV11, Theorem 7.3, p. 28 of arXiv v3.

*Needs:* §0.8 Families of `G`-isocrystals; §1.13 Algebraic sigma-centralizer; §2.16 Kottwitz invariant in isocrystal families; DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks); ModularCurves §0E (effective faithfully flat descent of affine schemes); SchemeAndStackFoundations §§1.15 and 2.3 (torsor carriers and descent); AlgebraicModuliForArithmeticGeometry §3.1 (module descent and finite local freeness); VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”, and Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”; DiamondsAndVStacks Layer D2 (pro-étale and v-sites); ReductiveGroups Layer 1 (representations and comodules); ReductiveGroupsPartII RG2.3 (parahoric group schemes and Lang’s theorem); Mathlib `Submodule`.

### 2.18 Grassmannian components and Kottwitz sign

For split `G`, the decomposition `Gr_G=∐_(α∈π_1G) Gr_G^α` has each component a filtered union of proper Schubert closures with `[μ]=α`. On the modification map in GS0 indexing, `κ(BL(x))=α` (followed by Γ-coinvariants for nonsplit `G`). For nonsplit `G`, use geometric `π_1` with Galois descent and then its Γ-coinvariant image in `Bun_G`. A component decomposition alone does not prove uniformization or bundle connectedness.

*Proof outline.* The decomposition of the Grassmannian into components indexed by `π₁(G)`, its Schubert exhaustion and nonsplit descent are proved here from the Schubert bounds of GeometricSatakeAndFusion GS0 (Zhu17, Proposition 1.21; FS III.3.6): over a splitting field, the component of a point is the class in `π₁` of the relative position of its geometric points, and the components are connected because each is a filtered union of the connected Schubert closures it contains; Galois descent passes to inertia and Galois coinvariants. Evaluate on the GS0 cocharacter lattice `μ(ξ)` to fix the positive Kottwitz sign, and use the local constancy of `κ` (VStackSheavesAndLisseCategories §VS4.0) and connectedness of the Schubert pieces to extend the equality.

*Remark.* For `G_m`, the lattice `ξ^m B_dR⁺` produces `O(−m)` with `κ=m`. Its CS Schubert label is `−m` while its GS label is `m`.

**Checks.**

- The lattice `ξ B_dR⁺` has GS component `1`, bundle `O(−1)` and Kottwitz invariant `1`.
- The lattice `ξ⁻¹ B_dR⁺` has GS component `−1`, bundle `O(1)` and Kottwitz invariant `−1`; inverting the label changes both signs.
- For `GL₂`, `diag(ξ,1)(B_dR⁺)²` has determinant component `1` and bundle `O(−1)⊕O`, with isocrystal slopes `(1,0)`.

Source: FS, Proposition III.3.6(i),(iii), pp. 99–100, for the component decomposition and exhaustion; Zhu17, Proposition 1.21 p. 427. The positive sign here follows from RelativeFarguesFontaine §7.7, `modify_gm_degree`, and the GS lattice identification in GeometricSatakeAndFusion GS0. FS III.3.6(ii) states the negative sign in its presentation.

*Needs:* §1.8 Newton and Kottwitz invariants; VStackSheavesAndLisseCategories §VS4.0; GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice).

### 2.19 Period-space descent and the valuation boundary

For a perfect F_q-algebra A, let `S=Spec` A and give `W_{O_E}(A)` the π-adic topology. Define the boundary period space on open v-subsheaves `F` of S^diamond by taking the open subspace `Y_F` of `Spa(W_{O_E}(A)[1/π],W_{O_E}(A))` whose diamond is `F×Spd(E)`. This is a period-space construction with the outer boundary retained; the usual relative period domain removes that boundary. It is independent of the affine presentation of `F` and commutes with open restriction, fibre products and Čech nerves.

The construction uses ramified Witt vectors in mixed characteristic and `A[[π]]` in equal characteristic. Choose the perfectoid extension `E_infinity` used in GIZ26 §3.1; the displayed spaces become perfectoid after completed base change to `E_infinity`. The conservative, faithful base-change functor of its Proposition 3.13 permits gluing the open subspaces. No construction of meromorphic bundles or of a shtuka stack is involved.

The API:

- For `F=(Spec` A)^diamond, `Y_F` is `Spa(W_{O_E}(A)[1/π],W_{O_E}(A))`, with π-adic coefficients.
- For a perfectoid pair `(R,R⁺), F=Spd(R⁺,R⁺)` with the adic topology gives `Y_F=Spa(A_inf(R⁺),A_inf(R⁺))` minus `V(π)`, denoted `Y_(0,infinity]`. For `F=Spa(R,R⁺)`, remove `V(π[ϖ])` instead, giving `Y_(0,infinity)`. Here `ϖ` is a pseudouniformizer of `R`.
- Finite locally free bundles on E_infinity-sousperfectoid spaces satisfy effective v-descent as exact `E`-linear tensor categories. This is the vector-bundle form of GIZ26 Corollary 3.10; prove it directly by the vector-bundle descent argument of SW19.5.3 after perfectoid base change, and descend morphisms, locally free modules and exactness. Perfect complexes of arbitrary amplitude are not needed.
- The v-descent limit of `Vect(Y_X)`, over affinoid perfectoid `X→F`, is naturally equivalent to `Vect(Y_F)`, preserving exact sequences, tensors, duals and Frobenius pullback. Apply the preceding v-descent theorem to the affinoid perfectoid covering sieve of `F` and the Čech-compatible construction of `Y_F`. This is GIZ26 Theorem 3.16, and uses descent, rather than a slope-extension assertion.
- For `R⁺=R^circ` and either characteristic of `E`, restriction of Frobenius-equivariant bundles from `Y_(0,infinity]` to `Y_(0,infinity)` is fully faithful. For `R=C` an algebraically closed perfectoid field it is an equivalence. Iterate Frobenius to reduce to `Y_[r,infinity]` for `r>0`, and the bounded Frobenius-fixed-section argument of Pappas–Rapoport 2024 Proposition 2.1.3. Keep the hypothesis `R⁺=R^circ`. The extension to the coefficient ring `O_E` follows Pappas–Rapoport 2024 Remark 2.1.10 and GIZ26's use of the same argument for general `E`.
- Let `V` be a perfect rank-one valuation ring over `F_q`, choose a nonzero nonunit `ϖ∈V`, and write `Vhat` for its ϖ-adic completion and `K=Vhat[1/ϖ]`. A schematic `G`-isocrystal family over `V` gives, by analytification, a Bun_G-family on `Spd(V,V)`, where `V` here has the discrete topology. If its residue-field class is `b`, the restriction to the open subsheaf `Spd(Vhat,Vhat)` has constant geometric class `b`. To prove this, use the boundary vector-bundle comparison to realize the restricted exact tensor family as Frobenius-equivariant bundles on `Y_{K,(0,infinity]}`. Apply restriction of Frobenius-equivariant bundles and geometric vector-bundle classification (FS II.2.14) to obtain the residue-class comparison in the proof of GIZ26 Theorem 7.18, `p. 52`. Extend isomorphisms representation by representation through full faithfulness; uniqueness preserves the tensor and unit constraints. The input family is already exact, so this argument does not infer exactness merely from a fully faithful functor. This is a statement about the family induced by the schematic isocrystal, not an assertion that every open-period-space bundle admits a boundary extension.

**Checks.**

- For `F=Spd(R⁺,R⁺)` with its adic topology, a point with `[ϖ]=0` and `π≠0` belongs to `Y_F`; it is excluded for `F=Spa(R,R⁺)`. Giving both `F` the same period domain loses the valuation-boundary point.
- For the constant rank-one isocrystal `π^mσ` over `V`, the induced boundary family has bundle `O(−m)` at both points of `Spd(Vhat,Vhat)`, for `m=0` and `m=1`. The construction therefore preserves the fixed slope sign at the boundary.
- Restriction of Frobenius-equivariant bundles requires `R⁺=R^circ`: for a proper valuation subring `C⁺⊊O_C` the boundary category can depend on `C⁺` while the open category does not (Pappas–Rapoport 2024, arXiv v6, p. 14). No equivalence for that pair is asserted.
- For `G=1` the constant-class assertion gives the unique bundle; for an unramified norm-one torus it retains the chosen integral `κ` class, even when both classes have Newton point zero. The tensor comparison, rather than equality of representation slopes alone, is needed for the latter test.

Source: GIZ26, §3.1, pp. 13–17, Corollary 3.10, p. 15, Proposition 3.13 and Lemma 3.14, pp. 15–16, Remark 3.15 and Theorem 3.16, p. 17, and the schematic-to-Bun direction in the proof of Theorem 7.18, p. 52; Pappas–Rapoport 2024, arXiv v6, Proposition 2.1.3 and proof, pp. 14–16, Remark 2.1.4, p. 14, and Remark 2.1.10, p. 19; SW, Proposition 19.5.3, pp. 180–181; FS, Theorem II.2.14, p. 70.

*Needs:* §0.8 Families of `G`-isocrystals; VStackSheavesAndLisseCategories §VS4.0; §2.16 Kottwitz invariant in isocrystal families (the family analytification); RelativeFarguesFontaine Layer 1 (period spaces, coefficient rings, perfectoid base change); VectorBundlesAndIsocrystals Layer 2, “Finite locally free bundles on the curve”, and Layer 4, “Geometric classification of vector bundles”; DiamondsAndVStacks Layers D2–D4 (v-descent, small v-sheaves and open subsheaves).

### 2.20 Newton topology theorem in both characteristics

For every nonarchimedean local field `E` and connected reductive `G/E`, the geometric-class bijection `|Bun_G|→B(G)` is a homeomorphism for the topology whose closed subsets are upward closed in the fixed-κ Newton order. Equivalently, `[b]≤[b′]` iff `E_b′` lies in the closure of `E_b`.

Hypotheses: `E` is a nonarchimedean local field of either characteristic, with finite residue field; `G/E` is connected reductive, with no quasi-split or unramified hypothesis. Use GIZ26 arXiv v3: its §2 and Remark 2.1 allow both characteristics. He16 §2.5 restricts the schematic closure discussion to equal characteristic; use Vie21 for the mixed-characteristic route.

*Proof outline.* Geometric point classification, HN semicontinuity and integral `κ`-local-constancy give a continuous bijection to the reversed Newton topology, hence one implication on specialization. In mixed characteristic, use Vie21 Theorem 1.1 with its finite-Q_p-extension hypothesis.

In equal characteristic, He16 Theorems 1.29 and 2.12 identify schematic specialization with fixed integral `κ` and Newton dominance. Use the straight-class and affine Bruhat inputs of §1.10 and ReductiveGroupsPartII RG2.4, retaining inertia torsion. On finite bounded loci the topology is determined by specialization, as in GIZ26 Lemma 7.17. For a covering relation `b≤b′`, realize the schematic specialization by a perfect rank-one valuation ring `V` over F̄_q, using the geometric family stack of §2.17, with closed class `b` and generic class `b′`: the proof of GIZ26 Theorem 7.18, pp. `51–52`, passes to a product comb, applies the Newton closed-locus theorem to obtain a finitely generated defining ideal, makes it principal by Proposition 2.17, and cuts a valuation-ring component around a nonzero nonunit. Proposition 2.17 itself asserts the Bézout property, not this rank-one realization.

Analytify that family on `Spd(V,V)`. By the boundary-family constant-class comparison the completed open subsheaf `Spd(Vhat,Vhat)` lies in `Bun_G^b`. Its v-sheaf closure is `Spd(V,V)`, which also contains the discrete generic-field locus of class `b′`. Thus `E_b′` lies in the closure of `E_b`. Iterate along the finite bounded specialization chains. This gives the missing implication; the reverse implication already follows from HN semicontinuity and `κ`-local-constancy. The meromorphic comparison of GIZ26 Theorem 7.13 and its parahoric shtuka-stack constructions are unnecessary for this proof.

**Checks.**

- In the `GL_2` fibre `κ=1`, slopes `(1/2,1/2)≤(1,0)`; the ordinary bundle point is in the closure of the basic point. Reversing this direction fails the rank-two extension example.
- For `G_m`, equal `κ` forces equal class, so each Newton point is open and closed.
- The two norm-one-torus classes have equal Newton point but different integral `κ`; neither specializes to the other.

Source: GIZ26, §2 and Remark 2.1, pp. 6–7, Proposition 2.17, p. 11, Lemma 7.17, pp. 50–51, and only the schematic-to-Bun direction of Theorem 7.18, pp. 51–52; He16, §1.10.5, Theorem 1.29, pp. 20–21, §§2.2 and 2.4–2.6, pp. 22, 25–28, Theorem 2.12, p. 28; Vie21, Theorem 1.1 and topology convention, p. 2; FS, Conjecture III.2.15, p. 97.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §2.19 Period-space descent and the valuation boundary; §2.17 Isocrystal-family v-descent and strata; §1.10 Straight Weyl comparison with B(G); ReductiveGroupsPartII RG2.4 (Iwahori–Weyl group, lengths, admissible sets, Cartan decomposition).

### 2.21 CS-to-GS comparison of the modification bound

For connected reductive G/ℚ_p and any geometric cocharacter class μ, transport the arbitrary-cocharacter modification bound of IgusaVarietiesAndTorsionConcentration §3.4 from CS to GS0 indexing. Under this comparison a geometric point of Gr^GS_(G,μ) modifying the trivial bundle has b∈B(G,{μ}). For `GL_n` its bundle Newton tuple is dominated by `(−μ)^dom` with total degree `−Σμ_i`; translate through `ν_bundle=w_0(−ν_isocrystal)`. The full `κ` equality is `μ♯`. In CS indexing the same cell has label `η=(−μ)^dom` and the bound is `B(G,{η⁻¹})`.

*Proof outline.* Identify the cells by Gr^CS_η=Gr^GS_((−η)^dom), with η=(−μ)^dom. The inverse cocharacter class {η⁻¹} is {μ}, so both the Newton inequality and the integral Kottwitz equality transport from IgusaVarietiesAndTorsionConcentration §3.4. For GL_n apply the involution ν↦w₀(−ν) to express the same dominance inequality on bundle slopes, using the slope and degree normalization of RelativeFarguesFontaine §7.7.

*Remark.* The inverse bound in CS17 is transported through `Gr^CS_η=Gr^GS_((−η)^dom)`; it is the direct bound for the GS label.

**Checks.**

- For `GL₂` and GS label `(1,0)`, ordinary slopes are `(1,0)` and basic slopes are `(1/2,1/2)`, both with `κ=1`.
- The lattice `ξ B_dR⁺` for `G_m` gives `O(−1)`, hence isocrystal slope `1`, rather than the inverse-bound slope `−1` for the same GS label.
- For `GL₂`, slopes `(2,−1)` have the required total but exceed `(1,0)` at the first partial sum and cannot occur in that cell.

Source: CS17, Proposition 3.5.3 and Lemmas 3.5.4–3.5.5, pp. 687–689, after the CS-to-GS label conversion in the Conventions.

*Needs:* IgusaVarietiesAndTorsionConcentration §3.4 (arbitrary-cocharacter modification bound); VStackSheavesAndLisseCategories §VS4.0; §1.23 Acceptable classes B(G,{μ}); RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice); GeometricSatakeAndFusion GS0 (generic Schubert bounds and properness).

### 2.22 Minuscule modification image

For minuscule `μ` over `Q_p` in GS0 indexing, the map from the flag variety `Fℓ^GS_(G,μ)≅Gr^GS_(G,μ)` to `B(G,{μ})` is surjective on geometric classes. This is stronger than the invariant containment for all `μ` and uses the Rapoport existence result recalled by CS17 Remark 3.5.8.

*Proof outline.* Use the minuscule identification of the Schubert cell with the flag variety from GeometricSatakeAndFusion GS0. Every acceptable class occurs by Rapoport, *Accessible and weakly accessible period domains*, appendix to Scholze, *On the p-adic cohomology of the Lubin–Tate tower*, Proposition A.9. The Newton bound gives a nonempty weakly admissible locus; the admissible locus has the same classical points and is therefore nonempty. At an admissible point the inverse modification is semistable. The integral equality `κ(b)=μ^♮` makes its Kottwitz invariant zero, so the basic classification identifies it with the trivial bundle. Reversing this modification realizes `b` from the trivial bundle. Both parts of acceptability enter this existence argument, which is part of the target.

*Remark.* A nonempty acceptable index set alone does not produce a flag point.

**Checks.**

- For `GL₂` with GS label `(1,0)`, both the ordinary class `(1,0)` and basic class `(1/2,1/2)` occur on the flag line.
- A central minuscule cocharacter gives a point and its unique acceptable class.
- The class `(2,−1)` has no point for GS bound `(1,0)` despite its matching Kottwitz invariant; surjectivity is only onto the acceptable set.

Source: Rap15, Proposition A.9, p. 42; CS17, Remark 3.5.8 p. 689, after the CS-to-GS label conversion.

*Needs:* §2.21 CS-to-GS comparison of the modification bound; §1.23 Acceptable classes B(G,{μ}); GeometricSatakeAndFusion GS0 (open Schubert cell smoothness).

### 2.23 Class from a de Rham quotient-group lattice

In Liu–Zhu Corollary 4.9, the tensor functor has domain `Rep_(Q_p)(G^c)`, where `G^c=G/Z_G^s`. At a classical point embedded into `C_p`, its de Rham comparison defines compatible `B_dR^+` lattices. The Fargues tensor modification construction therefore gives a class in `B(G^c_(Q_p))`. Producing a class in `B(G_(Q_p))` requires a chosen compatible lift or additional `G`-level tensor data. No canonical lift is claimed.

*Proof outline.* Apply the de Rham comparison at the point in every rational representation of `G^c`, use the exact tensor lattice-to-bundle functor of RelativeFarguesFontaine §7.7, and classify the resulting bundle. The class lies in `B(G^c)`; a central-torus v-surjectivity statement gives local existence of lifts but no canonical lift to `G`.

*Remark.* The class is defined for the quotient group `G^c` (Liu–Zhu, Remark 4.1(iii)); a class for `G` needs extra tensor data or the hypothesis `G = G^c`.

Source: LZ17, Corollary 4.9 and Remark 4.1(iii) pp. 33–34.

*Needs:* RelativeFarguesFontaine §7.0 (tensor–torsor dictionary); VStackSheavesAndLisseCategories §VS4.0; §2.14 Central-torus bundle surjectivity; RelativeFarguesFontaine §§7.2, 7.7 (Beauville–Laszlo gluing of `G`-bundles and modification by a B_dR⁺-lattice).

### Examples

- For `G = GL_2`, the points of `|Bun_G|` of degree `d` are the semistable bundle (`O(d/2)` for `d` odd, `O(d/2)²` for `d` even) and the bundles `O(a) ⊕ O(d − a)` with `a > d/2`. The semistable point is open, and every other point of degree `d` lies in its closure.
- For `G = G_m, Bun_G = ⊔_{d ∈ ℤ} [*/E^×]` and each point is open and closed.

### Dependencies

Layers 0–1; VectorBundlesAndIsocrystals Layers 2–6 (analytic bundles, algebraization, classification, Banach–Colmez spaces and families); RelativeFarguesFontaine Layers 1, 4 and 7; GeometricSatakeAndFusion GS0; DiamondsAndVStacks Layers D0–D6; DiamondEtaleCohomology §§C1.11–C1.12.

## Layer 3: automorphism groups, Newton strata and the smooth Artin stack

Use the HN-graded, full-automorphism and stratum contracts of VStackSheavesAndLisseCategories §VS4.0 and the flag-stratum contracts of IgusaVarietiesAndTorsionConcentration §§3.4–3.5. Develop filtered relative automorphism group schemes, compute stratum dimensions, and deduce the connected components `π₁(G)_Γ` from the supplied smooth Artin structure.

### 3.3 Filtered torsor automorphism group schemes

Define the rational-threshold automorphism filtration using HodgeTateAndCanonicalSubgroups §2.14, `TauCeti.HodgeTate.filteredFiberFunctor_split`, for the integer-filtered carrier, splitting torsor and parabolic/unipotent/Levi constructions. For a reductive `G/K`, scheme `X/K` and Q-filtered `G`-fibre functor `E`, let `H=Aut_G(E)`, its inner group over `X`. For `λ≥0`, `H^≥λ` consists of automorphisms whose difference from `1` raises every represented filtration by at least `λ`. Rational reindexing identifies `H^≥0` with the supplied parabolic and `H^>0` with its unipotent radical. The higher raising groups are smooth, `Lie H^≥λ=(ad E)^≥λ`, and for `λ>0` the quotient `H^≥λ/H^>λ` is the vector group `(ad E)^≥λ/(ad E)^>λ`.

Hypotheses: The underlying functor is an exact K-linear tensor fibre functor for finite rational representations of a reductive `G/K`, associated to a `G`-torsor on `X`. The descending `ℚ`-filtration is exhaustive, separated and locally has finitely many jumps on each representation; its steps are subbundles with locally free graded pieces, and it is exact and tensor-compatible. Splitting is asserted on affine open charts, followed by étale trivialization of the smooth underlying torsor; no global splitting over an arbitrary scheme is assumed.

*Construction.* On an affine chart, choose a tensor generator and clear its finitely many rational weight denominators as in §0.2. Exact tensor generation extends the same denominator to all representations. Rescale to the supplied `ℤ`-filtered carrier, including a chosen threshold `λ` in the denominator. The underlying automorphism group is an inner form of reductive `G`, hence smooth. Zie15 Theorem `1.3/4.15` gives a section of the supplied splitting torsor on that affine chart. Trivialize the `G`-torsor étale locally; the supplied splitting/cocharacter dictionary then gives a rational cocharacter `D→G`. Transport the supplied parabolic and radical, and use root weights to represent the higher raising subgroups and identify their `Lie` algebras with the filtered adjoint subbundles. At `λ>0`, the map `g↦g−1` on associated gradeds is additive: the product error raises the filtration by `2λ>λ`. Zie15 Proposition 4.24 and Lemma 4.25 give the vector-group quotient after rescaling; its `Lie` bundle identifies it with `gr^λ(ad E)`. At `λ=0` retain the supplied reductive Levi quotient. Descend the higher subgroup schemes and their Lie/graded identifications along the étale charts, compatibly with arbitrary scheme pullback and independently of the denominator.

*Remark.* Subgroups of points over a field do not represent this relative group scheme. The splitting input is the affine one for smooth groups, not an fpqc-local splitting, and no global splitting on a non-affine `X` is asserted.

The API:

- For every rational representation and `λ′, (γ−1)E^≥λ′⊂E^≥(λ′+λ)`.
- Rational reindexing identifies `H^≥0` with the supplied filtration-preserving parabolic.
- Rational reindexing identifies `H^>0` with the supplied unipotent radical.
- For `λ>0` the quotient is the stated additive vector group.
- Scheme pullback commutes with `H`, its filtration and vector-group quotients.
- There is an affine open cover on which the filtered fibre functor splits; after an étale trivialization of its underlying torsor the splitting is a rational cocharacter `D→G`. This assertion is compatible with restriction and does not assert a global splitting on `X`.

**Checks.**

- For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
- For the trivial filtration `H^≥0=H` and `H^>0=1`.
- At `λ=0` the reductive Levi quotient is not generally an additive vector group.
- For `GL_2` with ordered basis of weights `0,3/2`, `H^≥0` is lower triangular and `H^>0` is its one-dimensional lower unipotent radical. `H^≥1/H^>1` is trivial, `H^≥(3/2)/H^>(3/2)` is `G_a`, and `H^≥2` is trivial. Clearing denominator `2` preserves these thresholds.
- On `P^1_K`, the Euler filtration `0→O(−1)→O^2→O(1)→0` defines a filtered `GL_2` fibre functor with smooth underlying group, but no global splitting: `O^2` is not `O(−1)⊕O(1)`. It splits on affine opens. Thus the affine hypothesis cannot be dropped.

Source: FS, Proposition III.5.2 p. 105; Zie15, Theorem 1.3 p. 2; §4.3, Theorems 4.14–4.16 pp. 24–25 and Proposition 4.24/Lemma 4.25/Theorem 4.26 pp. 26–27.

*Needs:* HodgeTateAndCanonicalSubgroups §2.14 (`TauCeti.HodgeTate.filteredFiberFunctor_split`); §0.7 Pure inner twisting of torsors; §0.2 Relative tensor torsors and filtered automorphism groups; ReductiveGroups Layer 7 (structure theory); ReductiveGroups Layer 1 (representations and comodules); Tau Ceti `Cocharacter.parabolic`, `Cocharacter.leviGroupExtension`, `FGPointRepresentationCat`, `FGPointRepresentationCat.instRigidCategory`.

### 3.6 Quasi-split opposite-parabolic automorphisms

For quasi-split `G` and a dominant rational `ν_b, M_b=Z_G(ν_b), P_b^−` is the parabolic with nonpositive `ν_b` weights. The curve group `Q=E_(b_M)×^(M_b)P_b^−` has `J̃_b(S)=Q(X_S)` and positive kernel `Γ(X_S,R_uQ)`. The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.

*Proof outline.* Use the rational Newton representative to put `b` in its Levi. Identify the HN-preserving inner parabolic with the twist of `P_b^−`. Take curve sections and compare its unipotent root bundles with the positive HN pieces.

*Remark.* For `GL_2` and column vectors ordered as `O, O(1)`, the positive section is the lower-left `O(1)` entry. Reversing the summand order puts it above the diagonal; the bundle slopes are `(0,1)`, whereas the isocrystal slopes before dominant reordering are `(0,−1)`.

Source: FS, III.5.1.1 pp. 105–106.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §1.34 Rational Newton representative; ReductiveGroups Layer 7 (structure theory); VectorBundlesAndIsocrystals Layer 2, “The exact tensor isocrystal-to-bundle functor”.

### 3.8 Torus bundle Picard stack

Define the torus-bundle Picard stack. For a torus `T, Bun_T` is a Picard stack fitting into `0→[*/T(E)]→Bun_T→X_*(T)_Γ→0`. Every `κ`-fibre is a T(E)-banded gerbe neutralized by a choice of representative `b` of its class. A multiplicative splitting exists when a group section of `T(L)→B(T)` is chosen, for example when `B(T)` is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.

*Construction.* Use contracted product of commuting torus torsors for the Picard operation. Identify the neutral fibre and other fibres by translation with `E_b`. A group section gives coherent multiplicative neutralizations; without it retain the extension.

*Remark.* A set-wise neutralization of each fibre is weaker than a Picard splitting.

The API:

- Contracted product adds the `κ` classes.
- `Bun_T→X_*(T)_Γ` is a Picard-stack morphism.
- A chosen `b` of `κ=β` neutralizes the fibre as `[*/T(E)]`.
- A group section of `T(L)→B(T)` gives the Picard product decomposition.

**Checks.**

- Line bundles form `∐_(d∈Z)[*/E×]`, with tensor product adding degrees.
- The trivial torus has the terminal Picard stack.
- For the norm-one torus, the two `κ` fibres do not by themselves specify a canonical multiplicative splitting.

Source: FS, Example III.4.6 p. 102.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §1.36 Torus norm and Newton average; DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks).

### 3.10 Reduction of full automorphism torsors

Over affinoid perfectoid `S`, every J̃_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from `H^1_v` vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.

*Proof outline.* Reduce successive positive extensions using affinoid `v-H^1` vanishing. Apply perfectoid representability of locally profinite torsors.

*Remark.* Different reductions can have positive-kernel automorphisms; they are not identified.

Source: FS, Remark III.5.4 p. 106.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §2.7 Pro-étale torsors on strictly disconnected bases; VectorBundlesAndIsocrystals Layer 5, “Two-term Banach–Colmez geometry”; DiamondsAndVStacks Layer D3 (effective descent and morphisms of stacks); VectorBundlesAndIsocrystals Layer 6, “Slope-zero bundles and E-local systems”.

### 3.11 Cohomological dimension of Newton strata

For `ℓ≠p, Bun_G^b` is a cohomologically smooth Artin v-stack of `ℓ`-dimension `−⟨2ρ,ν_b⟩`. The fibre over `[*/J_b(E)]` has the smooth cover * of relative dimension `⟨2ρ,ν_b⟩`; the rational-point classifying stack has dimension `0`.

*Proof outline.* Use the full kernel and its positive `BC` filtration to compute the dimension of the relative classifying stack. Add the dimension `0` of `[*/J_b(E)]`, from §0.9, applied to a faithful closed embedding of `J_b(E)`.

*Remark.* The `O⊕O(1)` stratum has dimension−1 despite its algebraic `J_b` being a torus.

Source: FS, Proposition IV.1.22 p. 113.

*Needs:* §0.9 Locally profinite classifying stacks; VStackSheavesAndLisseCategories §VS4.0; VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

### 3.12 Newton strata of a minuscule flag variety

For connected reductive G/ℚ_p, a minuscule GS cocharacter μ and its reflex field E_μ, compare the GS flag variety with the CS-labelled flag variety for η=(−μ)^dom by the minuscule Grassmannian identification. Under this identification the modification of the trivial bundle is unchanged, so the point maps to B(G) agree, and B(G,{η⁻¹})=B(G,{μ}). Prove that its image is all of B(G,{μ}) by §2.22. This is a comparison of labels and arithmetic images on the flag strata, rather than another construction of the stratification.

The API:

- The label comparison preserves the attached bundle at every geometric point and commutes with algebraically closed field extension.
- Each CS stratum is the corresponding GS stratum with the same b, and each upper union has the same indices in the fixed-κ Newton order.
- The image of the GS point map equals the acceptable set with bound μ.

**Checks.**

- For split `GL_2` and GS `μ=(1,0)`, the ordinary stratum has slopes `(1,0)` and the basic stratum slopes `(1/2,1/2)`; both have `κ=1`.
- A central minuscule `μ` gives a zero-dimensional flag variety with its single acceptable class.
- For CS label `η=(1,0)`, the GS label is `(0,−1)` and the strata have ordinary slopes `(0,−1)` and basic slopes `(−1/2,−1/2)`, with `κ=−1`. Identifying the two labels without conversion reverses `κ`.

Source: CS17, Definition 3.5.6 pp. 689–690.

*Needs:* IgusaVarietiesAndTorsionConcentration §§3.4–3.5; §2.22 Minuscule modification image; VStackSheavesAndLisseCategories §VS4.0; GeometricSatakeAndFusion GS0 (open Schubert cell smoothness); DiamondsAndVStacks Layer D4 (diamonds, small v-stacks, underlying spaces).

### 3.18 Connected components of Bun_G

`κ` induces `π_0(Bun_G)≅π_1(G)_Γ`. Every nonempty open substack contains a basic point: restrict to a finite `T_0` Newton region, take an open point, and compare the whole-stack dimension `0` with the stratum dimension `−⟨2ρ,ν_b⟩` to force central `ν_b`.

*Proof outline.* Use the finite `T_0` open-point lemma with the discrete `κ` coordinate. An open stratum has the ambient dimension `0`, so its positive-root pairing vanishes and `b` is basic. The basic `κ` bijection makes each fibre connected; two disjoint nonempty open pieces would each have to contain its unique basic point.

*Remark.* Torsion components such as split `PGL_n’s Z/n` are included.

Source: FS, Corollary IV.1.23 and Lemma IV.1.24 pp. 113–114.

*Needs:* VStackSheavesAndLisseCategories §VS4.0; §3.11 Cohomological dimension of Newton strata; §1.11 Kottwitz classification by both invariants; VStackSheavesAndLisseCategories Layer VS0 (Artin v-stacks and smooth descent).

### Examples

- For `G = GL_2` and `E_b = O ⊕ O(1)`, the full automorphism group is `(E^× × E^×)` ⋉ `BC(O(1))`, the stratum is `[*/J̃_b]` of dimension `−1`, and `Bun_G` has dimension `0` at the basic point.
- For the minuscule flag variety P¹ of `GL_2` with `μ = (1, 0)`, for `E = ℚ_p` the basic stratum is Drinfeld's upper half plane `Ω =` P¹ ∖ P¹(ℚ_p) and the ordinary stratum is P¹(ℚ_p).

### Dependencies

Layers 0–2; VectorBundlesAndIsocrystals Layer 5, “Two-term Banach–Colmez geometry”, and Layer 6, “Geometric family filtrations and cohomology”; DiamondsAndVStacks Layers D3–D5; VStackSheavesAndLisseCategories VS0; GeometricSatakeAndFusion GS0; IgusaVarietiesAndTorsionConcentration §3.4 for the flag-label comparison.

## Layer 4: filtered charts and specialization

Use the filtered chart `M_b`, its negative Banach–Colmez tower, split section, contraction and smooth map to `Bun_G` from VStackSheavesAndLisseCategories §VS4.0, `BunCharts`. Identify its open image with the Newton-order down-set of `b` using §2.20, and compute the rank-two extension chart.

### 4.7 Smooth specialization neighborhoods

For every connected reductive G over E and b∈B(G), identify the open image of π_b:M_b→Bun_G with {b′∈B(G) : κ(b′)=κ(b), ν_b′≤ν_b}. This adds an arithmetic description to the geometric generalization image of the chart.

*Proof outline.* Apply §2.20 to the open image consisting of generalizations of b: a point b′ generalizes b exactly when b′≤b in the fixed-κ Newton order. The central Newton action used by the chart is the morphism of §1.17, with the same arithmetic Frobenius convention.

**Checks.**

- For GL₂ and the graded bundle O⊕O(1), b has isocrystal slopes (0,−1) and κ=−1. Its image consists of that point and (−1/2,−1/2): the first partial sums are −1/2≤0 and the totals are −1=−1. The reverse comparison fails since 0≤−1/2 is false.
- In the same chart, the negative extension direction has relative dimension 1 and split origin 0; the action of diag(1,π⁻¹) on Ext¹(O(1),O) is multiplication by π. Its positive iterates tend to 0, consistently with specialization of the nonsplit basic point to b.
- For G_m, κ fixes the integer slope, so the down-set is a singleton; there is no extra chart point with a different degree.

Source: FS, Theorem V.3.7, p. 177; §2.20 for the arithmetic topology comparison.

*Needs:* VStackSheavesAndLisseCategories §VS4.0 (chart image); §2.20 (Newton topology); §1.17 (central Newton morphism).

### 4.8 Rank-two extension chart

For graded bundle `O⊕O(1), M̃_b=BC(O(−1)[1])` parametrizes framed extensions `0→O→E→O(1)→0. E` is either split or the simple rank `2` slope `1/2` bundle. The fibres of `π_b` are open subspaces of (`BC(E)` minus `{0})/E×` of nowhere-vanishing sections giving the prescribed quotient.

*Proof outline.* Identify `Ext^1` with the negative `BC H^1` of `O(−1)`. Use the rank `2` bundle classification and determinant degree `1`. Describe a filtration by a nowhere-vanishing section, and use that saturation of a section is an open condition.

*Remark.* The split point has full positive automorphism kernel; the framed chart extension direction has negative slope.

Source: FS, Example V.3.1 p. 173.

*Needs:* §4.7 Smooth specialization neighborhoods; VectorBundlesAndIsocrystals Layer 5, “Two-term Banach–Colmez geometry”; VectorBundlesAndIsocrystals Layer 5, “Ordinary Banach–Colmez properness”; VectorBundlesAndIsocrystals Layer 4, “Geometric classification of vector bundles”; VectorBundlesAndIsocrystals Layer 6, “Geometric family filtrations and cohomology”.

### Examples

- For `G = GL_2` and `E_b = O ⊕ O(1)`, the framed chart of §4.8 is the negative Banach–Colmez space `BC(O(−1)[1])` of extensions `0 → O → ℰ → O(1) → 0`: its split point is `E_b` itself and every other point is the stable bundle `O(1/2)`, whose point in `|Bun_GL₂|` specializes to that of `E_b`.

### Dependencies

Layers 0–3; VectorBundlesAndIsocrystals Layer 5, “Two-term Banach–Colmez geometry”, and Layer 6, “Geometric family filtrations and cohomology”; VStackSheavesAndLisseCategories VS0 and §VS1.3; DiamondsAndVStacks Layers D4–D5.

## Worked examples

These examples fix the conventions of the roadmap.

- *Twisted conjugacy.* For a group automorphism `σ`, the twisted-conjugacy relation records the existence of a twisted conjugator and the twisted-conjugacy quotient is the quotient set; it forgets stabilizers. The sigma-stabilizer subgroup keeps them as a subgroup: for `b = 1` it is the `σ`-fixed subgroup, and if moreover `σ = id` it is the whole group. Under `b ↦ g b σ(g)⁻¹` the stabilizer is transported by `h ↦ g h g⁻¹`.
- *Finite norms.* `N₀(b) = 1, N₁(b) = b` and `N₂(b) = b σ(b)`. The conjugation formula for `N_r` ends with `σ^r(g)⁻¹`, and the positive-period Frobenius norm relation requires `r > 0`; in rank one, `b = π` gives `N_r(b) = π^r`, not `π^{r+1}`. That auxiliary relation alone does not impose Newton integrality or the prescribed value (rν_b)(π) required for decency.
- *Rank one over the Witt vectors.* Over the fraction field of the Witt vectors of an algebraically closed field of characteristic `p`, valuation sends the class of `p^m` to `m`; it separates `1` from `p` and `p` from `p⁻¹`.
- *Numerical `GL_n` data.* Numerical Newton data requires decreasing rational slopes, an integral total `κ` and denominator divisibility of each slope multiplicity. Dominance fixes `κ` and compares initial partial sums; basic means constant slope; acceptability is dominance by the chosen bound and ordinarity attains it. The empty tuple has `κ = 0` and is basic and ordinary; no rank-one datum has slope `1/2`: its sole slope has integral total and denominator dividing its multiplicity `1`.
- *The slope protorus.* The coordinate Hopf algebra of `D` is `E[ℚ]`; the character of slope `q` sends the monomial of `n ∈ ℤ` to that of `nq`. At `q = 1/2` the generator indexed by `2` goes to the one indexed by `1`, and at `q = 0` everything goes to the unit; the half character differs from every integral one. A finite representation has finitely many weights and hence a common denominator.
- *Integral descent of `κ`.* An equivariant homomorphism composed with integral cyclic coinvariants descends uniquely to `σ`-classes; for an abelian group, twisted conjugacy is exactly the quotient by the range of `τ − id`. The component coset is the solution set of `τx − x = d`: it is a translate of the fixed subgroup when nonempty. For `τ = id` and `d = 0` it is all of `ℤ`; for `τ = −id` and `d = 2` it is `{−1}`, and for `d = 1` it is empty. The sign-action coinvariants keep the nonzero class of `1` and kill `2`: their integral quotient is `ℤ/2`, with no rationalization.

### Numerical slopes

The acceptance carrier `WittGLNewtonPolygon` records only the decreasing tuple and denominator divisibility; its integral total follows by summing each slope with its multiplicity. Define numerical Newton data of rank n to record a function `Fin n → ℚ`,
antitone in the standard order, an integer `κ` equal to its sum, and the condition
that the reduced denominator of every slope divides its multiplicity. Its API
records the slope tuple, its decreasing order, its integral total and the denominator-divisibility condition; these data classify the numerical polygons of
`GL_n`-isocrystals.

**Checks.**

- The slopes `(1/2, 1/2)` with `κ=1` satisfy all fields; a single slope `1/2`
  fails the multiplicity and integral-total conditions.
- The integral-total tuple `(1/3, 1/3, 1/3)` is allowed, with total `κ=1`
  and denominator `3` dividing multiplicity `3`; `(2/3, 1/3)` has
  integral total `1` but fails denominator divisibility; integral total alone is insufficient.
- The decreasing-order condition rejects `(0, 1)`, although its total and
  denominator conditions hold; rank zero has the empty tuple and forces `κ=0`.

Define dominance between numerical data x and y by equal integral `κ` and the inequalities
between initial sums of lengths `0≤k≤n`. Prove antisymmetry of dominance for every
natural `n` and `x,y` with dominance in both directions: `x=y`. The API also includes
reflexivity, transitivity and the partial-sum criterion, with no rank restriction.

**Checks.**

- `(1/2, 1/2)` is below `(1, 0)`, and the reverse inequality fails at `k=1`.
- Slopes `(0)` and `(1)` are incomparable because their integral `κ` values are `0` and `1`.
- At rank zero dominance holds for the unique empty datum; at `k=n` its
  inequality is equality because the integral totals agree.

Define basic numerical data by equality of every pair of slopes. Its API
identifies positive-rank basic data with constant slope `κ/n`, while rank zero
is handled without division.

**Checks.**

- `(1/2, 1/2)` is basic, although its slope is nonzero.
- `(1, 0)` is not basic, even though both slopes are integral.
- Every rank-one datum is basic, and the rank-zero datum is basic by the empty
  universal quantifier.

Define numerical acceptability for a bound μ as dominance by the numerical bound mu.
Its API is the dominance criterion, reflexivity at the bound and preservation
under equality of the bound. This numerical predicate records the split linear
inequalities; the acceptable set in §1.23 retains the full reductive invariant theory.

**Checks.**

- Both `(1/2, 1/2)` and `(1, 0)` are acceptable for the bound `(1, 0)`.
- `(2, −1)` fails that bound at its first partial sum despite having `κ=1`.
- The zero datum is acceptable for the zero bound in every rank, including zero;
  changing the total `κ` makes acceptability fail.

Define numerical ordinarity for a bound μ as acceptability and equality of the entire
slope functions. Its API includes uniqueness at a fixed bound, equality of `κ`
and the implication to acceptability. In particular equality of total alone is
insufficient.

**Checks.**

- `(1, 0)` is ordinary for itself, and `(1/2, 1/2)` is acceptable but not ordinary
  for that bound.
- The basic datum `(1/2, 1/2)` is ordinary for its own bound: numerical
  ordinarity does not itself impose integral Hodge slopes.
- The empty datum is ordinary for the empty bound, with `κ=0`.

The half-slope pair, the split pair and the rank-n zero tuple satisfy these conditions. Their API exposes their slope
values and `κ` values and the comparison and basicness tests above.

**Checks for the half-slope pair.**

- Both slopes are `1/2` and their sum is `1`, giving `κ=1`.
- Its denominator `2` divides multiplicity `2`; deleting one slope makes the datum
  invalid.
- It is basic and lies strictly below the split pair.

**Checks for the split pair.**

- Its first slope is `1` and its second is `0`, giving `κ=1`.
- It is not basic, and both reduced denominators are `1`.
- It is ordinary for itself and fails dominance by the half-slope pair at the first slope.

**Checks for the zero tuple.**

- Every slope is zero, the sum and `κ` are zero, and the denominator `1` divides
  each multiplicity.
- At rank zero it has no slope entries and its basicness and ordinarity still
  hold; no expression `κ/n` is used at this boundary.
- At positive rank the slope at index `0` distinguishes it from every nonzero constant
  basic datum, so basicness alone
  does not identify it with such a datum.

These are numerical consequences of Dieudonné–Manin and the order conventions
of KMPS, §§1.1.1–1.1.5, pp.5–8, and FS, §III.2.2,
pp.90–91; VectorBundlesAndIsocrystals Layer 1, “Dieudonné–Manin classification of finite isocrystals”, supplies the linear classification.
They accompany the general reductive targets of Layer 1.

### Algebraic conventions

The twisted conjugation of b by g is `g b σ(g)⁻¹`. Its API consists of the unit action,
the composition law for the group action with later conjugator on the left,
and the inverse-action law. The twisted-conjugacy relation uses the existence of such a conjugator as its relation;
the twisted-conjugacy quotient and its representative map are its quotient and representative map, with
the quotient API of §0.6.

**Checks.**

- Acting by `1` fixes every `b`; for identity `σ` the action is ordinary conjugation.
- Acting first by `g` and then by `h` agrees with acting by `h g`;
  the inverse action uses `g⁻¹`. In the permutation group on three points,
  reversing that product fails.
- With identity `σ` in an abelian group, the setoid relates `b` and `c` exactly when
  `b=c`. Its quotient therefore retains every group element; with `b=1` its
  representative stabilizer is still the entire group.

The finite Frobenius norm has the API of the zero, successor and twisted-conjugate
formulas. The positive-period Frobenius norm relation requires a strictly positive period
and equality of that norm to a specified element. Decency in §1.9 additionally requires
rν_b to be integral and specifies the right-hand side as (rν_b)(π).

**Checks.**

- The empty norm is `1`, the one-factor norm is `b`, and the two-factor norm is
  `bσ(b)`; replacing the last by `b²` fails for nonfixed `b`.
- For fixed `b=π` each Frobenius iterate is `π`, so the `r`-factor norm is `π^r`,
  including `r=0`.
- The positive-period Frobenius norm relation is false at period zero, is b=a at period one,
  and at period two is bσ(b)=a; this auxiliary relation alone asserts no Newton integrality.
- For b=[[0,π],[1,0]], ν_b=(1/2,1/2). At r=1 the norm relation holds with a=b,
  but decency fails because ν_b is not integral; at r=2, bσ(b)=πI and
  2ν_b=(1,1), so decency holds. This uses σ(π)=π in either characteristic.

The cyclic representation, its integral coinvariants and an equivariant homomorphism have the integral
action, coinvariant and equivariance API of §1.8. The equivariant datum consists of an actual
homomorphism and its Frobenius-equivariance equation, rather than a reductive
classification assumption.

**Checks.**

- The positive cyclic generator acts by `τ`, its inverse by `τ⁻¹` and the identity
  automorphism gives the trivial action on every integer power.
- The identity homomorphism on `Multiplicative A` with Frobenius `τ` supplies
  such a datum; a homomorphism that fails Frobenius equivariance cannot supply it.
- The target for identity `τ` is `A`. For sign `τ` on `ℤ` it is `ℤ/2`, so `1` survives
  while `2` vanishes; rational coinvariants would fail this test. The actual twisted-conjugacy quotient
  retains this distinction: `0` and `1` have different classes, while `2` and `0`
  have the same class.

For the Witt specialization, with p prime and k algebraically closed of characteristic p, the coefficient field is exactly
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

These checks specialize the twisted-conjugacy convention of FS,
§III.2.2, pp.90–91; the Witt rank-one normal form uses Mathlib's
`WittVector.exists_frobenius_solution_fractionRing`. The slope-protorus
coordinate algebra is the existing group algebra
`MonoidAlgebra E (Multiplicative ℚ)` bundled by `CommHopfAlgCat.of`, without a
finite-type assertion. Its generator `[0]` is `1`, its coproduct sends `[q]` to
`[q]⊗[q]`, and its antipode sends `[q]` to `[−q]`; imposing finite-type torus
hypotheses would exclude its rational character group. The character maps and
their three tests are in §1.4.

## Source corrections

The following corrections to the sources are used in the statements above. Each concerns the version cited in the References.

`1`. *Liu–Zhu, Remark 4.1(iii).* The de Rham tensor data there are indexed by representations of the quotient `G^c`, so they determine a class in `B(G^c)`. A class in `B(G)` needs additional lifting data, or the hypothesis `G = G^c` (§2.23).
`2`. *Gleason–Lim–Xu, proof of Lemma 3.16, equation `(3.23)`.* The valuation quotient of a torus `T` is `X_*(T)_I`, not `π₁(G)_I`: for split `SL_2, π₁(G) = 0` while the diagonal torus has valuation lattice `ℤ`, and `diag(p, p⁻¹)` lies in the kernel of the map to `π₁(G)` without lying in `T(O_L)`. Rational surjectivity of the Kottwitz map needs the separate theorem (§1.41).
`3`. *Caraiani–Scholze `2017`, Proposition `3.5.7(1)`.* With the order on `B(G)` fixed on `p. 677`, the Newton map is upper semicontinuous and the upper unions are closed, in agreement with their Corollary 3.5.9; the printed word “lower” is reversed (IgusaVarietiesAndTorsionConcentration §3.4 (closed upper flag unions)).
`4`. *Kisin–Madapusi–Shin, `(1.1.2.2)`.* The decency equation has exactly `r` factors `b, σ(b)`, …, `σ^{r−1}(b)`; with `r + 1` factors, `b = p` in rank one would give `p^{r+1}` on the left and `p^r` on the right (§1.9).
`5`. *Kisin–Madapusi–Shin, Corollary `1.1.15`.* The cocharacter is moved by `W(G,T)`, where `T` is a maximal torus of `M`, as in Proposition 1.1.13; `W(M,T)` may be too small, and the quotient `N_G(M)/M` need not contain the required element. For `GL_3, M = GL_1 × GL_2, μ = (0, 1, 0)` and `b_M = diag(p, 1, 1)`, the quotient `N_G(M)/M` is trivial but an absolute Weyl transposition is needed (§1.35).
`6`. *Kisin–Madapusi–Shin, §1.3.15.* The ordinary class is unique when it exists and exists for quasi-split groups; for a general inner form its existence is an extra hypothesis. For `D^×` with `D` a quaternion division algebra, `b ↦ bΠ (Π² = p)` identifies `B(D^×)` with `B(GL_2)` shifting both slopes by `1/2`, and the ordinary slopes `(0, −1)` would become `(1/2, −1/2)`, each with multiplicity one, which violates the denominator condition, so `D^×` has no ordinary class for this `μ` (§1.26).
`7`. *Kisin–Zhou, §2.2.3.* Dominance in the rational cocharacter space uses positive coroots, not positive roots (§1.5).
`8`. *Hamacher–Kim, proof of Lemma 2.9 (arXiv v5).* The bound on the minimal effective over-lattice must include the Frobenius denominator `d` of the chosen lattice: for rank `h` it lies in `π^{−d(h−1)}M₀` (Zink, Lemma `9`). A rank-two slope-zero shear with coefficient `π^{−N}` shows that no bound depending on the Newton polygon alone exists (§2.17).
`9`. *Hamacher–Kim, proof of Theorem 2.11 (arXiv v5).* A local section of the ambient GL(H)-action does not give a lift preserving the defining tensor line. The smooth-orbit argument retains both `Aut_Φ(V₀)` and `Aut_Φ(L₀)`, whose pair stabilizer is `J_b`, as in §2.17.
`10`. *Kisin–Zhou, §2.2.2.* The `σ`-conjugacy class of `w` is `{u⁻¹ w σ(u)}` with `u` varying; the printed formula lets the last factor depend on the fixed element. For `w = 1` and `σ = id` in a nontrivial Weyl group the printed set is the whole group, while the class of the identity is a point (§1.10).

## Downstream consumers

IgusaVarietiesAndTorsionConcentration supplies the flag interfaces of §§3.4–3.5. RelativeFarguesFontaine §7.0 supplies the tensor–torsor dictionary, and VStackSheavesAndLisseCategories §VS4.0 supplies the bundle, stratum, automorphism and chart geometry. This roadmap develops the general arithmetic classification and Newton-order comparisons on those carriers. EndoscopicTransferAndUnitaryTraceComparison supplies the local cohomological inputs and has the compatible specializations of the invariant theory listed above. Downstream, the consumer HeckeStacksAndLocalShtukas uses uniformization, the smooth Artin structure and the strata, and the consumer ExcursionOperatorsAndSpectralAction uses the stack, its topology and the parabolic charts.

## References

Page numbers are the printed pages of the version listed, unless a PDF page is named.

- **[FS]** Laurent Fargues, Peter Scholze, *Geometrization of the local Langlands correspondence*. [https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).
- **[SW]** Peter Scholze, Jared Weinstein, *Berkeley Lectures on `p`-adic Geometry*. [https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf).
- **[Kot85]** Robert Kottwitz, *Isocrystals with additional structure*. [https://www.numdam.org/article/CM_1985__56_2_201_0.pdf](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf).
- **[Kot97]** Robert Kottwitz, *Isocrystals with additional structure II*. [https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf).
- **[RR96]** Michael Rapoport, Melanie Richartz, *On the classification and specialization of F-isocrystals with additional structure*. [https://www.numdam.org/article/CM_1996__103_2_153_0.pdf](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf).
- **[Kot14]** Robert Kottwitz, *B(G) for all local and global fields*. [https://arxiv.org/pdf/1401.5728](https://arxiv.org/pdf/1401.5728).
- **[Ans19]** Johannes Anschütz, *Reductive group schemes over the Fargues-Fontaine curve*. [https://arxiv.org/pdf/1703.00700](https://arxiv.org/pdf/1703.00700).
- **[KMPS]** Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, *Honda-Tate theory for Shimura varieties*. [https://math.berkeley.edu/~swshin/HT.pdf](https://math.berkeley.edu/~swshin/HT.pdf).
- **[KZ]** Mark Kisin, Rong Zhou, *Independence of l for Frobenius conjugacy classes attached to abelian varieties*. [https://arxiv.org/pdf/2103.09945v2](https://arxiv.org/pdf/2103.09945v2).
- **[CS17]** Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf).
- **[Rap15]** Michael Rapoport, *Accessible and weakly accessible period domains*, appendix to Peter Scholze, *On the p-adic cohomology of the Lubin–Tate tower*. [Author PDF](https://www.math.uni-bonn.de/people/scholze/pAdicCohomLT.pdf), Proposition A.9, p. 42.
- **[CS24]** Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of non-compact unitary Shimura varieties*. [https://arxiv.org/pdf/1909.01898v2](https://arxiv.org/pdf/1909.01898v2).
- **[Zhu17]** Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf).
- **[GLX]** Ian Gleason, Dong Gyu Lim, Yujie Xu, *The connected components of affine Deligne-Lusztig varieties*. [https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf).
- **[HK]** Sean Howe, Christian Klevdal, *Admissible pairs and `p`-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*. [https://arxiv.org/pdf/2308.11064v2](https://arxiv.org/pdf/2308.11064v2).
- **[LZ17]** Ruochuan Liu, Xinwen Zhu, *Rigidity and a Riemann-Hilbert correspondence for `p`-adic local systems*. [https://arxiv.org/pdf/1602.06282v3](https://arxiv.org/pdf/1602.06282v3).
- **[Kisin17]** Mark Kisin, *Mod p points on Shimura varieties of abelian type*. [https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1).
- **[vH24]** Pol van Hoften, *Mod p points on Shimura varieties of parahoric level*. [https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf).
- **[He21]** Xuhua He, *Cordial elements and dimensions of affine Deligne-Lusztig varieties*. [https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf).
- **[Vie21]** Eva Viehmann, *On Newton strata in the B_dR^+-Grassmannian*. [https://arxiv.org/pdf/2101.07510](https://arxiv.org/pdf/2101.07510).
- **[HN18]** Xuhua He, Sian Nie, *On the acceptable elements*. [https://arxiv.org/pdf/1408.5836](https://arxiv.org/pdf/1408.5836).
- **[GIZ26]** Ian Gleason, Alexander B. Ivanov, Felix Zillinger, *Meromorphic vector bundles on the Fargues–Fontaine curve*. [https://arxiv.org/pdf/2307.00887v3](https://arxiv.org/pdf/2307.00887v3). arXiv:2307.00887v3, 14 May 2026; 62-page PDF, printed pages equal PDF pages.
- **[He14]** Xuhua He, *Geometric and homological properties of affine Deligne–Lusztig varieties*. [arXiv:1201.4901v2](https://arxiv.org/pdf/1201.4901v2), Theorem 3.5, Proposition 3.6 and Theorem 3.7, pp. 12–13.
- **[HeKR16]** Xuhua He, *Kottwitz–Rapoport conjecture on unions of affine Deligne–Lusztig varieties*. [arXiv:1408.5838v2](https://arxiv.org/pdf/1408.5838v2), Proposition 4.1, p. 12, and Theorem 6.1, p. 15.
- **[He16]** Xuhua He, *Hecke algebras and `p`-adic groups*. [https://arxiv.org/pdf/1511.01386v3](https://arxiv.org/pdf/1511.01386v3). arXiv:1511.01386v3, 21 November 2016; survey version.
- **[Zie15]** Paul Ziegler, *Graded and filtered fiber functors on Tannakian categories*. [https://arxiv.org/pdf/1111.1981v4](https://arxiv.org/pdf/1111.1981v4). arXiv:1111.1981v4; printed pages equal PDF pages.
- **[Iva23]** Alexander B. Ivanov, *Arc-descent for the perfect loop functor and `p`-adic Deligne–Lusztig spaces*. [https://arxiv.org/pdf/2003.04399v3](https://arxiv.org/pdf/2003.04399v3). arXiv:2003.04399v3, 3 September 2021; printed pages equal PDF pages.
- **[Ans22]** Johannes Anschütz, *Extending torsors on the punctured Spec(A_inf)*. [https://arxiv.org/pdf/1804.06356v2](https://arxiv.org/pdf/1804.06356v2). arXiv:1804.06356v2, 21 October 2020; printed pages equal PDF pages.
- **[HK22]** Paul Hamacher, Wansu Kim, *Point counting on Igusa varieties for function fields*. [https://arxiv.org/pdf/2208.01069v5](https://arxiv.org/pdf/2208.01069v5). arXiv:2208.01069v5, 21 August 2025; from PDF page 2 onward, printed page = PDF page − 1. The normal-base hypothesis differs from v1.
- **[Wed99]** Torsten Wedhorn, *Ordinariness in good reductions of Shimura varieties of PEL-type*. [https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf). Published Ann. Sci. École Norm. Sup. 32 (1999), 575–618; printed page = PDF page + 573.
- **[CGH20]** Ana Caraiani, Daniel R. Gulotta, Chi-Yun Hsu, Christian Johansson, Lucia Mocz, Emanuel Reinecke, Sheng-Chi Shih, *Shimura varieties at level Gamma_1(p^infinity) and Galois representations*. [https://arxiv.org/pdf/1804.00136v2](https://arxiv.org/pdf/1804.00136v2). arXiv:1804.00136v2, 25 July 2019; printed pages equal PDF pages.
- **[Sch15]** Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. [https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Published Annals of Mathematics 182 (2015), 945–1066; printed page = PDF page + 944.
- **[Zin01]** Thomas Zink, *On the slope filtration*. [https://www.math.uni-bielefeld.de/~zink/slopes.pdf](https://www.math.uni-bielefeld.de/~zink/slopes.pdf). 19-page Bielefeld author copy, PDF creation date 23 January 2002. Author page numbers equal PDF pages; not the pagination of Duke Math. J. 109 (2001), 79–95.
- **[HV20]** Paul Hamacher, Eva Viehmann, *Finiteness properties of affine Deligne–Lusztig varieties*. [https://ems.press/content/serial-article-files/26546?nt=1](https://ems.press/content/serial-article-files/26546?nt=1). Documenta Mathematica 25 (2020), 899–910; published version.

- **[Dillery23]** Peter Dillery, *Rigid inner forms over local function fields*. Advances in Mathematics 430 (2023), 109204. [arXiv:2008.04472v4](https://arxiv.org/pdf/2008.04472v4), Theorem 5.3 and its following paragraph, p. 44, for elliptic maximal tori. Locators refer to this preprint version; the published edition has different pagination.
- **[Conrad12]** Brian Conrad, *Finiteness theorems for algebraic groups over function fields*. [Author copy](https://virtualmath1.stanford.edu/~conrad/papers/cosetfinite.pdf), proof of Lemma A.2.1, p. 62.

- **[Pappas–Rapoport 2024]** Georgios Pappas, Michael Rapoport, *`p`-adic shtukas and the theory of global and local Shimura varieties*. Cambridge Journal of Mathematics 12 (2024), 1–164. [arXiv:2106.08270v6](https://arxiv.org/pdf/2106.08270v6). Locators refer to this preprint: Proposition 2.1.3 and Remark 2.1.4, p. 14, and Remark 2.1.10, p. 19; the published edition has different pagination.
- **[HV11]** Urs Hartl, Eva Viehmann, *The Newton stratification on deformations of local `G`-shtukas*. [arXiv:0810.0821v3](https://arxiv.org/pdf/0810.0821v3); Theorem 7.3, p. 28 of this version.

- **[Chai00]** Ching-Li Chai, *Newton polygons as lattice points*. American Journal of Mathematics 122 (2000), 967–990. [Published text archived from the CiteSeerX institutional repository](https://web.archive.org/web/20240426121415/https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=1e204c73fc8f0e2ea8cca12dff6a724bccb7d834). Lemma 6.2(i), p. 981, and Theorem 6.5 with proof, pp. 981–982; these are printed journal pages (PDF pages 16–17). DOI: 10.1353/ajm.2000.0042.
