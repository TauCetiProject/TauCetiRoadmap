# Roadmap: local Galois deformation rings and their components, part II: explicit tame GL₂ rings of small Hodge type

**Summary.** Let `K/ℚ_p` be unramified of degree `f` and let `ρ̄ : G_K → GL₂(𝔽)` be semisimple and sufficiently generic. This roadmap computes, by explicit equations, the framed potentially crystalline deformation rings of `ρ̄` whose labelled Hodge–Tate weights are `(3,0)` or `(2,1)` at every embedding, first for one tame inertial type and then for all the tame types whose reduction contains a fixed Serre weight `σ`. It builds, in every rank `n`, characteristic-zero tame types and their orientations, Kisin modules with tame descent in gauge coordinates, an effective finite-jet form of the monodromy condition and the classification of semisimple residual representations by monomial étale `φ`-modules; then, in rank two, the admissible types and residual Kisin modules, three explicit eight-variable charts with an effective Newton approximation, and common nine-variable charts for several types. The end theorems are the single-type presentation `R^{≤(3,0),τ}_ρ̄⟦X₁,…,X_{2f}⟧ ≅ (R/Σ_j I_j)⟦Y₁,…,Y₄⟧` with its `2^f` Hodge-labelled components and reduced special fibres, the multiple-type presentation of `R^{≤(3,0),σ}_ρ̄` with `4^f` components, and the integral component-intersection relation `p ∈ (Q₁ ∩ Q₂) + P_{w̃,j,(3,0)}`, which is the local input of the patched-module gluing argument of BHHMS23, Theorem 8.3.9 (equations (78)–(79), pp. 101–102).

## Scope and ownership

This is Part II of `LocalGaloisDeformationRings`. That roadmap stops at general framed lifting rings, Hodge and inertial types, fixed-type potentially semistable quotients, their dimension and generic regularity, bounded-height lattice functors, and the explicit rank-three (`GL₃`) charts of its §§6.9–6.33. This Part owns the explicit tame theory needed for these rings. In every rank `n`: characteristic-zero tame types `τ(s,μ+η)` with their orientation, eigenbasis and gauge coordinates, the monodromy derivation and its finite jets on Kisin modules with tame descent, monomial residual representations, the contravariant realization of étale `φ`-modules with coefficients in `𝔽`, the identification of tame quotients along the Kummer tower, cyclotomic freeness of `ad(ρ̄)`, descent of isomorphisms from `G_{K∞}` to `G_K`, and the framed deformation rings of profinite groups that fail Mazur's finiteness condition (used for `G_{K∞}`). In rank two: the Jordan–Hölder labels of tame types, the admissible types and residual Kisin modules for a normalized generic `ρ̄`, the polynomial charts and their effective comparison with the actual deformation rings, the single-type and multiple-type presentations, and the exact small-weight ideals and the membership of `p`. `LocalGaloisDeformationRings` §6.9 owns the rank-three eigenbasis charts with their Frobenius matrices and shapes; 1.1–1.2 extend the normalized Frobenius matrix and the shape to every rank `n`, and 1.2 proves that at `n = 3` they are §6.9's, at the same index.

The two Hodge profiles `(3,0)` and `(2,1)` are not the potentially Barsotti–Tate profile `(1,0)`: every statement here includes the profile `(3,0)` and its determinant twist `(2,1)`, embedding by embedding.

The following are imported and are not targets here.

- The framed lifting functor of a profinite group, its representing pair `(R□, ρ□)` under Mazur's `Φ_p` condition, and the reduced `𝒪`-torsion-free potentially semistable and potentially crystalline quotients of bounded labelled Hodge type and finite-image inertial type: `PadicLocalLanglandsForGL2Qp`, §0.4. Their specialization to `G_K` and the fixed-type rings `R^{λ,τ}_ρ̄`: `LocalGaloisDeformationRings`, §§1.1, 3.1, 3.4; potentially crystalline loci over a complete local base: §3.5; equidimensionality and generic regularity: §§3.9–3.10.
- Fundamental characters `ω_f` of every niveau and Teichmüller lifts: `PadicLocalLanglandsForGL2Qp`, §0.3. Tame inertia and the tame quotient: `LocalFieldsRamification`, Layer 4. The local Artin map and its normalizations: `ClassFieldTheory`, Layer 7.
- Henniart's types `σ(τ)` and the lattice-independent semisimplified reduction `σ̄(τ)`: `PadicLocalLanglandsForGL2Qp`, §4.4.
- Breuil–Kisin coefficient rings, the open-disc ring, `λ` and `N_∇`: `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.4.1; Kisin modules of finite height and with coefficients: §§R07.4.2, R07.4.36; étale `φ`-modules with finite coefficients and their covariant `G_{K∞}`-realization `T_A`: §R07.4.39; the `(φ,N_∇)` comparison: §R07.4.6; full faithfulness of restriction to `G_{K∞}` on finite flat representations: §R07.4.24. Kisin modules with tame descent data over `𝔖_{L′,R}`, their étale descent and contravariant realization `T*_dd`, and the eigenbasis transformation law: `LocalGaloisDeformationRings`, §6.9. Bounded-height lattice functors: `LocalGaloisDeformationRings`, §§1.2 and 1.8.
- Regular Serre weights `F(λ)` and their depth: `ModpRepresentationsOfGL2OverLocalFields`, §3.1; the translation map `t_λ`, the set `Σ` and adjacency: §3.2; the mod-`p` tame parameter `τ(s,ν)` and the tame weight set `W(ρ̄)`: §3.4. The adjoint tensor decomposition and the `2^f` characteristic-zero constituents of a projective lift: §5.5.
- Complete-local coproducts `A ⊗̂_𝒪 B`: `DeformationAndDerivedPatchingAlgebra`, §1.12; relative cotangent spaces and power-series presentations: §1.9; towers and cofinal completions: §§1.8, 1.14; flat completion of finite modules: §1.13; pointed tensor domains and component products: §4.6; detection of reduced `𝒪`-flat quotients by valued points: §4.7; square-free monomial components: §6.8.
- Factoriality of regular local rings in every dimension (Auslander–Buchsbaum): `PurityForFlatCohomology`, §7.4.
- Weierstrass preparation and division (`PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`), multivariate power series and regular local rings: Mathlib; regularity of power series over a regular local ring: Tau Ceti.

The unrestricted framed rings in every dimension (complete intersection, components, normality and factoriality after Böckle–Iyengar–Paškūnas and Paškūnas–Quast) and the weight-zero crystalline lifting rings of Boxer–Calegari–Gee–Newton–Thorne §2 are outside this roadmap; neither is an input here.

## Conventions

- `n ≥ 1` is the rank. §§0.1–0.4 and Layers 1–3 are stated for `GL_n`; §0.5 and Layers 4–7 take `n = 2`. In Layers 0–3 a Check or example written with the element `w`, with pairs of integers as weights, or with `2 × 2` matrices is the case `n = 2`. Elsewhere a local `n` (the index of the Kummer tower, the number of variables in 5.3, the exponent in 5.5) is bound where it appears.
- `p` is a rational prime. `K/ℚ_p` is unramified of degree `f ≥ 1` with residue field `k = 𝔽_q`, `q = p^f`. `E/ℚ_p` is a finite coefficient field, enlarged finitely where a statement says so; `𝒪 = 𝒪_E`, `ϖ` a uniformiser and `𝔽` the residue field. Throughout, `E` is large enough that `𝔽` contains a subfield isomorphic to the extension `k_(n) = 𝔽_{q^m}` of `k`, `m = lcm(1, …, n)`, which contains the residue field of the unramified extension of `K` of degree `ord(s)` for every `s ∈ S_n`; equivalently `𝒪` contains the `(q^m − 1)`-st roots of unity. For `n = 2` this is the quadratic extension `k₂ = 𝔽_{q²}`. `p` and `ϖ` need not generate the same ideal; every integral membership statement says which of the two it uses.
- Fix an embedding `σ₀ : k → 𝔽` and put `σ_j = σ₀ ∘ Frob_p^j`, where `Frob_p(x) = x^p`, indices modulo `f`. Fix also an embedding `σ′₀ : k_(n) → 𝔽` extending `σ₀`; for `K′/K` unramified of degree `r` dividing `m`, with residue field `k′ ⊆ k_(n)` and `f′ = rf`, an index `j′` modulo `f′` means the embedding `σ′₀ ∘ Frob_p^{j′}` restricted to `k′`. Coefficient rings decompose along `σ_{−j}`, so that Frobenius moves the `j`-th summand to the `(j+1)`-st.
- The cyclotomic character `ε` has Hodge–Tate weight `+1`; `ω` is its reduction. Labelled Hodge–Tate weights `λ = (λ_j)_j` with `λ_j ∈ {(3,0),(2,1)}` are written `{30,21}^f` when only the label matters. All deformations are framed, continuous and with unrestricted determinant.
- The fundamental character `ω_{f′}` of niveau `f′ = rf` is `PadicLocalLanglandsForGL2Qp` §0.3's Kummer character of a `(p^{f′}−1)`-st root of a uniformiser, a character of `I_K = I_{K′}` with values in the residue field `k′` of degree `f′`, followed by `σ′₀` (this is `σ₀` when `f′ = f`); `ω̃_{f′}` is its Teichmüller lift, with values in `𝒪^×`. Composed with the local Artin map of `K′` normalized to send a uniformiser to **geometric** Frobenius, it restricts on `𝒪_{K′}^×` to reduction followed by `σ′₀`; with `ClassFieldTheory` Layer 7's arithmetic normalization, it restricts to the inverse of that. The unramified character `nr(α)` sends **arithmetic** Frobenius to `α`. Both statements are used and they are consistent.
- The Kummer tower is `K∞ = ⋃_n K(p_n)` with `p₀ = −p` and `p_n^p = p_{n−1}`. For `r` the order of `s_τ` below, `K′/K` is unramified of degree `r`, `f′ = rf`, `e′ = p^{f′} − 1` and `L′ = K′((−p)^{1/e′})`. The Kisin variable `u′` satisfies `v = (u′)^{e′}` and `E(u′) = v + p`. The realization of étale `φ`-modules is the contravariant `V*_K` of 3.3, and that of Kisin modules with descent data is `LocalGaloisDeformationRings` §6.9's contravariant `T*_dd`.
- `η = (n − 1, …, 1, 0)` at every embedding and `W = S_n`, acting on `ℤⁿ` by `(s·x)_i = x_{s^{−1}(i)}`, so that `ṡ diag(x) ṡ^{−1} = diag(s·x)` for the permutation matrix `ṡ` with `ṡ e_i = e_{s(i)}`; `t^ν` is the translation by `ν ∈ ℤⁿ`. A weight `μ` is `N`-deep (in the lowest alcove) when `N < ⟨μ_j + η, α^∨⟩ < p − N` for every `j` and every positive root `α` of `GL_n` (BHHMS23, §2.1, p. 12). For `n = 2`: `η = (1,0)`, `W = {1, w}`, and the condition reads `N < μ_{j,1} − μ_{j,2} + 1 < p − N`; this is the depth of `ModpRepresentationsOfGL2OverLocalFields` §3.1, with `r_j = μ_{j,1} − μ_{j,2}`, and at `N = 12` it forces `p ≥ 29`.
- From Layer 4 on, `n = 2` and we fix **normalized data**: `ρ̄` is semisimple, `ρ̄|_{I_K} ≅ τ(s,μ)` with `s_j = 1` for every `j` except `s₀ = w` exactly when `ρ̄` is irreducible, and `μ_j = (r_j + 2, 1)` with `N < r_j + 1 < p − N` for all `j` and `N ≥ 12`. A central twist by a power of `ω_f` puts every 12-deep presentation in this form; a 13-generic semisimple `ρ̄` admits such a presentation (BHHMS23, §4.1, pp. 24–25). The normalized presentation is part of the data; no statement turns an arbitrary 12-generic presentation into normalized 12-deep data.
- A Kisin matrix table with index `j` describes the Frobenius matrix at embedding `f − 1 − j`; its Hodge label is `λ_{f−1−j}`. The star operation `(s t^μ)^*_j = t^{μ_{f−1−j}} s_{f−1−j}^{−1}` reverses both products and indices (BHHMS23, end of §2.1, p. 13).
- The admissible shapes are `U₁ = t^(2,1)`, `U₂ = w t^(2,1)` and `U₃ = t^(1,2)`; `Adm∨ = {U₁,U₂,U₃}^f`, and `i(w̃)_j ∈ {1,2,3}` records the shape `w̃_j`.
- Every comparison between a Serre weight and a type reduction includes the twist `N_{k/𝔽_p} ∘ det`; dropping it changes the central character.
- Locators in BHHMS23 refer to the printed pages of arXiv:2009.03127v7.

## Exact supplier contracts

### From Mathlib

- `MvPowerSeries`, `MvPowerSeries.C`, `MvPowerSeries.X` (`Mathlib/RingTheory/MvPowerSeries/Basic.lean`): the ambient chart rings `𝒪⟦x₁,…,x_n⟧`; no further completed carrier is introduced. Mathlib has no theorem that these rings are factorial in more than one variable.
- `PowerSeries.exists_isWeierstrassFactorization` and `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` (`Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`): Weierstrass preparation and division over a coefficient ring `A` that is complete for its maximal ideal, for a series whose reduction modulo the maximal ideal is nonzero.
- `IsDiscreteValuationRing`, `IsAdicComplete`, `IsLocalRing.maximalIdeal`, `IsLocalRing.notMem_maximalIdeal`, `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`, with its instance for a local principal ideal domain, so for a discrete valuation ring), `UniqueFactorizationMonoid`, `Ideal.span`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`.

### From Tau Ceti

- `TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv` (`TauCeti/NumberTheory/LocalField/Tame/Character.lean`): the tame character of inertia and the identification of the tame inertia quotient, implementing `LocalFieldsRamification` Layer 4.
- `TauCeti.PowerSeries.isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean`): power series in one variable over a regular local ring form a regular local ring. By induction on the number of variables, `𝒪⟦x₁,…,x_n⟧` is regular local for a discrete valuation ring `𝒪`. Tau Ceti's `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean`) gives factoriality only in Krull dimension at most two, which does not cover `𝒪⟦x₁, x₂⟧` (dimension three).

### From TauCetiRoadmap.LocalFieldsRamification and TauCetiRoadmap.ClassFieldTheory

- `LocalFieldsRamification`, Layer 4: the absolute Galois group `G_K`, inertia `I_K`, wild inertia `P_K`, the maximal tamely ramified extension `K^t` and the tame quotient `G_K/P_K`, its generators and the action of an arithmetic Frobenius lift by the `q`-power map. Layer 3: Eisenstein polynomials generate totally ramified extensions. Layer 2: unramified extensions and Frobenius. Used in 0.1, 3.1, 3.4, 3.5, 3.6, 3.7 and 3.9.
- `ClassFieldTheory`, Layer 7: the absolute local Artin map with its arithmetic normalization and the geometric normalization obtained by inversion. Used only to translate the normalization of `ω_f` and of `nr(α)`.

### From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp

- §0.3: the fundamental characters at every niveau on the tame inertia quotient, their independence of the uniformiser, Teichmüller lifts, norm compatibility and Frobenius conjugation by the `q`-power map. Used in 0.1 and 3.5.
- What PadicLocalLanglandsForGL2Qp must provide (gap:fundamental-character-artin): for finite `K/ℚ_p` with residue field `𝔽_q` and the arithmetically normalized Artin map of ClassFieldTheory Layer 7, the niveau-`f` fundamental character satisfies `ω_f(Art_K(u)) = σ₀(ū)^{−1}` for every `u ∈ 𝒪_K^×`, equivalently `σ₀(ū)` for the geometric normalization.
- §0.4: the framed lifting functor of a profinite group and of each of its finite quotients, its representing pair `(R□, ρ□)` under Mazur's `Φ_p` condition (which every finite group satisfies), with tangent space the continuous cocycles `Z¹(Γ, ad ρ̄)`, and the reduced `𝒪`-torsion-free potentially crystalline quotients of bounded labelled Hodge type and finite-image inertial type, with their criterion on all finite local `E`-algebras. Used in 3.10, 5.1, 5.7, 6.1 and 7.2.
- §4.4: Henniart's types `σ(τ)` and `σ^cr(τ)`, their twists and the lattice-independent semisimplified reduction `σ̄(τ)`, stated there for `GL₂(ℤ_p)` and, in the supercuspidal case, for every nonarchimedean local field.
- What PadicLocalLanglandsForGL2Qp must provide (gap:tame-types-unramified): for `K/ℚ_p` unramified of degree `f` and every tame inertial type `τ` of rank two (`τ ≅ τ(s,μ+η)` for some `s ∈ S₂^f` and `μ ∈ (ℤ²)^f`), the type `σ(τ)` of `GL₂(𝒪_K)` in the normalization of BHHMS23 §2.2 (p. 13; for scalar `τ = χ ⊕ χ` it is `χ ∘ det`, the `σ^cr(τ)` of §4.4) with its occurrence property, the fact that it is inflated from an irreducible representation of `GL₂(𝔽_q)`, the twist rule `σ(τ ⊗ χ) ≅ σ(τ) ⊗ (χ ∘ det)` and a lattice-independent semisimplified reduction `σ̄(τ)`; and, when `μ` is 1-deep, its identification with the inflation of the Deligne–Lusztig representation `R_s(μ+η)` of `GL₂(𝔽_q)` (BHHMS23, proof of Proposition 2.4.3, p. 16, after LLHL19, Corollary 2.3.5, p. 15).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

