# Roadmap: vector bundles and isocrystals, part II

**Summary.** VectorBundlesAndIsocrystals, Layer 5, builds classical Banach–Colmez spaces over sympathetic algebras: presentations, Dimension, curvature, the finite-length period realization and Le Bras's equivalence with the tilted coherent heart of the Fargues–Fontaine curve. That roadmap, called the parent below, stops there. This part II builds what comes after, in three directions. First, the arithmetic theory of Fontaine's almost `C`-representations of `G_K`. This covers the strict Banach Galois category, full faithfulness of the forgetful functors from `C`- and `B_dR⁺`-representations, the abelian category `C(G_K)` with its Dimension, the Yoneda `Ext` comparison, the two-operator `Ext` complex, Euler–Poincaré duality and the fundamental theorem for an extension of a `C`-line. Second, the topological enlargement of Banach–Colmez spaces due to Colmez and Nizioł. This covers Topological Vector Spaces (TVS) in the left heart of nonarchimedean locally convex spaces, completed period Modules and Pairs, the perfectoid disc class `Ext¹_TVS(V₁,V₁) ≅ C`, Hom and `Ext¹` comparisons for reasonable period models, and quasi-Banach–Colmez spaces (qBC) with their intrinsic curvature filtration and full faithfulness. Third, the contravariant period-valued height functor `h(W) = Hom_VS(W, B_dR)` and the height–rank formula `rank h(W) = ht(W) + rank Ext¹_VS(W, B_dR)`. The end theorems are Fontaine's full faithfulness and duality, the disc extension isomorphism, full faithfulness of reasonable qBCs in TVS, and the height–rank formula.

## Scope and ownership

This roadmap owns almost `C`-representations and their arithmetic Hom and `Ext` (Layers 0–1), Topological Vector Spaces, period Modules and Pairs (Layer 2), the perfectoid disc class (Layer 3), reasonable period comparisons (Layer 4), qBC (Layer 5) and the period-valued height functor (Layer 6). It also owns `SemilinearRep`, the `Suggested.lean` structure of a continuous semilinear `ℂ_p`-representation that makes the Layer 0 headlines of §§0.2 and 0.10 statable for finite `K/ℚ_p`; the action of `Gal(ℚ̄_p/K)` on `ℂ_p` over which it is semilinear is PadicPeriodRings §1.1's, and the Lean statements write it as `UniformSpace.Completion.map σ`.

It leaves to other roadmaps:

- VectorBundlesAndIsocrystals, Layer 5: sympathetic algebras and Vector Spaces, classical Banach–Colmez presentations, Dimension, the abelian BC category, curvature, HN invariants, finite-length period realizations, the Artinian property, morphism calculus and Le Bras's equivalence. These are imported by section heading.
- CompactOperators §0.5: compactoid subsets of Banach spaces and maps of compactoid image over a complete nontrivially normed ultrametric field. The `B_m`-relative notion and compact-type limits over `C` and `B_m`, with their completeness, regularity and permanence, are this roadmap's §2.5.
- LocallyAnalyticDistributions §§0.0–0.3 and Layer 1: the generic nonarchimedean locally convex category, its strict derived category and left heart, completed tensors, three-space and functional-extension theorems, locally analytic functions, continuous functions, distributions and measures. The sympathetic functor categories and their period comparisons are what this roadmap adds.
- PadicPeriodRings §§1.1–1.2: the continuous action of `G_K` on `ℂ_p` for finite `K/ℚ_p`, by the completion map of each automorphism, with its uniqueness, isometry, composition and joint-continuity laws, and the fixed field `ℂ_p^{G_K} = K`.
- PadicPeriodRings §§1.5, 2, 4.1–4.3: the period carriers, their topologies and Galois actions, the fixed fields and the twist invariants.
- PadicHodgeTheory §4.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2: Sen modules and operators. PadicHodgeTheory §0.3: the Hensel lift `K̄ → B_dR⁺` for finite `K/ℚ_p`; this roadmap's §0.8 constructs the same lift over the general base field of the Conventions, which that section does not cover.
- ArithmeticGaloisRepresentations §1.1: finite-dimensional continuous representations. ArithmeticGaloisDuality §§R02.1.3 and D7.4: rational local Tate duality.
- PerfectoidSpaces, Layers P1, P3 and P6 and §P7.16, and PerfectoidTowers §§P9.2, P9.4 and P9.6: the perfectoid criterion, almost purity, the pro-étale calculus, the pro-étale site of a rigid space, the completed structure sheaf `Ô`, pro-étale Galois towers and descent along towers. Their specialization to the translation-invariant `Ô`-cohomology of the closed disc is a target here (§§3.4 and 3.8).
- DiamondsAndVStacks §D2.2: the v-site of perfectoid spaces, on which the v-sheaf comparison of §6.2 is formed.

The pinned libraries already supply functors, topological modules, scalar torsion submodules, the positive and localized de Rham rings as commutative rings, abelian `Ext` and its comparison maps, Krull topologies, spectral norms, completions, and Tau Ceti's exact structures. These are reused as listed under the supplier contracts. The roadmap asserts no general abelianness or splitting of qBC, no equivalence of `Ext` for arbitrary Pairs, and no comparison of topological-module `Ext` in degrees above one.

## Conventions

Let `p` be any prime. In Layers 0–1, `K` is a field of characteristic zero, complete for a discrete valuation, with perfect residue field `k` of characteristic `p`. `K̄` is an algebraic closure, `G_K = Gal(K̄/K)`, and `C` is the completion of `K̄` with its continuous `G_K`-action. The definition of almost `C`-representations, the scalar rigidity of §0.7, the density of §0.8 and the period Hom computation of §0.9 hold for this general `K`. The structure theorem, the extension theory, the duality and the fundamental theorem hold for finite `K/ℚ_p`, which is Fontaine's setting (Fontaine03, §1.2, p. 289).

For finite `K/ℚ_p` the Lean statements realise `K` as a finite intermediate field of Mathlib's fixed algebraic closure `PadicAlgCl p` of `ℚ_p`. Then `C` is `PadicComplex p = ℂ_[p]`, and `G_K` is `PadicAlgCl p ≃ₐ[K] PadicAlgCl p` with its Krull topology. Every finite extension of `ℚ_p` embeds in `ℚ̄_p`, and the statements are invariant under the choice of embedding, so this realization loses no generality. PadicPeriodRings §2 identifies its general-base completion with `ℂ_[p]` in this case.

Write `σ̂ : ℂ_[p] → ℂ_[p]` for the action of `σ ∈ Gal(ℚ̄_p/K)` on `ℂ_p` constructed in PadicPeriodRings §1.1: the extension by continuity `UniformSpace.Completion.map σ`, which is the continuous extension of `σ` because `σ` preserves the spectral norm (`spectralNorm_eq_of_equiv`). Its laws are PadicPeriodRings §1.1's: `σ̂` restricts to `σ` on `ℚ̄_p`, it is the unique continuous extension, an isometric ring automorphism, `σ ↦ σ̂` respects composition, and the action map `G_K × ℂ_p → ℂ_p` is jointly continuous for the Krull topology; `ℂ_p^{G_K} = K` is its §1.2. Define `SemilinearRep p K W`, for a `ℂ_p`-module `W` with a topology, as a monoid homomorphism from `G_K` to the additive endomorphisms of `W` with two properties. Writing `σ · w` for the action, it is semilinear: `σ · (c • w) = σ̂(c) • (σ · w)`. It is jointly continuous on `G_K × W`. A finite-dimensional `W` carries its module topology (`IsModuleTopology`). Continuous additive maps between such spaces are automatically `ℚ_p`-linear, because they are `ℚ`-linear and `ℚ` is dense in `ℚ_p`. The Lean statements therefore quantify over continuous additive maps, and write `σ̂` as `UniformSpace.Completion.map σ`.

API of `SemilinearRep`:

- `ℂ_p` with `σ` acting by `σ̂` is a semilinear representation of dimension one: semilinearity is multiplicativity of `σ̂`, and joint continuity is PadicPeriodRings §1.1. Its Tate twists `ℂ_p(j)` (`σ` acting by `χ(σ)^j · σ̂`), finite direct sums and duals are semilinear representations.
- An equivariant `ℂ_p`-linear map between semilinear representations is a morphism. Kernels and images of such morphisms are semilinear representations.
- The forgetful passage to Banach `ℚ_p`-representations sends a finite-dimensional semilinear representation to its underlying `ℚ_p`-Banach space with the same action.

**Checks.**

- For `σ` the identity, `σ̂` is the identity of `ℂ_p`, so the semilinearity law at `σ = 1` reads `c • w = c • w`. A structure built over an arbitrary field automorphism of `ℂ_p` extending `σ`, ignoring continuity, would not be determined by `σ`, since `ℂ_p` has discontinuous field automorphisms.
- For `K = ℚ_p`, odd `p` and `σ` with `χ(σ) = a ≢ 1 mod p`, `σ̂(ζ_p) = ζ_p^a ≠ ζ_p`; at `p = 2`, where `ζ_2 = −1` is fixed, take `χ(σ) ≡ 3 mod 4`, so `σ̂(i) = −i`. For `K = ℚ_p(ζ_p)` every `σ ∈ G_K` fixes `ζ_p`.
- `ℂ_p(1)` and `ℂ_p` are both one-dimensional `SemilinearRep`s, yet the only equivariant `ℂ_p`-linear map between them is zero, since `H⁰(G_K, ℂ_p(±1)) = 0` (PadicPeriodRings §2). Forgetting the Galois action gives isomorphic one-dimensional `ℂ_p`-vector spaces, with `Hom_C(C(1), C) = C` and the identity of the underlying line invertible. For finite `K/ℚ_p`, forgetting only `C`-linearity of morphisms retains the zero continuous additive equivariant Hom group by §0.2.
- With the action `act σ = id` on `W = ℂ_p`, the semilinearity law at `c = ζ_p`, `w = 1` and the `σ` of the second Check gives `ζ_p = ζ_p^a` (at `p = 2`, `i = −i`), which is false, so the trivial action is not a `SemilinearRep` on `ℂ_p`.

The sympathetic and qBC constructions of Layers 2–6 use the parent's countability hypotheses: the residue field and `O_C/p` are countable. Fix a universe containing the sympathetic algebras and use the corresponding larger functor and `Ext` universes. No size-independent category of all algebras is assumed.

Functors on sympathetic `C`-algebras are covariant. Write `B = B_dR⁺(C)`, `B_m = B/t^m` for `m ≥ 1` (and `B_0 = 0`), `V₁(Λ) = Λ` and `U_d = (B_cris⁺)^{φ=p^d}`. Capitalised Module and Pair mean functors. Lower-case "model" means their topological `C`-valued presentation. Pairs are injective two-term left-heart presentations, localised at bicartesian squares. Their quotient is algebraic, with no closure imposed. No `C`-algebra section of `B_m → C` is chosen. A period Module has one uniform torsion exponent. TVS, qBC and height computations carry no Galois action unless one is stated.

In an almost presentation `W/V₂ ≅ C^d/V₁`, the spaces `V₂ ⊂ W` and `V₁ ⊂ C^d` are finite-dimensional stable `ℚ_p`-spaces, and `ht(W) = dim V₂ − dim V₁`. The BC presentation of the parent and Layer 6 instead uses `0 → F₁ → Y → V_d → 0` and `0 → F₂ → Y → W → 0`, with `ht(W) = dim F₁ − dim F₂`. The signed invariant agrees; the endpoint labels describe different presentations. Fix compatible `p`-power roots of unity `ε`, Fontaine's `t` and finite-character correction `π_t`, and put `t′ = t/π_t`. The character acting on `t′` is `χ⁽¹⁾(γ) = exp(log χ(γ̃))`, not a choice of cyclotomic value on a lift. Here `γ` generates `Gal(K_∞/K)` for the cyclotomic `ℤ_p`-extension. At odd `p`, `χ = χ⁽¹⁾ω` with `ω` of finite order. At `p = 2` the sign factor is retained and `χ⁽¹⁾` takes values in `1 + 4ℤ_2`.

**Checks.**

- `ℚ_p` has `(dim, ht) = (0, 1)`, `C` has `(1, 0)`, and `C/ℚ_p` has `(1, −1)`. The parent presentation gives the same heights 1, 0, −1.
- Over `ℚ₃` two lifts of `γ` have values `u` and `−u`, while `exp(log u) = exp(log(−u))`, so the finite character cancels in `t′`. At `p = 2`, `log(−1) = 0` and `exp(log 5) = 5`.
- For the two-term test in `B₂`, multiplication by `t′` sends `K` isomorphically to `Kt′`. The two expressions `t′(γ−1)z` and `(χ⁽¹⁾(γ)⁻¹γ − 1)t′z` both equal `t′γz − t′z`, so `d₁d₀ = 0`.
- The framed extension `0 → V₁ → B₂ → V₁ → 0`, with first map `c ↦ tc`, has disc parameter 1. The pushout relation `(tc, −c)` identifies its middle object by `(b, c′) ↦ b + tc′`; reversing that sign gives parameter −1.
- For `X = Y = ℚ_p` the `Ext` dimensions are `1, [K:ℚ_p] + 1, 0`, so the alternating Euler sum is `−[K:ℚ_p]`. The unsigned sum would be `[K:ℚ_p] + 2`.

## Exact supplier contracts

### From Mathlib

The pin is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

| Declaration and pinned file | Contract |
| --- | --- |
| `CategoryTheory.Functor` — Mathlib/CategoryTheory/Functor/Basic.lean:40 | Functor with object and map operations and identity and composition laws. It supplies neither sympathetic algebras nor boundedness. |
| `TopModuleCat` — Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41 | Bundled topological modules and continuous linear maps. Local convexity, completeness, strictness and the left heart come from LocallyAnalyticDistributions §0.0, not from this structure. |
| `ContinuousLinearMap.isOpenMap` — Mathlib/Analysis/Normed/Operator/Banach.lean:229 | A surjective continuous linear map of Banach spaces over a nontrivially normed field is open. Completeness of both spaces is required. |
| `ContinuousLinearMap.exists_preimage_norm_le` — Mathlib/Analysis/Normed/Operator/Banach.lean:162 | For a surjective continuous linear map of Banach spaces there is a constant giving preimages of controlled norm. This is not a linear section. |
| `Submodule.torsionBy` — Mathlib/Algebra/Module/Torsion/Basic.lean:177 | Submodule of elements killed by a scalar. `W[t^d]` below is this object. |
| `LinearMap` — Mathlib/Algebra/Module/LinearMap/Defs.lean:84 | Linear and semilinear maps, used for the period operators of §1.3. |
| `BDeRhamPlus` — Mathlib/RingTheory/Perfectoid/BDeRham.lean:75 | Theta-kernel adic completion after inverting `p`, for a commutative ring `R`, a prime `p`, `[Fact ¬IsUnit (p : R)]` and `[IsAdicComplete (Ideal.span {(p : R)}) R]`. No period topology and no Galois action are included. |
| `BDeRham` — Mathlib/RingTheory/Perfectoid/BDeRham.lean:88 | Localization of the positive period ring at generators of `ker θ`. A commutative ring, without the classical topology, the DVR structure or a Galois action. |
| `CategoryTheory.Abelian.Ext` — Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118 | `Ext` on an abelian category with `HasExt` in the selected universe. This is the `Ext` of `C(G_K)`. |
| `CategoryTheory.Abelian.Ext.mapExactFunctor` — Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:126 | The comparison map on `Ext` of an additive functor between abelian categories preserving finite limits and colimits, with `HasExt` on both sides. Its bijectivity for the two inclusions of §1.2 is a target. |
| `PadicAlgCl`, `PadicComplex` — Mathlib/NumberTheory/Padics/Complex.lean:54, 137 | The fixed algebraic closure of `ℚ_p` with its spectral norm, and its completion `ℂ_[p]`. The file defines no Galois action; PadicPeriodRings §1.1 supplies it, as `UniformSpace.Completion.map σ`. |
| `krullTopology` — Mathlib/FieldTheory/KrullTopology.lean:134 | The Krull topology on `L ≃ₐ[K] L`, used as the topology of `G_K`. |
| `spectralNorm_eq_of_equiv` — Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451 | `K`-algebra automorphisms preserve the spectral norm. This makes `UniformSpace.Completion.map σ` the continuous extension of `σ` (PadicPeriodRings §1.1). |
| `UniformSpace.Completion.map` — Mathlib/Topology/UniformSpace/Completion.lean:477 | Extension of a map to completions. It restricts to the map on the dense image when the map is uniformly continuous (`UniformSpace.Completion.map_coe`, line 488). |
| `IsModuleTopology` — Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133 | The module topology, the canonical topology of a finite-dimensional `ℂ_p`-space. |
| `AddMonoid.End` — Mathlib/Algebra/Group/Hom/Defs.lean:975 | The monoid of additive endomorphisms, the additive form of `Monoid.End` generated at that line by `to_additive`, and the target of the action map of a `SemilinearRep`. |
| `WithSeminorms.banach_steinhaus`, `BaireSpace.instBarrelledSpace` — Mathlib/Analysis/LocallyConvex/Barrelled.lean:164, 122 | The uniform boundedness principle for continuous linear maps from a barrelled space over a nontrivially normed field to a space with a generating family of seminorms, and barrelledness of every Baire topological vector space, in particular of every Fréchet space. No archimedean or ultrametric hypothesis is made. |
| `WittVector.fontaineTheta` — Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166 | `θ` from Witt vectors of the pretilt to a `p`-adically complete ring with `p` prime and not a unit. |

The positive period carrier requires `R` commutative, `p` prime, `[Fact ¬IsUnit (p : R)]` and `[IsAdicComplete (Ideal.span {(p : R)}) R]`. These hypotheses include no perfectoidness, DVR structure, topology or Galois action. For `R = O_C` the period suppliers identify this carrier with the classical one. In characteristic `p` the positive and localized rings are zero, and substituting `R = C` would make `p` a unit and violate the nonunit hypothesis.

### From Tau Ceti