- §R07.4.1: `𝔖`, `𝒪_ℰ`, `𝒪̂_{ℰ^ur}`, the open-disc ring with its bounded subring `𝔖[1/p]`, `λ = ∏_{n≥0} φ^n(E(u)/E(0))` and `N_∇ = −uλ d/du`, with the identity `λ = (E/E(0)) φ(λ)`. §R07.4.2: Kisin modules of finite `E`-height. §R07.4.36: Kisin modules with coefficients. §R07.4.5 and §R07.4.39: étale `φ`-modules with finite coefficients `A` and the covariant equivalence `T_A(M) = (𝒪̂_{ℰ^ur} ⊗_{𝒪_ℰ} M)^{φ=1}` with continuous `A`-representations of `G_{K∞}`, compatible with finite base change and duals, for the Kummer tower of a uniformiser of `K`; here the uniformiser is `−p`. §R07.4.6: `(φ,N_∇)`-modules over the open disc for scalar coefficients, with `N_∇φ = (p/E(0)) E(u) φ N_∇`. §R07.4.24: restriction to `G_{K∞}` is fully faithful on finite flat representations.
- What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:relative-monodromy-criterion): for an `𝒪`-flat complete Noetherian local `𝒪`-algebra `R` with residue field `𝔽` and a Kisin module `𝔐` of height `≤ h` over `𝔖_{L′,R}` with tame descent data, the relative open-disc ring `𝒪^rig_R = lim_n R⟦u′, (u′)^n/p⟧[1/p]` with its Frobenius, base change along continuous local `𝒪`-algebra maps between such rings and to the rings of integers of finite extensions of `E`, and the theorem that the monodromy derivation of 2.1 preserves `𝔐^rig` exactly when every specialization of `T*_dd(𝔐)[1/p]` at a finite `E`-algebra point extends to a potentially crystalline `G_K`-representation of the descent type with Hodge–Tate weights in `[0,h]`, compatibly with the potentially crystalline loci of `LocalGaloisDeformationRings` §3.5.
- What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:kummer-restriction-invariants): for a finite-dimensional continuous `𝔽`-representation `W` of `G_K` that becomes upper triangular over an unramified extension `K′/K` of degree prime to `p` with `H⁰(G_{K′}, (W|_{G_{K′}})^ss ⊗ ω^{−1}) = 0`, the restriction `H⁰(G_K, W) → H⁰(G_{K∞}, W)` is bijective (LLHLM23, Lemma 7.2.10(1), p. 107; its `Hom` form is Lemma 7.2.10(3) there and BHHMS23, Lemma 3.2.8).

### From TauCetiRoadmap.LocalGaloisDeformationRings

- §1.1: the local framed deformation ring `R□_ρ̄` of `G_K`. §1.2: the functor of bounded-height lattices and the coordinate height condition `XY = E^h I` on a free lattice; §1.8: its projective model and image. §3.1: Hodge types and Galois types. §3.4: the potentially crystalline quotients `R^{λ,τ}_ρ̄`, which are the quotients of `PadicLocalLanglandsForGL2Qp` §0.4. §3.5: potentially crystalline loci in families over a complete local base. §3.9: generic dimension `d² + Δ(v)`, which is `4 + f` for regular rank-two Hodge type, and integral relative dimension `4 + f`. §3.10: regularity of the crystalline generic fibre and formal smoothness at its closed points.
- §6.9: coefficient Kisin modules with tame descent data over `𝔖_{L′,R} = (W(k′) ⊗ R)⟦u′⟧` for `K′/K` unramified of degree at most three, their étale descent over the completed carrier `𝒪_{ℰ,K,R}`, the contravariant realization `T*_dd` and the twisted-conjugation law for a change of eigenbasis, stated there in rank three with its chart API, including the Frobenius matrices and shapes that 1.2 compares with those of 1.1–1.2. §6.28: the rank-three gauge charts, formally smooth of relative dimension `3f` and `9`.
- What LocalGaloisDeformationRings must provide (gap:descent-kisin-modules): the §6.9 construction in every rank `n` for `K′/K` unramified of degree `r = ord(s_τ)` and every height `h`, over every complete Noetherian local `𝒪`-algebra `R` with residue field `𝔽`: the category `Y^{[0,h],τ}(R)` of rank-`n` Kisin modules with descent of type `τ`, eigenbases, the contravariant realization `T*_dd` of the étale descent (over `R = 𝔽` it is the functor `V*_K` of 3.3 applied to the étale `φ`-module over `k((v)) ⊗ 𝔽`), coefficient base change and the eigenbasis transformation law, together with the Hodge-bound subfunctor `Y^{≤λ,τ}` and its minor criterion on `𝒪`-flat `p`-complete `R` (for `1 ≤ i ≤ n` the `i × i` minors of the Frobenius matrix are divisible by `(v+p)` to the sum of the `i` smallest entries of `λ_j`).
- §8.10: a crystalline lift in a Serre weight for reducible rank-two residual representations over `ℚ_p`.
- What LocalGaloisDeformationRings must provide (gap:ghls-existence): GHLS17 Theorem D (Theorem 3.1.5): for `K/ℚ_p` unramified, `p ≠ n` and `r̄ : G_K → GL_n(𝔽̄_p)` with a crystalline lift of some extended Fontaine–Laffaille weight `F`, if `F` is a Jordan–Hölder factor of `σ(λ,τ)` then `r̄` has a potentially crystalline lift of type `(λ,τ)`; together with the crystalline extended-Fontaine–Laffaille lift of `ρ̄` in every 3-deep weight of `W(ρ̄)` for semisimple rank-two `ρ̄`, and the dictionary translating GHLS17's `HT(ε) = −1`, dual Galois representations and highest weights to `HT(ε) = +1`, so that the criterion becomes BHHMS23 equation (26), p. 32.

### From TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields

- §3.1: regular weights `F(λ)`, depth and the central twist. §3.2: the translation map `t_λ(ω)`, the domain `Λ_W^λ`, `Σ` and adjacency. §3.4: the mod-`p` tame parameter `τ(s,ν)` and `W(ρ̄) = {F(t_{μ−η}(sω)) : ω ∈ Σ}` for tame `ρ̄` with `ρ̄|_{I_K} ≅ τ(s,μ)` and `μ − η` 1-deep. §5.5: `A_i ⊗ F(λ)` for 2-deep `λ` and the `2^f` pairwise distinct constituents of `P̃_σ[1/p]` for 3-deep `σ`.
- What ModpRepresentationsOfGL2OverLocalFields must provide (gap:deligne-lusztig-reduction): for `ν ∈ η + Λ_R` and `μ − sw^{−1}ν − η` 1-deep, the Jordan–Hölder constituents of the reduction of the Deligne–Lusztig representation `R_{sw^{−1}}(μ − sw^{−1}ν)` of `GL₂(𝔽_q)` are the weights `F(t_{μ−η}(sw^{−1}(ω − ν̄)))` for `ω ∈ Σ`, each with multiplicity one, in the translation coordinates of §3.2 (BHHMS23, Proposition 2.4.3, p. 16).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

- §1.8 (truncations and complete towers), §1.9 (the relative cotangent space `𝔪_B/(𝔪_B² + 𝔪_A B)` and `seriesPresentation_surjective`), §1.12 (the complete-local tensor product and its joint presentation `Λ⟦X⟧/I ⊗̂ Λ⟦Y⟧/J ≅ Λ⟦X,Y⟧/(I,J)`), §1.13 (`flatCompletion_finiteComparison`), §1.14 (the quotient-completion comparison `Â/JÂ ≅ (A/J)^`), §4.6 (pointed tensor domains; component products under geometric integrality), §4.7 (valued points detect reduced `𝒪`-flat quotients), §6.8 (square-free monomial component comparison: radicality and coordinate minimal primes).
- What DeformationAndDerivedPatchingAlgebra must provide (gap:power-invariance): Hamann's theorem that a quasi-local ring `A` is power-invariant (`A⟦X⟧ ≅ B⟦X⟧` implies `A ≅ B`; Hamann75, Theorem 4, pp. 155–156) and its iteration to `n` variables on both sides (Theorem 8, p. 158), and, for complete local `𝔽`-algebras with residue field `𝔽`, the coefficient-field correction making the resulting isomorphism `𝔽`-linear.

### From TauCetiRoadmap.PurityForFlatCohomology

- §7.4: a regular local ring is a unique factorization domain (Auslander–Buchsbaum). Used in 5.3 for `𝒪⟦x₁,…,x_n⟧`.

## How to read the build

Layers 0–3, except 0.5, work in every rank `n`; 0.5 and Layers 4–7 work in rank two. Layer 0 builds characteristic-zero tame types, their genericity and orientation, and their Jordan–Hölder labels. Layer 1 writes Kisin modules with descent in eigenbasis and gauge coordinates. Layer 2 turns monodromy into finitely many polynomial jet equations with controlled remainders. Layer 3 classifies semisimple residual representations by monomial étale `φ`-modules and their contravariant realization, identifies tame quotients along the Kummer tower, proves cyclotomic freeness of `ad(ρ̄)` and descent of isomorphisms from `G_{K∞}` to `G_K`, and builds the framed deformation ring of `G_{K∞}`. Layer 4 selects the `3^f` admissible types and their residual Kisin modules and matches extreme shapes with Serre weights. Layer 5 writes the three explicit charts, proves their Jacobian bound and the effective approximation, and builds the ambient automorphism `ψ` identifying the polynomial model with the actual chart. Layer 6 gives the single-type presentation, its components and its special fibres. Layer 7 places the `2^f` types of a Serre weight in one common chart and proves the multiple-type presentation and the membership of `p`.

## Layer 0: Tame types and their weight labels

The integral models need actual characteristic-zero inertial types; their component labels are mod-`p` weights. This layer builds the Teichmüller sum, its orientation and genericity, and the comparison of the type reduction with the weight coordinates of `ModpRepresentationsOfGL2OverLocalFields` §§3.1–3.4.

### 0.1 Tame inertial types

For `s ∈ S_n^f` and `μ ∈ (ℤⁿ)^f` put `s_τ = s₀ s_{f−1} ⋯ s₁`, `r = ord(s_τ)`, `f′ = rf` and `e′ = p^{f′} − 1`. Put `α′_j = (s₁^{−1} ⋯ s_j^{−1})(μ_j + η)`, with `α′_{j+kf} = s_τ^{−k} α′_j`, and `a′^(j) = Σ_{i=0}^{f′−1} p^i α′_{−j+i} ∈ ℤⁿ`. Define the **tame inertial type** `τ(s, μ+η)` as the direct sum of the `n` Teichmüller lifts `ω̃_{f′}^{a′^(0)_i}`, `1 ≤ i ≤ n`, a representation of `I_K` with open kernel; Frobenius permutes the `n` characters, so the sum extends to `W_K` (BHHMS23, Definition 2.3.1 and equations (11)–(12), p. 14). Its reduction modulo `ϖ` is the residual parameter, also written `τ(s, μ+η)`, used in 0.2 and Layer 3; for `n = 2` it is the mod-`p` parameter of `ModpRepresentationsOfGL2OverLocalFields` §3.4, and this is a refinement of that parameter, not a second definition. *Needs:* `PadicLocalLanglandsForGL2Qp` §0.3 (fundamental characters, Teichmüller lifts); `LocalFieldsRamification` Layer 4; `LocalGaloisDeformationRings` §3.1 (Galois types); `ModpRepresentationsOfGL2OverLocalFields` §3.4 (for `n = 2`); gap:fundamental-character-artin.

- The tame type is a Galois type of rank `n` in the sense of `LocalGaloisDeformationRings` §3.1: an inertia representation with open kernel extending to the Weil group.
- For `n = 2` its reduction modulo `ϖ` is isomorphic, as an inertia representation, to the parameter `τ(s, μ+η)` of `ModpRepresentationsOfGL2OverLocalFields` §3.4.
- Adding `(b_j, …, b_j)` to every `μ_j` twists every character by the tame character `ω̃_f^{Σ_j b_j p^j}`; the Weyl data `s` are unchanged.

**Checks.**

- For `f = 1` and `s = 1` the characters are `ω̃₁^{μ₁+1}` and `ω̃₁^{μ₂}`; a definition dropping `η` gives `ω̃₁^{μ₁}` and fails.
- For `f = 1` and `s = w` one has `f′ = 2`, `α′₀ = (μ₁+1, μ₂)`, `α′₁ = (μ₂, μ₁+1)`, and the exponents are `μ₁ + 1 + pμ₂` and `μ₂ + p(μ₁+1)`, interchanged by multiplication by `p` modulo `p² − 1`.
- For `f = 1`, `p = 7`, `s = 1`, `μ = (0,0)` the reduction is `ω₁ ⊕ 1`. Using the arithmetic Artin normalization without inversion would give `ω₁^{−1} ⊕ 1`, a different multiset since `ω₁` has order 6.
- For `n = 3`, `f = 1`, `s = (1 2 3)` and `μ = 0`: `η = (2,1,0)`, `r = 3`, `f′ = 3`, `α′₁ = s^{−1}·η = (1,0,2)`, `α′₂ = (0,2,1)`, and the exponents are `2 + p`, `1 + 2p²`, `2p + p²`, permuted cyclically by multiplication by `p` modulo `p³ − 1` (at `p = 5`: `7, 51, 35`). The other action `(s·x)_i = x_{s(i)}` gives `2 + p²`, `1 + 2p`, `p + 2p²` (at `p = 5`: `27, 11, 55`), the type of `s^{−1}`.

### 0.2 Generic tame types

A tame type `τ` is **`N`-generic** if `τ ≅ τ(s, λ+η)` for some `s` and some `λ` that is `N`-deep; a **lowest-alcove presentation** is a pair `(s, μ)` with `μ` 0-deep and `τ ≅ τ(s, μ+η)` (BHHMS23, Definition 2.3.3, pp. 14–15). A continuous `ρ̄ : G_K → GL_n(𝔽)` is `N`-generic if `(ρ̄^ss)|_{I_K} ≅ τ(s, μ)` for some `s` and some `μ` with `μ − η` `N`-deep (BHHMS23, Definition 2.3.4, p. 15). The shift by `η` sits in the type input and not in the residual input, so both conditions are depth of the same alcove coordinate. Residual genericity is a condition on semisimplified inertia and does not assert that `ρ̄` is semisimple. *Needs:* 0.1; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.4 (for `n = 2`).

- Type genericity is the existence of an `N`-deep presentation, with the `η` shift.
- Residual genericity is invariant under isomorphism and under semisimplification.
- `N`-generic implies `M`-generic for `0 ≤ M ≤ N`; no converse.

**Checks.**

- A presentation with `μ₁ − μ₂ + 1 = N` is not `N`-deep; one with `μ₁ − μ₂ + 1 = N + 1 < p − N` is.
- For `n = 2`, at `N = 12` an integer `d` with `12 < d < p − 12` exists only for `p ≥ 26`, hence `p ≥ 29`; for `p = 23` the range `12 < d < 11` is empty.
- A nonsplit extension of two characters and their direct sum have the same residual genericity; only the direct sum satisfies the semisimplicity hypothesis of Layer 4.

### 0.3 Orientation of a tame type

For a fixed lowest-alcove presentation `(s, μ)` define the **orientation** `s′_{or,j′} = s₁^{−1} s₂^{−1} ⋯ s_{f′−1−j′}^{−1} ∈ S_n`, indices on `s` modulo `f` and the empty product equal to `1`; then `s′_{or,j′+kf} = s_τ^k s′_{or,j′}` (BHHMS23, §2.3, p. 15). Prove that when `μ` is 0-deep, `s′_{or,j′}` is the unique element with `(s′_{or,j′})^{−1} a′^(j′)` dominant, and that `(s′_{or,−j′})^{−1} α′_{j′} = s_{j′}^{−1}(μ_{j′} + η)` (BHHMS23, Remark 2.3.6 and equation (13), p. 15). *Needs:* 0.1, 0.2.

- The orientation is the stated partial product, with upper endpoint `f′ − 1 − j′`.
- Its inverse orders `a′^(j′)` decreasingly, uniquely under the strict alcove inequalities.
- The relation with `α′` and index `−j′` used for the diagonal of the monodromy term.

**Checks.**

- At `j′ = f′ − 1` the product is empty and the orientation is `1`.
- For `f = 1`, `s = w`: `f′ = 2`, and the orientations at `j′ = 0, 1` are `w` and `1`. The formula with upper endpoint `j′` instead of `f′ − 1 − j′` gives `1` and `w`, and fails.
- For `f = 1`, `p = 5`, `s = w`, `μ = (1,0)`: `α′₀ = (2,0)`, `α′₁ = (0,2)`, `a′^(0) = (2,10)`, `a′^(1) = (10,2)`, and the orientations are `w`, `1`. Ordering `α′₀ = (2,0)` instead of `a′^(0)` would give `1` at index `0`.

### 0.4 Depth under change of presentation

Prove: if `τ` is `N`-generic with `N ≥ 1`, every lowest-alcove presentation of `τ` is `(N−1)`-deep (LLHL19, Proposition 2.2.15, p. 14; BHHMS23, Remark 2.3.5, p. 15). The same one-unit loss lets a 13-generic semisimple `ρ̄ : G_K → GL₂(𝔽)` be put in the normalized 12-deep form of the Conventions (BHHMS23, §4.1, pp. 24–25). Route: two lowest-alcove presentations differ by an element `t_ν σ` of the extended affine Weyl group that stabilizes the lowest alcove, and `|⟨ν, α^∨⟩| ≤ 1` for every root `α`; the new weight is the image of the old one under `t_ν σ` up to a correction pairing to at most one with every coroot, so each root coordinate loses at most one unit of depth. *Needs:* 0.2; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.2 (for `n = 2`).

**Checks.**

- At `N = 1` the conclusion is 0-depth, which is the definition of a lowest-alcove presentation.
- A central shift `(c, …, c)` changes no root coordinate and no depth.
- Applied to `N = 13` it yields 12-deep presentations, exactly the normalized hypothesis; it does not yield 12-deep data from a 12-generic `ρ̄`.

### 0.5 Weights of a tame type

Here `n = 2`. Let `τ = τ(sw^{−1}, μ − sw^{−1}ν)` with `ν ∈ η + Λ_R`, and assume `μ − sw^{−1}ν − η` is 1-deep. Prove `JH(σ̄(τ)) = {F(t_{μ−η}(sw^{−1}(ω − ν̄))) : ω ∈ Σ}`, with `Σ = {0,η}^f` and `t_{μ−η}` the translation map of `ModpRepresentationsOfGL2OverLocalFields` §3.2 (BHHMS23, Proposition 2.4.3, p. 16; Remark 2.4.5(iv), p. 17). Reduction is semisimplified, so the set is independent of the lattice. Route: identify `σ(τ)` with the inflated Deligne–Lusztig representation (gap:tame-types-unramified), then apply the finite-group reduction formula (gap:deligne-lusztig-reduction); check the `η` shift and the determinant twist before labelling components. *Needs:* 0.1, 0.2; `PadicLocalLanglandsForGL2Qp` §4.4 with gap:tame-types-unramified; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.2 with gap:deligne-lusztig-reduction.

**Checks.**

- For `f = 1` the two constituents are `F(t_{μ−η}(−sw^{−1}ν̄))` and `F(t_{μ−η}(sw^{−1}(η − ν̄)))`, with their determinant exponents. For a principal series type the count `2 = 2^f` is that of the reduction of `Ind_B^{GL₂(𝔽_p)}` of a regular character, whose constituents `Sym^r ⊗ det^b` and `Sym^{p−1−r} ⊗ det^{r+b}` have dimensions adding to `p + 1`; a formula with one constituent fails the dimension count.
- For a scalar inertial type `χ ⊕ χ` the 1-deep hypothesis fails (the root coordinates of any lowest-alcove presentation equal `p − 1`) and the formula is not asserted. `PadicLocalLanglandsForGL2Qp` §4.4 has two types there, the Steinberg twist `σ(τ)` and `σ^cr(τ) = χ ∘ det`; the normalization of BHHMS23 §2.2 (p. 13), used here, is the second, whose reduction is one character of `GL₂(𝔽_q)`.
- Twisting `τ` by `ω̃_f^c` twists every constituent by `(σ₀ ∘ det)^c`: adding `(b_j, b_j)` to every `μ_j`, with `c = Σ_j b_j p^j`, multiplies `τ` by `ω̃_f^c` (0.1) and tensors every `F(λ)` with `∏_j (σ_j ∘ det)^{b_j} = (σ₀ ∘ det)^c`. The norm twist `N_{k/𝔽_p} ∘ det = (σ₀ ∘ det)^{(q−1)/(p−1)}` is the case `b_j = 1` for all `j`. For `f = 2` and `c = 1` the twists `(σ₀ ∘ det)^1` and `(σ₀ ∘ det)^{1+p}` differ, since `σ₀ ∘ det` has order `q − 1`, which does not divide `p`; for `f = 1` they agree.

### Examples

- `f = 1`, `p = 5`, `s = w`, `μ = (1,0)`: the type is the sum of `ω̃₂^2` and `ω̃₂^{10}`, of niveau two, with orientations `w, 1` (0.1, 0.3).
- `f = 1`, `p = 29`, normalized `μ = (r+2, 1)` with `r + 1 = 13`: the presentation is exactly 12-deep (0.2).

### Dependencies

`PadicLocalLanglandsForGL2Qp` §§0.3, 4.4; `LocalFieldsRamification` Layer 4; `ClassFieldTheory` Layer 7; `LocalGaloisDeformationRings` §3.1; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.2, 3.4; gaps fundamental-character-artin, tame-types-unramified, deligne-lusztig-reduction.

## Layer 1: Kisin gauge charts

The category of Kisin modules with descent and its coefficient base change are imported (gap:descent-kisin-modules). This layer owns the coordinate descriptions on that category, in every rank `n`: normalized Frobenius matrices, shapes, gauge bases and their existence.

### 1.1 Eigenbasis Frobenius matrices

Let `R` be a complete Noetherian local `𝒪`-algebra with residue field `𝔽` and `𝔐 ∈ Y^{[0,h],τ}(R)` of rank `n` with an eigenbasis `β` for a fixed 1-deep lowest-alcove presentation `(s, μ)`. Decompose `𝔖_{L′,R} = (W(k′) ⊗_{ℤ_p} R)⟦u′⟧` along `σ_{−j′}`, so that `φ` sends `𝔐^(j′)` to `𝔐^(j′+1)`. Define `C^(j′)` by `β^(j′+1) C^(j′) = φ_𝔐(φ*β^(j′))` and the **normalized Frobenius matrix** `A^(j′) = Ad((ṡ′_{or,j′+1})^{−1} (u′)^{−a′^(j′+1)})(C^(j′))`, where `Ad(g)(C) = g C g^{−1}`; the order of the two conjugating factors is part of the definition (BHHMS23, Definition 3.1.1 and Remarks 3.1.2–3.1.3, pp. 18–19). Prove that `A^(j′) ∈ M_n(R⟦v⟧)`, that it is upper triangular modulo `v`, that it depends only on `j′` modulo `f`, and that on `𝒪`-flat `p`-complete `R` the Hodge bound `𝔐 ∈ Y^{≤λ,τ}(R)` holds exactly when, for `1 ≤ i ≤ n`, the `i × i` minors of `A^(j)` are divisible by `(v+p)` to the sum of the `i` smallest entries of `λ_j` (BHHMS23, p. 19). *Needs:* 0.1, 0.3; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.2, R07.4.36.

- `C^(j′)` is characterized by the semilinear identity above.
- `A^(j′)` is obtained from `C^(j′)` by the ordered conjugation.
- `A^(j′)` is `f`-periodic and agrees with the imported Frobenius after the eigencharacter conjugation.
- The minor criterion characterizes the imported Hodge bound on `𝒪`-flat `p`-complete coefficients.

**Checks.**

- For `f = f′ = 3`, the summand `j′ = 1` uses `σ₂ = σ_{−1}`, and `φ` carries it to summand 2. Indexing by `σ_{j′}` would use `σ₁` and reverse the cyclic transition; degree 2 cannot detect the sign, since `σ₁ = σ_{−1}` there.
- Over `ℚ` put `P = [[0,1],[1,0]]`, `D = diag(1,2)` and `C = [[0,1],[0,0]]`: then `Ad(P^{−1}D)(C) = [[0,0],[1/2,0]]` while `Ad(DP^{−1})(C) = [[0,0],[2,0]]`. The off-diagonal entry detects the order of conjugation; a diagonal `C` would not.
- For `λ_j = (2,1)` every entry of `A^(j)` is divisible by `v + p` and `det A^(j)` by `(v+p)³`; for `λ_j = (3,0)` only `det A^(j)` is constrained, by `(v+p)³`.

### 1.2 Shape of a Kisin module

Let `I ⊂ GL_n(𝔽⟦v⟧)` be the Iwahori subgroup of matrices upper triangular modulo `v`. A residual `𝔐 ∈ Y^{[0,h],τ}(𝔽)` has **shape** `w̃ = (w_j t^{ν_j})_j` if `I A^(j) I = I ẇ_j v^{ν_j} I` in `GL_n(𝔽((v)))` for every `j`, where `v^ν = diag(v^{ν_1}, …, v^{ν_n})` (BHHMS23, Definition 3.1.4, p. 19). Prove the shape is independent of the eigenbasis for a fixed presentation of `τ`: a change of eigenbasis multiplies `A^(j)` on both sides by elements of `I`. *Needs:* 1.1; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules.

For `n = 3` and a lowest-alcove presentation `(s, μ)` of `τ` with `μ` 1-deep, prove that the normalized Frobenius matrix and the shape are those of `LocalGaloisDeformationRings` §6.9: `(s, μ)` is a lowest-alcove presentation of `τ` there, with the same entries and the same ordering of the characters of `τ`; an eigenbasis for it here is an eigenbasis there; for every `j` the matrix `A^(j)` of 1.1 is §6.9's Frobenius matrix at the same index `j`; and a residual module has shape `w̃` here exactly when it has shape `w̃` there, where for a type that is not principal series §6.9 reads the shape after base change to `K′` (LLHL19, Definition 3.2.11, p. 21). No index is relabelled. The formula of 0.1 is that of LLHL19 (Definition 2.2.1 and equation (3.1), pp. 10 and 18), which reads the index `j` of `(s, μ)` as the embedding `σ₀ ∘ Frob_p^{−j}` instead of `σ_j`; this reading is the incompatibility recorded in BHHMS23, Remark 2.3.2 (p. 14), and it changes neither the characters, nor their order, nor the Kisin summands, which both sides take along `σ_{−j′}` (BHHMS23, §3.1.1, p. 18; LLHLM18, pp. 10–11). Route: §6.9's Frobenius matrix is the matrix of the partial Frobenius on the shifted isotypic bases (LLHLM18, Definition 2.11 and Proposition 2.13, p. 14), which conjugates `C^(j′)` first by `ṡ^{−1}` and then by `diag((u′)^{−a_{s(1)}}, …, (u′)^{−a_{s(n)}})`, with `a = a′^(j′+1)` and `s` the orientation at `j′ + 1` (LLHLM18, Definition 2.6, p. 12), which is `s′_{or,j′+1}` (LLHL19, proof of Proposition 3.2.9, p. 21); since `diag(x_{s(1)}, …, x_{s(n)}) ṡ^{−1} = ṡ^{−1} diag(x)`, this is the conjugation of 1.1. *Needs:* 1.1; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules.

- Shape is membership in the stated Iwahori double coset at every embedding.
- Every eigenbasis gives the same shape when the presentation of `τ` is fixed.
- `A^(j) = D_j w̃_j` with `D_j` diagonal over `𝔽^×` has shape `w̃_j`.
- For `n = 3` the matrices `A^(j)` and the shape are §6.9's at the same index `j`, for the same presentation and eigenbasis.

**Checks.**

- `diag(v², v)` has shape `t^(2,1)`.
- `[[0, v], [v², 0]] = w · diag(v², v)` has shape `w t^(2,1)`, and neither `t^(2,1)` nor `t^(1,2)`.
- Multiplying by an element of `I` on either side preserves the shape, whereas swapping the two diagonal powers, `diag(v, v²)`, gives the other extreme shape `t^(1,2)`.
- For `n = 3`, `f = 3`, `s = (1, 1, 1)` and the residual module in `Y^{[0,2],τ}(𝔽)` whose matrices in an eigenbasis are `A^(0) = diag(v², v, 1)`, `A^(1) = diag(v, 1, 1)` and `A^(2) = 1`, the shape is `(t^(2,1,0), t^(1,0,0), 1)` here and in §6.9. Reading §6.9's index `j` as `−j`, as the change of embedding labels might suggest, gives `(t^(2,1,0), 1, t^(1,0,0))`, and the reversed index `f − 1 − j` of the star operation gives `(1, t^(1,0,0), t^(2,1,0))`; neither is the shape. At `f = 2` the first misreading is invisible, since `−1 ≡ 1` modulo 2.

### 1.3 Gauge basis

Fix a residual module `𝔐̄ ∈ Y^{[0,h],τ}(𝔽)` with a **residual gauge basis** `β̄`, that is, an eigenbasis of `𝔐̄` whose matrices `A^(j)` satisfy over `𝔽` the two conditions below (BHHMS23, §3.1.1, p. 19, after LLHL19, Definition 3.2.23, p. 26), and let `w̃_j = w_j t^{ν_j}` be its shape. For a lift `𝔐` over `R` with `𝔐 ⊗_R 𝔽 ≅ 𝔐̄`, a **gauge basis** is an eigenbasis `β` lifting `β̄` such that, for `1 ≤ i, k ≤ n`, `A^(j)_{ik} ∈ v^{[i>k]} R[v+p]` and `deg_v A^(j)_{ik} ≤ ν_{j,k} − [i < w_j(k)]`, with equality when `i = w_j(k)` (BHHMS23, Definition 3.1.6 and Proposition 3.1.5(i)–(ii), pp. 19–20). A negative bound forces the entry to vanish; the leading coefficients in the equality positions are units by the residual shape. *Needs:* 1.1, 1.2.

- The gauge predicate is the stated polynomial, degree and reduction conditions.
- Each entry satisfies its degree bound, and each pivot attains it with unit leading coefficient.
- An `f`-periodic diagonal matrix reducing to `1` preserves the gauge predicate and the residual basis.

**Checks.**

- An eigenbasis of `𝔐̄` need not be a residual gauge basis. For `f ≥ 2` and `𝔐̄` with `A^(j) = D_j diag(v², v)`, replacing the first vector of `β̄` at the summands `≡ j + 1` modulo `f` by `(1 + v)` times itself gives an eigenbasis (`v = (u′)^{e′}` is invariant under the descent group) in which `A^(j)` acquires the factor `diag((1+v)^{−1}, 1)` or `diag(1, (1+v)^{−1})` on the left, after the conjugation of 1.1; the resulting entry `v²(1+v)^{−1}` or `v(1+v)^{−1}` is not a polynomial. So this eigenbasis is not gauge, and already over `R = 𝔽` no gauge basis lifts it: the hypothesis on `β̄` is needed.
- The lower-left entry of a gauge matrix is divisible by `v`, even where a polynomial of the same degree without that factor would give the same determinant.
- For `t^(2,1)` the pivot degrees are `2` and `1` and the upper-right entry has degree `≤ 0`; for `w t^(2,1)` the pivots are the off-diagonal entries, of degrees `1` (upper right) and `2` (lower left, including the factor `v`).
- A nontrivial `f`-periodic diagonal element of `ker(T(R) → T(𝔽))` gives a second gauge basis; literal uniqueness fails.

### 1.4 Existence of gauge bases

Prove: if `τ` is `(h+1)`-generic and `𝔐 ∈ Y^{[0,h],τ}(R)` reduces to the fixed residual module, a gauge basis lifting the residual gauge basis `β̄` of 1.3 exists, and two gauge bases differ by a unique `f`-periodic tuple in `ker(T(R) → T(𝔽))` (BHHMS23, Proposition 3.1.5, p. 19). Route: use the eigenbasis-change formula and the height bound to remove coefficients above the allowed degrees along the `𝔪_R`-adic filtration; the `(h+1)`-generic inequalities make the off-diagonal corrections contracting, and completeness gives the limit; the same estimates on the ratio of two gauge bases kill everything but residual-trivial diagonal scalings. *Needs:* 1.3, 0.2; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules; `DeformationAndDerivedPatchingAlgebra` §1.8.

**Checks.**

- At `h = 3` the hypothesis is 4-generic; the `(N−1)`-deep types of Layer 4, with `N ≥ 12`, satisfy it.
- Over `R = 𝔽` with a fixed residual gauge basis the ambiguity group is trivial; the residual gauge bases of `𝔐̄` themselves form a torsor under the periodic diagonal torus `T(𝔽)^f` (BHHMS23, §3.1.1, p. 19), whereas arbitrary eigenbases differ by Iwahori elements (1.2).
- Over `R = 𝔽[ε]/ε²` the ambiguity group is `(1 + ε𝔽)ⁿ` at each embedding, of `𝔽`-dimension `nf`; for `n = 2` this is the source of the `2f` smooth variables of 5.7.

### Examples

- `f = 1`, residual `A = diag(e, d) · diag(v², v)` with `e, d ∈ 𝔽^×`: the gauge lifts are `[[z²e* + z d₁₁ + c₁₁, c₁₂], [v(z d₂₁ + c₂₁), z d₂₂* + c₂₂]]` with `z = v + p`, eight parameters (1.3).

### Dependencies

Layer 0; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.2, R07.4.36; `DeformationAndDerivedPatchingAlgebra` §1.8.

## Layer 2: Monodromy and its finite jets

Monodromy is an analytic condition. Its Frobenius recursion produces one specific series; the finite-jet form retains the remainder of that series. At `h = 3` the value and derivative equations carry different `p`-adic accuracies, and the remainders are never replaced by unrelated small perturbations.

### 2.1 Monodromy derivation