The pin is `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Declaration and pinned file | Contract |
| --- | --- |
| `TauCeti.ExactStructure` — TauCeti/CategoryTheory/Exact/ExactStructure.lean:241 | Quillen exact structure on an additive category with zero object and binary biproducts, with genuine pushout and pullback squares. |
| `TauCeti.ExactStructure.IsConflationExact` — TauCeti/CategoryTheory/Exact/Functor.lean:74 | An additive functor preserving the conflations of two chosen exact structures. It does not assert preservation of all finite limits or colimits. |

The exact structures of `B(G_K)` and TVS are `TauCeti.ExactStructure` values, their comparison functors are conflation-exact, and `C(G_K)` uses abelian `Ext`. Abelianness of `C(G_K)`, its `Ext` universe and exactness of the two inclusions are targets here. The generic `Ext` map carries no assertion of bijectivity.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

The parent's Layer 5 supplies *Sympathetic Vector Spaces*. That includes the functorial period objects `B_dR⁺(Λ)`, `B_dR(Λ)` and `B_m(Λ)` on sympathetic algebras with their compatibility with algebra maps, reduction modulo the Cartier parameter, finite sums and evaluation at `C`. It also supplies *Finite-Dimensional Banach–Colmez presentations*, *Exact faithful Banach realization*, *Dimension and the abelian BC category*, *Dimensions of standard Banach–Colmez spaces*, *Curvature orthogonality*, *The tilted coherent heart*, *Le Bras equivalence*, *HN decomposition and connected components*, *Canonical curvature filtration*, *Artinian property of BC*, *Banach–Colmez morphism calculus*, *Torsion at an untilt point*, *Curvature-zero finite-length modules*, *VS Hom vanishing from torsion period modules*, *Curvature and HN support*, *Height of torsion period subobjects* and *Nonpositive curvature extension criterion*. Its Artinian property says that a proper BC subobject of `V₁` is a finite-dimensional `ℚ_p`-space. Together with Dimension this gives the analytic surjectivity and finite-kernel lemma used in Layers 0–1.

What VectorBundlesAndIsocrystals must provide (gap:G-HOM): in its Layer 5, *VS Hom vanishing from torsion period modules*, for every classical BC `W`, every VS natural map `W → B_dR` factors through the sub-VS `t^(−N)B_dR⁺` for one `N ≥ 0` independent of `Λ` (CN25, Corollary 3.18 and proof, p. 18). The parent proves the vanishing for torsion sources only. The bounded factorization for every BC source is the missing statement. Read pointwise, "for each `Λ` and each element some `N`", the condition would be empty, since `B_dR(Λ)` is the union of the `t^(−N)B_dR⁺(Λ)`.

### From TauCetiRoadmap.PadicPeriodRings

Section 1.1 supplies, for finite `K/ℚ_p` inside `PadicAlgCl p`, the action of `G_K` on `ℂ_[p]` by `UniformSpace.Completion.map σ` with the laws assumed of it in the Conventions: restriction to `σ` on `ℚ̄_p`, uniqueness of the continuous extension, isometry, compatibility with composition and joint continuity of `G_K × ℂ_p → ℂ_p` for the Krull topology. Section 1.2 supplies `ℂ_p^{G_K} = K` for such `K`. Sections 1.5, 2 and 4.1–4.3 supply `B_dR⁺`, `B_dR`, `θ`, `t`, their topologies and continuous actions, the complete discrete valuation ring structure of `B_dR⁺` with residue field `C`, the `G_K`-fixed embedding `K → B_dR⁺` lifting `K ⊂ C` (§4.3; this roadmap's §0.8 extends it to `K̄`), the fixed fields `K`, crystalline periods and the fundamental period sequence. Section 2 supplies `H⁰(G_K, C) = K` and `H⁰(G_L, C(j)) = 0` for `j ≠ 0` over every finite `L/K` in the general-base convention. The sympathetic extensions are consumed through the parent's period objects.

### From TauCetiRoadmap.PadicHodgeTheory

Section 4.4 supplies the Sen module and the Sen operator of a finite-dimensional continuous semilinear `C`-representation, scalar-extension recovery, and tensor and dual compatibility. Section 0.3 supplies, for finite `K/ℚ_p`, the unique `K₀`-algebra lift `K̄ → B_dR⁺` of `K̄ ⊂ C`, which is `G_K`-equivariant; this roadmap's §0.8 constructs it for the general base field. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 supplies the compatible labelled rational Sen operators.

### From TauCetiRoadmap.LocallyAnalyticDistributions

Section 0.0 supplies the category of nonarchimedean locally convex spaces, its strict derived category and left heart (*Left hearts and strict exactness*), bounded sets, projective tensors and separated completions. Section 0.2 supplies the comparison of strict sequences with the left heart, the closure of Banach and Fréchet spaces under extensions, Fréchet open mapping, *Continuous functional extension in countable type*, and *Strict countable inverse limits and cohomology* with its strict Roos surjectivity and finite-dimensional Mittag–Leffler hypotheses. Its *Extensions of spaces of compact type* keeps the subsection hypothesis of a finite `K/ℚ_p` and its spherical-completeness-or-separability alternatives, so this roadmap's §4.6 proves the separable extension over `C` needed here. Its compact-type contract of §0.0, completeness and regularity, is stated for countable Banach systems with injective compact transitions over finite `K/ℚ_p`; over `C` a compact map of Banach spaces is zero, so it is not used for `C`-spaces or `B_m`-models, and §2.5 here states the compactoid version. Sections 0.1 and 0.3 and Layer 1 supply locally analytic functions, continuous functions, distributions, measures and their analytic-stage and strong dual topologies over `ℚ_p`.

### From TauCetiRoadmap.CompactOperators

Section 0.5 supplies `IsCompactoidSet` and `HasCompactoidImage` for Banach spaces over a complete nontrivially normed ultrametric field, with no discreteness, local compactness or spherical completeness assumed, and its model-space criterion: a subset of `c₀(I, K)` is compactoid exactly when it is bounded and its coordinates are uniformly small outside a finite set of indices. Over `ℂ_p` it records that the identity of a line has compactoid image without being a compact operator. Its theory is for Banach spaces; the `B_m`-relative notion, compact-type inductive limits over `C` and `B_m`, and their completeness, regularity and permanence are this roadmap's §2.5.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Section 1.1 supplies finite-dimensional continuous representations and their morphisms. The Banach ambient category is constructed in this roadmap's §0.1.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Sections R02.1.3 and D7.4 supply rationalization and derived local Tate duality for finite-dimensional `ℚ_p`-representations. The continuous cyclotomic descent for finite-length periods in Fontaine's two-operator complex is proved in this roadmap's §1.4. The discrete-coefficient Hochschild–Serre theorem of §R02.2.1 does not supply it.

### From TauCetiRoadmap.PerfectoidSpaces and TauCetiRoadmap.PerfectoidTowers

PerfectoidSpaces Layer P1 supplies the Frobenius criterion for complete uniform perfectoid rings, P3 almost purity, P6 the pro-étale presentation calculus, and §P7.16 (*proetale-site*) the pro-étale site of a rigid space with its basis of affinoid perfectoid objects. PerfectoidTowers §P9.2 (*completed-structure-sheaves*) supplies, on that site, `O⁺ = ν*O⁺_ét`, `O = ν*O_ét`, `Ô⁺ = lim_m O⁺/p^m` and `Ô = Ô⁺[1/p]`, with their sections on affinoid perfectoid objects; §P9.4 (*profinite-galois-tower*) supplies pro-étale Galois towers with perfectoid limit; §P9.6 supplies *almost-cohomology-of-tower* and *function-descent-along-tower*, with their stated base and coefficient topologies: a pro-étale Galois tower over a smooth rigid space over a complete discretely valued field with perfect residue field, the almost statement read after base change to `C`. This roadmap's §3.2 constructs the sympathetic disc cover and verifies the perfectoid hypotheses. Its §3.4 applies the tower statements to the Kummer–cyclotomic tower of the disc over `ℚ_p`, whose base change to `C` is that cover, and reaches the sympathetic closure by inflation and almost purity (PerfectoidSpaces §P3), never by applying them to the closure itself; it proves the resulting identification of continuous `H_C`-cohomology with `Ô`-cohomology of the closed disc at every prime.

### From TauCetiRoadmap.DiamondsAndVStacks

Section D2.2 (*small-pro-etale-site-and-v-site*) supplies the v-site of perfectoid spaces, whose coverings are the families satisfying the finite quasicompact image condition. The `ℚ_p`-module v-sheaves over `Perf_C` of §6.2 are sheaves on its slice over `Spa(C, O_C)`.

## How to read the build

Layer 0 builds the strict Banach Galois category, Fontaine's full faithfulness, analyticity of fundamental extensions, the fundamental theorem for an extension of a `C`-line, the abelian category of almost `C`-representations, and the rigidity of continuous equivariant maps between de Rham periods. The fundamental theorem §0.10 depends only on §§0.1–0.3 and the parent and is proved before §0.5, which uses it. Layer 1 builds the arithmetic extension theory: almost-split extensions, the Yoneda comparison, the two-operator complex, Euler–Poincaré duality, the period `Ext` table and the equivariant analytic realization. Layer 2 builds the left-heart functor category TVS, completed period Modules and Pairs. Layer 3 computes the perfectoid disc class `Ext¹_TVS(V₁,V₁) ≅ C`. Layer 4 proves Hom and `Ext¹` comparisons for reasonable period models and Pairs. Layer 5 defines qBC and proves its intrinsic filtration and full faithfulness. Layer 6 returns to the parent's VS category and proves the period-valued height–rank formula, using its own sheaf and colimit comparisons and the projectivity of the constant source. Layers 0–1 and Layers 2–5 are independent. Layer 6 uses only the parent and Layer 2's conventions.

## Layer 0: Almost C-representations and period rigidity

### 0.1 Strict Banach Galois representations

Define `B(G_K)` for a profinite `G_K` as follows. Its objects are `ℚ_p`-Banach spaces, up to equivalent norms, with a jointly continuous linear `G_K`-action. Its morphisms are continuous equivariant linear maps. A conflation is an algebraically exact sequence `0 → W₁ → W → W₂ → 0` of such maps. Equivalently, the first map identifies `W₁` topologically with a closed kernel and the second is an open surjection. Prove that these conflations form a `TauCeti.ExactStructure`. No finiteness of `K` over `ℚ_p` is needed (CN25, §2.1, pp. 8–9; Fontaine03, §1.2, p. 289).

A proof route: the open mapping theorem `ContinuousLinearMap.isOpenMap` makes a continuous surjection open and a continuous bijection onto a closed kernel a homeomorphism. Kernels are closed and complete. Pullbacks of open surjections and pushouts of closed embeddings give the exact-category axioms.

*Needs:* `TopModuleCat`; `ContinuousLinearMap.isOpenMap`; ArithmeticGaloisRepresentations §1.1; `TauCeti.ExactStructure`.

API:

- The category has a forgetful functor to topological `ℚ_p`-modules, faithful and reflecting isomorphisms between Banach objects.
- A sequence of three Banach representations is a conflation exactly when it is algebraically exact: the open mapping theorem supplies strictness.
- Pullbacks of deflations and pushouts of inflations exist and are conflations. The finite-dimensional representations of ArithmeticGaloisRepresentations §1.1 form a full subcategory closed under conflations.

**Checks.**

- The zero representation is a zero object.
- A short exact sequence of finite-dimensional continuous representations is a conflation with its usual topology.
- The `log χ` extension of `ℚ_p` by `ℚ_p` is a conflation that does not split equivariantly. An exact structure consisting of split sequences only would exclude it.
- The diagonal injection `T : c₀ → c₀`, `T(x)_n = p^n x_n`, with trivial action is not an inflation: its image is dense and not closed, so `0 → c₀ → c₀ → c₀/T(c₀) → 0` is not a conflation.

### 0.2 Fontaine full faithfulness

For finite `K/ℚ_p`, the forgetful functor from finite-dimensional continuous semilinear `C`-representations to `B(G_K)` is fully faithful. That is, every continuous `ℚ_p`-linear `G_K`-equivariant map between two such representations is `C`-linear. Lean: `semilinearRep_equivariant_map_smul`, stated with `SemilinearRep` and continuous additive maps (Fontaine03, Théorème A, p. 290, and §3.3; CN25, Theorem 2.1, p. 9). The forgetful functor from finite-length continuous semilinear `B_dR⁺`-representations to `B(G_K)` is also fully faithful: every continuous equivariant `ℚ_p`-linear map between two such objects is `B_dR⁺`-linear (Fontaine03, Théorème A′, p. 291, and §3.3).

A proof route: pass to the Sen module and operator of the source and target. A continuous equivariant map induces a map of Sen modules commuting with the Sen operators, and the semilinear structure forces linearity. For `B_dR⁺`-representations use the finite-length dévissage of Fontaine03 §3.3. The labelled rational Sen theory is imported with its finite-coefficient hypotheses.

*Needs:* §0.1; PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; PadicPeriodRings §§4.1–4.3; for the Lean statement, PadicPeriodRings §1.1 and `SemilinearRep` (Conventions).

**Checks.**

- For source 0 both Hom groups are 0.
- For `C` to itself, the equivariant endomorphisms are multiplication by elements of `K` on both sides: `C`-linearity gives multiplication by some `c`, and equivariance puts `c` in `C^{G_K} = K`.
- From `B₁` to `B₂` both equivariant Hom groups are 0, although the `B_dR⁺`-linear map `1 ↦ t` that ignores the action is nonzero.
- From `C` to `C(1)` every continuous equivariant additive map is 0: it is `C`-linear, so it is multiplication by an element of `H⁰(G_K, C(1)) = 0`.

### 0.3 Analyticity of fundamental extensions

Let `K/ℚ_p` be finite, and let `0 → V → E → W → 0` be a strict Banach extension with `V` a finite-dimensional `ℚ_p`-representation and `W` a one-dimensional `C`-representation. Then `E` has the effective classical BC realization constructed in Fontaine03 §4, of Dimension `(1, dim_ℚ_p V)`. Every continuous equivariant `ℚ_p`-linear `η : E → C` is induced by a BC morphism from this realization to `V₁`. The construction and the analyticity use the finite-period presentation and do not assume that `η` is surjective (Fontaine03, §4, Proposition 4.2, p. 333, and Proposition 4.4, p. 337; end of the proof of Théorème 4.1, p. 340).

A proof route: use the analytic Banach construction `W ↦ W^an` of Proposition 4.2. Quotient by `ker(η|V)`, use the `B₂` presentation of Proposition 4.4 and §0.2 to identify `η` as analytic, then restore the finite constant kernel. The parent's functorial BC realization gives the sympathetic interpretation.

*Needs:* §0.1; §0.2; VectorBundlesAndIsocrystals, Layer 5, *Finite-Dimensional Banach–Colmez presentations*; VectorBundlesAndIsocrystals, Layer 5, *Dimension and the abelian BC category*.

**Checks.**

- For `E = V ⊕ C` and `η` the projection, the realized map is the BC projection and the Dimension is `(1, h)`.
- For `η = 0` the realized map is 0 and analytic, although it is not surjective.
- For `V = 0` and `W = C(1)` the equivariant map to `C` is 0. The claim gives analyticity, not an isomorphism `C(1) → C` in `B(G_K)`.

### 0.4 Almost C-representations

For `K` in the general-base convention, define `C(G_K)` as the full subcategory of `B(G_K)` of those `W` that admit two finite-dimensional `G_K`-stable `ℚ_p`-subspaces `V₂ ⊂ W` and `V₁ ⊂ C^d` and a continuous equivariant isomorphism `W/V₂ ≅ C^d/V₁`. Two Banach representations are almost isomorphic when they become isomorphic after quotienting each by a finite-dimensional stable subspace. The presentation integers are `dim(W) = d` and `ht(W) = dim_ℚ_p V₂ − dim_ℚ_p V₁`. For finite `K/ℚ_p`, their independence of the presentation and the abelian structure are §0.5 (CN25, §2.2.1 and Remark 2.3, p. 9; Fontaine03, §1.4, p. 291).

*Needs:* §0.1.

API:

- Identities, composition and the fully faithful inclusion in `B(G_K)` are inherited.
- Almost isomorphism is reflexive, symmetric and transitive: a common refinement of two finite-dimensional modifications is again one.
- For finite `K/ℚ_p`, the Dimension and height descend from presentations by §0.5, and conflations are inherited from `B(G_K)`.

**Checks.**

- `W = ℚ_p` uses `V₂ = ℚ_p`, `d = 0`, `V₁ = 0` and gives `(dim, ht) = (0, 1)`.
- `W = C` uses zero finite subspaces and gives `(1, 0)`. `W = C/ℚ_p` uses `V₁ = ℚ_p`, `V₂ = 0` and gives `(1, −1)`.
- For `W = C ⊕ ℚ_p`, the presentation `V₂ = ℚ_p`, `V₁ = 0` gives height 1. The presentation `V₂ = ℚ_p ⊕ ℚ_p ⊂ C ⊕ ℚ_p`, `V₁ = ℚ_p ⊂ C` has the same quotient `C/ℚ_p` on both sides and gives height `2 − 1 = 1`. An unsigned sum would give 3 instead of 1.

### 0.5 The abelian category and its Dimension

For finite `K/ℚ_p`, `C(G_K)` is an abelian strict full subcategory of `B(G_K)`. Its morphisms are strict, and their Banach kernels and cokernels remain almost `C`. The presentation integers `d` and `ht` do not depend on the presentation and are additive in short exact sequences. The exact structure is the restriction of the ambient one, and arithmetic `Ext` is `CategoryTheory.Abelian.Ext` with a compatible `HasExt` universe (Fontaine03, Théorème B, p. 291; Théorème 5.1 and §5.1, pp. 341–345; CN25, §2.2.1, p. 9).

A proof route: follow Fontaine03 §5.1, with the analytic morphisms of §0.3 and the parent's Dimension and subobject calculus. Where Fontaine03 §5.1 applies its Théorème 4.1 to the restriction of a morphism to an extension of a `C`-line by a finite-dimensional representation (Fontaine03, proof of Théorème 5.1, p. 343), use §0.10, which needs only §§0.1–0.3 and the parent and is proved before this target. This avoids using the structure theorem as its own input.

*Needs:* §0.4; §0.3; §0.10; VectorBundlesAndIsocrystals, Layer 5, *Dimension and the abelian BC category*; VectorBundlesAndIsocrystals, Layer 5, *Artinian property of BC*; `TauCeti.ExactStructure`; `CategoryTheory.Abelian.Ext`.

**Checks.**

- For `0 → ℚ_p → C → C/ℚ_p → 0`, dimensions give `1 = 0 + 1` and heights give `0 = 1 + (−1)`.
- For `0 → C(1) → B₂ → C → 0`, dimensions give `2 = 1 + 1` and heights give `0 = 0 + 0`.
- The zero object has Dimension `(0, 0)`. An isomorphism has zero kernel and cokernel, both of Dimension `(0, 0)`.

### 0.6 Finite-length periods are almost C

For finite `K/ℚ_p`, every finite-length semilinear `B_dR⁺`-representation `W` of length `d` is almost isomorphic to `C^d` and has Dimension `(d, 0)`. In particular every finite-dimensional semilinear `C`-representation lies in `C(G_K)` (Fontaine03, Théorème C, p. 291, and §5.5; CN25, §2.2.1, p. 9).

*Needs:* §0.2; §0.5.

**Checks.**

- `B₂` is almost isomorphic to `C²` and has Dimension `(2, 0)`.
- `C(1)` is almost isomorphic to `C`, although the equivariant Hom groups between them vanish in both directions.
- The zero period module has length 0 and Dimension `(0, 0)`. `ℚ_p` has Dimension `(0, 1)`, so it is not a length-zero period representation.

### 0.7 Scalar endomorphisms over a general base field

For every complete discretely valued `K` of characteristic zero with perfect residue field, the continuous `ℚ_p`-linear `G_K`-equivariant endomorphisms of `C` are the multiplications by elements of `K`. No finiteness over `ℚ_p` is assumed (Fontaine04, Proposition 6.2, p. 107, proof §6.2, p. 111; CN25, Remark 2.2, p. 9, and Proposition 2.13(i), p. 11).

A proof route: Fontaine's general-base argument, which CN25 Proposition 2.13(i) cites. The class-field-theoretic alternative proves only the finite case.

*Needs:* PadicPeriodRings §2; PadicPeriodRings §§4.1–4.3.

**Checks.**

- The identity corresponds to `1 ∈ K`.
- For `K = ℚ_p` the scalar `p` gives multiplication by `p`, not 0.
- For `a ∈ C ∖ K`, multiplication by `a` is not equivariant: choose `g` with `g(a) ≠ a`, so `g(a·1) ≠ a·g(1)`.

### 0.8 Density of algebraic constants

For every complete discretely valued `K` of characteristic zero with perfect residue field, let `K` act on `B_dR⁺` through the `G_K`-fixed embedding `K → B_dR⁺` of PadicPeriodRings §4.3, whose composite with `θ` is the inclusion `K ⊂ C`. Construct the canonical embedding `ι : K̄ → B_dR⁺` as the unique `K`-algebra map with `θ ∘ ι` equal to the inclusion `K̄ ⊂ C`. It exists and is unique because `B_dR⁺` is a local `K`-algebra, separated and complete for the `ker θ`-adic topology, with residue field `C` of characteristic zero, so that `θ` maps the separable closure of `K` in `B_dR⁺` isomorphically onto the algebraic closure `K̄` of `K` in `C` (Colmez12, Lemme 1.3, pp. 111–112). Uniqueness makes `ι` `G_K`-equivariant: for `g ∈ G_K`, `g ∘ ι ∘ g⁻¹` is again a `K`-algebra lift, since `g` fixes the image of `K` and commutes with `θ`. For finite `K/ℚ_p`, `ι` is the lift of PadicHodgeTheory §0.3. Prove that `ι` has dense image for the inverse limit of the Banach quotient topologies (Colmez12, Théorème 3.1(iii), p. 117; CN25, Proposition 2.13(ii), p. 11). The vanishing of nonzero-twist invariants over every finite `L/K` is supplied by PadicPeriodRings §2.

*Needs:* PadicPeriodRings §1.5; PadicPeriodRings §2; PadicPeriodRings §§4.1–4.3.

**Checks.**

- Modulo `t` the dense image is the dense inclusion `K̄ ⊂ C`.
- `K` is complete and hence closed in `C`, so replacing `K̄` by `K` fails already modulo `t`.
- In `B₂`, density requires approximating the nonzero element `t`, whose reduction in `C` is 0, so density in the residue field alone does not suffice.
- For `K = ℚ_p`, `X² − p` has exactly two roots in `B_dR⁺`, the Hensel lifts of the simple roots `√p` and `−√p` in `C`, and `ι(√p)` is the one with `θ(ι(√p)) = √p`. Composing with the nontrivial automorphism of `ℚ_p(√p)` gives the other `ℚ_p`-algebra map `ℚ_p(√p) → B_dR⁺`, which lifts `−√p` and so is not a lift of the inclusion. An element `g ∈ G_K` with `g(√p) = −√p` sends `ι(√p)` to the root with `θ`-image `−√p`, which is `−ι(√p) = ι(g(√p))`, as equivariance requires.
- The `K`-algebra condition is needed for uniqueness: a ring map `ℚ_p → B_dR⁺` lifting `ℚ_p ⊂ C` can send one element `x` of a transcendence basis of `ℚ_p` over `ℚ` to the canonical image of `x` plus `t`. It is defined on the field generated by the basis because nonzero elements go to elements with nonzero `θ`-image, which are units, and it extends to `ℚ_p` by the same Hensel lemma. It lifts `ℚ_p ⊂ C` but differs from the canonical map at `x`, by `t ≠ 0`.

### 0.9 Continuous equivariant Hom in de Rham periods

All Hom groups here are continuous `ℚ_p`-linear `G_K`-equivariant maps, not assumed `B_dR⁺`-linear, for general `K`. The period quotients and `B_dR` carry their natural topologies and actions. Prove the following (CN25, Proposition 2.14(i)–(iv), pp. 11–12).

1. `Hom(C, C(j))` is `K` for `j = 0` and 0 otherwise.
2. For `N ≥ 0` and `k ≥ 1`, `Hom(B_dR⁺, t^(−N)B_dR⁺/t^k B_dR⁺) = K`, by scalar multiplication followed by reduction, compatibly in `k`.
3. `End(B_dR⁺) = End(B_dR) = K`, and for integers `j < k`, `Hom(t^j B_dR⁺/t^k B_dR⁺, B_dR) = 0`.
4. For `1 ≤ k < ℓ`, `Hom(B_dR⁺/t^k, B_dR⁺/t^ℓ) = 0`.

A proof route: by §0.7 a map on `C(j)` with `j ≠ 0` kills the dense `K̄`. For the truncated target, smooth vectors and density first place the image in `B_dR⁺/t^k`. Reduce by `θ` to obtain a unique `K`-scalar; the difference vanishes on `K̄`, hence everywhere. Pass to the inverse limit for `B_dR⁺`. For `B_dR`, conjugate by `t^N`, applying the positive result to `x ↦ t^N f(t^(−N)x)`, and compare scalars on a common lattice. For torsion sources, choose elements of `K̄` tending to `t^k` in `B_dR⁺` and to zero in the source. Continuity then forces the `K`-scalar to vanish.

*Needs:* §0.7; §0.8; PadicPeriodRings §2; PadicPeriodRings §4.3.

**Checks.**

- `Hom(B₁, B₂) = 0` in this Galois category, even though `B_dR⁺`-linear maps `C → B₂` that ignore the action exist.
- The condition `ℓ > k` matters: `End(B_k)` contains the identity.
- For `(N, k) = (1, 1)`, `Hom(B_dR⁺, t^(−1)B_dR⁺/tB_dR⁺) = K`, spanned by the reduction of `1`, although the target is an extension of `C(−1)` by `C`. A count with one scalar for each graded piece would give `K²`.

### 0.10 The fundamental theorem for an extension of a C-line

Let `K/ℚ_p` be finite, `V` a continuous `ℚ_p`-representation of dimension `h`, `W` a one-dimensional continuous semilinear `C`-representation, and `0 → V → E → W → 0` a strict extension in `B(G_K)`. If a continuous equivariant `ℚ_p`-linear `η : E → C` satisfies `η(E) ≠ η(V)`, then `η` is surjective and `ker η` is a finite-dimensional `ℚ_p`-representation of dimension `h`. Lean: `fundamental_extension_surjective`, with `E` a `ℚ_p`-Banach space with jointly continuous linear action, `V` a finite-dimensional subspace, stable because it is the kernel of the equivariant `q`, and `q : E → W` a continuous equivariant surjection with kernel `V` (Fontaine03, Théorème 4.1, p. 329, proof completed p. 340; FF18, Preface, Theorem 2.25, pp. 21–22, the case `W = C`). The hypothesis compares images; `η ≠ 0` is not enough.

A proof route: §0.3 gives a BC source of Dimension `(1, h)` and a BC map to `V₁`. If `η(E)` were finite-dimensional, the induced map `W → η(E)/η(V)` would vanish: compose with the inclusion into `C ⊗_ℚ_p (η(E)/η(V))` and apply §0.2, since a nonzero `C`-linear image cannot lie in a finite-dimensional `ℚ_p`-space. So unequal images force an infinite-dimensional image, and the parent's Artinian property makes `η` surjective. Dimension additivity gives `Dim(ker η) = (1, h) − (1, 0) = (0, h)`, and zero-dimensional BC objects are finite `ℚ_p`-spaces.

*Needs:* §0.1; §0.2; §0.3; VectorBundlesAndIsocrystals, Layer 5, *Dimension and the abelian BC category*, *Banach–Colmez morphism calculus*, *Artinian property of BC* and *Height of torsion period subobjects*; for the Lean statement, PadicPeriodRings §1.1 and `SemilinearRep` (Conventions).

**Checks.**

- For `W = C`, `E = V ⊕ C` and `η = (g, 1)`, the kernel is `{(v, −g(v))} ≅ V`, of dimension `h`.
- `η = (g, 0)` has `η(E) = η(V)` and is excluded, even when `g ≠ 0`. Its kernel `ker g ⊕ C` is infinite-dimensional, so the hypothesis cannot be dropped.
- For `V = 0` and `W = C(1)`, every equivariant `η : W → C` is 0, so the hypothesis fails.
- For `E = U₁ = (B_cris⁺)^{φ=p}`, `V = ℚ_p t` and `η = θ`, the image of `V` is 0 and `θ(U₁) = C`, so the theorem gives the fundamental exact sequence `0 → ℚ_p t → U₁ → C → 0`, with kernel of dimension 1 = `dim V`.

### Examples

The almost presentations give height 1 for `ℚ_p` and −1 for `C/ℚ_p`. `B₂` has Dimension `(2, 0)` and is almost isomorphic to `C²`. For general `K`, multiplication by an element of `C` outside `K` is not equivariant. For finite `K/ℚ_p`, an equivariant continuous map `C(j) → C(j′)` is multiplication by an element of `H⁰(G_K, C(j′ − j))`, which is `K` or 0. In a split extension `V ⊕ C`, a projection to `C` has kernel `V`, as the fundamental theorem predicts.

### Dependencies

`TopModuleCat`; `ContinuousLinearMap.isOpenMap`; `TauCeti.ExactStructure`; `CategoryTheory.Abelian.Ext`; `PadicComplex`; `krullTopology`; `spectralNorm_eq_of_equiv`; `UniformSpace.Completion.map`; `IsModuleTopology`; ArithmeticGaloisRepresentations §1.1; PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; PadicPeriodRings §§1.1–1.2, 1.5, 2, 4.1–4.3; VectorBundlesAndIsocrystals, Layer 5, *Finite-Dimensional Banach–Colmez presentations*, *Dimension and the abelian BC category*, *Artinian property of BC*, *Banach–Colmez morphism calculus* and *Height of torsion period subobjects*.

## Layer 1: Arithmetic extensions and duality

### 1.1 Almost-split extensions

For finite `K/ℚ_p`, an extension in `B(G_K)` of two almost `C`-representations has an almost `C` middle term if and only if it is almost split. Almost split means that there is a finite-dimensional stable `ℚ_p`-subspace `Z` of the kernel such that the sequence obtained by quotienting by `Z` has a continuous equivariant splitting. In particular every short exact sequence in `C(G_K)` is almost split. For an extension in `B(G_K)` of two finite-length `B_dR⁺`-representations, the middle term is a finite-length `B_dR⁺`-representation if and only if the extension is almost split. Such a structure on the middle term makes both maps `B_dR⁺`-linear and is unique, by the second half of §0.2 (Fontaine03, Théorème D(i)–(ii), pp. 291–292, and §§5.2, 5.4–5.5; CN25, §2.2.1 and Proposition 2.5, pp. 9–10). A splitting after a finite scalar extension is not what almost split means.

A proof route: by Fontaine03 Théorème D, quotient by a finite stable kernel to obtain a split extension of `C`-representations. For the converse, recover the middle term by adjoining that finite kernel; almost presentations are stable under finite modifications. Fontaine03 Proposition 5.5, p. 344, and Théorème 5.6, p. 346, move extension classes into the finite-period or finite-`ℚ_p` subcategory. These resolutions are inputs of §1.2.

*Needs:* §0.1; §0.2; §0.4; §0.5; §0.6.

**Checks.**

- The extension `0 → C(1) → B₂ → C → 0` does not split equivariantly: its class spans `Ext¹(C, C(1)) = K`. It is almost split with `Z = ℚ_p t`: the space `U₁ = (B_cris⁺)^{φ=p}` injects into `B₂`, meets `C(1) = tB₂` in `ℚ_p t` and maps onto `C`, so `U₁/ℚ_p t` splits the quotient sequence. Almost splitting therefore does not make `Ext¹` vanish.
- For `0 → ℚ_p → C → C/ℚ_p → 0`, take `Z = ℚ_p`: the quotient sequence `0 → 0 → C/ℚ_p → C/ℚ_p → 0` splits.
- The extension of `ℚ_p` by `ℚ_p` given by `log χ` is almost split with `Z = ℚ_p`, although it does not split equivariantly.
- For `0 → C(1) → B₂ → C → 0` the ends are `B_dR⁺`-representations, the middle term is the `B_dR⁺`-representation `B₂`, and the sequence is almost split with `Z = ℚ_p t`, as the second equivalence requires. For `0 → ℚ_p → C → C/ℚ_p → 0` neither end is a `B_dR⁺`-representation, their Dimensions `(0, 1)` and `(1, −1)` having nonzero height while §0.6 gives height 0, so only the first equivalence applies; reading the second one as a statement about an almost `C` middle term would make it a special case of the first.

### 1.2 Yoneda Ext comparison for arithmetic period objects

For finite `K/ℚ_p`, the inclusions `Rep_ℚ_p(G_K) → C(G_K)` and `Rep_{B_dR⁺}^{fl}(G_K) → C(G_K)` induce isomorphisms on `Ext^i` for every `i ≥ 0` between objects of the respective source category. Each source category has its own abelian structure. The comparison preserves Yoneda products, connecting maps and Tate twists. The maps are `CategoryTheory.Abelian.Ext.mapExactFunctor` of the two exact inclusions, and the statement is their bijectivity (CN25, Proposition 2.5, pp. 9–10; Fontaine03, Propositions 6.4–6.5, pp. 357–359). It does not identify `Ext` between objects of mixed types by forgetting scalar structure.

A proof route: use §0.2 and the almost-split resolutions of §1.1 to represent target extension classes in each source category and compare equivalences there. Apply the all-degree effacement argument of Fontaine03 Propositions 6.4–6.5, using its Proposition 5.5, p. 344, and Théorème 5.6, p. 346. Naturality of the inclusion on Yoneda representatives gives products and boundaries.

*Needs:* §0.2; §0.4; §0.5; §0.6; §1.1; `CategoryTheory.Abelian.Ext.mapExactFunctor`.

**Checks.**

- Degree zero recovers §0.2.
- In degree one, for `C` and `C(1)`, the class of the nonsplit extension `B₂` is a nonzero element of both groups.
- In degree two, `Ext²_{Rep_ℚ_p}(ℚ_p, ℚ_p(1)) = H²(G_K, ℚ_p(1)) ≅ ℚ_p` maps isomorphically onto `Ext²_{C(G_K)}(ℚ_p, ℚ_p(1))`. A comparison valid only in degrees at most one would miss it.

### 1.3 Cyclotomic data and generalized invariants

For finite `K/ℚ_p`, fix compatible primitive `p`-power roots of unity, `χ`, the cyclotomic `ℤ_p`-extension `K_∞/K`, a generator `γ` of its Galois group, and Fontaine's finite-character correction `π_t`. Put `t′ = t/π_t`, a uniformizer fixed by `G_{K_∞}`, with `γ(t′) = χ⁽¹⁾(γ)t′`, where `χ⁽¹⁾(γ) = exp(log χ(γ̃))` for any lift `γ̃` to `G_K`. This removes the finite-order character `ω`, and `χ⁽¹⁾` does not depend on the lift. For a finite-length period representation `W`, define `W_(0)` as the union over `r ≥ 1` of the vectors killed by every product `(g₁ − 1)⋯(g_r − 1)`. Set `W_(1) = t′((t′)^(−1)W)_(0)`, where `(t′)^(−1)W` is the period-twisted module, not an inverse operator on a torsion module. The generalized-invariant spaces are `K`-vector spaces (CN25, §2.2.2 and footnote 3, p. 10; Fontaine03, §2.1, p. 296, §2.3, p. 306, and §2.5, p. 308).

A proof route: PadicPeriodRings §§1.5 and 4.1 give `χ` and `t`. Construct `π_t` and `t′` as in Fontaine03 §2.1, p. 296, and `χ⁽¹⁾` as in its §2.3, p. 306. At `p = 2` keep the sign character. Form the increasing union of simultaneous nilpotence kernels, transport it by the period twist, and verify functoriality and the `Γ`-action.

*Needs:* §0.4; §0.5; §0.6; PadicHodgeTheory §4.4; PadicPeriodRings §§4.1–4.3.

API:

- `π_t` and `t′` with their transformation laws under `G_K`.
- The union of simultaneous nilpotence kernels, functorial in equivariant maps.
- `W_(1) = t′((t′)^(−1)W)_(0)` with the induced operators `t′` and `χ⁽¹⁾(γ)^(−1)γ`.

**Checks.**

- Both spaces vanish for the zero representation.
- For `W = C`, `W_(0) = K` and `W_(1) = 0`.
- For `W = B₂`, `W_(0) = K` and `W_(1) = Kt′`, and multiplication by `t′` between them is an isomorphism.
- For `W = C(1) = tB₂`, on which `t′` acts by zero, the period twist `(t′)^(−1)W` is `C` with its untwisted action, so `W_(1) = t′·K = Kt′`, while `W_(0) = 0` since `H⁰(G_K, C(1)) = 0`. Reading `(t′)^(−1)` as an inverse operator on `W` would be meaningless here, since `t′` kills `W`. The values `(0, Kt′)` agree with the complex of §1.4 for `C(1)`, whose cohomology is `0, K, K`.
- For `K = ℚ₃` two lifts may have `χ`-values `u` and `−u`, but `exp(log u) = exp(log(−u))`, so `χ⁽¹⁾` is unchanged. For odd `p`, `χ = χ⁽¹⁾ω`; at `p = 2`, `ω` is the sign character.

### 1.4 The twisted three-term Ext complex

For finite `K/ℚ_p` and a finite-length `B_dR⁺`-representation `W`, `Ext^i_{C(G_K)}(C, W)` is naturally the degree-`i` cohomology of the complex `W_(0) → W_(1) ⊕ W_(0) → W_(1)` in degrees 0, 1, 2. The differentials are `d₀(z) = (t′z, (γ−1)z)` and `d₁(x, y) = t′y − (χ⁽¹⁾(γ)^(−1)γ − 1)x`, and all other degrees vanish. The composite is zero because `γ ∘ t′ = χ⁽¹⁾(γ) t′ ∘ γ` (CN25, Proposition 2.7 and equation (2.8), p. 10; Fontaine03, Théorème 2.14 and proof, pp. 309–311).

A proof route: by §1.2, work with finite-length period representations. Fontaine03 Théorème 2.14 uses finite Galois and cyclotomic descent to produce small representations and the two-operator Lie algebra complex. Compare its cohomology with the displayed model. The continuous cochain comparison for finite-length periods is proved here. The discrete-coefficient Hochschild–Serre theorem does not give it.

*Needs:* §0.5; §0.6; §1.2; §1.3; PadicHodgeTheory §4.4; `LinearMap`.

**Checks.**

- For `W = C`, `W_(0) = K` and `W_(1) = 0`, so the complex is `K → 0 ⊕ K → 0` with `d₀ = 0`, and the cohomology is `K, K, 0`.
- For `W = C(1)` the only nonzero pieces are `K` in degrees 1 and 2.
- `d₁d₀ = 0`: `t′(γ−1)z` and `(χ⁽¹⁾(γ)^(−1)γ − 1)t′z` both equal `t′γz − t′z`. With `χ⁽¹⁾(γ)` in place of its inverse the composite would be `(1 − χ⁽¹⁾(γ)²)t′γz`, which is nonzero at `z = 1` in `B₂` because `χ⁽¹⁾(γ) ≠ ±1`.

### 1.5 Euler–Poincaré and Ext duality

For finite `K/ℚ_p` and `X, Y ∈ C(G_K)`, every `Ext^i(X, Y)` is a finite-dimensional `ℚ_p`-space, and it vanishes for `i ≥ 3`. The alternating Euler characteristic is `−[K:ℚ_p] ht(X) ht(Y)`. There is a natural trace `Ext²(X, X(1)) → ℚ_p` such that Yoneda composition gives a perfect pairing `Ext^i(X, Y) × Ext^(2−i)(Y, X(1)) → ℚ_p` for `0 ≤ i ≤ 2` (CN25, Theorem 2.6, p. 10; Fontaine03, Théorème 6.1, p. 355, and §§6.2–6.5, pp. 355–368; FF18, Preface, Proposition 2.28, p. 23; Fontaine03 and FF18 print the plain sum of the three dimensions, a misprint for the alternating sum, which is how CN25 Theorem 2.6(ii) states it). The trace and pairing are `ℚ_p`-linear; the `Ext` spaces need not be `K`-vector spaces.

A proof route: use §1.1 and almost presentations to reduce the cohomological δ-functors to finite-dimensional `ℚ_p` pieces and finite-length period pieces. For `ℚ_p` pieces import local Tate duality with rational coefficients. For period pieces use Fontaine03 §§6.3–6.5 and the two-operator computation of §1.4. Extend the trace from the basic cases, checking compatibility with connecting morphisms. Dévissage and the five lemma give perfectness and finiteness. Euler additivity reduces to Dimension and height on the same presentations.

*Needs:* §0.4; §0.5; §0.6; §1.1; §1.2; §1.4; ArithmeticGaloisDuality §D7.4; ArithmeticGaloisDuality §R02.1.3.

**Checks.**

- For `X = Y = ℚ_p` the Euler characteristic is `1 − ([K:ℚ_p] + 1) + 0 = −[K:ℚ_p]`.
- `H²(G_K, ℚ_p(1)) ≅ ℚ_p` is nonzero, so the vanishing range cannot begin at degree 2.
- For `X = C`, `Y = C(j)`, height zero forces Euler characteristic zero.

### 1.6 Ext table for truncated periods and Tate twists

For finite `K/ℚ_p`, `k ≥ 1` and `j ∈ ℤ`: `Ext⁰(B_k, C(j))` is `K` for `j = 0` and 0 otherwise; `Ext¹(B_k, C(j))` is `K` for `j = 0` or `j = k` and 0 otherwise; `Ext²(B_k, C(j))` is `K` for `j = k` and 0 otherwise; all higher `Ext` vanish. These are natural `K`-linear identifications in `C(G_K)`. A nonzero extension of `B_k` by `C(k)` has middle object isomorphic to `B_(k+1)`. This forgets the identification of the two ends and does not make all nonzero classes equal (CN25, Lemma 2.10, pp. 10–11; Remark 2.11 and Example 2.12, p. 11). The hypothesis `k ≥ 1` keeps the two degree-one cases `j = 0` and `j = k` distinct.

A proof route: by §1.5 reduce to `Ext(C, B_k(1−j))` and compute with §1.4. The spaces `W_(0)` and `W_(1)` are nonzero for `1 ≤ j ≤ k` and `0 ≤ j ≤ k−1` respectively, and where both are nonzero, multiplication by `t′` is invertible. The remaining endpoint classes give the table. Normalize the `j = k` class by `0 → C(k) → B_(k+1) → B_k → 0`.

*Needs:* §0.5; §0.6; §1.4; §1.5.

**Checks.**

- For `k = 1`, `j = 0` the dimensions in degrees 0, 1, 2 are `(1, 1, 0)`; `log χ` generates degree one.
- For `k = 1`, `j = 1` they are `(0, 1, 1)`; `B₂` generates degree one.
- For `k = 2`, `j = 1` all three groups vanish.

### 1.7 Vanishing into longer truncated periods

For finite `K/ℚ_p`, `N ≥ 0` and `1 ≤ i < j`, `Hom_{C(G_K)}(B_i, t^(−N)B_dR⁺/t^j B_dR⁺) = 0`, and `Ext¹` in the same category is zero. These are equivariant maps and extensions, not arbitrary `B_dR⁺`-module maps (CN25, Corollary 2.9 and proof, p. 10).

A proof route: filter the source by its successive quotients `C(r)`. For each twist the two generalized-invariant terms of §1.4 are one-dimensional and `t′` is an isomorphism between them, so the complex is acyclic. The long exact sequences recover `B_i`.

*Needs:* §0.5; §0.6; §1.2; §1.4.

**Checks.**

- `N = 0`, `i = 1`, `j = 2` gives `Hom(C, B₂) = Ext¹(C, B₂) = 0`.
- `i = j` is excluded, since the identity survives.
- `N = 1`, `i = j = 1` is excluded by `i < j`, and indeed `Hom(C, t^(−1)B_dR⁺/tB_dR⁺)` contains the nonzero inclusion of `C = B_dR⁺/tB_dR⁺`.

### 1.8 Equivariant analytic realization

For finite `K/ℚ_p`, construct an exact faithful functor from almost `C`-representations to classical BC spaces with continuous `G_K`-action, whose evaluation at `C` is naturally the original Banach representation. The target category has BC objects with jointly continuous `G_K`-action on their Banach evaluations and equivariant BC morphisms. The functor does not depend on the almost presentation. Forgetting the action gives a faithful functor to BC, which is not full (FF18, Preface, Remark 2.26(i), p. 22; Fontaine03, Théorème 4.1, p. 329, and §1.6, pp. 292–294).

A proof route: use the analytic extension construction of §0.3 and its finite-dimensional modifications, and the almost-split presentations of §1.1. Prove descent for different presentations and identify evaluation, instead of choosing a non-functorial BC lift of each object. Equivalent almost presentations give canonically isomorphic realizations satisfying the cocycle law. Exactness and the natural `C`-evaluation with its topology are part of the target.

*Needs:* §0.5; §0.6; §0.10; §1.1; VectorBundlesAndIsocrystals, Layer 5, *Exact faithful Banach realization* and *Finite-Dimensional Banach–Colmez presentations*; `TauCeti.ExactStructure.IsConflationExact`.

API:

- A functor to BC with `G_K`-action and a natural comparison of its `C`-evaluation with the identity.
- Strict arithmetic sequences become exact BC sequences.
- Canonical comparison isomorphisms for equivalent almost presentations, satisfying the cocycle law.

**Checks.**

- A finite `ℚ_p`-representation is realized by the corresponding constant BC space with its action.
- `C` is realized by `V₁` with semilinear action.
- `End_{G_K}(C) = K` while `End_BC(V₁) = C`, so forgetting `G_K` is not full.
- Evaluation recovers both the action and the Banach topology: a realization of `C(1)` by `V₁` with trivial action fails it.

### Examples

For `k = 1` the `Ext` triples against `C` and `C(1)` are `(K, K, 0)` and `(0, K, K)`. The nonzero `H²(G_K, ℚ_p(1))` pins the vanishing range at degrees `≥ 3`.

### Dependencies

Layer 0; `CategoryTheory.Abelian.Ext.mapExactFunctor`; `LinearMap`; `TauCeti.ExactStructure.IsConflationExact`; PadicHodgeTheory §4.4; PadicPeriodRings §§4.1–4.3; ArithmeticGaloisDuality §§R02.1.3 and D7.4; VectorBundlesAndIsocrystals, Layer 5, *Exact faithful Banach realization* and *Finite-Dimensional Banach–Colmez presentations*.

## Layer 2: Topological Vector Spaces and period Pairs

### 2.1 Boundedness independent of presentation

For an injective two-term presentation `E₁ → E₀` of nonarchimedean locally convex `ℚ_p`-spaces, give the algebraic quotient `E₀/E₁` the quotient topology. A bicartesian comparison square induces a homeomorphism of these quotients and preserves bounded subsets. So the boundedness condition defining TVS does not depend on the chosen injective presentation (CN25, Definition 4.1 and Remark 4.3, pp. 20–21; Schneiders99, Corollary 1.2.21, pp. 24–25).

*Needs:* LocallyAnalyticDistributions §0.0.

**Checks.**

- For `[0 → C]` the bounded subsets are the usual bounded subsets of `C`.
- For `[C → C]` with the identity, the quotient and every bounded subset are 0.
- For `T : c₀ → c₀`, `T(x)_n = p^n x_n`, the class of `(p^n)` is nonzero in `c₀/T(c₀)`, while the Hausdorff quotient is zero, so Hausdorffization is not the quotient used here.

### 2.2 The pointwise exact structure

On uniformly bounded covariant functors from sympathetic algebras to the `ℚ_p` left heart, pointwise short exact sequences form a `TauCeti.ExactStructure`. Identity conflations, composition, pullbacks of deflations and pushouts of inflations stay within the subcategory. The algebraic quotient functor to VS is well defined on the bicartesian localization (CN25, Definition 4.1 and Remarks 4.2–4.3, pp. 20–21).

*Needs:* §2.1; LocallyAnalyticDistributions §0.0; `TauCeti.ExactStructure`.

**Checks.**

- The split sequence `0 → V₁ → V₁ ⊕ V₁ → V₁ → 0` is pointwise exact, with kernel and quotient `V₁`.
- Pulling its projection back along `0 → V₁` gives `0 → V₁ → V₁ → 0 → 0`.
- For the dense proper diagonal injection on `c₀`, the exact sequence ends in its nonzero left-heart quotient, not in 0.

### 2.3 Topological Vector Spaces

A Topological Vector Space is a covariant functor `W` from the parent's sympathetic `C`-algebras to the left heart of nonarchimedean locally convex `ℚ_p`-spaces, with `ℚ_p`-linear structure maps, satisfying uniform boundedness. For all `Λ`, `Λ′` and every bounded subset `A` of `W(Λ)`, the union of the images `u_*(A)` over all continuous `C`-algebra maps `u : Λ → Λ′` is bounded in `W(Λ′)`. Morphisms are natural transformations. Exactness is left-heart exactness at every `Λ`. Hom and `Ext^i_TVS` are natural maps and Yoneda extensions for this exact structure. Boundedness is read in the classical quotient realization of a left-heart object, keeping its non-Hausdorff quotient topology (CN25, Definition 4.1, p. 20; Remarks 4.2–4.3, p. 21; Schneiders99, Corollary 1.2.21, pp. 24–25). The sympathetic algebras are the parent's separable, `C`-point-detected ones, with `O_C/p` countable. Left-heart objects are injective two-term presentations in degrees −1 and 0, localized at bicartesian squares.

A proof route: import the strict derived category and left heart of LocallyAnalyticDistributions §0.0, with the classical embedding and its exactness comparison. Form the full subcategory of the functor category satisfying uniform boundedness, prove boundedness stable under the finite exact constructions used here, use §2.1 for presentation independence and §2.2 for the exact structure.

*Needs:* `CategoryTheory.Functor`; LocallyAnalyticDistributions §0.0; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*; §2.1; §2.2.

API:

- Objects, natural transformations, additive structure and evaluation at `C`.
- Uniform boundedness over all algebra maps, which is stronger than continuity of each map.
- The pointwise left-heart exact structure and the Yoneda `Ext` δ-functors.
- Taking the algebraic quotient `E₀/E₁` at each `Λ` gives a VS, invariant under bicartesian squares.

**Checks.**

- The zero functor and zero maps are TVS objects and morphisms.
- `V₁(Λ) = Λ` with its Banach topology is a TVS, since algebra maps preserve the spectral unit ball.
- The injection `c₀(ℕ, C) → c₀(ℕ, C)`, `(x_n) ↦ (p^n x_n)`, is dense and proper. Its two-term object has a nonzero algebraic quotient in the left heart, which Hausdorffization would kill.

### 2.4 Classical BC spaces are TVS

The parent's canonical Banach topologies on `W(Λ)`, for a classical BC `W`, make `W` a TVS. BC morphisms are TVS morphisms, and exact BC sequences are pointwise strict and hence TVS-exact. Evaluation at `C` keeps its topology and detects BC morphisms. This does not assert that arbitrary Banach spaces are BC or that the topology determines the Dimension (CN25, Remark 4.2, p. 21, with decomposition (3.14), pp. 16–17). The topology is the parent's exact Banach point realization, not an arbitrary topology on a VS.

A proof route: cover `W` by finite sums of universal covers of `p`-divisible groups and constant finite-dimensional `ℚ_p` parts, as in CN25 Remark 4.2. Their natural lattices are functorial for every sympathetic-algebra map, which gives the uniform bound. Quotient the bounded presentations and use exactness at sympathetic points.

*Needs:* §2.3; VectorBundlesAndIsocrystals, Layer 5, *Exact faithful Banach realization*, *Finite-Dimensional Banach–Colmez presentations* and *HN decomposition and connected components*.

**Checks.**

- The `C`-points of `C/ℚ_p` are a Banach quotient, with BC height −1.
- The constant BC `ℚ_p` is the constant TVS with its `p`-adic topology at every `Λ`.
- `V₁` and the zero BC give the TVS of §2.3 and the zero TVS.

### 2.5 Completion and evaluation of period tensors

For `m ≥ 1` and a Hausdorff locally convex `B_m`-module `M` with jointly continuous action, define its separated completion `M̂`. The completed balanced realization evaluated at `C` is naturally `M̂`, and equals `M` when `M` is complete. Identify the completed balanced tensor with the completion of the algebraic balanced projective tensor (CN25, Definition 4.4(i) and footnote 10, p. 21; Appendix A, pp. 58–59).

Write `B_m°` for the unit ball of the Banach algebra `B_m`, the image of `A_inf` (CN25, §4.3.2, p. 26), and `W°` for the unit ball of a `B_m`-Banach model `W`. A continuous `B_m`-linear map `u : W → W′` of `B_m`-Banach models has compactoid image over `B_m` when for every open lattice `U` of `W′` there is a finite set `F ⊂ W′` with `u(W°) ⊆ U + Σ_{f ∈ F} B_m° f`. For `m = 1` this is `HasCompactoidImage` of CompactOperators §0.5 over the field `C`; for `m ≥ 2` it is a notion relative to `B_m`, not compactoidness over a field. A compact-type `B_m`-model is a countable locally convex inductive limit of `B_m`-Banach models with injective transition maps of compactoid image. CN25 §4.3.2 asks for c-compact images instead. Over `C`, which is not spherically complete, no nonzero bounded closed `O_C`-submodule is c-compact, because its trace on a `C`-line is a ball of `C`; so compactoid image is the notion used. It is not compactness over `ℚ_p`, the notion of LocallyAnalyticDistributions §0.0 for finite `K/ℚ_p`: the image of the unit ball under a nonzero `C`-linear map contains a closed copy of `O_C`, which is not compact. Prove that Fréchet `B_m`-models and compact-type ones are complete and separated. Prove that a compact-type model is regular: every bounded subset lies in one step and is bounded there. Prove that a closed `B_m`-submodule of a compact-type model, with the induced topology, and the quotient by it are compact-type models. LocallyAnalyticDistributions §0.0 states completeness and regularity for finite `K/ℚ_p` only, so these are targets here.

A proof route: the image of the unit ball under a map of compactoid image lies in the closed `B_m`-span of the countably many finite sets `F` attached to the balls of radius `p^(−k)`, so every step may be replaced by a closed submodule of countable type, over which continuous functional extension in countable type replaces the Hahn–Banach theorem used over finite `K/ℚ_p`. For `m = 1`, let `D` be the Fréchet space of compatible families of continuous functionals on the steps, the projective limit of their Banach duals. Identify the compact-type space with the strong dual of `D`, the bidual identification that CN25 uses under separability (proof of Proposition A.4, p. 59). A Fréchet space is a Baire space and hence barrelled, so the uniform boundedness principle `WithSeminorms.banach_steinhaus` makes a bounded set of functionals on `D` equicontinuous, which places it in the polar of a zero-neighbourhood of `D` and hence, after one transition map, in a bounded subset of one step. The submodule and quotient statements follow from regularity, by intersecting with the steps and by passing to the quotient step by step. For `m ≥ 2` argue on the `t`-adic filtration, whose graded pieces are `C`-spaces.

*Needs:* LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2 (*Continuous functional extension in countable type*); CompactOperators §0.5; `WithSeminorms.banach_steinhaus`; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*.

API:

- The separated completion `M ↦ M̂` of a Hausdorff locally convex `B_m`-module with jointly continuous action, natural in continuous `B_m`-linear maps, and the identification of the completed balanced realization at `C` with `M̂`, equal to `M` when `M` is complete.
- The unit balls `B_m°` and `W°`, and the predicate "compactoid image over `B_m`" for continuous `B_m`-linear maps of `B_m`-Banach models; for `m = 1` it is `HasCompactoidImage` of CompactOperators §0.5.
- Compact-type `B_m`-models: countable locally convex inductive limits of `B_m`-Banach models along injective transitions of compactoid image over `B_m`, with the inductive-limit topology.
- Completeness and separation of Fréchet and compact-type `B_m`-models; regularity of compact-type models (a bounded subset lies, and is bounded, in one step); a closed `B_m`-submodule with the induced topology, and the quotient by it, are again compact-type models.

**Checks.**

- For `M = B_m` the evaluation is `B_m`.
- For `M = c₀₀(ℕ, C)` with the sup norm the evaluation is `c₀(ℕ, C)`, strictly larger than `M`.
- For `M = 0` the completion, balanced tensor and evaluation are 0.
- `colim_n C^n` with the coordinate inclusions is of compact type: each transition has finite rank, so the image of the unit ball, `O_C^n`, lies in the `O_C`-span of the `n` coordinate vectors. That image is not compact, because the residue field of `O_C` is infinite, so compactness over `ℚ_p` would exclude this space.
- In `colim_n C^n` the set `{e_n : n ≥ 1}` lies in no single step, so regularity forces it to be unbounded. Indeed the lattice `⊕_n O_C p^n e_n` meets every step in an open lattice, so it is open, and `λe_n` lies in it only when `|λ| ≤ |p^n|`, so no nonzero multiple of the set lies in it. In the norm topology induced from `c₀(ℕ, C)` the same set is bounded, so that topology is not the inductive-limit topology.
- The identity of `c₀(ℕ, C)` does not have compactoid image: by the coordinate-decay criterion of CompactOperators §0.5, a compactoid subset of `c₀(ℕ, C)` has uniformly small coordinates outside a finite set, and `e_n` has coordinate 1 at `n`. So the constant system on `c₀(ℕ, C)` is not a compact-type presentation.
- For `m = 2`, the identity of `B₂` has compactoid image relative to `B₂`, with `F = {1}`, so a finite free `B₂`-module with identity transitions is a compact-type `B₂`-model. A `C`-linear definition does not apply, since `B₂` is not a `C`-vector space, and compactness over `ℚ_p` fails, since `B₂°` maps onto the non-compact `O_C`.

### 2.6 Injectivity and exactness of period base change

For sympathetic `Λ` with a countable topological Banach `C`-basis indexed by `I`, the lifted `B_m`-basis identifies `B_m(Λ)` with `c₀(I, B_m)`. For complete separated locally convex `B_m`-models `M` the balanced realization is `c₀(I, M)` with its completed locally convex topology. It preserves continuous injections, and strict exact sequences whose three terms are all Fréchet or all of compact type in the sense of §2.5. No separability of a Fréchet model is needed: `c₀(I, −)` with `I` countable preserves strict exact sequences of Fréchet spaces, since null sequences lift along open surjections of Fréchet spaces. The realization is uniformly bounded for all sympathetic algebra maps (CN25, Definition 4.4 and footnote 10, p. 21; Remark 4.20, p. 26).

*Needs:* §2.2; §2.5; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*; LocallyAnalyticDistributions §0.0.

**Checks.**

- For `Λ = C`, `I` is a singleton and the base-change injection is the original injection.
- For the diagonal injection on `c₀(ℕ, C)`, coordinatewise base change remains injective, but the class of `(p^n)` shows that it need not be strict.
- For the split sequence `C → C² → C`, base change gives `Λ → Λ² → Λ`, and the projection remains a strict surjection.

### 2.7 Completed balanced period Modules

For a complete Hausdorff locally convex `B_m`-module `M` with continuous scalar action, define the period Module `𝐌(Λ) = B_m(Λ) ⊗̂_{B_m} M`. The algebraic tensor modulo the balancing relations `(ab) ⊗ x − a ⊗ (bx)` gets the quotient of the projective `ℚ_p` tensor topology, and is then separated and completed. It is regarded as a classical left-heart object. The bounded period Module category consists of these realizations, with natural maps that are `B_m(Λ)`-linear at every `Λ`. Increasing `m` through `B_n → B_m` does not change the functor when `t^m M = 0`. Evaluation at `C` is `M`. For an incomplete Hausdorff model the evaluation is its separated completion, by §2.5 (CN25, Definition 4.4(i) and footnote 10, p. 21). A Module has one uniform exponent `m`, not a torsion exponent for each vector.

A proof route: use the completed projective tensor of LocallyAnalyticDistributions §0.0, impose the closed balancing relations and its universal property. For a countable topological Banach basis of `Λ/C`, lift the basis to `B_m(Λ)` and obtain `c₀(I, B_m)`, so the realization is `c₀(I, M)`, with the completed locally convex meaning for non-Banach `M`. Recover evaluation at `C`, and prove uniform boundedness with the lattice lifts and their multiplicative structure constants. Basis independence follows from the universal property.

*Needs:* §2.3; §2.5; §2.6; PadicPeriodRings §§4.1–4.3; LocallyAnalyticDistributions §0.0; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*.

API:

- The completed balanced tensor realization, its period action and topology.
- The natural evaluation isomorphism `𝐌(C) ≅ M` for complete separated `M`.
- A model killed by `t^m` stays killed by `t^m` after every sympathetic base change.
- For `n ≥ m`, realizing a `t^m`-torsion module through `B_n` agrees with realizing it through `B_m`.
- On finite-length models it recovers VectorBundlesAndIsocrystals, Layer 5, *Curvature-zero finite-length modules*.

**Checks.**

- The zero model realizes to the zero TVS.
- The regular `B_m`-module realizes to `Λ ↦ B_m(Λ)`, with evaluation `B_m`.
- For `b ∈ B_m`, the tensors `ab ⊗ x` and `a ⊗ bx` agree. An unbalanced `ℚ_p` tensor fails this.
- The algebraic direct sum of all `B_m`, with unbounded exponents, is not a period Module.
- For finite-length `M` the realization agrees with the parent's affine BC realization.

### 2.8 Period Pairs in the left heart

A topological period pair is a continuous injective `B_m`-linear map `M₁ → M₂` of model modules as in §2.7, for one `m`, with no strictness requirement. Its Pair is the pointwise left-heart cokernel `[𝐌₁ → 𝐌₂]` in degrees −1 and 0. Morphisms are period-linear morphisms of these left-heart objects after bicartesian localization, not unlocalized commutative squares. Its algebraic `C`-value is `M₂/M₁`, with no closure of `M₁` taken. A Module is the Pair `[0 → 𝐌]`. Prove that the realized map stays injective, using the countable `c₀` model of §2.6 (CN25, Definition 4.4(ii) and Remark 4.3, p. 21).

A proof route: apply the left-heart construction of LocallyAnalyticDistributions §§0.0–0.2 to topological `B_m`-modules and their TVS realizations. Injectivity in `c₀` coordinates and compatibility with period scalars give a well-defined Pair functor. Localize at the same bicartesian squares, so that equivalent presentations give equivalent Pairs. Construct the forgetful maps on Hom and Yoneda `Ext`; only the comparison theorems of Layer 4 assert that they are bijective.

*Needs:* §2.6; §2.7; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2.

API:

- The left-heart object of an injective topological period-module map.
- Bicartesian squares identify presentations, and induced morphisms respect identities and composition.
- The algebraic quotient `M₂/M₁`, invariant under localization.
- `M ↦ [0 → M]` and the exact sequence `0 → 𝐌₁ → 𝐌₂ → Pair → 0` in the left heart.
- The forgetful maps from Pair Hom and Yoneda `Ext` to TVS Hom and `Ext`, defined for every two Pairs; their bijectivity on Hom for reasonable same-type Pairs is §4.16.

**Checks.**

- `[M → M]` with the identity represents zero.
- `[0 → B_m]` is the period Module of `B_m`.
- On `c₀(ℕ, C)`, the injection `(x_n) ↦ (p^n x_n)` has dense proper image: finitely supported vectors are in the image, but `(p^n)_n` has no preimage in `c₀`. Its Pair has a nonzero algebraic quotient; replacing the image by its closure would give zero.

### Examples

The dense proper diagonal injection on `c₀` has a nonzero algebraic quotient because `(p^n)` has no preimage in `c₀`, while its separated quotient is 0. Completed realization sends the incomplete model `c₀₀` to `c₀`.

### Dependencies

`CategoryTheory.Functor`; `TauCeti.ExactStructure`; `WithSeminorms.banach_steinhaus`; LocallyAnalyticDistributions §§0.0 and 0.2; CompactOperators §0.5; PadicPeriodRings §§4.1–4.3; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*, *Exact faithful Banach realization*, *Finite-Dimensional Banach–Colmez presentations*, *HN decomposition and connected components* and *Curvature-zero finite-length modules*.

## Layer 3: The perfectoid disc extension class

### 3.1 The sympathetic disc and translation characters

For sympathetic `Λ`, let `Λ̃{X}` be the sympathetic closure of the closed disc algebra `Λ{X}` and `H_Λ` its group of continuous automorphisms over `Λ{X}`. Let `T_Λ` be the group of continuous `Λ`-algebra automorphisms of `Λ̃{X}` that restrict to `X ↦ X + x` with `x ∈ O_Λ`. Then `1 → H_Λ → T_Λ → (O_Λ, +) → 0` is exact. Fix `α_C` with `α_C(X) = 0`. For `a ∈ C`, choose `n` with `p^n a ∈ 2pO_C` and the compatible `p^n`-th root `E_a` of `exp(p^n aX)` normalized at zero. Its eigencharacter `χ_a : T_C → C^×` restricts on `H_C` to `μ_{p^∞}`, defining `ψ_a : H_C → ℚ_p` through the chosen `ε` by `χ_a(σ)^♭ = ε^(ψ_a(σ))`, where `χ_a(σ)^♭` is the compatible system `(χ_(a/p^k)(σ))_(k ≥ 0)` of `p`-power roots of `χ_a(σ)` given by the roots `E_(a/p^k)`. Then `ψ_a` is invariant under conjugation by `T_C` (CN25, §4.2, pp. 22–23; Colmez02, Propositions 5.20 and 5.23, pp. 30–32). The closure and the lifts are not uniquely functorial; different lifts differ by `H_Λ`. The characters `χ_a` are disc characters, distinct from the cyclotomic `χ`.

A proof route: the closure and lifting theorem of Colmez02 Propositions 5.20 and 5.23, proved as an extension of the parent's sympathetic-algebra API. Take the kernel of the translation map and lift each translation to prove exactness. Use normalized compatible roots to define `χ_a` and `ψ_a`. Conjugation invariance follows because `χ_a` is a character.

*Needs:* §2.3; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*; PadicPeriodRings §§4.1–4.3; PerfectoidSpaces §P6.

API:

- `T_Λ`, `H_Λ`, the translation map and their topologies.
- The kernel `H_Λ` and surjectivity onto `O_Λ`.
- `E_a`, `χ_a`, `ψ_a`, with their normalization and conjugation invariance.
- Changing an algebra-map lift acts through `H_Λ`, and rank-zero expressions descend independently of the choice.

**Checks.**

- `E_0 = 1`, `χ_0 = 1` and `ψ_0 = 0`.
- For `a ∈ 2pO_C`, `E_a` is the ordinary convergent exponential on the disc.
- An automorphism lies in `H_Λ` exactly when its translation parameter is zero.
- At `p = 2` and `a = 1`, `exp(X)` does not converge on the closed disc, so `n ≥ 2` is needed.
- At odd `p`, `E_(1/p^k)` is a `p^(k+1)`-th root of `exp(pX)`, so `σ ∈ H_C` multiplies it by `ζ_(p^(k+1))^c` for one `c ∈ ℤ_p` (the roots of unity of `ε`) and `ψ_1(σ) = c/p`: `ψ_1` has values in `p^(−1)ℤ_p`, not `ℤ_p`. At `p = 2`, `E_1` is a fourth root of `exp(4X)`, so `ψ_1` has values in `(1/4)ℤ_2` and `ψ_2 = 2ψ_1` in `(1/2)ℤ_2`. Reading `ψ_1(σ)` as the exponent `c` of the first root of unity would rescale it by `p` (by 4 at `p = 2`).

### 3.2 The explicit perfectoid cover of the unit disc

For odd `p`, choose compatible `p`-power roots of `p` and set `Y_n = (E_(1/p^n) − 1)/p^(1/p^(n+1))`. The ring `O_C{X}[Y_n : n ≥ 0]` is integral over `O_C{X}`, and its `p`-adic completion is perfectoid. Modulo `p^(1/p)`, `Y_0^p = X` and `Y_n^p = Y_(n−1)` for `n ≥ 1`. At `p = 2` use `E_2`: set `Y_n = (E_(2/2^n) − 1)/2^(2/2^(n+1))`. Then `Y_0² + Y_0 = X` modulo 2 and `Y_n² = Y_(n−1)` modulo `2^(1/2)` for `n ≥ 1`. The resulting tower is integral, its `p`-adic completion is perfectoid, and its character is `ψ_2`. The comparison of `ψ_2` with `ψ_1` is §3.3 (CN25, Lemma 4.9 and footnote 12, p. 23). The normalized roots are those of §3.1, and perfectoidness refers to the completion.

A proof route: for odd `p`, expand `(1 + p^(1/p)Y_0)^p = exp(pX)`, divide by `p` and read off a monic integral equation. For successive roots expand `(1 + p^(1/p^(n+1))Y_n)^p = 1 + p^(1/p^n)Y_(n−1)`. At `p = 2` the series `exp(2X)` is not in `C{X}`. The first equation is `(1 + 2Y_0)² = exp(4X)`; divide by 4 to get `Y_0² + Y_0 = (exp(4X) − 1)/4`. Frobenius hits every `Y_n` by the next level. At `p = 2` it therefore hits `Y_0² + Y_0` and hence `X`. Frobenius hits the constants because `O_C` is perfectoid. Pass to the completion and use the perfectoid criterion and almost purity.

*Needs:* §3.1; PerfectoidSpaces §P1; PerfectoidSpaces §P3.

**Checks.**

- At `n = 0` the predecessor is `X`, not a nonexistent `Y_(−1)`.
- At `p = 3`, `n = 0`, the coefficients `3^(k−1)/k!` of `(exp(3X) − 1)/3` have positive valuation for `k ≥ 2`, so `Y_0³ ≡ X` modulo `3^(1/3)`.
- At `p = 2`, for `k ≥ 1` the coefficient `4^(k−1)/k!` of `(exp(4X) − 1)/4` has 2-adic valuation at least `k − 1`, so `Y_0² + Y_0 ≡ X` modulo 2. The unnormalized `(exp(2X) − 1)/2` has unit coefficients at every `X^(2^r)`, so the odd-`p` formula fails at `p = 2`.

### 3.3 The rational character at p = 2

At `p = 2` the completed `E_2` tower computes the same rational disc cohomology line as `ψ_1`, with `ψ_2 = 2ψ_1` under the compatible-root normalization. The integral bounds are transported before dividing by 2, and this division multiplies a norm bound by 2. The comparison respects translations and the normalized `B₂` extension class (CN25, Lemma 4.9 and Proposition 4.10, pp. 23–25; Colmez02, §10.5, pp. 82–83).

*Needs:* §3.1; §3.2.

**Checks.**

- For `σ` with `ψ_1(σ) = 1`, `ψ_2(σ) = 2` and `ψ_2(σ)/2 = 1`, since `E_2 = E_1²` gives `χ_2 = χ_1²`.
- The coefficient of `X^(2^r)` in `exp(2X)` has valuation 1 for every `r`, so `exp(2X)` is not a closed-disc series.
- The coefficient `4^n/n!` of `exp(4X)` has valuation `2n − v₂(n!) ≥ n`, tending to infinity, and division by 2 multiplies a norm bound by 2.

### 3.4 Normed descent on the completed disc

Put `A = exp(pX) = E_1^p` for odd `p` and `A = exp(4X) = E_2²` at `p = 2`. Then `A` is a closed-disc series, whereas `E_1` (resp. `E_2`), formally `exp(X)` (resp. `exp(2X)`), is not in `C{X}`. Write `Ĉ{X}_∞` for the completion of the cover of §3.2, the algebra `C{X}[A^(1/p^n) : n ≥ 1]`. Its normalized root `A^(1/p^n)` is `E_(1/p^(n−1))` for odd `p` and `E_(2/2^(n−1))` at `p = 2`, so its first root is `E_1` (resp. `E_2`). Let `Γ = Aut(Ĉ{X}_∞/C{X})` be the geometric Kummer group, and `κ : Γ → ℤ_p` the isomorphism with `σ(A^(1/p^n)) = ζ_(p^n)^(κ(σ)) A^(1/p^n)` for all `n`, the roots of unity being those of `ε`. Comparing with §3.1, `ψ_1` factors through `Γ`, with `κ = pψ_1` for odd `p` and `κ = 2ψ_2 = 4ψ_1` at `p = 2` (§3.3); so `ψ_1(H_C)` is the lattice `p^(−1)ℤ_p` (resp. `(1/4)ℤ_2`). Prove `H¹_cts(H_C, C̃{X}) = C{X}·ψ_1`: every continuous additive cocycle is `λψ_1` plus a coboundary, with `λ ∈ C{X}` unique; and identify this group with the pro-étale `Ô`-cohomology `H¹_proet(Sp(C{X}), Ô)` of the disc, on the pro-étale site of PerfectoidSpaces §P7.16, where `Ô = (lim_m O⁺/p^m)[1/p]` is the completed structure sheaf of PerfectoidTowers §P9.2 and `O⁺` the integral subsheaf of the uncompleted structure sheaf `O` (Scholze13, Definition 4.1, p. 21). The route has three steps, and the tower comparison is applied to a tower over `ℚ_p`, never to the sympathetic closure itself.

First, the tower step. The closed disc `Sp(ℚ_p{X})` with the tower whose level `n ≥ 1` adjoins the `p^n`-th roots of unity, of `p` and of `A`, level 0 being the disc itself, is a pro-étale Galois tower in the sense of PerfectoidTowers §P9.4, *profinite-galois-tower*. The constant coefficient of `A` is 1. For `k ≥ 1`, its nonconstant coefficients `p^k/k!` at odd `p` have valuation `k − v_p(k!) ≥ 1`, and its coefficients `4^k/k!` at `p = 2` have valuation `k + s_2(k) ≥ 2`, with `s_2(k)` the binary digit sum; both valuations tend to infinity as `k → ∞`. Thus, keeping the constant coefficient 1, `A` lies in `1 + pℤ_p{X}` (resp. `1 + 4ℤ_2{X}`), it is a unit, and each level is a finite étale Galois cover, Kummer over the cyclotomic level; the group `G` is an extension of `Gal(F_∞/ℚ_p)` by the geometric Kummer group `ℤ_p(1)`, where `F_∞ = ℚ_p(μ_{p^∞}, p^(1/p^∞))`; and the completed limit is perfectoid by the computation of §3.2 read over the integers of the perfectoid field `F̂_∞`. The base change of the tower to `C` is `Ĉ{X}_∞ × S`, with `S` the profinite set of embeddings of `F_∞` into `C`, so its integral sections modulo `p^m` form the module coinduced from `Γ` to `G`. *almost-cohomology-of-tower* (PerfectoidTowers §P9.6) and Shapiro's lemma give `H^q_proet(Sp(C{X}), O⁺/p^m)` almost isomorphic to `H^q_cts(Γ, O⁺(Ĉ{X}_∞)/p^m)` for all `m` and `q`. The degree-zero invariants are `O_C{X}/p^m` extended by a group killed by a fixed power of `p` (the torsion of `H¹_cts(Γ, O⁺(Ĉ{X}_∞))`, on which the transition maps are nilpotent), so the system is Mittag–Leffler, the derived-limit condition of P9.6 holds, and passing to the limit over `m` and inverting `p` identifies `H¹_proet(Sp(C{X}), Ô)` with `H¹_cts(Γ, Ĉ{X}_∞)`.

Second, the inflation step. The sympathetic closure `C̃{X}` is the completion of the union of the elementary extensions of `C{X}`, each a Kummer extension by a `p`-th root of an element at distance less than 1 from 1, hence finite étale and Galois with group `μ_p` (Colmez02, §5.2 and §5.5, pp. 23 and 30–31); that union is `p`-closed, so every finite subextension lies in a finite Galois one. Every finite Galois subextension `L` containing a level of the Kummer tower generates with `Ĉ{X}_∞` a finite étale Galois extension of the perfectoid `Ĉ{X}_∞`, the base change of `L` over its intersection with the Kummer tower, and these are dense in `C̃{X}`. The lifting theorem of §3.1 makes `H_C → Γ` surjective, with kernel `H′ = Aut(C̃{X}/Ĉ{X}_∞)`. By almost purity (PerfectoidSpaces §P3) each of these finite stages is almost finite étale over `O⁺(Ĉ{X}_∞)`, so `H^q_cts(H′, O⁺(C̃{X})/p^m)` is almost zero for `q ≥ 1` and the invariants are almost `O⁺(Ĉ{X}_∞)/p^m`. After the limit over `m` and inverting `p`, `C̃{X}^{H′} = Ĉ{X}_∞` and `H¹_cts(H′, C̃{X}) = 0`, and inflation–restriction makes inflation `H¹_cts(Γ, Ĉ{X}_∞) → H¹_cts(H_C, C̃{X})` an isomorphism.

Third, decompletion along `Γ`. The normalized traces from the levels of the Kummer tower to `C{X}` are uniformly bounded, and `γ − 1`, for a topological generator `γ` of `Γ`, is invertible with bounded inverse on their kernel, so `H¹_cts(Γ, Ĉ{X}_∞) = H¹_cts(Γ, C{X}) = Hom_cts(Γ, C{X}) = C{X}·κ = C{X}·ψ_1`. Take `γ` with `κ(γ) = 1`, so that `ψ_1(γ) = 1/p` (resp. `1/4`). The coefficient `λ` of a cocycle `c` is the normalized-trace component in `C{X}` of `c(γ)` divided by `ψ_1(γ)`, that is, multiplied by `p` (resp. 4). For a lift `h` of `vX` in a TVS extension of `V₁` by `V₁`, construct `g` with `(σ−1)(h − g) = λ_v ψ_1(σ)` and `‖g‖ ≤ p · sup_{τ ∈ T_C} ‖τh − h − h(τ)‖`, the supremum being finite by uniform boundedness. Prove the corresponding uniform bound for Banach-valued coefficients used in Layer 4 (CN25, Proposition 4.10(i) and proof, pp. 23–24).

*Needs:* §3.1; §3.2; §3.3; PerfectoidTowers §§P9.2, P9.4 and P9.6; PerfectoidSpaces §P3; PerfectoidSpaces §P6; PerfectoidSpaces §P7.16.

**Checks.**

- For `p = 3` and `k = 0, 1, 2, 3, 6, 9`, the valuations of `3^k/k!` are `0, 1, 2, 2, 4, 5`. For `p = 2` and `k = 0, 1, 2, 3, 4`, the valuations of `4^k/k!` are `0, 2, 3, 5, 5`. In both cases `A(0) = 1`, of valuation 0: the positive bounds apply only to nonconstant coefficients. The constant coefficient of `(A − 1)/p` (of `(A − 1)/4` at `p = 2`) is instead 0.
- The zero cocycle has coefficient `λ = 0` and primitive 0.
- The cocycle `ψ_1` has value `ψ_1(γ) = 1/p` at `γ` (1/4 at `p = 2`), and dividing by `ψ_1(γ)` gives coefficient `λ = 1`; it is not a coboundary. Taking the trace component of the value at `γ` unchanged as the coefficient would give `1/p` (resp. `1/4`).
- For the constant analytic two-cocycle 1, the correcting primitive is −1, of norm `1 ≤ p`; changing the sign gives the wrong cocycle.
- At odd `p`, the first level adjoins `ζ_p`, `p^(1/p)` and `A^(1/p) = E_1`. The constant field `F_1 = ℚ_p(ζ_p, p^(1/p))` has degree `p(p−1)`, so the base change of the first tower level to `C` is `p(p−1)` copies of `Sp(C{X}[E_1])`. The geometric Kummer group at that level is `μ_p`, of order `p`, while `G/G_1` has order `p²(p−1)`: at `p = 3` the constant, geometric and total degrees are 6, 3 and 18. Adjoining `E_1^(1/p)`, a `p²`-th root of `A`, at the first level would give geometric degree 9 and total degree 54 at `p = 3`. At `p = 2` the first level adjoins `2^(1/2)` and `A^(1/2) = E_2`, with degrees 2, 2 and 4. The cohomology of `G` on the coinduced module is that of the geometric group, and a computation with `G/G_1` acting on a single copy would be wrong.
- On the line `C{X}·E_1` inside `Ĉ{X}_∞` (odd `p`), `γ` acts by `χ_1(γ) = ζ_p`, so `γ − 1` acts by `ζ_p − 1`, with inverse of norm `p^(1/(p−1))`, which is `3^(1/2)` at `p = 3`. At `p = 2`, on `C{X}·E_2`, `γ` acts by `χ_2(γ) = −1` and `γ − 1` by `−2`, with inverse of norm 2. On `C{X}·E_1^(1/p)` the same `γ` acts by a primitive `p²`-th root of unity, not by `ζ_p`. These inverse norms are at most the constant `p` of the bound, with equality at `p = 2`.
- The tower comparison is applied to the Kummer–cyclotomic tower over `ℚ_p{X}` only. Applied to `C̃{X}` directly it would need a discretely valued base field and a countable tower, neither of which the closure comes with: `C̃{X}` contains a `p`-th root of `1 + cX` for every `c ∈ 𝔪_C`, and for `|c| ≥ p^(−p/(p−1))` that root is not in `C{X}`, the binomial series for `(1 + cX)^(1/p)` having coefficients of norm `p^(k + v_p(k!))|c|^k`, which do not tend to zero. The closure enters only through the inflation step.

### 3.5 Bounded denominators for additive analytic cocycles

If `f ∈ O_C{Y, Z}` satisfies `f(Y, Z) − f(X+Y, Z) + f(X, Y+Z) − f(X, Y) = 0`, there is `u ∈ p^(−1)O_C{X}` with `f(Y, Z) = u(Y+Z) − u(Y) − u(Z)`. If `f(0, 0) = 0`, `u` may be normalized by `u(0) = 0`, and its linear coefficient, which is undetermined, may be set to zero. The same denominator bound holds for vector-valued Banach coefficients (CN25, Lemma 4.13 and proof, p. 24). Convergence means that coefficients tend to zero, not that a formal series exists.

A proof route: subtract the constant cocycle and integrate the first `Y`-derivative to find `u` formally; the cocycle identity forces the remaining homogeneous pieces to vanish. For each degree `k ≥ 2` use the coefficient `b_(i, k−i)`, with `i = 1` when `p ∤ k` and `i = p^(r−1)` for `r = v_p(k) ≥ 1`. Then `1 ≤ i < k` and `v_p(binom(k, i)) = 1` in the second case. So `|a_k| ≤ p |b_(i, k−i)|`, including when `k` is a power of `p`, which bounds `a_k` and proves `a_k → 0`. For a constant `c`, add `−c` to the primitive, since the coboundary of a constant is its negative.

*Needs:* §3.1; LocallyAnalyticDistributions §0.0; PadicPeriodRings §§4.1–4.3.

**Checks.**

- The cocycle `f = c` is the coboundary of `u = −c`.
- For `f = YZ` one may take `u = X²/2`, which shows the denominator at `p = 2`.
- At `k = p`, `i = 1` gives `binom(p, 1) = p`, valuation 1, consistent with the bound `|a_p| ≤ p |b_(1, p−1)|`. A formal primitive whose coefficients do not tend to zero is not in `p^(−1)O_C{X}`.

### 3.6 Additive lifts and rank-zero splitting

For a TVS extension `0 → V₁ → E → V₁ → 0` and `v ∈ C`, a lift of `vX` to `E(C̃{X})` can be modified by an analytic element into an additive lift `ℓ_v`. Its `H_C`-differences have the form `(σ−1)ℓ_v = λ_v ψ_1(σ)`, with `λ_v ∈ C` independent of the lift. The additive rank is the `ℤ_p`-rank of the image of `H_C` under `σ ↦ (σ−1)ℓ_v`; it is at most one. If `v ≠ 0` and `λ_v = 0`, translations of `ℓ_v` define a functorial TVS splitting. The rank is a monodromy rank, not a `C`-dimension. The endpoint identifications with `V₁` and the normalization `α_C(ℓ_v) = 0` are fixed (CN25, Proposition 4.10(i), Lemma 4.11 and Remark 4.14, pp. 23–25).

A proof route: the cover of §3.2 and almost descent write the initial cocycle as `λ_h ψ_1` plus a bounded coboundary (§3.4), and translation invariance forces `λ_h ∈ C`. Construct `c_τ = (τ−1)ℓ − α_Λ(τℓ)`, constant along `H_Λ`-cosets. Its defect is an analytic two-cocycle, which §3.5 cancels (CN25 Lemma 4.11). In rank zero define `s(x) = (τ_(x/v) − 1)ℓ_v` for `x ∈ vO_Λ` and extend `ℚ_p`-linearly. Independence of the lift uses `H`-invariance, and Colmez02 Proposition 5.20 gives compatibility in `Λ`.

*Needs:* §2.3; §3.1; §3.2; §3.3; §3.4; §3.5; PerfectoidTowers §P9.6.

API:

- The normalized lift and the defect correction with bounded denominators.
- The rank of the `ℤ_p`-image of the `H_C`-difference character.
- The translation formula, which produces a natural continuous splitting in rank zero.
- Algebra-map lifts differing by `H` give the same rank-zero descent.

**Checks.**

- The standard lift in `V₁ ⊕ V₁` has `λ_v = 0` and rank zero.
- With the injection `c ↦ tc` in `B₂`, the normalized lift has `λ_v = v`, hence rank one for `v ≠ 0`.
- `v = 0` has the zero lift in every extension, so a rank-zero lift of zero alone does not split anything.

### 3.7 The perfectoid disc extension class

The assignment `E ↦ λ_E`, with `λ_v = vλ_E`, is a natural `C`-linear isomorphism `Ext¹_TVS(V₁, V₁) ≅ C`. With endpoints fixed by `0 → V₁ → B₂ → V₁ → 0`, first map multiplication by `t`, the class of `B₂` maps to 1. The scalar structure uses `End_TVS(V₁) = C`. An isomorphism of unframed middle objects does not identify all nonzero classes (CN25, Proposition 4.10(ii), pp. 23–25).

A proof route: §3.6 extracts the invariant and shows that `λ_v = 0` for nonzero `v` exactly when the extension splits. For the period extension take `ℓ = v̂·log[E_1^♭]` in `B₂(C̃{X})`, where `E_1^♭ = (E_(1/p^k))_(k ≥ 0)` is the compatible system of `p`-power roots of `E_1` given by the normalized roots of §3.1 and `v̂ ∈ B₂` lifts `v`. Then `θ(ℓ) = v·log E_1 = vX`, and `(σ − 1)ℓ = v̂·log[χ_1(σ)^♭] = v̂·ψ_1(σ)t` for `σ ∈ H_C`, by the definition of `ψ_1`; this is the image of `vψ_1(σ)` under `c ↦ tc`, so `λ_v = v`, which proves surjectivity. At `p = 2` the same formula holds with `E_1` the normalized fourth root of `exp(4X)`, again with `log E_1 = X`. CN25 writes the compatible system with the letter `X` in place of `E` at this point (proof of Proposition 4.10, p. 23). Injectivity and scaling give `λ_v = vλ_E`. Baer sum and pushout give `C`-linearity.

*Needs:* §2.3; §2.7; §3.6; PadicPeriodRings §§4.1–4.3.

**Checks.**

- The split class maps to 0 and `B₂` maps to 1.
- Pushing `B₂` out along multiplication by `c ∈ C^×` on the kernel gives the class `c`, not 1.
- `Ext¹_{C(G_K)}(C, C(1)) = K` is a different group: the categories and the scalar fields differ.

### 3.8 Translation-invariant pro-étale interpretation

There are compatible identifications `Ext¹_TVS(V₁, V₁) ≅ H⁰(T_C, H¹_proet(Sp(C{X}), Ô)) ≅ C`, sending the normalized disc class to `ψ_1`, where `Ô` is the completed structure sheaf of §3.4. For every `a ∈ C`, `ψ_a − aψ_1` is a coboundary with an additive primitive in the sympathetic closure. The coefficient sheaf and completed-cover descent are those of §3.4, for which the comparison with continuous `H_C`-cohomology holds (CN25, Remark 4.15(i)–(ii), p. 25; Colmez02, Théorème 10.5, pp. 76–77, and §10.5, Proposition 10.18 and Remarque 10.19, pp. 82–83). The class is translation-invariant cohomology, not all of `H¹_proet` of the disc.

A proof route: use the completed tower, almost purity and continuous torsor descent to compare group cohomology with pro-étale `Ô`-cohomology. The bounded descent identifies `H¹` with the module of analytic functions, whose `T_C`-invariants are the constants. Match the `B₂` normalization of §3.7. Colmez02 Théorème 10.5, Proposition 10.18 and Remarque 10.19 give the additive primitive and its bounds.

*Needs:* §3.2; §3.3; §3.4; §3.7; PerfectoidSpaces §P3; PerfectoidSpaces §P6; PerfectoidSpaces §P7.16; PerfectoidTowers §§P9.2 and P9.6; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*.

**Checks.**

- For `a = 0` the coboundary is zero, and for `a = 1` the difference `ψ_1 − ψ_1` is zero.
- The invariant subspace is `C`, not the whole analytic-function ring.
- At `p = 2`, `ψ_2 − 2ψ_1 = 0`, matching §3.3.
- With the uncompleted structure sheaf `O` in place of `Ô` the middle group is 0. The sheaf `O` is pulled back from the étale site, so its pro-étale cohomology is the étale cohomology of the affinoid disc (Scholze13, Corollary 3.17(i), p. 20), which vanishes in degree 1 by Tate acyclicity. The identification with `C` therefore needs the completed sheaf.

### Examples

At `p = 3` the first congruence is `Y_0³ = X` modulo `3^(1/3)`. At `p = 2` it is `Y_0² + Y_0 = X` modulo 2, and `exp(4X)` converges. At `p = 3` the first level of the Kummer–cyclotomic tower over `ℚ_3{X}` adjoins `ζ_3`, `3^(1/3)` and `E_1 = exp(3X)^(1/3)`, with constant, geometric and total degrees 6, 3 and 18, and a generator `γ` of `Γ` acts on `E_1` by a primitive cube root of unity, with `ψ_1(γ) = 1/3`. The normalized `B₂` class has parameter 1 and the split class has parameter 0.

### Dependencies

§2.3; §2.7; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*; PadicPeriodRings §§4.1–4.3; PerfectoidSpaces §§P1, P3, P6 and P7.16; PerfectoidTowers §§P9.2, P9.4 and P9.6; LocallyAnalyticDistributions §0.0.

## Layer 4: Reasonable period modules and comparisons

### 4.1 Reasonable C-spaces

A reasonable `C`-space is a Hausdorff locally convex `C`-vector space that is separable, meaning it has a dense `C`-linear subspace of countable dimension, together with a Fréchet presentation or a countable compact-type presentation. Fréchet means complete and metrizable by a countable family of nonarchimedean seminorms. Compact type is the case `m = 1` of §2.5: a countable locally convex inductive limit of `C`-Banach spaces with injective transition maps of compactoid image (`HasCompactoidImage`, CompactOperators §0.5). Over `C`, which is not locally compact, a map sending the unit ball into a compact set is zero, so the compact maps of LocallyAnalyticDistributions §0.0, stated for finite `K/ℚ_p`, are not the notion used. The TVS realization of a reasonable `C`-space `W` is `Λ ↦ Λ ⊗̂_C W`. The type is remembered when a same-type theorem is used (CN25, §4.3, p. 25; Appendix A, pp. 58–59). `C` need not be spherically complete, so results of LocallyAnalyticDistributions §§0.0–0.2 that require spherical completeness do not specialize to `C`. Completeness, regularity and strict tensor exactness come from §§2.5–2.6 and extensions from §4.6.

A proof route: use the Fréchet notions of LocallyAnalyticDistributions §0.0 and the compact-type notion of §2.5 with its permanence properties, adding separability rather than a second topology. Construct the realization with countable-type Banach models and completed projective tensors, and verify independence of the presentation and evaluation at `C`.

*Needs:* §2.5; §2.7; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2; CompactOperators §0.5.

API:

- A locally convex space with a separability proof and one of the two presentation types.
- Completed scalar extension, natural in `Λ` and in continuous linear maps.
- Evaluation at `C` agrees with the original complete space and its topology.
- A strict exact sequence of reasonable spaces of one type gives a pointwise strict exact sequence of realizations, under the hypotheses of §2.6.

**Checks.**

- The zero space is reasonable of both types.
- `c₀(ℕ, C)` is a separable Banach, hence Fréchet, example, with realization `c₀(ℕ, Λ)`.
- An infinite-dimensional Banach space is not of compact type: by the regularity of §2.5 its unit ball would lie and be bounded in one step, so its image in the next step would be compactoid. The unit ball would then be compactoid in the space itself, and a Banach space with compactoid unit ball is finite-dimensional.
- The identity of `C` has compactoid image, being of rank one, but does not send the unit ball `O_C` into a compact set, since `O_C` is not compact. So `C`, with the constant presentation, is of compact type, and compactness of the transition maps would exclude it.

### 4.2 Reasonable topological B_m-modules

For `m ≥ 1`, a reasonable `B_m`-model has a topology defined by a countable family of `B_m`-module seminorms and is Fréchet, or is a compact-type `B_m`-model in the sense of §2.5. Scalars act continuously, and complete separated models are used for realization. Its graded pieces `W[t^i]/W[t^(i−1)]`, `1 ≤ i ≤ m`, are closed subquotients killed by `t`, hence `C`-spaces of the same type (by §2.5 for compact type), and each of them is required to be of countable type, or a Banach space linearly homeomorphic to `c₀(I, C)` for a set `I` of any cardinality, or a Fréchet space whose local Banach spaces, the completions of its quotients by the kernels of a defining sequence of seminorms, are of one of these two kinds. Whether a dense countably generated `B_m`-submodule exists is recorded separately. Reduction to `t`-kernels and quotients preserves the topological type with the strict structures used (CN25, §4.3.2 and Remark 4.20, p. 26; §2.5 for compact type). A single `m` kills the whole model. No `C`-algebra section `C → B_m` is chosen. CN25 §4.3.2 imposes no condition on the graded pieces, but its comparison for these models reduces to Proposition 4.18, whose proof uses continuous functionals and orthonormal bases of separable spaces (CN25, Proposition 4.22 and proof, p. 27; proof of Proposition 4.18, p. 26); the condition on the graded pieces is what that route needs. A compact-type model is of countable type automatically, since the image of a map of compactoid image lies in the closed span of a countable set (§2.5), so the condition restricts only Banach and Fréchet models. The statements below quantify over this class, which contains every model of countable type; §4.9 supplies the `C`-spaces beyond countable type.

A proof route: use the Banach and Fréchet notions of LocallyAnalyticDistributions §§0.0–0.2 with `B_m`-module seminorms, the compact-type notion of §2.5, and the topological module carrier `TopModuleCat`. Check `t`-stable closed subobjects, the induced strict quotient topology and the completed realization of §2.7. Prove strict tensor exactness with the `t`-filtration and the countable basis of `B_m(Λ)`. Treat `m = 1` as the `C`-case.

*Needs:* §2.5; §2.7; §4.1; `TopModuleCat`; LocallyAnalyticDistributions §0.0; CompactOperators §0.5.

API:

- A topological `B_m`-module with a Fréchet or compact-type presentation, graded pieces of countable type or with a `c₀(I, C)` model as above, and a countable-type flag.
- Its period Module realization, independent of exponent and presentation.
- Successive `t`-kernels and images with their induced topologies, strict where used.
- Strict exact sequences of reasonable models give exact period Modules.

**Checks.**

- `B_m` and finite direct sums of copies of `B_m` are reasonable Banach models on which `t^m = 0` uniformly.
- For an uncountable set `I`, `c₀(I, C)` with `t` acting by zero is a reasonable Banach `B₁`-model, its only graded piece being `c₀(I, C)` itself, but it has no dense countably generated subspace. Each vector of `c₀(I, C)` has countable support, so a countably generated subspace and its closure are supported on a countable `S ⊂ I`, and a unit vector `e_j` with `j ∉ S` has distance 1 from that closure. The model lies in this class but not in that of §4.1.
- A colimit of `B_m` over unbounded `m` is not a reasonable model, although each element is torsion.
- The spherical completion `Ĉ` of `C`, with `t` acting by zero, is a `C`-Banach space and hence a Banach `B₁`-module in the sense of CN25 §4.3.2, and its continuous `C`-dual is 0, as CN25 asserts in Remark A.2, p. 58, by way of a non-splitting it only expects. Directly: a nonzero continuous functional `f` would make the one-dimensional `C`-space `Ĉ/ker f`, whose norm is a multiple of the absolute value of `C`, a quotient of a spherically complete Banach space by a closed subspace, hence spherically complete; then `C` would be spherically complete, which it is not. A decreasing sequence of balls of strictly decreasing radii `r_n` in the quotient lifts to centres `x_n` with `‖x_(n+1) − x_n‖ ≤ r_(n−1)`, and a point `y` of the intersection of the balls of radius `r_(n−1)` about the `x_n` maps into every ball, since its image is within `max(r_n, r_n) = r_n` of the `n`-th centre. It is not a reasonable model here: a nonzero space of countable type has a nonzero continuous functional, by the functional extension of LocallyAnalyticDistributions §0.2, and `c₀(I, C)` has its coordinate functionals. The route of §4.7 has neither a functional nor a basis on `Ĉ`, and no comparison is asserted for it.

### 4.3 Reasonable Pairs and same type

A reasonable Pair is represented by an injective continuous map `M₁ → M₂` of reasonable period models of the same topological type. Two Pairs have the same type when one branch, Fréchet or compact type, works for all four terms, with one common torsion exponent after increasing it. The localized left-heart object is used, together with a reasonable presentation to which the comparisons apply. The conclusions do not depend on the chosen same-type presentation (CN25, §4.4, p. 27; Theorem 4.30, p. 31). No strictness is imposed on `M₁ → M₂`, and `M₂/M₁` is the algebraic quotient.

A proof route: combine §2.8 and §4.2 and transport along bicartesian squares. Type compatibility is a hypothesis of the Hom comparison, not a theorem for arbitrary pairs of types.

*Needs:* §2.8; §4.2.

API:

- An injection of two same-type reasonable period models, with its Pair realization.
- A common Fréchet or compact-type branch for all source and target terms.
- The localized comparison and the exact sequences do not depend on the reasonable presentation.

**Checks.**

- The identity Pair is zero in the left heart.
- For a strict closed inclusion, the Pair is the classical quotient Module with its quotient topology.
- For a dense proper same-type inclusion, the Pair is nonzero although its Hausdorff quotient is zero.
- A Fréchet `M₁ → M₂` and a compact-type `M₁′ → M₂′` with no common branch are not of the same type, and the Hom comparison of §4.16 is not asserted for them.

### 4.4 Normalized period pushout extensions

For a topological `B_m`-model `W`, `d ≥ 1` and `w ∈ W`, push out `0 → B_m → B_(m+d) → B_d → 0`, first map multiplication by `t^d`, along `c ↦ cw`. The result is `E_w = (B_(m+d) ⊕ W)/{(t^d c, −cw) : c ∈ B_m}` with the quotient topology and its period action. The sign is the usual pushout convention, so `E_1` for `W = C`, `d = m = 1` is `B₂` with its framed endpoints. The class depends only on `w` modulo `t^d W` and gives `Ext¹_B(B_d, W) ≅ W/t^d W`. For the topological exact structure, prove that these extensions are strict and that every extension admits a compatible topology (CN25, Remarks 4.17 and 4.21, pp. 25–27). The `Ext` group is over `B = B_dR⁺`, not over `B_m`, and an extension can have exponent `m + d`.

A proof route: construct the pushout with the closed relation graph (the first coordinate has closed image), which gives a strict extension. Resolve `B_d` by multiplication by `t^d` on the free `B`-module and compute the cokernel of `t^d` on `W`. Changing `w` by `t^d w′` changes the lift by `w′` and gives an equivalent framed extension.

*Needs:* §2.7; §3.7; §4.2; LocallyAnalyticDistributions §0.2.

API:

- The strict pushout extension with framed ends and the stated sign.
- The class map `W/t^d W ≅ Ext¹_B(B_d, W)`.
- A continuous `B`-linear `f : W → W′` carries `E_w` to `E_f(w)`, compatibly with Baer sum.
- The framed class vanishes exactly when `w ∈ t^d W`.

**Checks.**

- `w = 0` gives the split framed extension.
- `m = d = 1`, `W = C`, `w = 1` gives `B₂` and disc class 1.
- `w` and `w + t^d w′` define the same class, although the displayed lifts differ.
- The split condition is `w ∈ t^d W`. For `W = B₂`, `d = 1`, `w = t` gives a split class although `w ≠ 0`.

### 4.5 A profinite cocycle lies in one compact-type step

Let `H` be profinite and `W = colim_n W_n` a compact-type `C`-space in the sense of §2.5, with `H` acting compatibly and isometrically on every `W_n`. Then every continuous 1-cocycle `H → W` has image in a single `W_N`. The assertion concerns cocycles with these invariant steps, not arbitrary continuous maps to an inductive limit (CN25, Lemma 4.19 and proof, p. 26). CN25 proves the subgroups below closed by c-compactness of the closed unit balls, which over `C` fails for every nonzero step; the route below uses closures and the regularity of §2.5 instead.

A proof route: let `B_n` be the closure in `W` of the image of the unit ball of `W_n`, and let `Ū_n` be the closure of `U_n = Σ_{i ≤ n} p^(i−n) B_i`. The `Ū_n` are increasing closed subgroups covering `W`, each preserved by `H`, which acts continuously on `W` and preserves every `B_i`. Their preimages `H_n` under the cocycle are closed subgroups, by the cocycle equation. Baire gives some `H_n` with nonempty interior, hence of finite index. Adjoining the values at finitely many coset representatives places the cocycle in one bounded set `Ū_N`, which lies in a single step `W_M` by the regularity of §2.5.

*Needs:* §2.5; §4.1; LocallyAnalyticDistributions §0.2.

**Checks.**

- The zero cocycle lies in every step.
- For `H` finite, every cocycle has finitely many values and lies in a single step for any presentation.
- For `H = ℤ_p` acting trivially on `W = colim_n C^n` (coordinate inclusions, of finite rank and hence of compactoid image), a continuous cocycle is a continuous homomorphism, `x ↦ x·w` with `w = c(1)`, and its image lies in the step `C^N` containing `w`. The step depends on the cocycle: for `w = e_N` it is `N`, so no single step contains all cocycles, and the quantifiers "for each cocycle there is a step" cannot be exchanged.

### 4.6 Separable compact-type extensions over C

Over `C`, a strict left-heart extension of separable compact-type `C`-spaces has a separable compact-type middle term. Identify the stereotypical duals of CN25 Appendix A.4 with the strong duals needed here and prove continuity of the bidual identifications used there. In the space of rank-zero additive lifts of CN25 Proposition 4.27, prove that evaluation `ℓ ↦ ℓ(1)` is a topological isomorphism for compact-type endpoints (CN25, Appendix A.4, p. 59; Proposition 4.27, pp. 29–30; Proposition A.4, p. 59, for separable outer terms over any `K`).

*Needs:* §4.5; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2.

**Checks.**

- For the split extension `C → C² → C`, all terms are finite-dimensional compact type and the bidual maps are identities.
- For zero outer spaces the middle term and the space of additive lifts are 0.
- `C` is not spherically complete. Extension of a coordinate functional on a closed subspace of `c₀` comes from countable-type functional extension, without preservation of its norm.

### 4.7 Hom and extensions from B₁

For a separable `C`-space `W` that is Banach, nuclear Fréchet or of compact type, with realization `𝐖`, evaluation at 1 identifies `Hom_TVS(B₁, 𝐖)` with `W`, and the normalized pushout `w ↦ E_w` identifies `Ext¹_TVS(B₁, 𝐖)` with `W`. Both identifications are `C`-linear and natural in `W` (CN25, Proposition 4.18 and proof, p. 26). Arbitrary separable Fréchet `W` is §4.8.

A proof route: for Hom, apply continuous `C`-linear functionals on `W` and `End_TVS(B₁) = C`; separation forces `f(a) = a f(1)`. This uses separation by functionals in countable type, not spherical completeness of `C`. For separable Banach `W`, apply §3.7 coordinatewise: the bounds of §3.5 make the primitives and the `λ`-values converge in the Banach model. For nuclear Fréchet `W`, use the tower of Banach quotients with the topological Mittag–Leffler criterion, keeping the `lim¹` term until its hypotheses are proved. For compact type, apply §4.5 to the disc cocycle and the bounded corrections to reduce to a Banach step. Normalize with §4.4.

*Needs:* §3.5; §3.7; §4.1; §4.4; §4.5; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2 (*Continuous functional extension in countable type*).

**Checks.**

- For `W = C` both groups are `C`, with `B₂` representing 1.
- For `W = 0` both groups vanish.
- For `W = c₀(ℕ, C)`, the extension parameter is a null sequence, not an arbitrary bounded sequence.

### 4.8 Hom and Ext for all separable Fréchet targets

For every separable `C`-Fréchet space `W`, nuclear or not, evaluation at 1 and the normalized pushout give `Hom_TVS(B₁, 𝐖) ≅ W` and `Ext¹_TVS(B₁, 𝐖) ≅ W`. Establish the topological inverse-limit comparison through Banach quotients for these two functors and prove that the relevant `lim¹` vanishes, without assuming nuclearity (CN25, Proposition 4.18 and proof, p. 26; Appendix A.3, pp. 58–59).

*Needs:* §3.4; §4.7; LocallyAnalyticDistributions §0.2.

**Checks.**

- For `W = C^ℕ` with the product topology, the parameter `(1, 1, …)` is allowed; `c₀` would exclude it.
- For `W = c₀(ℕ, C)` with its Banach norm, `(1, 1, …)` is excluded while `(p^n)` is allowed.
- For the constant zero Banach tower, the limits of Hom and `Ext¹` and the `lim¹` term are 0.

### 4.9 Period comparison without a countable-type hypothesis

Let `W` be a `C`-space that is a Banach space linearly homeomorphic to `c₀(I, C)` for a set `I` of any cardinality, or a Fréchet space each of whose local Banach spaces is of countable type or of that form, with realization `𝐖`. Then evaluation at 1 identifies `Hom_TVS(B₁, 𝐖)` with `W`, and the normalized pushout `w ↦ E_w` identifies `Ext¹_TVS(B₁, 𝐖)` with `W`, both `C`-linearly and naturally in `W`. No dense countable-dimensional subspace is assumed. With §§4.7–4.8 this is the case `m = d = 1` of §4.10 for every graded piece allowed in §4.2. CN25 states its torsion-source comparison for reasonable `B_m`-modules without separability, but proves it by reduction to Proposition 4.18, whose spaces are separable; the extension to `c₀(I, C)` uses only what that proof uses, continuous functionals separating points and an orthonormal basis (CN25, §4.3.2, Remark 4.20 and Proposition 4.22, pp. 26–27; Proposition 4.18 and proof, p. 26).

A proof route: for Hom, compose with the coordinate functionals of `c₀(I, C)`, which induce TVS maps `𝐖 → B₁`, and use `End_TVS(B₁) = C` as in §4.7; the coordinate functionals separate the points of `c₀(I, Λ) = Λ ⊗̂_C c₀(I, C)` for every sympathetic `Λ`. For `Ext¹`, the cocycle of a lift of `X` takes values in `c₀(I, C̃{X})`; the normalized-trace coefficient of §3.4 and the primitives of §3.5 are computed coordinatewise with bounds independent of the coordinate, so the coefficient lies in `c₀(I, C)` and the extension is the pushout `E_w` of §4.4 for that `w`. For a Fréchet `W`, apply this or §4.7 to its local Banach spaces and pass to the limit by the topological Mittag–Leffler argument of §4.8, which uses only the density of the transition maps between local Banach spaces.

*Needs:* §2.6; §3.4; §3.5; §3.7; §4.2; §4.4; §4.7; §4.8; LocallyAnalyticDistributions §0.2.

**Checks.**

- For `W = c₀(I, C)` with `I` uncountable and `m = d = 1`, the parameter space in degrees 0 and 1 is `c₀(I, C)`, although `W` has no dense countably generated subspace (§4.2). The class of `w = e_j` is the pushout of `B₂` along the `j`-th coordinate inclusion `C → c₀(I, C)`.
- For `I` finite, `W = C^I` and both groups are `C^I`, as §4.7 gives for a finite-dimensional space.
- For `W = 0` both comparison maps are `0 → 0`.

### 4.10 Hom and Ext from B_d

For every reasonable `B_m`-model `W` and `d ≥ 1`, the comparison maps identify `Hom_TVS(B_d, 𝐖)` with `Hom_B(B_d, W) = W[t^d]` and `Ext¹_TVS(B_d, 𝐖)` with `Ext¹_B(B_d, W) = W/t^d W`. Here `W[t^d]` is `Submodule.torsionBy` and `W/t^d W` is the algebraic cokernel, not a Hausdorffization. The `Ext` parameter is the pushout of §4.4 (CN25, Proposition 4.22 and proof, p. 27). No comparison of `Ext^i` for `i ≥ 2` is asserted.

A proof route: §§4.7–4.9 for `m = d = 1`, according to the kind of graded piece. For `m ≥ 2` use `0 → W[t] → W → W/W[t] → 0`, whose outer terms have the graded pieces of `W`, checking type, separation and strict exactness by §4.2. Compare the algebraic and TVS long exact sequences; naturality of pushouts gives the connecting maps. The five-lemma diagram of CN25 p. 27 gives the Hom and `Ext¹` comparison. Then induct on `d` using `0 → B₁ → B_d → B_(d−1) → 0`, first map multiplication by `t^(d−1)`, keeping all boundary maps.

*Needs:* §4.2; §4.4; §4.6; §4.7; §4.8; §4.9; `Submodule.torsionBy`.

**Checks.**

- For `W = B_m`, Hom has length `min(d, m)` and `Ext¹ = W/t^d W` has the same length.
- For `d ≥ m`, both groups are `W`.
- With `B_0 = 0`, the case `d = 0` gives zero groups, consistent with the formulas `W[t⁰] = 0` and `W/t⁰W = 0`.

### 4.11 Constant-source evaluation and projectivity

For a period Module `𝐖`, `Hom_TVS(ℚ_p, 𝐖) = 𝐖(C) = W` and `Ext¹_TVS(ℚ_p, 𝐖) = 0`. For a reasonable Pair `[M₁ → M₂]`, `Hom_TVS(ℚ_p, Pair) = M₂/M₁` as an algebraic vector space. The twisted constant lines `ℚ_p t^d` have the corresponding normalized evaluation identifications. Here `ℚ_p` is the constant functor, `C` is initial among sympathetic algebras, and no `G_K`-action is present (CN25, proof of Lemma 4.24(i) and proof of Proposition 4.25, p. 28; Remark 4.8(ii), p. 22).

A proof route: a natural map from the constant one-dimensional functor is determined by its value at `1` over `C`, transported along `C → Λ`. A finite-dimensional `ℚ_p`-space is projective in the quasi-abelian left heart; with pointwise exactness this lifts the `C`-value of 1 in an extension, and transport gives a TVS splitting. Apply `Hom(ℚ_p, −)` to the Pair presentation; degree-one vanishing for Module targets identifies the cokernel with the algebraic quotient.

*Needs:* §2.3; §2.7; §2.8; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2.

**Checks.**

- For `W = C`, evaluation gives all of `C` and `Ext¹` is 0.
- This is not the arithmetic category: `H¹(G_K, ℚ_p) ≠ 0` there.
- For the Pair of the dense injection on `c₀`, `Hom(ℚ_p, Pair)` is the nonzero algebraic quotient, not its zero Hausdorff quotient.

### 4.12 Torsion-source Hom into a Pair

For a reasonable same-type Pair `P = [M₁ → M₂]` and `d ≥ 1`, `Hom_TVS(B_d, P) ≅ (M₂/M₁)[t^d]`, naturally. The quotient is algebraic, and no closed-image hypothesis is imposed (CN25, Lemma 4.23 and its diagram, pp. 27–28).

A proof route: compare the algebraic long exact sequence of `0 → M₁ → M₂ → M₂/M₁ → 0` with the left-heart sequence. The four outer Hom and `Ext¹` maps are isomorphisms by §4.10, and the five lemma gives the middle one.

*Needs:* §2.8; §4.3; §4.10.

**Checks.**

- For `P = [0 → B_m]` the result is the torsion submodule `B_m[t^d]`.
- For a dense proper inclusion, the result is computed on the nonzero algebraic quotient.
- For `P = [tB₂ → B₂]` and `d = 1` the result is `B₂/tB₂ = C`.

### 4.13 Hom and Ext from U_d

For `d ≥ 0`, `U_d = (B_cris⁺)^{φ=p^d}`, a reasonable period Module `𝐖` and a reasonable Pair `P = [M₁ → M₂]`: `Hom_TVS(U_d, 𝐖) ≅ W`, `Ext¹_TVS(U_d, 𝐖) = 0`, and `Hom_TVS(U_d, P) ≅ M₂/M₁`. The identifications use `U_d ↪ B_(m+d)` when `t^m W = 0`, and `0 → ℚ_p t^d → U_d → B_d → 0`. For `d = 0`, `U_0 = ℚ_p` and `B_0 = 0`. No `Ext¹` assertion for Pair targets is made (CN25, Lemma 4.24 and proof, p. 28). The value 0 of `Ext¹` is what the proof in CN25 (p. 28) derives; the displayed value `W` in the statement of Lemma 4.24(i) is a misprint.

A proof route: use the parent's fundamental BC sequence and the injection into `B_(m+d)`, and compare Hom and `Ext¹` along `0 → t^d B_m → B_(m+d) → B_d → 0`. By §4.10 and §4.11, `Hom(ℚ_p t^d, 𝐖) → Ext¹(B_d, 𝐖)` is the quotient map `W → W/t^d W`, which is onto, so the next term vanishes. The same diagram identifies Hom with `W`. The Pair presentation and its long exact sequence give the quotient formula.

*Needs:* §4.10; §4.11; §4.12; VectorBundlesAndIsocrystals, Layer 5, *Dimensions of standard Banach–Colmez spaces* and *Nonpositive curvature extension criterion*; PadicPeriodRings §§4.1–4.3.

**Checks.**

- For `d = 1`, `W = C`: `Ext¹(U_1, C) = 0` although `Ext¹(B₁, C) = C`.
- For `d = 0` the statement is §4.11.
- In the long exact sequence for `d = 1`, `W = C`, the map `Hom(ℚ_p t, C) = C → Ext¹(B₁, C) = C` is the identity, so `Ext¹(U_1, C)` sits between a surjection and `Ext¹(ℚ_p t, C) = 0`, and vanishes. The value `W` would contradict this.

### 4.14 Linearity of rank-zero additive lifts

In the situation of CN25 Proposition 4.27, an extension split on `C` with both endpoint Modules killed by `t` and reasonable of the same type (reasonable `B₁`-models of §4.2), let `v ↦ ℓ_v` be the continuous map of rank-zero additive lifts, with `ℓ_v(1) = v`. For every sympathetic `Λ`, `x ↦ ℓ_v(x)` on `O_Λ` is continuous and additive, and `ℓ_v(cx) = ℓ_(cv)(x)` for every `c ∈ O_C`, including zero and nonunits (CN25, Lemma 4.29 and proof, p. 30). Continuity of the lift map needs evaluation `ℓ ↦ ℓ(1)` to be a topological isomorphism. For compact type this is §4.6. For Fréchet endpoints, of countable type or not, §§4.7–4.9 make evaluation bijective on the space of lifts. That space is closed in `E(C̃{X})`, the value of the extension `E` at the sympathetic closure, which is a Fréchet space because it is an extension of the Fréchet spaces `𝐖₂(C̃{X})` by `𝐖₁(C̃{X})` (LocallyAnalyticDistributions §0.2, *Extensions of Fréchet spaces*); a TVS has no value at the disc algebra `C{X}`, which is not sympathetic. The open mapping theorem then makes evaluation a homeomorphism onto the Fréchet space `E(C)` (CN25, proof of Proposition 4.27, p. 29).

A proof route: descend `(τ−1)ℓ_v` to the translation parameter using `H`-invariance. `C`-point detection of sympathetic algebras makes the descended map additive. For units `c`, use the lift `X ↦ cX` and its conjugation action to identify `ℓ_v` and `ℓ_(cv)`. For a nonunit `c`, both `1` and `1 + c` are units, so additivity applied to `c = (1 + c) − 1` extends the identity. Treat `c = 0` directly.

*Needs:* §2.3; §3.6; §4.2; §4.3; §4.6; §4.7; §4.8; §4.9; LocallyAnalyticDistributions §0.2 (*Extensions of Fréchet spaces* and *Fréchet open mapping*); VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*.

**Checks.**

- The identity holds for `c = 0`, where both sides are 0, and for `c = p`.
- Changing a lift by `H` does not change the descended function.
- For `c = −1`, `ℓ_v(−x) = ℓ_(−v)(x) = −ℓ_v(x)`, consistent with additivity.
- For `W₁ = W₂ = C` and the split extension `E = V₁ ⊕ V₁`, `E(C̃{X}) = C̃{X}²` and the rank-zero additive elements are the pairs `(cX, vX)` with `c, v ∈ C`, a closed plane on which `ℓ ↦ ℓ(1) = (c, v)` is a bijection onto `C²`, hence a homeomorphism. The space of lifts is a subspace of this value at the sympathetic closure, not of a value at `C{X}`.

### 4.15 Period-module Hom and Ext comparison

For reasonable topological period models `W₁`, `W₂` of the same type, the natural maps from continuous `B`-linear model Hom to period Module Hom to TVS Hom are isomorphisms. The corresponding maps on Yoneda `Ext¹`, computed in topological `B`-modules with strict sequences, in period Modules and in TVS, are also isomorphisms. The exponent may increase in an extension. This is a degree-one comparison, not an equivalence of derived `Ext` groups (CN25, Proposition 4.27, equation (4.28) and proof, pp. 29–30; Appendix A, pp. 58–59). One common branch and one common exponent are used; graded pieces beyond countable type use §4.9.

A proof route: for Hom, restrict to finitely generated submodules decomposed into `B_d`-blocks, where §4.10 forces period linearity, and extend by continuity and density to the completed tensor at every `Λ`. For `Ext¹`, recover a `B`-action on `E(C)` by the same block restriction, and compare an extension split on `C` with its space of rank-zero additive elements. Evaluation `ℓ ↦ ℓ(1)` is a topological isomorphism, by §4.6 for compact type and by the open mapping theorem for Fréchet models, as in §4.14. With §4.14 and a countable approximately orthonormal basis `(e_i)` of `O_Λ` over `O_C` (not an isometric basis over arbitrary `C`; no basis of the models is used), define `s(Σ e_i v_i) = Σ ℓ_(v_i)(e_i)`. Uniform boundedness gives convergence, and a double-sum argument gives independence and naturality. Filter by the exponents of `W₁`, then of `W₂`.

*Needs:* §2.3; §3.6; §4.2; §4.3; §4.6; §4.8; §4.9; §4.10; §4.14; LocallyAnalyticDistributions §0.0; LocallyAnalyticDistributions §0.2.

**Checks.**

- For `W₁ = C` and `W₂ = B₂` the three `Ext¹(W₂, W₁)` groups are `C/t²C = C`, generated by `0 → C → B₃ → B₂ → 0` with first map multiplication by `t²` (§4.4 with `m = 1`, `d = 2`, `w = 1`). Its middle term is killed by `t³` but not by `t²`, while `B₂` is free over `B₂`, so `Ext¹` computed among Modules of exponent 2 would be 0 and miss this class.
- For `W₁ = W₂ = C` the extension group is `C` in all three categories.
- A merely algebraic section of `E(C)` does not give the tensor splitting.

### 4.16 Full faithfulness for reasonable Pairs

For reasonable same-type topological Pairs `P`, `P′` and their realizations, three sets of morphisms coincide naturally: continuous `B`-linear morphisms in the topological left-heart Pair category, morphisms of period Pairs, and TVS morphisms. This concerns Hom only, not `Ext¹` of arbitrary Pairs. Both presentations are localized at bicartesian squares, so a TVS map need not be a chain map of the chosen presentations (CN25, Theorem 4.30 and proof, p. 31).

A proof route: the source sequence `0 → 𝐌₁ → 𝐌₂ → P → 0` expresses `Hom(P, P′)` as a kernel, reducing to a Module source. Apply the target presentation and compare the five-term Hom and `Ext¹` sequences in both categories. The outer maps are isomorphisms by §4.15, so the middle Hom map is. Check compatibility with localization, composition and change of exponent.

*Needs:* §2.8; §4.3; §4.6; §4.8; §4.9; §4.15.

**Checks.**

- For Module pairs the result is the Hom part of §4.15.
- A non-strict dense inclusion stays a nonzero Pair, and its identity morphism is not zero.
- For `P = [0 → B₁]` and `P′ = [0 → B₂]`, all three Hom groups are `B₂[t] = tB₂ ≅ C`.

### Examples

For `W = B₃`, `d = 2`, both `W[t²]` and `W/t²W` have length 2, and for `d = 5` both are `W`. For `W = c₀(ℕ, C)` a degree-one parameter is a null sequence, and `(1, 1, …)` is excluded. The pushout for `m = d = 1`, `w = 1` is the framed `B₂`.

### Dependencies

Layers 2–3; `TopModuleCat`; `Submodule.torsionBy`; LocallyAnalyticDistributions §§0.0 and 0.2; CompactOperators §0.5; PadicPeriodRings §§4.1–4.3; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*, *Dimensions of standard Banach–Colmez spaces* and *Nonpositive curvature extension criterion*.

## Layer 5: Quasi-Banach–Colmez spaces

### 5.1 Filtered quasi-Banach–Colmez spaces

A qBC is a TVS `W` with subobjects `0 ⊂ W_{>0} ⊂ W_{≥0} ⊂ W` such that `W_{>0}` is a classical BC of curvature `> 0`, `W_{=0} = W_{≥0}/W_{>0}` is a period Pair, and `W_{<0} = W/W_{≥0}` is a classical BC of curvature `< 0`. A morphism is a TVS map preserving both subobjects and inducing a period-linear Pair map on the middle quotient. The height is `ht(W_{>0}) + ht(W_{<0})`. Curvature `> 0`, `≥ 0`, `= 0`, `< 0`, `≤ 0` means respectively `W = W_{>0}`, `W = W_{≥0}`, both outer pieces vanish, `W_{≥0} = 0`, and `W_{>0} = 0`. A qBC is reasonable when its middle Pair is reasonable. Two reasonable qBCs have the same type when their middle presentations have a common branch as in §4.3 (CN25, Definitions 4.5 and 4.7, Remark 4.6, pp. 21–22). Subobjects and quotients are taken in the pointwise left-heart exact structure. The filtration is intrinsic only under reasonableness, by §5.3.

A proof route: use the classical BC embedding of §2.4 and §2.8 for the middle piece. Height is invariant under filtered isomorphism, because the outer BC pieces are then isomorphic; no finite dimension is assigned to the middle Pair. A classical BC embeds through its canonical curvature filtration. Its middle affine BC is a finite-length period Module and hence a Pair `[0 → M]`. The two heights agree because affine BCs have height zero.

*Needs:* §2.3; §2.4; §2.8; §4.3; VectorBundlesAndIsocrystals, Layer 5, *Dimension and the abelian BC category*, *Canonical curvature filtration* and *Curvature-zero finite-length modules*.

API:

- A TVS with the two subobjects, outer classical BC witnesses and a middle Pair witness.
- Filtration-preserving TVS maps with period-linear middle maps, with identity and composition.
- The height, an integer invariant under filtered isomorphism.
- The five curvature conditions, given by vanishing or exhaustion of the filtration pieces.
- The embedding of classical BCs through their canonical filtration, preserving height and curvature.
- A period Pair with zero outer pieces is a qBC of height zero.

**Checks.**

- Zero is a qBC of height zero with all pieces zero.
- `ℚ_p` has `W_{>0} = W_{≥0} = 0`, `W_{<0} = ℚ_p` and height 1, since the parent gives `ℚ_p` negative curvature.
- The period Module realizing `c₀(ℕ, C)` lies entirely in degree `= 0` and has height zero, with no finite `C`-dimension assigned.
- `C/ℚ_p` with its parent filtration has height −1, which rules out an unsigned rank.

### 5.2 Positive BC spaces have no maps into a reasonable Pair

If `Y` is a classical BC of curvature `> 0` and `P` a reasonable period Pair, then `Hom_TVS(Y, P) = 0`. No common type with `Y` is required (CN25, Proposition 4.25 and proof, p. 28).

A proof route: the parent's HN decomposition and curvature dictionary reduce to `Y = B_d/ℚ_p^h` and `Y = U_d/ℚ_p t_x^d` for `x ≠ ∞`. For `B_d/ℚ_p^h`, use §4.12 and §4.11. Under the evaluation identifications, restriction from `Hom(B_d, P) = (M₂/M₁)[t^d]` to `Hom(ℚ_p^h, P)` is injective: restrict along a vector `v ∈ ℚ_p^h` with `θ(v) ≠ 0`, which exists because a space of curvature `> 0` has no quotient `C`. So a map that descends to the quotient is zero. For `U_d/ℚ_p t_x^d` use §4.13: restriction is multiplication by `t_x^d` on the algebraic quotient of the Pair. Since `θ(t_x) ≠ 0`, this is a unit on every uniformly torsion period model, hence on the quotient.

*Needs:* §4.3; §4.11; §4.12; §4.13; VectorBundlesAndIsocrystals, Layer 5, *HN decomposition and connected components* and *Curvature and HN support*.

**Checks.**

- For `P = [0 → B_m]` and `Y = U_1/ℚ_p t_x` with `x ≠ ∞`, restriction is multiplication by the unit `t_x` on `B_m`, which is injective, so the Hom group is 0.
- `C/ℚ_p = B₁/ℚ_p` has curvature `> 0` (a BC map `f : C/ℚ_p → C` composed with `C → C/ℚ_p` is multiplication by some `a ∈ C` killing 1, so `a = 0`; its height is −1, as positive curvature allows) and is covered: restriction from `Hom_TVS(B₁, P) = (M₂/M₁)[t]` to `Hom_TVS(ℚ_p, P) = M₂/M₁` is the inclusion of the `t`-torsion, so `Hom_TVS(C/ℚ_p, P) = 0`. For `P = [0 → C]` this restriction is the identity of `C`.
- Replacing positive by zero curvature gives the nonzero identity map `B₁ → B₁`.
- For `Y = B₂/ℚ_p^h` of curvature `> 0`, where `ℚ_p^h ⊄ tB₂`, the restriction along a vector with `θ(v) ≠ 0` is injective on `(M₂/M₁)[t²]`, so a map killing `ℚ_p^h` is 0.

### 5.3 Intrinsic filtration of a reasonable qBC

For a reasonable qBC `W`, `W_{>0}` is the largest positive-curvature classical BC subobject and `W_{<0}` the largest negative-curvature classical BC quotient. Every such BC monomorphism into `W` factors through `W_{>0}`, and every such BC epimorphism from `W` factors uniquely through `W_{<0}`. These universal properties recover `W_{>0}` and `W_{≥0} = ker(W → W_{<0})` independently of a reasonable presentation (CN25, Proposition 4.26 and proof, pp. 28–29). "Largest quotient" refers to factorization of quotient maps.

A proof route: a positive BC subobject maps to zero in `W_{<0}` by the parent's curvature orthogonality, and to zero in `W_{=0}` by §5.2. For a negative BC quotient, first kill `W_{>0}`, then show that every TVS map from a reasonable period Pair to a negative BC is zero. Reduce the source to the second Module of a presentation and restrict to finite-length period submodules, where the parent's orthogonality applies. The finite-length submodules span the model and have dense union after scalar extension. Continuity into the Hausdorff BC values forces the map to vanish. The extensions are not required to split.

*Needs:* §2.7; §5.1; §5.2; VectorBundlesAndIsocrystals, Layer 5, *Curvature orthogonality* and *Torsion at an untilt point*.

**Checks.**

- For a pure Pair both extremal BC pieces are zero.
- An isomorphism of the underlying TVS of two reasonable qBCs transports the recovered filtration.
- For a classical BC, the recovered filtration is its canonical curvature filtration: for `ℚ_p ⊕ B₁ ⊕ (U_1/ℚ_p t_x)` the pieces are `U_1/ℚ_p t_x`, `B₁` and `ℚ_p`.

### 5.4 Full faithfulness of reasonable qBCs in TVS

For reasonable qBCs `W`, `W′` of the same type, the natural map `Hom_qBC(W, W′) → Hom_TVS(W, W′)` is bijective. Every TVS map carries `W_{>0}` into `W′_{>0}` and `W_{≥0}` into `W′_{≥0}`, and its middle map is a morphism of period Pairs. In particular an isomorphism of underlying TVS is a qBC isomorphism and preserves height (CN25, Corollary 4.31 and Remark 4.6(ii), pp. 22, 31). The common-type condition concerns the middle presentations. The theorem does not claim that qBC is abelian or that the filtration splits.

A proof route: for an arbitrary map, apply the orthogonality arguments of §5.3 to the positive piece of the source and the negative quotient of the target. This gives preservation of both filtration steps without assuming the map injective or surjective. The induced map on middle Pairs is period-linear by §4.16. Uniqueness is uniqueness of the underlying natural transformation. Apply the same argument to the inverse of a TVS isomorphism, and use height invariance from §5.1.

*Needs:* §4.16; §5.1; §5.2; §5.3; VectorBundlesAndIsocrystals, Layer 5, *Curvature orthogonality*.

**Checks.**

- For pure reasonable Pairs this is §4.16.
- For classical BCs it gives the parent's morphisms.
- The TVS isomorphism `C/ℚ_p ≅ C/ℚ_p` given by multiplication by `p` is a qBC isomorphism and preserves the height −1.

### 5.5 A nonzero left-heart object with zero Hausdorff quotient

Over `ℚ_p`, let `E₁ = LA(ℤ_p, ℚ_p)`, `E₀ = C(ℤ_p, ℚ_p)`, and `J : E₁ → E₀` the canonical dense proper continuous inclusion. Its left-heart cokernel `X = [E₁ → E₀]` is nonzero. `Hom_LH(X, ℚ_p) = 0`, and `Ext¹_LH(X, ℚ_p) = D(ℤ_p, ℚ_p)/Mes(ℤ_p, ℚ_p)`, the algebraic quotient, or its left-heart object if the non-Hausdorff topology is kept. Zero is dense in the induced quotient topology. This is an example in the left heart, not a claim that `X` is a period Pair or a qBC (CN25, Remark 4.8(ii), p. 22). The topologies are the locally analytic inductive-limit topology, the uniform topology on `C(ℤ_p, ℚ_p)` and their continuous duals. Finite-dimensional strict extensions split over the spherically complete `ℚ_p`, a fact that is not applied to arbitrary `C`-spaces.

A proof route: LocallyAnalyticDistributions §§0.1, 0.3 and Layer 1 supply `LA`, `C⁰` and their duals. Give `D` the projective limit of the analytic-stage Banach dual topologies, which agrees with its strong dual topology over `ℚ_p`, and `D/Mes` the quotient topology. `LA → C⁰` is dense and proper, so its left-heart cokernel has a nonzero algebraic quotient and zero separated quotient. Apply `Hom(−, ℚ_p)` to the presentation. Finite-rank strict splitting over `ℚ_p` gives `Ext¹(C⁰, ℚ_p) = 0`, so the five-term sequence identifies `Ext¹(X, ℚ_p)` with the cokernel of `Mes → D`. Density gives `Hom(X, ℚ_p) = 0`. Prove that measures are dense for the stated distribution topology, so zero is dense in the quotient.

*Needs:* LocallyAnalyticDistributions §§0.0, 0.1, 0.2, 0.3 and Layer 1.

API:

- The canonical map `LA → C⁰` with its two topologies.
- Its cokernel in the left heart, keeping the algebraic quotient.
- `Hom` to `ℚ_p` vanishes and `Ext¹` is distributions modulo measures.
- A nonzero left-heart cokernel with zero separated quotient.

**Checks.**

- Replacing `J` by the identity of `C⁰` gives `X = 0`.
- `J` is not a strict monomorphism; treating it as one would collapse `X`.
- The connecting map sends a distribution to its class modulo measures, and a measure to zero.
- A quotient construction giving `X = 0` for this `J` fails the example.

### Examples

The heights of `0`, `ℚ_p`, `C/ℚ_p` and a pure reasonable Pair are 0, 1, −1 and 0. A pure Pair has zero outer pieces even when its `C`-value is infinite-dimensional.

### Dependencies

Layers 2 and 4; LocallyAnalyticDistributions §§0.0–0.3 and Layer 1; VectorBundlesAndIsocrystals, Layer 5, *Dimension and the abelian BC category*, *Canonical curvature filtration*, *Curvature-zero finite-length modules*, *HN decomposition and connected components*, *Curvature and HN support*, *Curvature orthogonality* and *Torsion at an untilt point*.

## Layer 6: The period-valued height functor

### 6.1 The contravariant period-valued height functor

For a classical BC `W`, define `h(W) = Hom_VS(W, B_dR)`, with `B_dR` acting by multiplication on the target. Precomposition makes `h` a contravariant `B_dR`-linear functor. The canonical comparisons identify `h(W)` with `colim_{k ≥ 0} Hom_VS(W, t^(−k)B_dR⁺)` and with `Hom_VS(W, B_dR⁺) ⊗_{B_dR⁺} B_dR`. Finite-dimensionality and the rank formula are §6.7 (CN25, §3.3, p. 19; Corollary 3.18 and proof, p. 18). VS is the parent's category of sympathetic Vector Spaces with its exact structure, neither the arithmetic category nor TVS. That every BC-source map has bounded period target is the supplier statement gap:G-HOM.

A proof route: use the parent's period functors `B_dR⁺`, `B_dR` and its morphism groups, define scalar multiplication on natural transformations and verify the functor laws. By gap:G-HOM every map factors through some `t^(−N)B_dR⁺`. Identify `t^(−k)`-target Hom with the lattice multiple of positive-target Hom. Localizing along `t` gives the filtered colimit; this localization is not itself the boundedness.

*Needs:* VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces* and *VS Hom vanishing from torsion period modules*; gap:G-HOM; PadicPeriodRings §§4.1–4.3.

API:

- The `B_dR`-module `Hom_VS(W, B_dR)`.
- Precomposition, preserving identities and reversing composition.
- The lattice-target colimit and the positive-target scalar extension, canonically identified with `h(W)`.
- For affine finite-length period Modules, `h = 0` by the parent's vanishing of torsion-to-`B_dR` maps.

**Checks.**

- `h(0) = 0`.
- `h(ℚ_p^r) = B_dR^r`, functorially in finite-dimensional `ℚ_p`-spaces.
- `h(B_m) = 0` for `m ≥ 1`, although `B_m` has `C`-dimension `m`.
- `h(C/ℚ_p) = 0`, whereas `ht(C/ℚ_p) = −1`; rank equals height only in curvature `≤ 0`.
- The identity of `ℚ_p` corresponds to the evaluation vector `1` in `h(ℚ_p) = B_dR`.

### 6.2 Exact comparison for period targets

Construct the comparison from the parent's sympathetic VS period objects to `ℚ_p`-module v-sheaves over `Perf_C`. For a BC source `W` and targets `t^(−k)B_dR⁺`, `B_m` and `B_dR`, prove that the comparison maps on Hom and `Ext¹` are bijective and commute with the period short exact sequences and their connecting maps. The topologies, exact structures and countability hypotheses are those fixed above. The parent's equivalence with the curve heart is not by itself this statement (CN25, §3.3 and proof of Lemma 3.26, pp. 19–20; LeBras18, Theorem 4.1, pp. 26–28; TVS25, Definition 3.32, pp. 23–24, Theorem 4.1 and Corollary 4.7, pp. 24–26, and Lemma 4.21, p. 28, for the enriched condensed route).

*Needs:* VectorBundlesAndIsocrystals, Layer 5, *Le Bras equivalence* and *Sympathetic Vector Spaces*; DiamondsAndVStacks §D2.2.

**Checks.**

- For `(W, target) = (ℚ_p, V₁)` the `Ext¹` comparison is `0 → 0`.
- For `(V₁, V₁)` the degree-zero and degree-one comparisons both identify `C` with `C`.
- For the normalized `B₂` sequence the connecting map sends 1 to the class 1; a zero comparison map fails this.

### 6.3 The constant source is projective in VS

For every VS `F`, evaluation of `1 ∈ ℚ_p` over `C` identifies `Hom_VS(ℚ_p, F)` with `F(C)`. Here `ℚ_p` is the constant functor, and `C` is initial among sympathetic algebras: a natural map from `ℚ_p` is determined by the image of `1` at `C`, and every element of `F(C)` defines one by transport along the unique algebra maps `C → Λ`. Exactness in VS is exactness at each algebra, so this functor of `F` is exact. Hence the constant `ℚ_p` is projective in VS and `Ext^i_VS(ℚ_p, F) = 0` for all `i ≥ 1`. In particular `Hom_VS(ℚ_p, B_m) = B_m` and `Hom_VS(ℚ_p, B_dR) = B_dR`, and `Ext¹_VS(ℚ_p, −)` vanishes on `B_m`, `V₁`, `B_dR⁺`, `t^(−k)B_dR⁺` and `B_dR`; no inverse-limit argument is needed. CN25 derives the `B_dR⁺` case from the tower of the `B_m` instead (CN25, Lemma 3.26 and proof, pp. 19–20).

*Needs:* VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*.

**Checks.**

- For `F = V₁`, `Hom_VS(ℚ_p, V₁) = C` and `Ext¹_VS(ℚ_p, V₁) = 0`, the values §6.5 uses.
- For `F = B_dR`, `Hom_VS(ℚ_p, B_dR) = B_dR` and `Ext¹_VS(ℚ_p, B_dR) = 0`, so `h(ℚ_p)` and the `Ext¹` term have `B_dR`-ranks `(1, 0)`, as §6.7 requires for height 1.
- The argument fails for the source `V₁`: `Hom_VS(V₁, F)` is not evaluation at an initial object, and `Ext¹_VS(V₁, B_dR⁺) = C ≠ 0` (§6.5), so `V₁` is not projective in VS.

### 6.4 Filtered localization of VS Ext

For every classical BC `W`, the canonical map `colim_{k ≥ 0} Ext¹_VS(W, t^(−k)B_dR⁺) → Ext¹_VS(W, B_dR)` is bijective. Prove the compactness or pseudocoherence of these BC sources through the VS-to-sheaf comparison, and identify the colimit with localization at `t`; `Ext` does not commute with arbitrary filtered colimits (AnschutzLeBras25, proof of Corollary 3.8, pp. 3675–3676, and Theorem 3.9, pp. 3676–3678; CN25, Lemma 3.26, pp. 19–20).

*Needs:* §6.2; gap:G-HOM.

**Checks.**

- For `W = ℚ_p` all lattice-target `Ext¹` and their colimit are 0.
- For `W = V₁` each lattice-target `Ext¹` is `C`, each transition is 0, and the colimit is 0.
- For `W = C/ℚ_p` the localized `Ext¹` has `B_dR`-rank 1, so not all sources have vanishing `Ext¹`.

### 6.5 VS Ext for the basic sources

For a classical BC `W`, the map of §6.4 is an isomorphism of `B_dR`-vector spaces. By §6.3, `Ext¹_VS(ℚ_p, V₁) = 0`. Prove, for every `k ≥ 0`, `Ext¹_VS(V₁, t^(−k)B_dR⁺) ≅ C`, with the connecting map `Hom_VS(V₁, t^(−k−1)V₁) → Ext¹_VS(V₁, t^(−k)B_dR⁺)` an isomorphism. Consequently the transition to the next lattice-target `Ext¹` is zero. Section 6.3 gives `Ext¹_VS(ℚ_p, B_dR⁺) = 0`. All groups are in VS. A table computed in v-sheaves is used only through the comparison of §6.2 (CN25, §3.3 and proof of Lemma 3.26, pp. 19–20; LeBras18, Theorem 4.1, pp. 26–28; AnschutzLeBras25, Theorems 3.1, 3.2 and 3.9 and Corollary 3.11, pp. 3670–3681; TVS25, Theorem 4.1 and Corollary 4.7, pp. 24–26, Lemma 4.21, p. 28, and Corollary 4.25, p. 30).

A proof route: compute the v-sheaf values `Hom` and `Ext¹` of `V₁` into `t^(−k)B_dR⁺` and `t^(−k)V₁` as in LeBras18 Theorem 4.1, as part of this target, and transport them through §6.2. The filtered colimit is §6.4; the Mac Lane resolution and qcqs representable powers in the proof of AnschutzLeBras25, Corollary 3.8, give the sheaf-side pseudocoherence. For the source `ℚ_p` use §6.3. For `V₁` use `0 → t^(−k)B_dR⁺ → t^(−k−1)B_dR⁺ → t^(−k−1)V₁ → 0`, the parent's vanishing of torsion-to-positive-period Hom and the normalized degree-one class. The boundary is the isomorphism `C → C`, so the next transition is zero.

*Needs:* §6.1; §6.2; §6.3; §6.4; VectorBundlesAndIsocrystals, Layer 5, *The tilted coherent heart*, *Le Bras equivalence* and *VS Hom vanishing from torsion period modules*.

**Checks.**

- For `k = 0`, `Hom_VS(V₁, B_dR⁺) = 0` and `Hom_VS(V₁, t^(−1)V₁) = C`, so the connecting map identifies `C` with `Ext¹_VS(V₁, B_dR⁺)`.
- The boundary `C → C` is nonzero by the normalized extension; equal dimensions alone would not make the transition zero.
- For `W = ℚ_p`, `Ext¹_VS(ℚ_p, V₁) = 0`, consistent with §4.11 in TVS.

### 6.6 Vanishing and exactness in nonpositive curvature

If a classical BC `W` has curvature `≤ 0`, then `Ext¹_VS(W, B_dR) = 0`. Therefore every exact sequence `0 → W₁ → W → W₂ → 0` of such BC spaces gives an exact sequence `0 → h(W₂) → h(W) → h(W₁) → 0`. These are BC sequences read in VS, not arbitrary Pairs (CN25, Lemma 3.26 and proof, pp. 19–20).

A proof route: for `ℚ_p` use §6.3. For `V₁` the lattice transitions are zero by §6.5, so the colimit vanishes. Filter a finite-length affine BC by its `t`-filtration to get vanishing for every affine object. The parent's characterization `0 → V → W → M → 0`, with `V` finite-dimensional over `ℚ_p` and `M` affine, for curvature `≤ 0`, and the long exact sequence give the general case. Apply `Hom_VS(−, B_dR)` to a short exact sequence to get the contravariant exactness.

*Needs:* §6.1; §6.3; §6.5; VectorBundlesAndIsocrystals, Layer 5, *Nonpositive curvature extension criterion* and *Curvature-zero finite-length modules*.

**Checks.**

- For `W = C` and `W = ℚ_p`, `Ext¹` is zero.
- The claim does not extend to `C/ℚ_p`, whose period `Ext¹` has rank 1 by §6.7.
- For `0 → ℚ_p → ℚ_p ⊕ C → C → 0`, the sequence `0 → h(C) = 0 → h(ℚ_p ⊕ C) = B_dR → h(ℚ_p) = B_dR → 0` is exact.

### 6.7 Height and period Hom/Ext ranks

For every classical BC `W`, `h(W)` and `Ext¹_VS(W, B_dR)` have finite `B_dR`-dimension and `rank h(W) = ht(W) + rank Ext¹_VS(W, B_dR)`. If `W` has curvature `≤ 0`, the `Ext¹` term vanishes and `rank h(W) = ht(W)` (CN25, Proposition 3.27 and proof, p. 20). Height has the parent's signed convention.

A proof route: for curvature `≤ 0` use `0 → F → W → M → 0` from the parent, `h(M) = 0` and §6.6, so `h(W) ≅ h(F)` has rank `dim_ℚ_p F = ht(W)`. For general `W` use the parent's presentation `0 → F₂ → Y → W → 0`, where `0 → F₁ → Y → G_a^d → 0` with `F₁`, `F₂` finite-dimensional constant `ℚ_p`-spaces and `G_a(Λ) = Λ`. `Y` has curvature `≤ 0` by the parent's extension criterion. By §6.6 the long exact sequence is `0 → h(W) → h(Y) → h(F₂) → Ext¹(W, B_dR) → 0`, with middle terms of ranks `dim F₁` and `dim F₂`. The alternating rank identity and `ht(W) = dim F₁ − dim F₂` give the formula.

*Needs:* §6.1; §6.6; VectorBundlesAndIsocrystals, Layer 5, *Finite-Dimensional Banach–Colmez presentations*, *Nonpositive curvature extension criterion* and *Dimension and the abelian BC category*.

**Checks.**

- `W = ℚ_p` gives ranks `(1, 0)` and height 1; `W = C` gives `(0, 0)` and height 0.
- `W = C/ℚ_p` gives ranks `(0, 1)` and height −1, which fixes the sign of the correction term.
- For `W = ℚ_p² ⊕ (C/ℚ_p)³`, which mixes both curvature signs, the ranks of `(h, Ext¹)` are `(2, 3)` and the height is `2 − 3 = −1`, so the formula reads `2 = −1 + 3`. Reading the correction term with the opposite sign would give `−1 − 3 = −4`, and dropping it, as in curvature `≤ 0`, would give `−1`; both differ from the rank 2.

### Examples

For `ℚ_p`, `C` and `C/ℚ_p`, the ranks of `(h, Ext¹)` are `(1, 0)`, `(0, 0)` and `(0, 1)`, giving `1 = 1 + 0`, `0 = 0 + 0` and `0 = −1 + 1`. The last example needs the correction term.

### Dependencies

gap:G-HOM; PadicPeriodRings §§4.1–4.3; DiamondsAndVStacks §D2.2; VectorBundlesAndIsocrystals, Layer 5, *Sympathetic Vector Spaces*, *VS Hom vanishing from torsion period modules*, *Le Bras equivalence*, *The tilted coherent heart*, *Nonpositive curvature extension criterion*, *Curvature-zero finite-length modules*, *Finite-Dimensional Banach–Colmez presentations* and *Dimension and the abelian BC category*.

## Downstream consumers

CstConjectureForDaggerVarieties uses the qBC filtration and full faithfulness of Layer 5. The Colmez–Nizioł comparisons of CohomologyComparisons §§4.8–4.11 work in the same setting (countable perfect residue field, `C` the completion of `K̄`) and are the natural consumer of the period Hom and `Ext` statements of Layers 1 and 4 and of the height–rank formula. Neither is a supplier of this roadmap.

## References

Locators refer to the versions recorded in `sources.toml`. Statements are paraphrases. Where a source contains a misprint, the statement here is the corrected one and the misprint is noted where it occurs.

- CN25: Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture* (2025). Numbering and pages follow the 61-page author copy dated 24 November 2024. [Author copy](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf).
- Fontaine03: Jean-Marc Fontaine, *Presque C_p-représentations*, Documenta Mathematica Extra Volume Kato (2003), 285–385. [Open text](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-kato/fontaine.dm.pdf).
- Fontaine04: Jean-Marc Fontaine, *Arithmétique des représentations galoisiennes p-adiques*, Astérisque 295 (2004), 1–115. [Numdam](https://www.numdam.org/item/AST_2004__295__1_0/).
- Colmez12: Pierre Colmez, *Une construction de B_dR⁺*, Rendiconti del Seminario Matematico della Università di Padova 128 (2012), 109–130. [Numdam](https://www.numdam.org/item/RSMUP_2012__128__109_0/).
- Colmez02: Pierre Colmez, *Espaces de Banach de dimension finie* (2002). Locators use the internal pagination of the author copy. [Author copy](https://webusers.imj-prg.fr/~pierre.colmez/jussieucorps.pdf).
- FF18: Laurent Fargues and Jean-Marc Fontaine, preface by Pierre Colmez, *Courbes et fibrés vectoriels en théorie de Hodge p-adique* (2018). Numbering follows the author copy dated 16 April 2017; printed page equals PDF page minus 10. [Author copy](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf).
- Schneiders99: Jean-Pierre Schneiders, *Quasi-abelian categories and sheaves*, Mémoires de la SMF 76 (1999). [Numdam](https://www.numdam.org/item/10.24033/msmf.389.pdf).
- TVS25: Pierre Colmez and Wiesława Nizioł, *Topological Vector Spaces* (2025). Locators use the author copy dated 21 November 2025. Its enriched condensed category is distinct from the left-heart category used here. [Author copy](https://webusers.imj-prg.fr/~wieslawa.niziol/TVS-arxiv.pdf).
- AnschutzLeBras25: Johannes Anschütz and Arthur-César Le Bras, *A Fourier transform for Banach–Colmez spaces*, Journal of the European Mathematical Society (2025), §3.1, pp. 3670–3681. [Open text](https://ems.press/content/serial-article-files/51138).
- LeBras18: Arthur-César Le Bras, *Espaces de Banach–Colmez et faisceaux cohérents sur la courbe de Fargues–Fontaine* (2018). Locators use arXiv v1. [arXiv](https://arxiv.org/abs/1801.00422v1).
- Scholze13: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Forum of Mathematics, Pi 1 (2013), e1. Locators use arXiv v2. [arXiv](https://arxiv.org/abs/1205.3463v2).