Let `R` be an `𝒪`-flat complete Noetherian local `𝒪`-algebra with residue field `𝔽` (for instance `𝒪⟦x₁,…,x_k⟧`, the chart rings of Layer 5 and their quotients, or the ring of integers of a finite extension of `E` with residue field `𝔽`), `𝒪^rig_R = lim_n R⟦u′, (u′)^n/p⟧[1/p]`, `λ = ∏_{n≥0} φ^n(E(u′)/p)` and `N_∇ = −u′λ d/du′`. For `𝔐 ∈ Y^{[0,h],τ}(R)` and `𝔐^rig = 𝔐 ⊗ 𝒪^rig_R`, prove that `𝔐^rig[1/λ]` carries a unique **monodromy derivation** `N_𝔐` over `N_∇` with `N_𝔐 φ_𝔐 = E(u′) φ_𝔐 N_𝔐` and `N_𝔐 ≡ 0` modulo `u′` (BHHMS23, Proposition 3.1.7, p. 20, after Kisin06, Corollary 1.3.15). It decomposes along the embeddings; write `N^(j′)_{𝔐,β}` for its matrix in an eigenbasis `β`. BHHMS23 §3.1.2 states this for `p`-adically complete `𝒪`-flat `𝒪`-algebras topologically of finite type and applies it to complete local rings in the proof of Proposition 4.2.1 (pp. 28–29); the statement here is for the complete local rings, on which `Y^{[0,h],τ}(R)` and its eigenbases are defined (gap:descent-kisin-modules). Route: iterate the Frobenius equation from the derivative of `C`; the growing Frobenius powers of `u′` make the series converge after inverting `λ`; a difference of two solutions satisfies a contracting homogeneous equation with zero constant term. *Needs:* 1.1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.1, R07.4.6 with gap:relative-monodromy-criterion; `LocalGaloisDeformationRings` §6.9 with gap:descent-kisin-modules.

- `N_𝔐` is the unique derivation with the two normalizations.
- Leibniz rule: `N_𝔐(am) = N_∇(a)m + a N_𝔐(m)`.
- Frobenius rule with the factor `E`: `N_𝔐 φ_𝔐 = E φ_𝔐 N_𝔐`.
- A change of basis `B` sends the matrix `N` to `B^{−1} N B + B^{−1} N_∇(B)`.

**Checks.**

- For a rank-one summand with `φ(e) = e`, `N_𝔐(e) = 0` and `N_𝔐(ae) = N_∇(a)e`.
- For the trivial rank-one module (`φ(e) = e`, `N_𝔐(e) = 0`), apply the Frobenius rule to `u′e`: the left side is `N_∇((u′)^p)e = −p(u′)^p λ e` and the right side is `E φ(N_∇(u′)) e = −E (u′)^p φ(λ) e`; they agree because `λ = (E/p) φ(λ)`. Omitting `E` would give `−(u′)^p φ(λ) e`, which differs.
- For `N_𝔐(e) = 0` and the analytic unit `B = 1 + u′`, the basis `eB` has monodromy coefficient `B^{−1}N_∇(B) = −u′λ/(1+u′)`; conjugating the zero matrix alone would give zero.

### 2.2 Monodromy condition

For `h ≥ 1`, `𝔐` satisfies the **monodromy condition** if `λ^{h−1} N^(j′)_{𝔐,β}` vanishes to order at least `h − 1` at `u′ = (−p)^{1/e′}` for every `j′` (BHHMS23, Definition 3.1.8, p. 20). Prove that this is equivalent to `N_𝔐(𝔐^rig) ⊆ 𝔐^rig`, hence independent of `β`, and that it depends only on `j′` modulo `f` (BHHMS23, p. 20, after LLHLM18, Proposition 5.3, p. 47, and Theorem 6.14, p. 63). Under gap:relative-monodromy-criterion this is the condition cutting out potentially crystalline lifts in the tame-type charts; it does not replace a general potentially semistable condition by `N = 0`. *Needs:* 2.1; gap:relative-monodromy-criterion.

- The condition is order-`(h−1)` vanishing at the root of `E`.
- It holds exactly when `N_𝔐` preserves `𝔐^rig`.
- It suffices to test `j′` modulo `f`.

**Checks.**

- At `h = 1` the order-zero vanishing condition is empty: every module satisfies it.
- At `h = 3` both the value and the first derivative must vanish; a function with a simple zero passes the value test alone.
- An integral change of eigenbasis `B` preserves the condition despite the extra term `B^{−1}N_∇(B)`: `λ^{h−1} B^{−1}N_∇(B) = −u′ λ^h B^{−1} dB/du′` vanishes to order at least `h` at the root of `E`, because `E(u′)/p` is the factor `n = 0` of `λ`, and conjugation by the invertible `B` does not change vanishing orders.

### 2.3 Explicit monodromy equations

Write `D_j = Diag((s′_{or,j})^{−1} a′^(j))` and `P_N(A^(j−1)) = (−e′ v dA^(j−1)/dv − [D_j, A^(j−1)]) (v+p)^h (A^(j−1))^{−1}`, with `[D,A] = DA − AD`. Prove that the monodromy condition is equivalent to the vanishing, for `t = 0, …, h−2`, of the `t`-th `u′`-derivatives at `u′ = (−p)^{1/e′}` of `Ad((ṡ′_{or,j′})^{−1}(u′)^{−a′^(j′)})(λ^{h−1} N^(j′)_{𝔐,β})`; and that if `τ` is `L`-generic with `L ≥ 2h − 3` and `(L−1)(p−1) ≥ h`, these equations take the form `(d/dv)^t P_N(A^(j−1))|_{v=−p} + ε_{j,t} = 0` with specific elements `ε_{j,t} ∈ p^{L−(h−1)−t} M_n(R)` (BHHMS23, equation (16) and Proposition 3.1.9, pp. 20–21, where `M₂(R)` is printed in a rank-`n` statement). The remainders come from the Frobenius series of 2.1 and may involve every embedding; they are not independent perturbations. For the types of Layer 4, `L = N − 1` and `h = 3` give remainders in `p^{N−3−t}`. Route: the first term of the Frobenius series gives `P_N`, the rest gains powers of `v` from the genericity inequalities; each derivative loses at most one power of `p`; `u′` is invertible in `(R[u′]/E(u′))[1/p]`. *Needs:* 2.1, 2.2, 0.3, 0.2; Mathlib `Polynomial.derivative`.

**Checks.**

- For `h = 3` and `N = 12` the value and derivative remainders lie in `p⁹` and `p⁸`.
- The commutator is `DA − AD` and the index is `j − 1`. For diagonal `D = diag(D₁, D₂)` the entries of `[D, A]` are `(D_i − D_k)A_{ik}`: zero on the diagonal and nonzero off it when `D₁ ≠ D₂`. The opposite commutator `AD − DA` negates the off-diagonal entries, so the two conventions give the same `P_N` only for diagonal `A`.
- At `h = 2` there is one jet (`t = 0`) and the hypotheses read `L ≥ 1`, `(L−1)(p−1) ≥ 2`.

### Examples

- Rank one, `φ(e) = E(u′)e`: `N_𝔐` is computed by the series of 2.1 and the monodromy condition is empty at height `h = 1` (2.2).

### Dependencies

Layers 0–1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.1, R07.4.6 with gap:relative-monodromy-criterion; Mathlib `Polynomial.derivative`.

## Layer 3: Residual representations and restriction

The normalized residual modules are built from monomial Frobenius matrices. Their classification with fixed tame inertia uses a primitivity condition. Restriction to `G_{K∞}` is treated twice: full faithfulness on `Hom` needs a cyclotomic-free tensor, while 2-genericity yields a bijection on isomorphisms. The layer ends with the framed deformation ring of `G_{K∞}`, which fails Mazur's finiteness condition and is used in Layer 7.

### 3.1 Good tame presentations

For `(s, μ) ∈ S_n^f × (ℤⁿ)^f` let `d(i)` be the length of the orbit of `i ∈ {1, …, n}` under `s_τ`. The pair is **good** if, for each `i` and each proper divisor `d` of `d(i)`, the integer `Σ_{j=0}^{f d(i) − 1} p^j (s₁^{−1} ⋯ s_j^{−1} μ_j)_i` is not divisible by `(q^{d(i)} − 1)/(q^d − 1)` (BHHMS23, Definition 3.2.1 and Remark 3.2.2, p. 22). No `η` is inserted. A singleton orbit imposes no condition; in rank two a two-cycle requires non-divisibility by `q + 1`. *Needs:* 0.1; `LocalFieldsRamification` Layer 4.

- Goodness is the orbit-sum non-divisibility test.
- If `s_τ = 1` every pair is good.
- For `n = 2` and `s_τ = w` the pair is good exactly when the two-cycle exponent is not divisible by `q + 1`.

**Checks.**

- For `f = 1`, `s = 1`, every pair of integers is good.
- For `f = 1`, `s = w`, `μ = (a, a)` gives exponent `(p+1)a`, divisible by `p + 1`: not good.
- For `f = 1`, `s = w`, `μ = (1, 0)` gives exponents `1` and `p`, neither divisible by `p + 1`: good, with a primitive niveau-two orbit.

### 3.2 Alcove presentations are good

Prove: if `μ − η ∈ C₀`, i.e. `0 < ⟨μ_j, α^∨⟩ < p` for every `j` and every positive root `α` (for `n = 2`: `0 < μ_{j,1} − μ_{j,2} < p`), then `(s, μ)` is good for every `s ∈ S_n^f` (BHHMS23, Lemma 3.2.3, p. 22). Route: fix `i` and put `c_k = (s_τ^{−k} ν)_i` with `ν = Σ_{j<f} p^j s₁^{−1} ⋯ s_j^{−1} μ_j`, so that the exponent is `y = Σ_{k<d(i)} q^k c_k`; each `c_k − c_ℓ` with `k ≢ ℓ` modulo `d(i)` has `p`-adic digits `±⟨μ_j, α^∨⟩` for positive roots `α`, all nonzero and of absolute value `< p`, so `0 < |c_k − c_ℓ| < q`. Divisibility of `y` by `(q^{d(i)} − 1)/(q^d − 1)` means `q^d y ≡ y` modulo `q^{d(i)} − 1`, and `q^d y − y ≡ Σ_{k<d(i)} q^k (c_{k−d} − c_k)` with indices of `c` modulo `d(i)`, whose digits are nonzero, of absolute value `< q`, and add up to `0`; this sum is nonzero modulo `q` and of absolute value `< q^{d(i)} − 1`, so it is not divisible by `q^{d(i)} − 1`. For a two-cycle this says `c₀ − c₁ ≢ 0` modulo `q + 1`. *Needs:* 3.1; `ModpRepresentationsOfGL2OverLocalFields` §3.1 (for `n = 2`).

**Checks.**

- `f = 1`, `p = 5`, `s = w`, `μ = (3, 1)`: the exponent is `3 + 5 = 8`, and `8 ≢ 0` modulo `6`.
- The wall `μ₁ − μ₂ = 0` gives `c₀ = c₁` and exponent `(q+1)c₀`: the hypothesis `μ − η ∈ C₀` is needed.
- `f = 2`, `p = 3`, digit differences `δ₀ = 2`, `δ₁ = −1`: `|δ₀ + 3δ₁| = 1`, nonzero and `< 9 = q`; the leading nonzero digit dominates.

### 3.3 Monomial étale φ-modules and their contravariant realization

For a tuple `w̃_j = w_j t^{ν_j}` and `D = (D_j) ∈ T(𝔽)^f`, define the **monomial étale `φ`-module** `𝓜(w̃, D)`: the free module of rank `n` over `k((v)) ⊗_{𝔽_p} 𝔽` whose semilinear Frobenius on component `j` has matrix `D_j w̃_j` in the standard basis (BHHMS23, Definition 3.2.4, p. 22, after LLHL19, Definition 3.1.1, p. 16). Here `k((v)) = 𝒪_ℰ/p` for the Kummer tower of `−p`, and `𝓜(w̃, D)` is an object of the étale `φ`-module category of `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.39 with coefficients `A = 𝔽`; each monomial matrix, a diagonal matrix with entries in `𝔽^× v^ℤ` times a permutation matrix, is invertible, so the linearized Frobenius is an isomorphism. For an étale `φ`-module `M` over `k((v)) ⊗_{𝔽_p} 𝔽` define its **contravariant realization** `V*_K(M) = Hom_{k((v)) ⊗ 𝔽, φ}(M, k((v))^sep ⊗_{𝔽_p} 𝔽)`, with `G_{K∞}` acting on `k((v))^sep = 𝒪̂_{ℰ^ur}/p` through the field-of-norms identification of §R07.4.5. Prove that `V*_K(M) ≅ T_𝔽(M^∨)`, where `M^∨` is the dual module with the dual Frobenius and `T_𝔽` the covariant functor of §R07.4.39; hence `V*_K` is an exact, rank-preserving anti-equivalence onto continuous `𝔽`-representations of `G_{K∞}`, compatible with tensor products (BHHMS23, §3.2, p. 22, after LLHL19, §3.1). Record the star operation of the Conventions on monomial tuples: it is an anti-isomorphism, not an index-preserving homomorphism. *Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.5, R07.4.39.

- The module carries the standard component bases with Frobenius matrices `D_j w̃_j`.
- It is the residual specialization of the imported coefficient category, with its semilinearity convention.
- A diagonal basis change `B_j` transforms the matrices into `B_{j+1}^{−1} D_j w̃_j φ(B_j)`.
- `V*_K(M) ≅ T_𝔽(M^∨)` naturally in `M`; `V*_K` reverses arrows and preserves ranks and tensor products.

**Checks.**

- For `w̃_j = 1` and `D_j = 1` the module is the sum of `n` trivial rank-one étale modules, and `V*_K` of it is the trivial `n`-dimensional representation.
- `diag(v^{−1}, 1)` is allowed over `k((v))`; a definition demanding polynomial entries rejects it.
- Variance: for `f = 1` and the rank-one module `M = (k((v)) ⊗ 𝔽) e` with `φ(e) = αe`, `α ∈ 𝔽^×`, `V*_K(M)` is spanned by `e ↦ c` with `φ(c) = αc`, and an arithmetic Frobenius lift acts on it by `α`; `T_𝔽(M)` is spanned by `b ⊗ e` with `αφ(b) = b`, on which the same element acts by `α^{−1}`. Using the covariant `T_𝔽` in place of `V*_K` would invert the unramified twist of 3.5.
- For `f = 2`, the star factor at index `0` uses the original index `1`, and the star of a product is the product of stars in reversed order.

### 3.4 Tame monomial representations

Prove first that restriction along `G_{K∞} ⊆ G_K` induces an isomorphism of tame quotients `G_{K∞}/(G_{K∞} ∩ P_K) ≅ G_K/P_K` that maps the image of `G_{K∞} ∩ I_K` onto `I_K/P_K`; in particular an arithmetic Frobenius lift can be chosen in `G_{K∞}`, a continuous representation of `G_K` that is trivial on `P_K` is determined up to isomorphism by its restriction to `G_{K∞}`, and `ρ^ss|_{G_{K∞}} ≅ (ρ|_{G_{K∞}})^ss` for every finite-dimensional continuous `𝔽`-representation `ρ` of `G_K` (BHHMS23, proof of Corollary 3.2.9, p. 24; LLHL19, §3.1). Route: each `K(p_n)/K` is totally ramified of degree `p^n` (the polynomial `x^{p^n} + p` is Eisenstein; `LocalFieldsRamification` Layer 3), so a finite subextension of `K∞ ∩ K^t`, with `K^t` the maximal tamely ramified extension, is totally ramified of `p`-power degree and tame, hence trivial; Galois theory then identifies the image of `G_{K∞}` in `Gal(K^t/K)` with all of it, with kernel `G_{K∞} ∩ P_K`, and the same argument over `K^ur` handles inertia; semisimplifications factor through `G_K/P_K` since `P_K` is pro-`p` and acts unipotently.

Then define `V(w̃, D)` as the unique tame continuous `𝔽`-representation of `G_K` whose restriction to `G_{K∞}` is `V*_K(𝓜(w̃, D))` (BHHMS23, Definition 3.2.5, p. 22). Uniqueness is up to the isomorphism fixed by the tame restriction equivalence. For arbitrary `w̃` no semisimplicity is claimed. Route: `V*_K(𝓜(w̃, D))` factors through the tame quotient of `G_{K∞}` (LLHL19, Proposition 3.1.2, p. 16), which the first part identifies with that of `G_K`. *Needs:* 3.3; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.39; `LocalFieldsRamification` Layers 3 and 4 (Eisenstein extensions are totally ramified; the maximal tamely ramified extension `K^t` with `P_K = Gal(K̄/K^t)`); `ModpRepresentationsOfGL2OverLocalFields` §3.4 (for `n = 2`); Mathlib `Field.absoluteGaloisGroup`.

- Restriction identifies the tame quotients of `G_{K∞}` and `G_K`, inertia included, and commutes with semisimplification.
- `V(w̃, D)` is the tame extension of `V*_K(𝓜(w̃, D))`.
- Its restriction to `G_{K∞}` is the contravariant realization of 3.3, for the tower of `−p`.
- If `w̃* = t^{μ′} s′`, its restriction to inertia is the residual parameter `τ(s′, μ′)` of 0.1 (LLHL19, Proposition 3.1.2); for `n = 2` this is the parameter of `ModpRepresentationsOfGL2OverLocalFields` §3.4.

**Checks.**

- `w̃ = 1`, `D = 1` gives the trivial `n`-dimensional representation.
- For `n = 2`, a primitive two-cycle gives an irreducible tame representation of niveau `2f`, not a sum of two characters of `G_K`.
- For a rank-one cycle with product `α` of the `D` entries, arithmetic Frobenius acts by `α`, not `α^{−1}`, in this contravariant convention.
- The total ramification of `p`-power degree is needed: the cyclotomic tower `K(μ_{p^∞})` contains the tame extension `K(μ_p) = K((−p)^{1/(p−1)})` of degree `p − 1`, so its Galois group maps onto a proper subgroup of `G_K/P_K`, missing the elements acting nontrivially on `μ_p`. For the Kummer tower, `[K(p₁) : K] = p` is prime to `p − 1`.

### 3.5 Unramified twists

Prove: for `λ = (λ_j) ∈ (𝔽^×)^f`, `V(w̃, λD) ≅ V(w̃, D) ⊗ nr(∏_j λ_j)` (BHHMS23, Lemma 3.2.6, p. 23). Route: tensor with the rank-one module with `φ_j = λ_j`; a diagonal basis change concentrates the scalars in one component; the contravariant realization gives arithmetic Frobenius `∏_j λ_j`, by the variance Check of 3.3. *Needs:* 3.3, 3.4; `LocalFieldsRamification` Layers 2 and 4 (arithmetic Frobenius on the unramified quotient, defining `nr`).

**Checks.**

- Scaling every component by the same `c` gives `nr(c^f)`, not `nr(c)`.
- `λ = (1, …, 1)` gives the identity twist.
- `f = 2`, `λ = (c, c^{−1})` gives the trivial twist although both components change.

### 3.6 Classification with fixed tame inertia

Prove: if `w̃* = t^{μ′} s′` and `(s′, μ′)` is good, then every `V(w̃, D)`, `D ∈ T(𝔽)^f`, is semisimple with `V(w̃, D)|_{I_K} ≅ τ(s′, μ′)`; conversely, for every semisimple `ρ : G_K → GL_n(𝔽)` with `ρ|_{I_K} ≅ τ(s′, μ′)` there are a finite extension `𝔽′/𝔽` and `D ∈ T(𝔽′)^f` with `ρ ⊗_𝔽 𝔽′ ≅ V(w̃, D)`, the latter formed over `𝔽′`, and one can take `𝔽′ = 𝔽` when the `n` characters of `τ(s′, μ′)` are pairwise distinct (BHHMS23, Proposition 3.2.7 and equation (19), p. 23, stated there with `𝔽′ = 𝔽` in all cases, which the first Check below contradicts). No injectivity in `D` is asserted. Route: `V(w̃, D)` splits along the orbits of `s′_τ` into blocks, each irreducible because `(s′, μ′)` is good (LLHL19, Proposition 3.1.2, p. 16; BHHMS23, Remark 3.2.2, p. 22), so it is semisimple with the stated inertia. Conversely, after a finite extension of `𝔽`, `ρ` is a direct sum of irreducibles `ρ_i` whose restrictions to `I_K` are the systems of the orbits; when the characters are pairwise distinct this holds over `𝔽`, the eigenlines of one orbit spanning a `G_K`-stable subspace. For an orbit of length `d`, `ρ_i` and the matching block of `V(w̃, D)` are induced from the unramified extension of `K` of degree `d` by characters that agree on inertia, so they differ by an unramified character of that extension, and rescaling one entry of `D` on the orbit realizes it; the scalar rescaling of 3.5 reaches only the characters whose value at Frobenius is a `d`-th power. *Needs:* 3.1, 3.3, 3.4, 3.5; `LocalFieldsRamification` Layer 4.

**Checks.**

- `f = 1`, `s′ = 1`, inertia `ω^a ⊕ ω^b`: the family is all `nr(α₁)ω^{a} ⊕ nr(α₂)ω^{b}`. For `a ≢ b` modulo `p − 1` Frobenius preserves the two inertia eigenlines, so these are all semisimple representations with that inertia; for `a = b` the representation `ω^a ⊗ ρ₀`, with `ρ₀` unramified and Frobenius of irreducible characteristic polynomial over `𝔽`, is irreducible with the same inertia and is a member only after a quadratic extension of `𝔽`.
- `f = 1`, `s′ = w`, primitive exponent: every member is irreducible and induced from the unramified quadratic extension.
- `D` and `D′` with the same products on each orbit give isomorphic representations: the parametrization is not injective.

### 3.7 Cyclotomic-free representations

A finite-dimensional continuous `𝔽`-representation `ρ` of `G_K` is **cyclotomic free** if there is an unramified extension `K′/K` of degree prime to `p` over which `ρ` is upper triangular and `H⁰(G_{K′}, (ρ|_{G_{K′}})^ss ⊗ ω^{−1}) = 0` (BHHMS23, before Lemma 3.2.8, p. 23, after LLHLM18, Definition 3.8, p. 29). The choice of `K′` is existential. On a triangularization this excludes `ω` as a diagonal constituent; it does not exclude the trivial character.

Prove: if `p > 2`, `ρ₁ : G_K → GL_n(𝔽)` is 2-generic (0.2) and `ρ₂ : G_K → GL_n(𝔽)` is continuous with `ρ₂^ss ≅ ρ₁^ss`, then `ρ₁^∨ ⊗ ρ₂` is cyclotomic free; in particular `ad(ρ̄) = ρ̄^∨ ⊗ ρ̄` is cyclotomic free for every 2-generic `ρ̄` (BHHMS23, proof of Corollary 3.2.9, p. 24, by the analogue of LLHLM18, Proposition 3.9, p. 29, which treats `GL₃`; LLHLM23, Lemma 7.2.10(2), p. 107, in every rank). For `n ≥ 2` the hypothesis `p > 2` is automatic: for a 2-deep weight `λ` and the highest root `α̃`, `⟨λ + η, α̃^∨⟩` is at least `3(n − 1)` and less than `p − 2`, so `p ≥ 3n`. Route: for a presentation `ρ₁^ss|_{I_K} ≅ τ(s, μ)` let `K′/K` be unramified of degree `r = ord(s_τ)`; 2-depth makes the `n` inertial characters pairwise distinct and Frobenius of `K′` fixes each, so `ρ₁^ss|_{G_{K′}} = χ₁ ⊕ ⋯ ⊕ χ_n` is a sum of characters, and `r` divides `lcm(1, …, n)`, hence is prime to `p` because `p > n`. Restriction to the normal subgroup `G_{K′}` commutes with semisimplification, so `ρ₁` and `ρ₂` are upper triangular over `K′` with diagonal `χ₁, …, χ_n`, and `ρ₁^∨ ⊗ ρ₂` is upper triangular with diagonal characters `χ_a^{−1}χ_b`. For `a = b` this is trivial, which is not `ω`, since `ω|_{I_K}` has order `p − 1 > 1`. For `a ≠ b`, on inertia `χ_a^{−1}χ_b = ω_{f′}^{e}` with `e = Σ_{j<f′} p^j δ_j`, where each `δ_j` is `±⟨μ_j, α^∨⟩` for a positive root `α` (indices of `μ` modulo `f`) and satisfies `3 ≤ |δ_j| ≤ p − 3` by 2-depth of `μ − η`, and `ω|_{I_K} = ω_{f′}^{(p^{f′}−1)/(p−1)}`; then `e − (p^{f′}−1)/(p−1) = Σ_j p^j (δ_j − 1)` with `2 ≤ |δ_j − 1| ≤ p − 2` is nonzero modulo `p` and of absolute value less than `p^{f′} − 1`, so it is not divisible by `p^{f′} − 1`. *Needs:* 0.2; `LocalFieldsRamification` Layer 4; `PadicLocalLanglandsForGL2Qp` §0.3 (norm compatibility of fundamental characters); Mathlib `modularCyclotomicCharacter`.

- Cyclotomic freeness is the existence of such `K′` with the vanishing invariant.
- It is invariant under isomorphism of representations.
- On an allowed triangularizing extension, no diagonal character of the semisimplification is `ω`.
- For `p > 2`, 2-generic `ρ₁` and `ρ₂^ss ≅ ρ₁^ss`, `ρ₁^∨ ⊗ ρ₂` is cyclotomic free; in particular `ad(ρ̄)` is.

**Checks.**

- For `p > 2` and `K` unramified the trivial character is cyclotomic free, since `ω|_{G_K}` is nontrivial.
- `ω` is not: `ω ⊗ ω^{−1}` is trivial and has a nonzero invariant.
- For `ρ₁ = 1` and `ρ₂ = ω`, `ρ₁` is cyclotomic free but `ρ₁^∨ ⊗ ρ₂ = ω` is not; the `Hom` statement of 3.8 must test the tensor.
- `f = 1`, `ρ̄ = nr(α)ω^a ⊕ nr(β)ω^b`: `ad(ρ̄)^ss = 1 ⊕ 1 ⊕ ω^{a−b} ⊕ ω^{b−a}` is cyclotomic free exactly when `a − b ≢ ±1` modulo `p − 1`. For normalized data `a − b = r + 1` with `12 < r + 1 < p − 12`, and the condition holds; for `ρ̄ = ω ⊕ 1`, which is not 2-generic, `a − b = 1` and `ad(ρ̄)` is not cyclotomic free.
- `n = 1`, `p = 2`: every character is 2-generic, since `GL₁` has no roots, and `ad(ρ̄)` is the trivial character, which is `ω` because `ω` is trivial for `p = 2`; it is not cyclotomic free, so the hypothesis `p > 2` is needed.

### 3.8 Cyclotomic-free restriction on Hom

Prove: if `ρ₁^∨ ⊗ ρ₂` is cyclotomic free, restriction `Hom_{G_K}(ρ₁, ρ₂) → Hom_{G_{K∞}}(ρ₁, ρ₂)` is bijective (BHHMS23, Lemma 3.2.8, pp. 23–24). The tensor hypothesis is required; full faithfulness on all residual representations is not asserted. Route: view `Hom` as invariants of `ρ₁^∨ ⊗ ρ₂`; apply gap:kummer-restriction-invariants over the triangularizing extension and descend; restriction is injective on underlying linear maps. *Needs:* 3.7; gap:kummer-restriction-invariants.

**Checks.**

- `ρ₁ = ρ₂ = 1` (`p > 2`): both sides are `𝔽`.
- `ρ₁ = 1`, `ρ₂ = ω`, `K = ℚ_p`: the hypothesis fails; `Hom_{G_K}` is zero and the theorem asserts nothing about `Hom_{G_{K∞}}`.
- Restriction is always injective, so only surjectivity uses the hypothesis.

### 3.9 Descent of isomorphisms

Prove: if `ρ₁ : G_K → GL_n(𝔽)` is 2-generic and `ρ₂` is a finite-dimensional continuous `𝔽`-representation of `G_K`, restriction `Isom_{G_K}(ρ₁, ρ₂) → Isom_{G_{K∞}}(ρ₁, ρ₂)` is bijective (BHHMS23, Corollary 3.2.9, p. 24). Route: by 3.4 semisimplification commutes with restriction to `G_{K∞}` and tame representations are determined by their restrictions, so a restricted isomorphism forces `ρ₁^ss ≅ ρ₂^ss`; then `ρ₁^∨ ⊗ ρ₂` is cyclotomic free by 3.7, and 3.8 applies; a descended invertible map has an equivariant inverse. If the right side is empty so is the left. For `n = 1` and `p = 2`, where 3.7 does not apply, `ρ₁` is a character of odd order, hence tame, and a character `ρ₂` with the same restriction to `G_{K∞}` is isomorphic to it by 3.4, both sets being `𝔽^×`. *Needs:* 0.2, 3.4, 3.7, 3.8.

**Checks.**

- When `ρ₂` has different semisimplification, both sets are empty.
- `ρ₁ = ρ₂` 2-generic: the bijection on automorphism groups is the statement for `Aut`.
- The conclusion is about isomorphisms; `Hom_{G_K}(ρ₁, ρ₂)` for 2-generic `ρ₁` and `ρ₂ = ρ₁ ⊗ ω` is not covered.

### 3.10 Framed deformation rings of `G_{K∞}`

For a profinite group `Γ` and continuous `ρ̄ : Γ → GL_n(𝔽)` put `R□_{ρ̄,Γ} = lim_H R□_{ρ̄,Γ/H}`, the limit over the open normal subgroups `H ⊆ ker ρ̄` with the transition maps induced by inflation, each term the framed deformation ring of the finite group `Γ/H` (`PadicLocalLanglandsForGL2Qp` §0.4; a finite group satisfies `Φ_p`). Prove that `R□_{ρ̄,Γ}` is a profinite local `𝒪`-algebra that pro-represents the framed deformation functor of `ρ̄` on Artinian local `𝒪`-algebras with residue field `𝔽`, with continuous tangent space `Z¹(Γ, ad ρ̄)`; that it is §0.4's `R□_ρ̄` when `Γ` satisfies `Φ_p`; that a continuous homomorphism `Γ′ → Γ` induces a continuous local map `R□_{ρ̄,Γ′} → R□_{ρ̄,Γ}`, in particular `R□_{ρ̄|G_{K∞}} → R□_ρ̄` for `G_{K∞} ⊆ G_K`; and that a continuous local `𝒪`-algebra map from `R□_{ρ̄,Γ}` to a complete Noetherian local `𝒪`-algebra `B` with residue field `𝔽` that is injective on `𝔽[ε]`-points (`ε² = 0`) is surjective. BHHMS23 uses this ring for `Γ = G_{K∞}` in the proof of Proposition 4.3.1, Claim 1 (p. 37). Route: an Artinian local `𝒪`-algebra with residue field `𝔽` is finite, so a continuous lift to it factors through some `Γ/H`; each `R□_{ρ̄,Γ/H}` is compact, so continuous maps from the limit to a finite ring factor through one term; for the last assertion the image is compact, hence closed, and contains lifts of a basis of `𝔪_B/(𝔪_B² + ϖB)`. *Needs:* `PadicLocalLanglandsForGL2Qp` §0.4; `LocalGaloisDeformationRings` §1.1; `DeformationAndDerivedPatchingAlgebra` §§1.8, 1.9.

- `R□_{ρ̄,Γ}` pro-represents framed lifts of `ρ̄` to Artinian coefficients, functorially in `Γ`.
- Its continuous tangent space is `Z¹(Γ, ad ρ̄)`.
- Under `Φ_p` it agrees with the Noetherian framed ring of §0.4.
- Injectivity on `𝔽[ε]`-points implies surjectivity onto a complete Noetherian local target.

**Checks.**

- For finite `Γ` the limit is attained at `H = 1`, and the ring is §0.4's framed ring of `Γ`.
- For `Γ = G_K` the ring is `R□_ρ̄` of `LocalGaloisDeformationRings` §1.1.
- For `Γ = G_{K∞}`, `n = 1` and `ρ̄ = 1` the tangent space `Hom_cont(G_{K∞}, 𝔽)` is infinite-dimensional: by the field-of-norms identification `G_{K∞} ≅ G_{k((v))}` (`FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.5) and Artin–Schreier theory it is isomorphic to `(k((v))/℘(k((v)))) ⊗_{𝔽_p} 𝔽`, where `℘(x) = x^p − x`, and `k((v))/℘(k((v)))` contains the independent classes of `v^{−m}` for `p ∤ m`. So `G_{K∞}` fails `Φ_p` and `R□_{ρ̄,G_{K∞}}` is not Noetherian.

### Examples

- `f = 1`, `s = w`, `μ = (r+2, 1)` with `0 < r+1 < p`, and `w̃` with `w̃* = t^μ w`: the pair `(w, μ)` is good by 3.2 and `V(w̃, D)` is irreducible for every `D` (3.6).
- `f = 1`, normalized reducible `ρ̄` with `ρ̄|_{I_K} ≅ ω^{r+2} ⊕ ω`: `ad(ρ̄)` is cyclotomic free since `r + 1 ≢ ±1` modulo `p − 1` (3.7), so isomorphisms of deformations descend from `G_{K∞}` to `G_K` (3.9).

### Dependencies

Layers 0–1; `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §§R07.4.5, R07.4.39 with gap:kummer-restriction-invariants; `LocalFieldsRamification` Layers 2–4; `PadicLocalLanglandsForGL2Qp` §§0.3, 0.4; `LocalGaloisDeformationRings` §1.1; `DeformationAndDerivedPatchingAlgebra` §§1.8, 1.9; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.4.

## Layer 4: Admissible types and residual Kisin modules

From this layer on the normalized data of the Conventions are fixed. A type is attached to each tuple of the three shapes; the two extreme shapes, read at the reversed index, encode the Serre weights.

### 4.1 Admissible tame types

For `w̃ ∈ Adm∨` write `w̃* = t^ν w` and define the **admissible type** `τ_{w̃} = τ(sw^{−1}, μ − sw^{−1}ν)` with lowest-alcove presentation `(s(τ), μ(τ)) = (sw^{−1}, μ − sw^{−1}ν − η)` (BHHMS23, §4.1, p. 25). Prove that this presentation is `(N−1)`-deep. Explicitly, `μ(τ)_j + η_j` is `(r_j, 0)` or `(r_j + 1, −1)` according to the pair `(t^{ν_j} w_j, s_j)` (BHHMS23, p. 25). *Needs:* 0.1, 0.2, 3.3; `ModpRepresentationsOfGL2OverLocalFields` §3.1.

- `τ_{w̃}` is defined for every tuple of the three shapes.
- Its presentation is `(sw^{−1}, μ − sw^{−1}ν − η)`.
- The presentation is `(N−1)`-deep, which suffices for the gauge bound at `h = 3` and the monodromy bound with `L = N − 1`.

**Checks.**

- At `f = 1` the admissible set has exactly three elements `U₁, U₂, U₃`.
- At `f = 1`, `U₁* = t^(2,1)` while `U₂* = t^(2,1) w`; the order of the factors distinguishes the two presentations.
- At `N = 12` the type coordinates are at least 11-deep: `11 ≥ h + 1 = 4` and `L = 11` satisfies `L ≥ 3` and `(L−1)(p−1) ≥ 3`.

### 4.2 Semisimple residual Kisin modules

Prove: for every `w̃ ∈ Adm∨` there is, up to isomorphism, a unique semisimple `𝔐̄ ∈ Y^{≤(3,0),τ_{w̃}}(𝔽)` of shape `w̃` with `T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}`, and it has an eigenbasis with `A^(j) = D_j w̃_j`, `D_j ∈ T(𝔽)`, which is a residual gauge basis in the sense of 1.3 (BHHMS23, Lemma 4.1.1, pp. 25–26, and the opening of §4.2, p. 28). Uniqueness is of an isomorphism class, not of `D` or of a gauge basis, and is not asserted for non-semisimple modules. Route: the monomial module with `A = D w̃` obeys the `(3,0)` bound; its étale matrix is `(D w̃ (sw^{−1})^* t^{(μ − sw^{−1}ν)^*})_j = (D s^* t^{μ^*})_j`, whose contravariant realization (3.3) is `T*_dd` of the module, and 3.2 with 3.6 choose `D`; uniqueness compares two lattices using `3 < ⟨μ(τ)_j + η_j, α^∨⟩ < p − 4`. *Needs:* 4.1, 1.2, 1.3, 1.4, 3.2, 3.6; gap:descent-kisin-modules.

**Checks.**

- Both the split case (`s = 1`) and the irreducible case (`s₀ = w`) are covered.
- `D` and `D′` differing by an `f`-periodic diagonal scaling of the basis give isomorphic modules; the statement is about classes.
- The bound `3 < ⟨μ(τ)_j + η_j, α^∨⟩ < p − 4` holds for `N ≥ 12`: the coordinate is `r_j` or `r_j + 2`, and `N < r_j + 1 < p − N` puts both between `12` and `p − 12`.
- The monomial basis is gauge: for `U₂`, `D w t^(2,1) = [[0, d₁v], [d₂v², 0]]` has pivots of degrees `1 = ν₂` (upper right) and `2 = ν₁` (lower left, in `v𝔽[v]`) and zero elsewhere, within the bounds of 1.3.

### 4.3 Weights and extreme shapes

Prove: there is a unique bijection `θ : W(ρ̄) → {U₁, U₃}^f` such that, for `σ ∈ W(ρ̄)` and `w̃ ∈ Adm∨`, `σ ∈ JH(σ̄(τ_{w̃}) ⊗ (N_{k/𝔽_p} ∘ det))` if and only if `w̃_j ≠ θ(σ)_j` for every `j`; and for any tame inertial type `τ`, `JH(σ̄(τ) ⊗ (N_{k/𝔽_p} ∘ det)) ∩ W(ρ̄) ≠ ∅` if and only if `τ ≅ τ_{w̃}` for some `w̃ ∈ Adm∨` (BHHMS23, Lemma 4.1.2 and equations (20)–(21), pp. 26–27). If `σ = F(t_{μ−η}(sω))`, `ω ∈ Σ`, then `θ(σ)_j = U₃` when `ω_{f−1−j} = 0` and `θ(σ)_j = U₁` when `ω_{f−1−j} = η`. Hence `X(σ) = {w̃ : w̃_j ≠ θ(σ)_j for all j}` has `2^f` elements and the types `τ_{w̃}`, `w̃ ∈ X(σ)`, are pairwise distinct. Route: the twist by `N ∘ det` adds `(1,1)` to the type parameter; combine 0.5 with the description of `W(ρ̄)` in `ModpRepresentationsOfGL2OverLocalFields` §3.4; settle `f = 1` and take products with index reversal; for the converse, `σ(τ)` is inflated from `GL₂(k)` (gap:tame-types-unramified), so by Brauer reciprocity `σ(τ) ⊗ χ̃`, with `χ̃` the Teichmüller lift of `N_{k/𝔽_p} ∘ det`, is a constituent of the projective lift `P̃_σ[1/p]`, which has exactly the `2^f` constituents `σ(τ_{w̃}) ⊗ χ̃`, `w̃ ∈ X(σ)` (`ModpRepresentationsOfGL2OverLocalFields` §§5.4–5.5). *Needs:* 4.1, 0.5; `ModpRepresentationsOfGL2OverLocalFields` §§3.2, 3.4, 5.4, 5.5; gap:tame-types-unramified.

**Checks.**

- For `f = 1`, `θ(0) = U₃` allows `U₁, U₂` and excludes `U₃`; `θ(η) = U₁` allows `U₂, U₃`.
- For `f = 2`, `X(σ)` has four elements, and `θ(σ)_0` is read from `ω_1`: labelling by `ω_0` swaps the two embeddings whenever `ω_0 ≠ ω_1`.
- Dropping `N_{k/𝔽_p} ∘ det` changes the central character of every constituent by `z ↦ N_{k/𝔽_p}(z)²` on the scalars `z ∈ k^×`, which is nontrivial for `p > 3`; then no weight of `W(ρ̄)` lies in any untwisted `JH(σ̄(τ_{w̃}))`, and the equivalence fails for every `w̃`.

### Examples

- `f = 1`: the three types `τ_{U₁}, τ_{U₂}, τ_{U₃}` and the two weights of `W(ρ̄)`; each weight lies in exactly two of the three type reductions (4.3).

### Dependencies

Layers 0, 1, 3; `ModpRepresentationsOfGL2OverLocalFields` §§3.1, 3.2, 3.4, 5.4, 5.5; gaps descent-kisin-modules, tame-types-unramified, deligne-lusztig-reduction.

## Layer 5: Polynomial charts and effective comparison

First the finite union of the fixed-profile rings is formed. The finite-height and monodromy equations define the actual reduced `𝒪`-flat chart; five simplified polynomial equations per embedding define a separate model. The `p³` Jacobian bound and an effective Newton step map the model onto the actual chart modulo `p^{N−8}`; nonemptiness of every Hodge profile makes the map an isomorphism, and one ambient automorphism transports all equations and prime factors together.

### 5.1 Small-Hodge deformation quotients

Define the **small-Hodge quotient** `R^{≤(3,0),τ}_ρ̄` as the quotient of `R□_ρ̄` by the intersection of the kernels of `R□_ρ̄ → R^{λ,τ}_ρ̄` over `λ ∈ {(3,0),(2,1)}^f` (BHHMS23, opening of §4.2, pp. 27–28). It is the maximal reduced `𝒪`-flat quotient whose characteristic-zero points have inertial type `τ` and labelled weights in that set; it does not include other profiles below `(3,0)`. Each `R^{λ,τ}_ρ̄` is imported. Route: a finite intersection of radical `p`-saturated ideals is radical and `p`-saturated, the quotient embedding in the product; the point criterion is `DeformationAndDerivedPatchingAlgebra` §4.7. *Needs:* `LocalGaloisDeformationRings` §§1.1, 3.4; `PadicLocalLanglandsForGL2Qp` §0.4; `DeformationAndDerivedPatchingAlgebra` §4.7.

- It is the quotient by the intersection of the fixed-profile kernels.
- It surjects onto every `R^{λ,τ}_ρ̄`, preserving the framing.
- Its `𝒪′`-points, for finite `E′/E`, are the framed potentially crystalline lifts of type `τ` with one of the listed profiles.
- Its quotient maps are the imported ones; the determinant is unrestricted.

**Checks.**

- At `f = 1` the allowed profiles are exactly `(3,0)` and `(2,1)`; `(2,0)` and `(3,1)` are excluded.
- For two distinct profile kernels `I, J` the union uses `I ∩ J`, while `I + J` describes their intersection.
- An unramified twist of a lift with the same inertia and weights remains a point; a fixed-determinant functor would remove that parameter.

### 5.2 Polynomial gauge charts

Fix `w̃ ∈ Adm∨` and the residual module of 4.2. For each table index `j` put `z = v + p` and let `R_j = 𝒪⟦eight variables⟧`, the two starred coefficients being their fixed nonzero residual Teichmüller values plus formal variables. The **chart matrices** at embedding `f − 1 − j` are (BHHMS23, Tables 1–3, pp. 41–43):

```text
A₁ = [[z² e₁₁* + z d₁₁ + c₁₁,  c₁₂],          [v (z d₂₁ + c₂₁),  z d₂₂* + c₂₂]]
A₂ = [[z d₁₁ + c₁₁,  z d₁₂* + c₁₂],           [v (z d₂₁* + c₂₁),  z d₂₂ + c₂₂]]
A₃ = [[z d₁₁* + c₁₁,  z d₁₂ + c₁₂],           [v c₂₁,  z² e₂₂* + z d₂₂ + c₂₂]]
```

for `w̃_{f−1−j} = U₁, U₂, U₃`. The constants `a₁, a₂, a₃ ∈ ℤ_(p)` are the oriented exponent differences divided by `e′`; modulo `p` they are `−sgn(s_j)(r_j+1) + 1`, `sgn(s_j)(r_j+1) + 1` and `−sgn(s_j)(r_j+1) − 1`, where `sgn(1) = 1`, `sgn(w) = −1`; they depend on the whole type. All displayed denominators are units under the normalized hypotheses. The ordered **chart equations** `G₁, …, G₅` are:

```text
A₁:  u = e₁₁*, d = d₂₂*, a = a₁, x = c₁₂d₂₁/(ud)
     d₁₁ + (a−2)c₁₂d₂₁/d,   c₂₂ − (a−1)c₁₂d₂₁/u,   c₂₁ + (a−1)(a−2)c₁₂d₂₁²/(aud),
     c₁₁ − (c₁₂d₂₁/d)((a−1)²(a−2)x/a − p),   c₁₂((a−1)(a−2)x − 2p)
A₂:  u = d₁₂*, d = d₂₁*, a = a₂, t = d₁₁d₂₂/(ud)
     c₂₁ + (a−1)d(t+p),   c₁₂ − au(t+p),   c₁₁ + a(a−1)d₁₁(t+p)/(a+1),
     c₂₂ − a(a−1)d₂₂(t+p)/(a−2),   (t+p)(a(a−1)t/((a−2)(a+1)) + p)
A₃:  u = d₁₁*, d = e₂₂*, a = a₃, x = d₁₂c₂₁/(ud)
     d₂₂ − (a+1)d₁₂c₂₁/u,   c₁₁ + a d₁₂c₂₁/d,   c₁₂ − a(a+1)d₁₂²c₂₁/((a−1)ud),
     c₂₂ − (d₁₂c₂₁/u)(a²(a+1)x/(a−1) − p),   c₂₁(a(a+1)x − 2p)
```

Let `I^poly_j = (G₁, …, G₅)` and let `P^poly_{j,21}` and `P^poly_{j,30}` be `I^poly_j` plus the first, respectively second, factor of `G₅`. Each chart has a dense polynomial subring in eight parameters (using `c₁₂/e₁₁*, d₂₁/d₂₂*` in chart 1; `d₁₁/d₁₂*, d₂₂/d₂₁*` in chart 2; `d₁₂/d₁₁*, c₂₁/e₂₂*` in chart 3, the others unchanged) in which the equations are polynomial. Put `R = ⊗̂_{𝒪,j} R_j` (`DeformationAndDerivedPatchingAlgebra` §1.12) and `I^poly = Σ_j I^poly_j R`. Prove that the three lower coefficients of `det A − (leading unit) z³` give the finite-height equations, and that each `G_i` lies in `(I∞, p^{N−5})`, where `I∞` is the kernel of the maximal reduced `𝒪`-flat quotient of `R` by the finite-height and monodromy equations (BHHMS23, proof of Proposition 4.2.1 and equation (23), pp. 28–31). These five equations define the model, not the actual ideal. *Needs:* 1.3, 1.4, 2.3, 4.2, 0.3; Mathlib `MvPowerSeries`, `Ideal.span`, `Matrix.det_fin_two`; `DeformationAndDerivedPatchingAlgebra` §1.12.

- The chart matrices are defined over the eight-variable ring for each of the three shapes.
- The chart ideal is generated by the five displayed equations in the dense polynomial ring and extended to `R_j`.
- The component ideals add the selected factor of `G₅`.
- The finite-height ideal is generated by the three lower coefficients of `det A − (leading unit) z³`.
- Every `G_i` maps into `p^{N−5}(R/I∞)`.
- For arbitrary coefficient values, `v` divides the lower-left entry of each chart matrix.
- For a unit `κ` the middle hypersurface is `κ^{−1}(xy + p)(xy + κp)`, with `κ = (a₂ − 2)(a₂ + 1)/(a₂(a₂ − 1))` for the model chart.

**Checks.**

- Reduce modulo `ϖ` and set all eight formal parameters to zero: the starred entries keep their residual values and the matrices become `D U_i`.
- In chart 2 put `x = d₁₁/d₁₂*`, `y = d₂₂/d₂₁*`, so `t = xy`: then `G₅ = (t + p)(t/κ + p) = κ^{−1}(xy + p)(xy + κp)` with `κ − 1 = ((a₂−2)(a₂+1) − a₂(a₂−1))/(a₂(a₂−1)) = −2/(a₂(a₂ − 1))`, a unit. At `a₂ = 5`, `κ = 18/20 = 9/10` and `κ − 1 = −1/10 = −2/20`; at `a₂ = 7`, `κ = 40/42` and `κ − 1 = −2/42`.
- In chart 1 the `(2,1)` factor of `G₅` is `c₁₂` and in chart 3 it is `c₂₁`; swapping the labels exchanges the two Hodge components.
- For `f = 2` and `λ₀ ≠ λ₁`, table index `0` describes `A^(1)` and its factor carries `λ₁`; labelling table `j` by `λ_j` swaps the two conditions.
- At `x = y = 0` the hypersurface takes the value `p²` for every unit `κ`.
- Over `ℤ` with `p = 3`, `κ = −1`, `x = 2`, `y = 3`: `(6 + 3)(6 − 3)/(−1) = −27`.
- At `κ = 1` the hypersurface is `(xy + p)²`; this degenerate value violates the unit hypothesis on `κ − 1` used in 5.4.

### 5.3 Irreducible crossing equations

Let `𝒪` be a complete discrete valuation ring with uniformiser `ϖ`, `A = 𝒪⟦x₁, …, x_n⟧` with `n ≥ 2`, `d > 0` and `u ∈ A^×`. Prove that `x₁x₂ + ϖ^d u` is prime, that `(x₁x₂ + ϖ^d u) ≠ (x₁)`, and that if `u₁ ≢ u₂` modulo `𝔪_A` then `(x₁x₂ + ϖ^d u₁) ≠ (x₁x₂ + ϖ^d u₂)` (BHHMS23, Lemma 3.3.1, p. 24). The first assertion is `crossing_prime` in `Suggested.lean`; the source proves irreducibility, and primality is added here. Route: substitute `x₂ ↦ x₁ + x₂`; Weierstrass preparation in `x₁` over `𝒪⟦x₂, …, x_n⟧` reduces a factorization to a root `b` in the maximal ideal; `b² + b x₂ + ϖ^d u(b, …) = 0` forces `ϖ^d | b` or `ϖ^d | b + x₂`, contradicting that `u` is a unit; `A` is a regular local ring, by Mathlib's instance for the discrete valuation ring `𝒪`, `TauCeti.PowerSeries.isRegularLocalRing` one variable at a time and `MvPowerSeries.finSuccEquiv`, hence factorial (`PurityForFlatCohomology` §7.4), so the irreducible element is prime; comparing constant terms after Weierstrass preparation distinguishes the ideals. *Needs:* Mathlib `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `MvPowerSeries`, `MvPowerSeries.finSuccEquiv`, `IsRegularLocalRing.of_ringEquiv`, `IsDiscreteValuationRing`, `IsAdicComplete`; Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing`; `PurityForFlatCohomology` §7.4.

- The crossing element is prime in `A`.
- Its ideal differs from `(x₁)`.
- Different residues of the units give different ideals.

**Checks.**

- The unit hypothesis is needed: `x₁x₂ + ϖx₁ = x₁(x₂ + ϖ)` is reducible.
- `d = 0` is excluded: `x₁x₂ + u` is then a unit.
- The converse of the residue test fails: with `n = 2`, `d = 1`, `u₁ = 1`, `u₂ = 1 + x₁x₂`, the residues agree but the ideals differ, since `x₁x₂ + ϖ` would have to divide `ϖx₁x₂`, while this prime divides none of `ϖ`, `x₁`, `x₂`.
- Two variables do not suffice for the Tau Ceti factoriality theorem in dimension at most two: `𝒪⟦x₁, x₂⟧` has Krull dimension three, so primality needs the general Auslander–Buchsbaum theorem.
- Ramified `𝒪` is allowed: `p = ϖ^e · (unit)`, so `xy + up` with `u` a unit is a crossing element with `d = e`.

### 5.4 Effective Jacobian bound

For each chart let `B_j` be the dense polynomial ring of 5.2 in its eight parameters over `𝒪`, with the starred coordinate that divides `G₅` inverted: `e₁₁*` in chart 1 (where `G₅ = e₁₁* X((a₁−1)(a₁−2)XY − 2p)` with `X = c₁₂/e₁₁*`, `Y = d₂₁/d₂₂*`), `e₂₂*` in chart 3, none in chart 2. In `B_j`, `G₁, …, G₄` are the parameters `d₁₁, c₂₂, c₂₁, c₁₁` in chart 1 (respectively `c₂₁, c₁₂, c₁₁, c₂₂` in chart 2 and `d₂₂, c₁₁, c₁₂, c₂₂` in chart 3) plus polynomials in the other four parameters, and `G₅` involves only those other four. Let `J₅` be the ideal of `5 × 5` minors of the Jacobian matrix of `(G₁, …, G₅)` in the eight parameters. Prove `p³ ∈ (G₁, …, G₅) + J₅`, and `p² ∈ (G₁, …, G₅) + J₅` in charts 1 and 3, in `B_j` (BHHMS23, Lemma 4.2.3, p. 31). In chart 2, with `x, y, κ` and `F = κ^{−1}(xy + p)(xy + κp)` as in 5.2, the relevant minors contain `F_x`, and the identity `(2(κ+1)xy + p(κ−1)²)F − ((κ+1)xy + p(κ²+1)) x F_x = p³(κ−1)²` gives the claim since `κ − 1` is a unit. In the outer charts, with `e₁₁*` (respectively `e₂₂*`) a unit, the remaining hypersurface is a unit multiple of `H = X(cXY − 2p)` with `c = (a−1)(a−2)` a unit, and `p·H_X + cY(X·H_X − 2Y·H_Y) = −2p²`. The exponent is in `p`, not `ϖ`. *Needs:* 5.2; Mathlib `Polynomial.derivative`, `Ideal.span_le`.

**Checks.**

- At `x = y = 0` both sides of the identity equal `p³(κ−1)²`; at `p = 3`, `κ = −1` the value is `108`.
- The identity holds as a polynomial identity in `x, y, p, κ`. With `s = xy`, `κF = (s + p)(s + κp)` and `κxF_x = s(2s + p(κ+1))`; in `κ` times the left side the coefficient of `s³` is `2(κ+1) − 2(κ+1) = 0`, that of `s²` is `p((κ+1)² + (κ−1)² − 2(κ²+1)) = 0`, that of `s` is `p²(κ+1)(2κ + (κ−1)² − κ² − 1) = 0`, and the constant term is `κp³(κ−1)²`.
- Chart 1 without inverting `e₁₁*`: at `e₁₁* = X = d₁₁ = c₁₁ = c₂₁ = c₂₂ = 0` every `G_i` vanishes and the row of `G₅` in the Jacobian is zero, so every `5 × 5` minor vanishes and no power of `p` lies in `(G₁, …, G₅) + J₅`; the inversion is needed.
- With `κ = 1` the right side vanishes and the argument gives nothing, matching the repeated factor `(xy + p)²` of 5.2.

### 5.5 Effective chart approximation

Prove: let `A` be a `p`-adically complete Noetherian `p`-torsion-free `𝒪`-algebra and `G` one of the three chart systems in the eight parameters of 5.2; if `a ∈ A⁸` is a point at which the coordinate inverted in 5.4 (`e₁₁*` in chart 1, `e₂₂*` in chart 3, none in chart 2) is a unit of `A`, and `G(a) ∈ p^n A⁵` with `n > 6`, there is `a° ∈ A⁸` with `G(a°) = 0` and `a° − a ∈ p^{n−3} A⁸` (BHHMS23, proof of Proposition 4.2.1, pp. 31–32; Elkik73, §0.2 and Lemme 1, pp. 555–557, with `h = 3`). Consequently, with `n = N − 5`, the actual chart `A = R/I∞` receives an `𝒪`-algebra map `R/I^poly → R/I∞` congruent to the natural map modulo `p^{N−8}`, surjective for `N ≥ 12`; the images in `R/I∞` of the coordinates of `R_j` satisfy the unit hypothesis, since the starred ones reduce to nonzero elements of `𝔽`. Route: by 5.4, `p³` lies in the evaluated minor ideal, so the adjugate gives a right inverse of the Jacobian after division by `p³`; a correction in `p^{n−3}A⁸` raises the error to `p^{2(n−3)}`, with `2(n−3) > n`; iterate and use completeness; tensor over `j` and extend continuously; surjectivity holds on relative cotangent spaces. *Needs:* 5.2, 5.4; Mathlib `IsAdicComplete`, `Matrix.adjugate`; `DeformationAndDerivedPatchingAlgebra` §§1.8, 1.9, 1.12.

**Checks.**

- At `N = 12`, `n = 7 > 6` and the correction is divisible by `p⁴`.
- At `n = 6` one step gives error exponent `2(6−3) = 6`, no improvement; the case is excluded.
- The unit hypothesis cannot be dropped: `A = ℤ_p`, chart 1, `n = 7`, `e₁₁* = X = p³`, `Y = d₂₂* = 1` and the other four coordinates solving `G₁ = … = G₄ = 0` give `G₅(a) = p⁶((a₁−1)(a₁−2)p³ − 2p)`, of valuation `7`; every `a° ≡ a` modulo `p⁴` keeps `e₁₁*` and `X` of valuation `3` and the last factor of valuation `1`, so `G₅(a°) ≠ 0`.
- A surjection from a model with the right dimension does not by itself identify the rings; 5.6 and 5.8 are still needed.

### 5.6 Nonempty Hodge profiles

Prove: for every `w̃ ∈ Adm∨` and every `λ ∈ {(3,0),(2,1)}^f`, `ρ̄` has a potentially crystalline lift of inertial type `τ_{w̃}` and labelled Hodge–Tate weights `λ` after a finite extension of `E`; so all `2^f` profile loci are nonempty (BHHMS23, proof of Proposition 4.2.1 and equation (26), p. 32; GHLS17, Theorem D, p. 4, and Theorem 3.1.5, p. 21). This is not deduced from the dimension theorem. Route: 4.3 gives a weight in `JH(σ̄(τ) ⊗ N ∘ det) ∩ W(ρ̄)`; for `λ_j = (3,0)` tensor with the algebraic representation of highest weight `(2,0)`, whose decomposition `L(a,b) ⊗ L(2,0) ≅ L(a+2,b) ⊕ L(a+1,b+1) ⊕ L(a,b+2)` for `2 ≤ a − b ≤ p − 3` contains the middle shift `(1,1)`; for `λ_j = (2,1)` tensor with `det`; the constituents of `σ(τ)` are 7-deep; then apply gap:ghls-existence. *Needs:* 4.3, 0.5; `ModpRepresentationsOfGL2OverLocalFields` §5.5; `LocalGaloisDeformationRings` §§3.4, 8.10 with gap:ghls-existence.

**Checks.**

- All `2^f` profiles, including mixed `(3,0)/(2,1)` profiles, are covered.
- For `f = 1` there are two profiles and two nonempty loci, which with 5.8 gives two components.
- The decomposition of `L(a,b) ⊗ L(2,0)` needs `2 ≤ a − b ≤ p − 3`; the 7-deep constituents satisfy it.

### 5.7 Gauge and Galois deformation comparison

For the fixed residual module and type let `A∞ = R/I∞`. Prove that there is an `𝒪`-algebra isomorphism `R^{≤(3,0),τ}_ρ̄⟦X₁, …, X_{2f}⟧ ≅ A∞⟦Y₁, …, Y₄⟧`, compatible with every additional Hodge-bound condition (BHHMS23, equation (22) and its explanation, p. 29). The `2f` variables are the residual-trivial diagonal gauge choices and the four variables the Galois framing; no determinant is fixed. Route: gap:descent-kisin-modules and gap:relative-monodromy-criterion identify Kisin modules of type `τ` with height and monodromy conditions and potentially crystalline lifts; 4.2 fixes the residual chart; since `ad(ρ̄)` is cyclotomic free (3.7), 3.8 identifies morphisms of deformations with those of their restrictions to `G_{K∞}`; diagonal gauge choices form a formally smooth `2f`-dimensional family and framings a 4-dimensional one. *Needs:* 5.1, 4.2, 1.4, 2.2, 3.7, 3.8; `LocalGaloisDeformationRings` §§1.1, 1.2, 1.8, 3.4; `DeformationAndDerivedPatchingAlgebra` §1.9; gaps descent-kisin-modules, relative-monodromy-criterion.

**Checks.**

- Smooth variables: `2f` on the Galois side and `2² = 4` on the chart side, not the counts `3f` and `9` of the rank-three charts of `LocalGaloisDeformationRings` §6.28.
- At `f = 1`: chart relative dimension `3`, so `dim R^{≤(3,0),τ} + 2 = 3 + 4`, giving relative dimension `5 = 4 + f`.
- The comparison is between reduced `𝒪`-flat quotients, not the raw height-plus-jet quotients.

### 5.8 Effective ambient comparison

Prove: the map `R/I^poly → R/I∞` of 5.5 is an isomorphism, and it lifts to an `𝒪`-algebra automorphism `ψ : R → R` with `ψ ≡ id` modulo `p^{N−8}` and `ψ(I^poly) = I∞` (BHHMS23, Lemma 4.2.4 and the end of the proof of Proposition 4.2.1, pp. 32–33). Put `I_j = ψ(I^poly_j R)` and `P_{j,λ} = ψ(P^poly_{j,λ} R)` using this single `ψ`. Then `I∞ = Σ_j I_j` and the ideals `Σ_j P_{j,λ_{f−1−j}}`, `λ ∈ {(3,0),(2,1)}^f`, are exactly the distinct minimal primes of `I∞`. Although `I^poly_j` comes from `R_j`, the ideals `I_j` and `P_{j,λ}` have tails in all embeddings. Route: each `R_j/I^poly_j` is reduced, `𝒪`-flat with two geometrically integral components of relative dimension 3 (by 5.3 after eliminating four variables); `R/I^poly` has `2^f` components of relative dimension `3f` (`DeformationAndDerivedPatchingAlgebra` §4.6); the actual ring has at least `2^f` components by 5.6 and `LocalGaloisDeformationRings` §3.9, so the surjection is injective; set `ψ(X_i) = X_i + p^{N−8}ε_i`. *Needs:* 5.2, 5.3, 5.5, 5.6, 5.7; `LocalGaloisDeformationRings` §§3.9, 3.10; `DeformationAndDerivedPatchingAlgebra` §§1.9, 4.6.

**Checks.**

- The congruence is modulo `p^{N−8}`, at least `p⁴` for `N ≥ 12`; `ψ` is an automorphism as soon as `N ≥ 9`.
- One `ψ` transports every factor and every embedding; independent perturbations per factor would not preserve the intersections used in Layer 7.
- At `f = 1` there are exactly two minimal primes, `P_{0,(3,0)}` and `P_{0,(2,1)}`.

### Examples

- `f = 1`, `w̃ = U₂`: `R/I^poly ≅ 𝒪⟦x, y, four more⟧/(κ^{−1}(xy + p)(xy + κp))` after eliminating four variables, with the two components `(xy + p)` (label `(2,1)`) and `(xy + κp)` (label `(3,0)`) (5.2, 5.3).

### Dependencies

Layers 0–4; `LocalGaloisDeformationRings` §§1.1, 1.2, 1.8, 3.4, 3.9, 3.10, 8.10; `PadicLocalLanglandsForGL2Qp` §0.4; `DeformationAndDerivedPatchingAlgebra` §§1.8, 1.9, 1.12, 4.6, 4.7; `PurityForFlatCohomology` §7.4; `ModpRepresentationsOfGL2OverLocalFields` §5.5; Mathlib `MvPowerSeries`, Weierstrass preparation; Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing`; gaps ghls-existence, descent-kisin-modules, relative-monodromy-criterion.

## Layer 6: Single-type rings and their special fibres

The fixed-profile rings are imported; Layer 5 defines their union. The explicit presentation identifies the profile kernels; the special-fibre computation reduces each exact-profile chart to products of pairs of variables. Formal smoothness belongs to each component, not to their union.

### 6.1 Single-type deformation presentation

Prove: for each `w̃ ∈ Adm∨`, with `ψ`, `I_j` and `P_{j,λ}` of 5.8, there is an `𝒪`-algebra isomorphism `R^{≤(3,0),τ_{w̃}}_ρ̄⟦X₁, …, X_{2f}⟧ ≅ (R/Σ_j I_j)⟦Y₁, …, Y₄⟧` under which, for each `λ ∈ {(3,0),(2,1)}^f`, the kernel of the surjection onto `R^{λ,τ_{w̃}}_ρ̄⟦X₁, …, X_{2f}⟧` is generated by the prime `Σ_j P_{j,λ_{f−1−j}}` (BHHMS23, Proposition 4.2.1, pp. 28–33). The sums, not the individual local ideals, are the meaningful kernels. Route: combine 5.7 and 5.8; to identify a `(2,1)` coordinate, every entry of `A` at that embedding is divisible by `z`; if that coordinate were `(3,0)` on a surviving component, the factor equations and finite-height relations would put `p` in the prime, contradicting `𝒪`-flatness; induct over embeddings. *Needs:* 5.1, 5.6, 5.7, 5.8, 5.2; `DeformationAndDerivedPatchingAlgebra` §4.7.

**Checks.**

- The index in the prime sum is `λ_{f−1−j}`; at `f = 2` with `λ = ((3,0),(2,1))` the kernel is `P_{0,(2,1)} + P_{1,(3,0)}`.
- One isomorphism handles every `λ`; choosing a separate comparison per component would not identify the union.
- For `f = 1` the two kernels are `P_{0,(3,0)}` and `P_{0,(2,1)}`, and their intersection is `I_0`.

### 6.2 Hodge-labelled components

Prove: `R^{≤(3,0),τ_{w̃}}_ρ̄` is reduced and `𝒪`-flat with exactly `2^f` irreducible components, the `Spec R^{λ,τ_{w̃}}_ρ̄` for `λ ∈ {(3,0),(2,1)}^f`; each is a domain of relative dimension `f + 4`, geometrically integral after finite coefficient extension; each fixed-profile generic fibre is regular (BHHMS23, Proposition 4.2.1, pp. 28–33; dimension in the proof of Proposition 4.3.1, p. 38). This is a statement about complete local rings, not about algebraic `E`-schemes of finite type. Route: the model's component description and `DeformationAndDerivedPatchingAlgebra` §4.6; `ψ` preserves everything; `3f + 4 − 2f = f + 4`; regularity from `LocalGaloisDeformationRings` §3.10. *Needs:* 6.1, 5.8; `DeformationAndDerivedPatchingAlgebra` §4.6; `LocalGaloisDeformationRings` §§3.9, 3.10.

**Checks.**

- At `f = 1`: two components of relative dimension `5`, while the gauge chart has relative dimension `3`.
- `f + 4 = 4 + [K:ℚ_p] · 1` is `LocalGaloisDeformationRings` §3.9's `d² + Δ(v)` for `d = 2` and regular weights; a fixed determinant would give `f + 3`.
- At `f = 3` there are `8` components, each of relative dimension `7`.

### 6.3 Reduced special fibres

Prove: for each `λ`, `R^{λ,τ_{w̃}}_ρ̄/ϖ` is reduced and all its irreducible components are formally smooth over `𝔽`; more precisely, for some `0 ≤ m ≤ f`, `R^{λ,τ_{w̃}}_ρ̄/ϖ ≅ 𝔽⟦U₁, …, U_{f+4+m}⟧/(U₁U₂, …, U_{2m−1}U_{2m})` (BHHMS23, Corollary 4.2.6 and equations (27)–(28), pp. 33–34; Lemma 8.1.2, p. 88). For `m > 0` the special fibre is singular along the crossing. Route: modulo `ϖ` each exact-profile chart is `𝔽⟦Z₁, …, Z_{3+m_j}⟧/(Z₁Z₂, …)` with `m_j ≤ 1`; take completed tensor products, `m = Σ_j m_j`; `DeformationAndDerivedPatchingAlgebra` §6.8 gives radicality and coordinate components; cancel the `2f` and `4` formal variables by gap:power-invariance; reducedness and regularity of components also descend along the faithfully flat formal-variable extension. *Needs:* 6.1, 5.8; `DeformationAndDerivedPatchingAlgebra` §§1.12, 1.13, 6.8 with gap:power-invariance.

**Checks.**

- Dimension: `f + 4 + m − m = f + 4`, the dimension of `R^{λ,τ}/ϖ` for an `𝒪`-flat ring of relative dimension `f + 4`.
- `m = 0`: the special fibre is a power-series ring, formally smooth; `m = 1`: two smooth components meeting in codimension one.
- `𝔽⟦U₁, U₂⟧/(U₁²)` is not of the stated form and is not reduced; the square-free form is part of the conclusion.

### Examples

- `f = 1`, `w̃ = U₂`, `λ = (2,1)`: the chart component is `(xy + p)` plus four linear eliminations; modulo `ϖ` it becomes `𝔽⟦x, y, …⟧/(xy)`, so `m = 1` and `R^{λ,τ}/ϖ ≅ 𝔽⟦U₁, …, U₆⟧/(U₁U₂)` (6.3).

### Dependencies

Layer 5; `LocalGaloisDeformationRings` §§3.9, 3.10; `DeformationAndDerivedPatchingAlgebra` §§1.12, 1.13, 4.6, 4.7, 6.8; gap:power-invariance.

## Layer 7: Several tame types and component intersections

For one Serre weight there are `2^f` allowed types. Common charts put their étale `φ`-modules in one ambient power-series ring; extra linear relations recover the outer single-type charts. The union is an intersection over type tuples of sums over embeddings, and the final membership of `p` is integral.

### 7.1 Common charts for several types

Fix `σ ∈ W(ρ̄)`, `θ = θ(σ)` and `X(σ)`. At each table index `j` let `S_j = 𝒪⟦c₁₁, d₁₁, c₁₂, x₁₂, c₂₁, x₂₁, c₂₂, d₂₂, b⟧`, with `d₁₂* , d₂₁*` the residual units plus `x₁₂, x₂₁`. If `θ_{f−1−j} = U₃` put `b₁₂ = b`, `b₂₁ = 0` (Table 4); if `θ_{f−1−j} = U₁` put `b₂₁ = b`, `b₁₂ = 0` (Table 5). The **common étale matrix** is

```text
[[z d₁₂* + c₁₂ + b₁₂/v,  (z d₁₁ + c₁₁)/v],  [z d₂₂ + c₂₂,  z d₂₁* + c₂₁ + b₂₁/v]] · s_j^{−1} diag(v^{r_j+1}, 1)
```

(BHHMS23, Proposition 4.3.1, pp. 34–38; Figure 2, p. 38; Tables 4–5, pp. 44–45). Let `S = ⊗̂_{𝒪,j} S_j`. For each tuple `w̃ ∈ X(σ)` transport the ideals `I_j` of 5.8 for `τ_{w̃}` into `S` by the substitutions

```text
U₁ into Table 4:  (e₁₁*, d₁₁, c₁₁, d₂₁, c₁₂, c₂₁, d₂₂*, c₂₂) ↦ (d₁₂*, c₁₂ − p d₁₂*, b₁₂ − p c₁₂, d₂₂, d₁₁, c₂₂, d₂₁*, c₂₁),  and impose c₁₁ + p d₁₁ = 0
U₂ into either:   keep the eight middle-chart parameters,  and impose b = 0
U₃ into Table 5:  (d₁₁*, c₁₁, d₁₂, c₁₂, c₂₁, e₂₂*, d₂₂, c₂₂) ↦ (d₁₂*, c₁₂, d₁₁, c₁₁, d₂₂, d₂₁*, c₂₁ − p d₂₁*, b₂₁ − p c₂₁),  and impose c₂₂ + p d₂₂ = 0
```

applied to the full coupled series of each type with its constants `a_i`. Write `I_{w̃,j}`, `P_{w̃,j,λ}` for the transported ideals including the extra relation, and `I_{w̃} = Σ_j I_{w̃,j}`. Prove `S/I_{w̃} ≅ R_{w̃}/Σ_j I_j`, where `R_{w̃}` is the ring `R` of 5.2 for `τ_{w̃}`, compatibly with the associated étale `φ`-modules. (A cross-reference in the final note of Table 5, p. 45, names Tables 1–2 where Tables 2–3 are meant; Figure 2 and the formulas use Tables 2–3.) *Needs:* 4.3, 5.8, 5.2, 3.3; `DeformationAndDerivedPatchingAlgebra` §§1.9, 1.12.

- The common chart is the nine-variable ring with the displayed étale matrix for the chosen extreme shape.
- The type ideal of a tuple is obtained by substituting its single-type ideals and adding the chart relation.
- The quotient by the type ideal is the single-type chart with its étale realization.
- The substitutions preserve the `𝒪`-structure, the residual matrix and the contravariant realization.

**Checks.**

- Each `S_j` has one `b` variable and eight others: nine, not ten.
- In the `U₁`/Table 4 quotient `c₁₁ = −p d₁₁`, and in the `U₃`/Table 5 quotient `c₂₂ = −p d₂₂`; omitting the relation leaves an extra dimension.
- For `U₂`, setting `b = 0` recovers the middle single-type étale matrix with no change of coordinates.
- Changing the shape at a different embedding changes the constants `a_i` and the transported tails at this embedding: equality of local shape codes does not determine the transported ideal.

### 7.2 Deformation union for a Serre weight

Define `R^{≤(3,0),σ}_ρ̄` as the quotient of `R□_ρ̄` by the intersection of the kernels of `R□_ρ̄ → R^{≤(3,0),τ_{w̃}}_ρ̄` over `w̃ ∈ X(σ)` (BHHMS23, opening of §4.3, p. 34). Prove that it is the maximal reduced `𝒪`-flat quotient parametrizing potentially crystalline lifts with profiles in `{(3,0),(2,1)}^f` and some tame type `τ` with `σ ∈ JH(σ̄(τ) ⊗ N_{k/𝔽_p} ∘ det)`; the identification uses the exhaustion statement of 4.3. *Needs:* 5.1, 4.3; `DeformationAndDerivedPatchingAlgebra` §4.7; `PadicLocalLanglandsForGL2Qp` §0.4.

- It is the quotient by the intersection of the `2^f` single-type kernels.
- It surjects onto each allowed single-type quotient.
- Its characteristic-zero points are the lifts described above, with the twist by `N ∘ det`.
- All maps are induced from the same framed ring and agree with the fixed-type quotients.

**Checks.**

- At `f = 1` and `θ = U₃` the union uses exactly the `U₁` and `U₂` types; `U₃` is excluded.
- A point of either allowed type factors through the intersection kernel; the sum of the kernels would require both types at once.
- At `f = 2` there are four single-type maps and sixteen pairs `(λ, w̃)` indexing components.

### 7.3 Multiple-type deformation presentation

Prove: `R^{≤(3,0),σ}_ρ̄⟦X₁, …, X_{2f}⟧ ≅ (S/⋂_{w̃ ∈ X(σ)} I_{w̃})⟦Y₁, …, Y₄⟧` as `𝒪`-algebras, compatibly with each single-type quotient; the ring is reduced and `𝒪`-flat with `4^f` irreducible components indexed by `(λ, w̃) ∈ {(3,0),(2,1)}^f × X(σ)`, with kernels generated by `Σ_j P_{w̃,j,λ_{f−1−j}}`, each of relative dimension `f + 4`; distinct type ideals satisfy `p ∈ I_{w̃} + I_{w̃′}` (BHHMS23, Proposition 4.3.1 and its proof, pp. 34–38). The type ideals need not be comaximal in the integral ring. Route: the common étale module gives a continuous map from the framed deformation ring `R□_{ρ̄|G_{K∞}}` of 3.10 (not Noetherian) to the chart with four framing variables, surjective by 3.10 once it is injective on `𝔽[ε]`-points: for an infinitesimal basis change `1 + εM_j` with worst pole order `k_j`, `p k_j ≤ k_{j−1} + r_j + 3 < k_{j−1} + p − 1` forces `max k_j ≤ 0`, and 3.8, with `ad(ρ̄)` cyclotomic free by 3.7, kills the remaining endomorphisms; every characteristic-zero point of the intersection lies on a single-type branch, potentially crystalline by 6.1, and 3.9 descends the framed identification to `G_K`; for `w̃ ≠ w̃′` choose an embedding where the shapes differ and use the common equations, together with `a₂ ≢ 1` and `a₁ + a₂ ≡ 2` modulo `p`, to get `p ∈ I_{w̃} + I_{w̃′}`; dimensions `(f + 4) + 2f = 3f + 4` (with `LocalGaloisDeformationRings` §3.10). *Needs:* 7.1, 7.2, 6.1, 6.2, 3.7, 3.8, 3.9, 3.10; `PadicLocalLanglandsForGL2Qp` §0.4; `DeformationAndDerivedPatchingAlgebra` §§1.9, 4.7; `LocalGaloisDeformationRings` §3.10; gap:descent-kisin-modules.

**Checks.**

- The union is `⋂_{w̃}(Σ_j I_{w̃,j})`; swapping the intersection and the sum gives a different ideal.
- At `f = 1`: four components of relative dimension `5`.
- The tangent bound uses `r_j + 3 < p − 1`, true since `r_j + 1 < p − 12`.

### 7.4 Exact small-weight ideals

In a Table 4 ring define the **exact small-weight ideals**

```text
Q₁ = (b₁₂ − p c₁₂, c₁₁, c₁₂ − p d₁₂*, c₂₁, c₂₂, d₁₁)
Q₂ = (b₁₂, c₁₁, c₁₂, c₂₁, c₂₂, d₁₁d₂₂/(d₁₂* d₂₁*) + p)
```

and in a Table 5 ring

```text
Q₂ = (b₂₁, c₁₁, c₁₂, c₂₁, c₂₂, d₁₁d₂₂/(d₁₂* d₂₁*) + p)
Q₃ = (b₂₁ − p c₂₁, c₁₁, c₁₂, c₂₁ − p d₂₁*, c₂₂, d₂₂)
```

as ideals of `S_j`, extended to `S` (BHHMS23, Lemma 4.3.2, p. 39). Prove: for `w̃ ∈ X(σ)` and `λ_{f−1−j} = (2,1)`, `Q_{i(w̃)_{f−1−j}} ⊆ Σ_{j′} P_{w̃,j′,λ_{f−1−j′}}`; and if every `λ_j = (2,1)`, `Σ_j Q_{i(w̃)_{f−1−j}} = Σ_j P_{w̃,j,(2,1)}` (BHHMS23, Lemma 4.3.2, p. 39; Remark 4.2.5, p. 33). Individual `Q` and transported `P` are not asserted equal. Route: at a `(2,1)` embedding every entry of `A` is divisible by `z`, and the finite-height equations give the remaining generator; apply the substitutions of 7.1; equality by dimension. *Needs:* 7.1, 7.3, 6.1, 1.1; Mathlib `Ideal.span`.

- `Q_i` is the six-generator ideal in the appropriate common chart.
- A `Q_i` constraint at one `(2,1)` embedding lies in the profile prime sum.
- For the all-`(2,1)` profile the sums of the `Q` and of the transported `P` agree.
- `Q_i` is an ideal of the local ring `S_j`, unlike a general transported `P_{w̃,j,λ}`.
- In Table 4, `c₂₁ ∈ Q₁ ∩ Q₂`; in Table 5, `c₁₂ ∈ Q₂ ∩ Q₃`.
- The middle formula gives the same ideal from either table.

**Checks.**

- In Table 4 both `Q₁` and `Q₂` contain `c₂₁`; in Table 5 the common generator is `c₁₂`.
- `Q₂` kills all four `c` entries and imposes `t = −p`; omitting `+p` changes its characteristic-zero points.
- `Q₁` contains `c₁₂ − p d₁₂*` and `b₁₂ − p c₁₂`, `Q₃` contains `c₂₁ − p d₂₁*` and `b₂₁ − p c₂₁`; replacing these by `c₁₂, b₁₂` (resp. `c₂₁, b₂₁`) gives different ideals.
- Only the all-`(2,1)` profile gives the equality of sums; a mixed profile gives only the containment.
- Over `ℤ` with `p = 5` and both units `1`, Table 4 `Q₁` vanishes at `(c₁₁, d₁₁, c₁₂, c₂₁, c₂₂, d₂₂, b) = (0, 0, 5, 0, 0, 0, 25)`.
- With the same data `Q₂` vanishes at `(0, 1, 0, 0, 0, −5, 0)`: `d₁₁d₂₂ + 5 = 0`.
- Table 5 `Q₃` vanishes at `(0, 0, 0, 5, 0, 0, 25)`.

### 7.5 Integral component intersection

Prove: for `0 ≤ j ≤ f − 1` and `w̃ ∈ X(σ)` with `i(w̃)_{f−1−j} = 2`, in `S`,

```text
p ∈ (Q₁^(j) ∩ Q₂^(j)) + P_{w̃,j,(3,0)}   if θ(σ)_{f−1−j} = U₃,
p ∈ (Q₂^(j) ∩ Q₃^(j)) + P_{w̃,j,(3,0)}   if θ(σ)_{f−1−j} = U₁
```

(BHHMS23, Proposition 4.3.3, pp. 39–40). The intersections are of extended local ideals in `S`; `P` is the transported ideal with its coupled tails; the scalar is the prime `p`, not `ϖ`. Route: in Table 4 the middle `(3,0)` equations give `c₂₁ + (a₂ − 1)d₂₁*(t + p) + O(p^{N−8})` and `(t + p) − 2p/(a₂(a₂−1)) + O(p^{N−8})` in `P_{w̃,j,(3,0)}`; eliminating `t + p` gives `c₂₁ + (2p/a₂) d₂₁* + p^{N−8}ε`; since `c₂₁ ∈ Q₁ ∩ Q₂`, the sum contains `p((2/a₂)d₂₁* + p^{N−9}ε)`, and the bracket is a unit for `N ≥ 12`; in Table 5 use `c₁₂ − (2p/(a₂−1)) d₁₂* + p^{N−8}ε` and `c₁₂ ∈ Q₂ ∩ Q₃`, or the symmetry exchanging the matrix indices and `a_i ↦ 1 − a_{4−i}`. *Needs:* 7.4, 7.1, 5.8, 5.2; Mathlib `IsLocalRing.maximalIdeal`, `IsLocalRing.notMem_maximalIdeal`.

**Checks.**

- At `N = 12` the tail after dividing by `p` lies in `p³`, so it cannot change the nonzero residue of `2d₂₁*/a₂`.
- With `a₂ − 1 ≡ ±(r_j + 1)` and `a₂ ≢ 0, 1` modulo `p`, the elimination coefficient `(a₂ − 1) · 2/(a₂(a₂ − 1)) = 2/a₂` is a unit since `p > 2`.
- The statement uses `Q₁ ∩ Q₂`; with `Q₁ + Q₂` it would be weaker. With `ϖ` in place of `p` it is false when `𝒪` is ramified: `(Q₁ ∩ Q₂) + P ⊆ Q₂ + P`, and modulo `Q₂ + P` the four `c` entries and `b` vanish, `t = −p` and `(κ−1)p = 0` force `p = 0`, so `d₁₁d₂₂ = 0` and the tails vanish, leaving `(𝒪/p)⟦d₁₁, d₂₂, x₁₂, x₂₁, …⟧/(d₁₁d₂₂)`; setting the variables to zero retracts it onto `𝒪/p`, so `ϖ ≠ 0` in it when `e(E/ℚ_p) ≥ 2`.

### Examples

- `f = 1`, `θ = U₃`, `w̃ = U₂`: `p ∈ (Q₁ ∩ Q₂) + P_{U₂,0,(3,0)}`, from `c₂₁ + (2p/a₂)d₂₁* + O(p⁴) ∈ P` and `c₂₁ ∈ Q₁ ∩ Q₂` (7.5).

### Dependencies

Layers 3–6; `DeformationAndDerivedPatchingAlgebra` §§1.9, 1.12, 4.7; `LocalGaloisDeformationRings` §3.10; `PadicLocalLanglandsForGL2Qp` §0.4.

## Downstream consumers

`HilbertModularVarietiesAndShimuraCurvesPartII` consumes the single-type rings and components (6.1–6.3), the multiple-type ring for a Serre weight (7.2–7.3) and the membership of `p` (7.5) in its patched-module gluing argument after BHHMS23, Theorem 8.3.9 (pp. 101–102), where the local intersection relation of 7.5 enters through equations (78)–(79).

## References

- [BHHMS23] Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra, Benjamin Schraen, *Gelfand–Kirillov dimension and mod p cohomology for GL₂*, Invent. Math. 234 (2023), 1–128; arXiv:2009.03127v7, whose printed pages are cited.
- [GHLS17] Toby Gee, Florian Herzig, Tong Liu, David Savitt, *Potentially crystalline lifts of certain prescribed types*, Doc. Math. 22 (2017), 397–422; arXiv:1506.01050v3, whose printed pages are cited.
- [Elkik73] Renée Elkik, *Solutions d'équations à coefficients dans un anneau hensélien*, Ann. Sci. ÉNS (4) 6 (1973), 553–603.
- [Hamann75] Eloise Hamann, *On power-invariance*, Pacific J. Math. 61 (1975), 153–159.
- [Kisin06] Mark Kisin, *Crystalline representations and F-crystals*, in *Algebraic Geometry and Number Theory*, Progr. Math. 253, Birkhäuser (2006), 459–496.
- [LLHL19] Daniel Le, Bao V. Le Hung, Brandon Levin, *Weight elimination in Serre-type conjectures*, Duke Math. J. 168 (2019), 2433–2506; arXiv:1610.04819v4, whose printed pages are cited.
- [LLHLM18] Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, *Potentially crystalline deformation rings and Serre weight conjectures: shapes and shadows*, Invent. Math. 212 (2018), 1–107; arXiv:1512.06380v3, whose printed pages are cited.
- [LLHLM23] Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, *Local models for Galois deformation rings and applications*, Invent. Math. 231 (2023), 1277–1488; arXiv:2007.05398v2, whose printed pages are cited.
