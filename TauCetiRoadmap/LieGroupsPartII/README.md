# Roadmap: Lie groups, part II — minimal parabolic subgroups, the Bruhat decomposition and the self-adjoint matrix model of real reductive groups

**Summary.** This is the second part of [LieGroups](../RepresentationTheory/LieGroups/README.md). Its Layer 9 stops after the Cartan, Iwasawa and KAK decompositions, the restricted root system and the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` of a real reductive group. This part continues the structure theory on the same carrier, LieGroups' `CartanInvolution` with its finite central matrix-cover model, for groups that need not be connected, semisimple, linear or of finite centre. It equips the datum with a compatible invariant form and proves conjugacy of the underlying involutions and of Iwasawa triples with a common split centre, by an element of the identity component, without identifying invariant forms or matrix models. It compares `W_G = N_K(𝔞)/Z_K(𝔞)` with the Weyl group of `Σ` and characterizes their equality, the component condition. It extends the minimal parabolic subgroup `P = MAN` and its Langlands decomposition, which AutomorphicFormsOnReductiveGroups §2.3a owns for the real points of connected reductive `ℝ`-groups and RealSemisimpleLieGroups §3.1 for connected groups with semisimple Lie algebra and finite centre, to every such datum, and makes every Iwasawa triple satisfying the component condition a minimal parabolic datum, to which RealSemisimpleLieGroups' Tits system, standard and general parabolic subgroups with their Langlands decompositions, dynamical description and algebraic comparison apply; those are consumed, not rebuilt. Beyond the component condition this part proves the Bruhat decomposition `G = ⨆_{w ∈ W_G} P n_w P` with its cell coordinates for every Iwasawa triple, the group `⁰L` and the split component of a datum whose components move its split centre, and the dynamical description of a regular one-parameter subgroup over `W_G`. It proves the complexification criterion for parabolic subalgebras of a reductive Lie algebra with centre, without the component condition. The self-adjoint matrix groups carry all of this structure; that matrix model is the statement form pinned in Lean, and real points of connected reductive groups over `ℝ` are among them. The abstract Tits-system theory is Tau Ceti's and is consumed; one abstract statement that Tau Ceti lacks, the equality of conjugate standard parabolics, is proved here.

## Scope and ownership

This roadmap owns the following material on a real reductive group:

- the reductive Cartan datum: LieGroups' `CartanInvolution`, retaining its global matrix model, equipped with a compatible invariant form, and its restriction to the identity component;
- conjugacy of the underlying Cartan involutions and of the Iwasawa triples of reductive data with a common split centre, by an element of `G⁰`, for disconnected groups and finite central covers;
- the simple-root subsystems `Σ_{Π'}` of a possibly non-reduced restricted root system and the reflection generation of chamber stabilizers;
- conjugacy of maximal abelian subspaces of `𝔭` under the identity component `K⁰` of `K`, the factorizations `K = N_K(𝔞)·K⁰` and `G = N_K(𝔞)·G⁰`, the reflection representatives in `K⁰` and the carrying of `𝔞` into the closed positive chamber by `N_{K⁰}(𝔞)`;
- the comparison of `N_K(𝔞)/Z_K(𝔞)` with the Weyl group of `Σ` without the component condition, and the component condition with its equivalent forms;
- the minimal parabolic subgroup `P = MAN` and its Langlands decomposition for every reductive Cartan datum, extending AutomorphicFormsOnReductiveGroups §2.3a and RealSemisimpleLieGroups §3.1 (below), and the minimal parabolic datum of an Iwasawa triple satisfying the component condition;
- the Bruhat decomposition over `N_K(𝔞)/Z_K(𝔞)` with its cell coordinates, without the component condition;
- the group `⁰L` and the split component of a datum whose components act on its split centre;
- the dynamical description of regular one-parameter subgroups without the component condition;
- the complexification criterion for parabolic subalgebras of a reductive Lie algebra with centre, without the component condition;
- the invariant-form adapter for self-adjoint matrix groups (the tangent identification is Tau Ceti's), and the matrix forms of the results above, among them the splitting of a self-adjoint matrix group into the joint kernel of its real characters and the exponential of its invariant split centre;
- the identification of the real points of a connected reductive `ℝ`-group in a transpose-stable embedding as a self-adjoint matrix group satisfying the component condition.

It also owns one abstract statement about Tits systems that Tau Ceti lacks: an element conjugating `B` into a standard parabolic `P_J` lies in `P_J`, so conjugate standard parabolics are equal. For the Tits system of a real minimal parabolic datum whose `M` meets every component, the equality is the uniqueness of type of RealSemisimpleLieGroups §4.4. FlagVarieties states the same facts for a connected reductive group `G` over an algebraically closed field `k`, its standard parabolic subgroups and `g ∈ G(k)`: §3.1 the uniqueness of the standard representative, §3.2 self-normalization, and §5.2 the fixed points of `B` and of `P_J` on `G/P_K`, which are the conjugations of `B` and of `P_J` into `P_K`. Its route is the conjugacy of Borel subgroups inside `P_K` together with `N_G(B) = B`. §6.1 here holds for an arbitrary Tits system, with no algebraic group or field, and its route is the Bruhat decomposition alone, so it also covers the Tits systems of real Lie groups and of `GL_n(k)` over a field `k` that is not algebraically closed, where FlagVarieties does not apply.

The following are already in the library or stated by other roadmaps, and are imported:

- **Already in the library.** Tau Ceti has the abstract Bruhat decomposition of a Tits system, its standard parabolic subgroups `P_J`, the classification of subgroups containing `B`, self-normalization of `P_J` and the double cosets `P_J \ G / P_K`. RealSemisimpleLieGroups §§3.3 and 4.2 build on them; §6.1 here uses the standard parabolics directly. The finite root-system fact used in §2.1 (stabilizers of chamber points) is in Tau Ceti for reduced systems.
- **Stated by LieGroups.** Layers 0–3 supply the exponential map, `Ad`, the closed-subgroup theorem and the Lie functor; Layer 6 supplies maximal tori of compact connected groups and their Weyl groups; Layer 7 supplies complexification. Layer 9 owns finite central matrix-cover models, the global polar diffeomorphism, compactness and maximality of `K`, `Ad(K)𝔞 = 𝔭`, the Cartan decomposition `𝔤 = 𝔨 ⊕ 𝔭`, the Iwasawa decomposition `iwasawaDecomposition`, the KAK decomposition `kakDecomposition`, the restricted root system with its root spaces, and the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` with its compact normalizer representatives of the restricted reflections and the coverage of `𝔞` by normalizer translates of the closed positive chamber. They are not restated here: beside Layer 9's `Ad(K)𝔞 = 𝔭`, §2.2 proves the form under `K⁰`, the conjugacy of two maximal abelian subspaces, the factorizations `K = N_K(𝔞)·K⁰`, `G = N_K(𝔞)·G⁰` and, in (e), the reflection representatives in `K⁰`; §2.4 compares `W_G` with `W(Σ)`; and §2.3 proves the chamber coverage by `N_{K⁰}(𝔞)` from an Iwasawa triple alone, because that coverage is a field of the `IwasawaData` which §2.3 constructs.
- **Stated by RealSemisimpleLieGroups.** Its §0.2 proves conjugacy of the Cartan involutions of a real semisimple Lie algebra under inner automorphisms. Its §1.3 proves that maximal abelian subspaces of `𝔭` are conjugate under `K_θ ⊆ Int(𝔤₀)` for semisimple `𝔤₀`. Its §1.2 packages the restricted root system with its positive systems, simple roots and indivisible subsystem, the simple transitivity of `W(Σ)` on positive systems and the sign-coherent integer expansion of roots in simple roots. Its §2.3 proves `W_G = W(Σ)` when `M` meets every component of `G`, and that `M` meets every component of the real points of a connected reductive `ℝ`-group. Its §3.1 states the minimal parabolic subgroup for connected groups with semisimple Lie algebra and finite centre and defines a minimal parabolic datum. For a minimal parabolic datum whose `M` meets every component, its §§3.2–3.3 prove `N_G(𝔞) ∩ P = MA`, the rank-one decompositions, the open dense big cell, the Tits system `(P, N_G(𝔞))` and the Bruhat decomposition over `W(Σ)` with its cells. In the same setting its §4.1 treats the standard parabolic subalgebras, their classification and their eigenspace description, its §4.2 the standard parabolic subgroups and its §4.3 their Levi subgroups and Langlands decompositions. Its §4.4 treats parabolic subgroups and subalgebras, their type, the complexification criterion through `TauCeti.borelSubalgebra` and the dynamical parabolic `dynamicalParabolic`. Its §4.5 compares standard parabolics with algebraic `ℝ`-parabolic subgroups on all chamber faces. Its §5.4 proves conjugacy of `CartanInvolution` data on a group with semisimple Lie algebra. Section 3.5 here makes every Iwasawa triple satisfying the component condition a minimal parabolic datum, so those results apply to this roadmap's class; each variant kept here says in one clause how it differs. The matrix sets and predicates of Layer 7 (`dynamicParabolic`, `nonnegEigenspaces`, `IsMaximalAbelianSymmetric`) are readings, on self-adjoint matrix groups, of its `dynamicalParabolic`, its `nonnegEigenSubmodule` and its maximal abelian subspaces of `𝔭`, which live on the Lie-group and Lie-algebra carriers; §§7.2–7.3 state the comparisons.
- **Recorded by RootSystems.** Its section "Exact supplier contracts" records the Mathlib and Tau Ceti declarations on root systems, bases, positive roots, chambers and Weyl groups that §2.1 consumes. None of its own targets (geometric roots, faithfulness, the Weyl presentation) is used.
- **Stated by ArithmeticLocallySymmetricSpaces.** ALS.F.1 supplies real points of linear algebraic groups and their transpose-stable realizations, ALS.0.1 algebraic Cartan involutions, and ALS.0.2 the Lie-theoretic Cartan datum of real points.

The roadmap does not own:

- harmonic analysis or representation theory on `G` (principal series, normalized induction, the Casselman embedding);
- `θ`-stable parabolic subalgebras of `𝔤_ℂ` and cohomological induction;
- Cartan subgroups;
- the algebraic and rational parabolics over arbitrary fields, horospherical decompositions and the Borel–Serre compactification;
- the comparison of standard parabolic subgroups with algebraic `ℝ`-parabolic subgroups, which is RealSemisimpleLieGroups §4.5;
- the nonarchimedean Iwasawa, Cartan and Iwahori–Bruhat decompositions;
- the complex Bruhat decomposition and Schubert cells of `G_ℂ/B`, which belong to LieGroups Layer 8 and to ReductiveGroups Layer 7 (the split Bruhat decomposition) and Layer 7C (the cells);
- the rational split component: AdelicAlgebraicGroups §2.1 owns, for a connected reductive group `G` over a number field `F`, the group `A_G(ℝ)⁰`, the identity component of the real points of the largest `ℚ`-split central torus of `Res_{F/ℚ} G`, with the rational characters and the map `H_G`. The split component here (`A_G = lieExp(𝔷_𝔭)` in §1.1, `A_L = lieExp(𝔷(𝔩) ∩ 𝔭_L)` in §5.1, `exp(V)` in §7.4) belongs to a real Lie group with a reductive Cartan datum, and `⁰L` is cut out by all continuous homomorphisms to `ℝ_{>0}`, not by the absolute values of rational characters. On the real points `(Res_{F/ℚ} G)(ℝ)` of §8.1 the real split component can be strictly larger than `A_G(ℝ)⁰` (§7.4, Checks).

AutomorphicFormsOnReductiveGroups §2.3a owns `M`, `A`, `N`, the minimal parabolic subgroup `P = MAN`, its Langlands decomposition and the conjugacy of minimal parabolic subgroups for the real points of connected reductive `ℝ`-groups, together with their comparison with minimal algebraic `ℝ`-parabolic subgroups, which is not stated here. RealSemisimpleLieGroups §3.1, built on it, owns the same objects for connected groups with semisimple Lie algebra and finite centre. Layer 3 states the same facts for every reductive Cartan datum: finite central covers, reductive Lie algebras with centre, disconnected groups and closed transpose-stable matrix groups that are not the real points of an algebraic group, without the component condition unless stated. On the two classes above its statements are theirs (Layer 8 places the first in the matrix model of Layer 7); its proofs work on the datum and use neither, and RealSemisimpleLieGroups §3.1 is consumed only for its definition of a minimal parabolic datum (§3.5). RealSemisimpleLieGroups owns the parabolic theory of a minimal parabolic datum with the component condition; this roadmap consumes it and owns what lies beyond that condition.

## Conventions

**The group.** `G` is a real, finite-dimensional, `C^∞` Lie group in the sense of LieGroups Layer 0: `LieGroup I ∞ G` on a model `I : ModelWithCorners ℝ E H` with `[FiniteDimensional ℝ E]`, `[T2Space G]` and `[BoundarylessManifold I G]`, as required by the base Cartan structures. Its Lie algebra is `𝔤 = LeftInvariantDerivation I G`. The base's `lieExp`, `Ad`, `lieMap` and `lieSubalgebraOfSubgroup` are used throughout; for a subgroup `H ≤ G` write `Lie(H)` for `lieSubalgebraOfSubgroup H`. `G⁰` is the identity component. For a subset `S ⊆ 𝔤`, `Z_G(S)` and `N_G(S)` are the pointwise and setwise stabilizers of `S` under `Ad`. For subsets of `G` use Mathlib's `Subgroup.centralizer` and `Subgroup.normalizer`. `G` is not assumed connected, semisimple, linear or of finite centre.

**The datum.** A reductive Cartan datum `D = (C, B)` (§1.1), where `C` is the full base Cartan datum with involution `θ` and chosen finite central matrix-cover model, has fixed group `K = G^θ`, with `𝔨` and `𝔭` the `+1` and `−1` eigenspaces of `dθ = lieMap θ`. The inner product is `B_θ(X, Y) = −B(X, dθ Y)`. The centre is `𝔷 = 𝔷(𝔤)`, and its split central part is `𝔷_𝔭 = 𝔷 ∩ 𝔭`.

**Iwasawa triples.** An Iwasawa triple `(D, 𝔞, Σ⁺)` consists of a maximal abelian subspace `𝔞 ⊆ 𝔭` and a positive system `Σ⁺` of the restricted roots `Σ = Σ(𝔤, 𝔞)`. An **Iwasawa pair** `(D, 𝔞)` is a reductive Cartan datum with a maximal abelian subspace `𝔞 ⊆ 𝔭`, that is, an Iwasawa triple without its positive system. `Σ`, `W(Σ)`, `M`, `W_G` and the component condition (§2.5) depend on the pair only. Every pair extends to a triple, since `Σ` is finite and an `H₀` off the kernels of its roots exists. The Iwasawa triples here are not LieGroups' `IsIwasawaTriple K A N`, which says that three subgroups are the `K`, `A`, `N` of some `IwasawaData`; by §2.3 the subgroups `(K, lieExp 𝔞, lieExp 𝔫)` of an Iwasawa triple satisfy it. The root space of `β ∈ 𝔞*` is `𝔤^β = {X ∈ 𝔤 : ⁅H, X⁆ = β(H) X for all H ∈ 𝔞}`. A **positive system** is a set `Σ⁺ = {β ∈ Σ : β(H₀) > 0}` for some `H₀ ∈ 𝔞` with `β(H₀) ≠ 0` for all `β ∈ Σ`; its **simple roots** are the elements of `Σ⁺` that are not sums of two elements of `Σ⁺`. RealSemisimpleLieGroups §1.2 identifies the simple roots with a base of the indivisible subsystem `Σ_ind = {β ∈ Σ : β/2 ∉ Σ}`. Further notation:

- `𝔪 = Z_𝔨(𝔞)` and `M = Z_K(𝔞)`;
- `𝔫 = ⨁_{β ∈ Σ⁺} 𝔤^β`, `𝔫̄ = dθ 𝔫`, `A = lieExp 𝔞`, `N = lieExp 𝔫`, `N̄ = θ(N)`;
- `P = MAN`;
- `Π` is the set of simple roots of `Σ⁺`, and `W = W(Σ)` is the Weyl group of `Σ` acting on `𝔞`;
- `W_G = N_K(𝔞)/Z_K(𝔞)` is LieGroups Layer 9's restricted Weyl group, acting on `𝔞` by `Ad`, and `n_w ∈ N_K(𝔞)` denotes a representative of `w`;
- for `Π' ⊆ Π`: `Σ_{Π'} = Σ ∩ span(Π')` and `W_{Π'} = ⟨s_α : α ∈ Π'⟩`;
- for `Π' ⊆ Π`, the standard parabolic subalgebra `𝔮_{Π'} = 𝔪 ⊕ 𝔞 ⊕ ⨁_{β ∈ Σ⁺ ∪ Σ_{Π'}} 𝔤^β`, with `𝔞_{Π'}`, `𝔩_{Π'}` and `𝔫_{Π'}`, are those of RealSemisimpleLieGroups §4.1, and under the component condition the subgroups `Q_{Π'} = N_G(𝔮_{Π'})`, `L_{Π'} = Z_G(𝔞_{Π'})`, `A_{Π'}`, `N_{Π'}` and `M_{Π'}` are those of its §§4.2–4.3, applied to the minimal parabolic datum of §3.5.

**Sign conventions, with witnesses.**

- *Root spaces.* For `G = GL_2(ℝ)`, `H = diag(h₁, h₂)` and `E₁₂` the matrix unit, `⁅H, E₁₂⁆ = (h₁ − h₂) E₁₂`. So `E₁₂ ∈ 𝔤^{e₁−e₂}`. The positive system containing `e₁ − e₂` makes `𝔫 = ℝE₁₂`, and `P` is the upper triangular group.
- *Langlands decomposition.* The order is `(m, a, n) ↦ m a n`. In `SL_2(ℝ)`, `((a, b), (0, a⁻¹)) = (sgn a)·diag(|a|, |a|⁻¹)·((1, b/a), (0, 1))`.
- *Dynamical description.* For `X ∈ 𝔞` and `Y ∈ 𝔤^β`, `lieExp(−tX)·lieExp(Y)·lieExp(tX) = lieExp(e^{−tβ(X)} Y)`. For `Y ≠ 0` this stays relatively compact as `t → +∞` iff `β(X) ≥ 0`, and tends to `1` iff `β(X) > 0`; for `Y = 0` it is constantly `1` regardless of `β(X)`. For `GL_2(ℝ)` and `X = diag(1, 0)`, `exp(−tX)((a, b), (c, d))exp(tX) = ((a, e^{−t}b), (e^{t}c, d))`, which is bounded iff `c = 0`: the upper triangular group again. This is the sign of RealSemisimpleLieGroups' `dynamicalParabolic`.
- *Comparison with Tau Ceti's dynamic parabolic.* `TauCeti.Cocharacter.parabolic` is the set of `g` for which `t ↦ λ(t) g λ(t)⁻¹` extends over `t = 0`. For `λ(t) = diag(t, 1)` in `GL_2`, `λ(t)((a, b), (c, d))λ(t)⁻¹ = ((a, tb), (t⁻¹c, d))`, which extends iff `c = 0`. With `X_λ = dλ(1)` one has `λ(e^{−s}) = lieExp(−s X_λ)`, so `s → +∞` corresponds to `t → 0`. The two conventions agree.
- *Standard parabolic subalgebras* use `Σ⁺ ∪ Σ_{Π'}` (Brown–Rodriguez Hertz–Wang 2022, equation (1), §1.2), as in RealSemisimpleLieGroups' Conventions. This is the same set as `Σ⁺ ∪ span(−Π')` of Brown–Fisher–Hurtado 2022, §3.1, since `span(−Π') = span(Π')`. For `SL_3(ℝ)` and `Π' = {e₁ − e₂}`, `Σ⁺ ∪ Σ_{Π'}` adds `e₂ − e₁` to `Σ⁺`, and `𝔮_{Π'}` is the `(2, 1)`-block upper triangular algebra; indexing by the complement `Π ∖ Π'` would give the `(1, 2)` blocks.
- *Bruhat cells* are two-sided `P`-cosets `P n_w P`. `W` acts on `𝔞` on the left, with `s_α(H) = H − α(H)H_α` where `α(H_α) = 2`.

## Exact supplier contracts

The baseline is Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

### From Mathlib

- `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`) and `LeftInvariantDerivation` (`Mathlib/Geometry/Manifold/Algebra/LeftInvariantDerivation.lean`) are the group and its Lie algebra.
- `LieAlgebra.center`, `LieAlgebra.derivedSeries` and `LieAlgebra.IsSemisimple` are the reductivity fields of LieGroups' `CartanInvolution`. `LieAlgebra.IsSolvable` (`Mathlib/Algebra/Lie/Solvable.lean`) is used for Borel subalgebras. `LinearMap.BilinForm` carries the invariant form.
- `Subgroup.normalizer`, `Subgroup.centralizer`, `DoubleCoset.doubleCoset` and `DoubleCoset.Quotient` (`Mathlib/GroupTheory/DoubleCoset.lean`) are used for normalizers, centralizers and Bruhat cells. `DoubleCoset.Quotient` is the quotient `H \ G / K` of a group by two subsets; it carries no topology.
- `RootPairing`, `RootPairing.IsReduced`, `RootPairing.Base`, `RootPairing.weylGroup` (`Mathlib/LinearAlgebra/RootSystem/`) are the root-system carrier. `RootPairing.Base` requires the coroots to lie in the coroot monoid of the support. So the non-reduced system `BC₁ = {±λ, ±2λ}` has no `RootPairing.Base`: the coroot of `2λ` is half that of `λ`. Section 2.1 therefore works with the indivisible subsystem.
- `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`Mathlib/Analysis/InnerProductSpace/JointEigenspace.lean`): a commuting family of symmetric operators on a finite-dimensional inner product space decomposes it as the internal direct sum of its joint eigenspaces. Section 2.2 applies it to `ad 𝔞` on `(𝔤, B_θ)`.
- `NormedSpace.exp` (`Mathlib/Analysis/Normed/Algebra/Exponential.lean`), with `Matrix.exp_transpose` and `Matrix.exp_conj` (`Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`), is the exponential of the matrix model.
- `Matrix.GeneralLinearGroup` and `unitarySubgroup` (`Mathlib/Algebra/Star/Unitary.lean`; for real matrices this is `O(n)`) give the ambient group and `O(n)` as a `Subgroup` of it. Mathlib's other classical matrix groups are carriers of other types: `Matrix.SpecialLinearGroup` is the subtype of matrices of determinant one, sent into `GL` by the injective `Matrix.SpecialLinearGroup.toGL`, whose range is the kernel of `Matrix.GeneralLinearGroup.det` (`Matrix.SpecialLinearGroup.range_toGL_eq_ker_det`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`); `Matrix.orthogonalGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`, the unitary group of real matrices, so `O(n)` for `R = ℝ`) is a `Submonoid` of `Matrix n n R`, and the matrix statements write membership of `k` in `O(n)` as `kᵀk = 1`; and `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean`) is a `Submonoid` of `Matrix (l ⊕ l) (l ⊕ l) R`, cut out by `A·J·Aᵀ = J` with `Matrix.J` the block matrix `((0, −1), (1, 0))`. The statements of Layer 7 take a `Subgroup (GL (Fin n) ℝ)`, and these groups enter them as the subgroups of `GL (Fin n) ℝ` cut out by the same equations, after reindexing `l ⊕ l ≃ Fin n` for the symplectic group.
- `ConnectedComponents`, `connectedComponentIn` and `Filter.Tendsto` (for the product topology on `Matrix`) are used in the matrix-model definitions. `Matrix` has no `Bornology` instance at the pin: the matrix norms of `Mathlib/Analysis/Matrix/Normed.lean` are scoped instances (`Matrix.Norms.Elementwise`, `Matrix.Norms.Frobenius`, `Matrix.Norms.Operator`), and `CStarMatrix` is a separate type synonym. Boundedness of a family of matrices is therefore stated entrywise.
- `LieRing.ofAssociativeRing` (`Mathlib/Algebra/Lie/OfAssociative.lean`) is a definition used as a local instance, not a global instance, so `Matrix (Fin n) (Fin n) ℝ` is not a Lie ring by instance search at the pin. The matrix statements of Layer 7 write `ad Y` as `LinearMap.mulLeft ℝ Y − LinearMap.mulRight ℝ Y`, take its eigenspaces with `Module.End.eigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean`), and treat a Lie subalgebra of matrices as a `Submodule` closed under commutators.
- `Multiplicative ℝ` with its topology carries the real characters of §7.4: a continuous homomorphism `G →* Multiplicative ℝ` is a continuous homomorphism to `(ℝ, +)`, and `log` identifies these with the continuous homomorphisms to `(ℝ_{>0}, ·)`.
- `MvPolynomial`, `MvPolynomial.eval` and `MvPolynomial.map` describe in §8.1 a real algebraic subgroup of `GL_n` by real polynomials in the `n²` entries, with its real and complex points as zero loci in `GL (Fin n) ℝ` and `GL (Fin n) ℂ`.

### From Tau Ceti

- `map_lieExp` (`TauCeti/Geometry/Lie/Functor.lean:315`) intertwines the exponentials for a smooth homomorphism between finite-dimensional real Lie groups. `lieMap_injective` (`TauCeti/Geometry/Lie/Faithfulness.lean:50`) makes the Lie map faithful on smooth homomorphisms with finite-dimensional real source and target and preconnected source; §1.2 applies it on `G⁰`, not on disconnected `G`.
- `TauCeti.TitsSystem` (`TauCeti/GroupTheory/TitsSystem/Basic.lean`) is a Tits system with its simple reflections in `N/(B ∩ N)`. Its axioms are generation, normality of `B ∩ N` in `N`, generation and involutivity of the simple reflections, the multiplication inclusion `BsB·BwB ⊆ BswB ∪ BwB`, and `sBs⁻¹ ⊄ B` for a representative `s` of each simple reflection (equivalently `sBs ≠ B`, since `s² ∈ B`). `TauCeti.TitsSystem.bruhatCell` (`Bruhat/Basic.lean`) is the cell `BwB`.
- `TauCeti.TitsSystem.standardParabolic`, `TauCeti.TitsSystem.mem_standardParabolic_iff`, `TauCeti.TitsSystem.standardParabolic_empty` (`Parabolic/Basic.lean`) and `TauCeti.TitsSystem.coxeterSystem` (`Coxeter.lean`) are the standard parabolic `P_J`, indexed by a set `J` of simple reflections, its membership criterion (`g ∈ P_J` iff the Bruhat cell of `g` is indexed by an element of the subgroup `W_J`), the equality `P_∅ = B` and the Coxeter system of the Weyl group. `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean`) is the abstract Bruhat decomposition, `TauCeti.TitsSystem.standardParabolic_le_standardParabolic_iff` (`Parabolic/Classification.lean`) says `P_J ≤ P_K` iff `J ⊆ K`, and `TauCeti.TitsSystem.normalizer_standardParabolic` (`Parabolic/Normalizer.lean`) is the self-normalization of `P_J`. No finiteness, field or topology is assumed. The classification of overgroups of `B` and the double cosets are consumed through RealSemisimpleLieGroups §4.2. Nothing in `GroupTheory/TitsSystem/` says that an element conjugating `B` into `P_J` lies in `P_J`, or that conjugate standard parabolics are equal; that is §6.1 here.
- `TauCeti.stabilizer_eq_closure_wallReflections` (`TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean`) says the stabilizer of a closed-chamber point is generated by the wall reflections through it, and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (same file, for a root system) that every Weyl orbit meets the closed dominant chamber in exactly one point. Both assume a strict ordered ring, finite, crystallographic, and reducedness of the pairing and its flip.
- `TauCeti.glTitsSystem` and `TauCeti.glTitsSystemWeylGroupMulEquivPerm` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean`) require `[Field k] [Nontrivial kˣ]` and give the upper-triangular Tits system of `GL_{n+1}(k)` and its Weyl group `S_{n+1}`. Its `N` is the normalizer of the diagonal subgroup of points; over `𝔽₂` this subgroup is trivial, so the ambient normalizer cannot be identified with the monomial group in dimension at least two.
- `TauCeti.iwasawaHomeomorph` and `Matrix.GeneralLinearGroup.existsUnique_iwasawa` (`…/GeneralLinearGroup/Iwasawa.lean`) give the `O(n)·(positive diagonal)·(upper unitriangular)` decomposition of `GL_n(ℝ)`. `TauCeti.upperTriangularGroup`, `TauCeti.upperUnitriangularGroup` and `TauCeti.posDiagonalSubgroup` are its factor groups.
- `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`…/RestrictedWeylGroup.lean`) identifies the restricted Weyl group `N_K(A)/Z_K(A)` of `GL_n(ℝ)` with `S_n`.
- `TauCeti.GL2Borel.mem_doubleCoset_weyl_iff` (`…/GeneralLinearGroup/Bruhat.lean`) says membership in the big cell of `GL_2` is invertibility of the lower-left entry.
- `TauCeti.mem_doubleCoset_permutationGL_iff` and `TauCeti.eq_and_eq_of_mul_permutationGL_mul_eq` (`…/GeneralLinearGroup/UpperUnitriangular/BruhatCell.lean`) give, over any commutative ring, the normal form `j·P_w·b` of an element of the double coset of the permutation matrix `P_w` under the upper triangular group, with `j` in `TauCeti.unitriangularInversionGroup R w`, the upper unitriangular matrices lying in `P_w B⁻ P_w⁻¹` for the lower triangular `B⁻`, and `b` upper triangular, both unique. For `GL_n(ℝ)` this is the permutation-matrix case of the cell coordinates of §7.3.
- `Matrix.GeneralLinearGroup.existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary` (`…/Cartan.lean`) is the KAK decomposition of `GL_n`, and `Matrix.GeneralLinearGroup.maximal_isCompact_iff` (`…/MaximalCompact.lean`) characterizes the maximal compact subgroups of `GL_n`.
- `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary` (`TauCeti/Analysis/Matrix/Polar.lean`) is the uniqueness of the matrix polar decomposition: every invertible matrix is uniquely a positive definite matrix times a unitary one, in that order. The base Layer 9 owns its application to closed transpose-stable matrix groups.
- `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.limit` (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`) are the dynamic parabolic of a cocharacter on points and its limit retraction; they are the algebraic analogues against which the sign convention and §§6.2 and 7.2 are compared.
- `TauCeti.borelSubalgebra` (`TauCeti/Algebra/Lie/Weights/Borel.lean`) is the Borel subalgebra `𝔥 ⊕ 𝔫⁺` of a positive system, for a Killing Lie algebra with a splitting Cartan subalgebra.
- `TauCeti.Lie.unitsLieAlgebraLieEquiv` (`TauCeti/Geometry/Lie/Adjoint/Units/Basic.lean`) identifies the Lie algebra of the units `Rˣ` of a finite-dimensional real normed algebra `R` with `R`, and `TauCeti.Lie.unitsLieAlgebraEquiv_Ad` (same file) makes `Ad g` conjugation by `g` there. `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff` (`TauCeti/Geometry/Lie/Subgroup/Units.lean`) says that, for a closed subgroup `K ≤ Rˣ`, `x ∈ R` lies in the Lie algebra of `K` iff `TauCeti.expUnit (t • x) ∈ K` for all real `t`, and `TauCeti.expUnit_coe` (`TauCeti/Geometry/Lie/Exponential/Units/Basic.lean`) identifies `TauCeti.expUnit x` with `NormedSpace.exp x`. For matrices these need one of Mathlib's scoped matrix norms; §7.1 applies them to `R = Matrix (Fin n) (Fin n) ℝ`, and `linearLieAlgebra` is their reading on matrices, without a norm instance.

### From TauCetiRoadmap.LieGroups

- Layers 0–3: `lieExp`, `oneParameterSubgroup`, `Ad`, the conjugation law `g·lieExp X·g⁻¹ = lieExp(Ad g X)` (native as `TauCeti.Lie.conj_lieExp`), the identity `Ad(lieExp X) = exp(ad X)` (native on the tangent carrier as `TauCeti.Lie.tangentAd_mulInvariantExp_apply`, transported to `𝔤` in Layer 1), the matrix shadows (on `GL (Fin n) ℝ`, `lieExp` is the matrix exponential and `Ad g` is conjugation by `g`), `lieSubalgebraOfSubgroup`, `isEmbeddedLieSubgroup_of_isClosed`, `lieMap`; exponential naturality and faithfulness are the native Tau Ceti declarations above. Layer 6, for a compact connected group with a maximal torus `T`: conjugacy of maximal tori (`isConj_of_isMaximalTorus`), `Lie(T)` maximal abelian, and `weylGroup T = N(T)/T` acting on `Lie(T)` as the Weyl group of the roots of `(Lie(G)_ℂ, Lie(T)_ℂ)`, transitively and freely on chambers; §2.5 uses them for axiom (v). Layer 7: the complexification `𝔤 ⊗_ℝ ℂ`.
- Layer 9: the structures `CartanInvolution`, `IsRealReductive` and `IwasawaData`, and the theorems `iwasawaDecomposition` and `kakDecomposition`. Layer 9 also supplies the restricted root system: the eigenvalues of `ad 𝔞` are real, `𝔤 = 𝔤_0 ⊕ ⨁_{β ∈ Σ} 𝔤^β` with `𝔤_0 = 𝔪 ⊕ 𝔞`, `dθ 𝔤^β = 𝔤^{−β}`, `⁅𝔤^β, 𝔤^γ⁆ ⊆ 𝔤^{β+γ}`, and `Σ` is a possibly non-reduced finite crystallographic root system in the span of `Σ` inside `𝔞*`. It also supplies the restricted Weyl group `W_G = N_K(𝔞)/Z_K(𝔞)`, the actual normalizer quotient acting faithfully on `𝔞` by `Ad`; for each `β ∈ Σ`, an element of `N_K(𝔞)` acting on `𝔞` as the reflection `s_β`; and chamber coverage: every `Ad(N_K(𝔞))`-orbit in `𝔞` meets the closed positive chamber, walls and the zero-root case included. In LieGroups' Lean statements the coverage is the field `chamber_normalizer_cover` of `IwasawaData`, and RealSemisimpleLieGroups (Scope and ownership) reads the root-space decomposition, the reflection representatives and the coverage as statements about a group carrying an `IwasawaData`. This roadmap therefore consumes them only for the `IwasawaData` of §2.3, and §2.3 constructs that datum without them: the decomposition of `𝔤` into joint eigenspaces of `ad 𝔞` is §2.2, step 1; the reflection representatives are those in `K⁰` of §2.2 (e); and §2.3 proves the field `chamber_normalizer_cover` from these. Nothing in Layer 9 places the reflection representatives in `K⁰` or compares `W_G` with `W(Σ)`; that is §2.2 (e) and §2.4.
- Layer 9: `CartanInvolution` retains `global_model : FiniteCartanMatrixModel G θ`: a finite central covering onto a closed transpose-stable matrix subgroup with finitely many components, compatible with transpose-inverse, fixing the entire compact preimage pointwise. It also requires compact fixed group and the centre/semisimple-derived splitting. Its `cartan_polar_decomposition` and README polar diffeomorphism, compactness/maximality and central periods are consumed directly. Layer 9 proves `Ad(K)𝔞 = 𝔭`; §2.2 proves the form under `K⁰`, the conjugacy of two maximal abelian subspaces and the factorizations `K = N_K(𝔞)·K⁰`, `G = N_K(𝔞)·G⁰`, without consuming it. The nontrivial involution of `SU(2)` and inversion of the circle fail this base datum already.
- `IwasawaData` includes exact nonzero restricted roots and their simultaneous eigenspaces, positive-root sign and addition laws, closed connected exponential `N`, injectivity on `𝔞`, the Lie complement, a separate closed connected root-generated `Nplus`, and the closed chamber defined by positive-root inequalities, spanning `𝔞`, covered by the compact normalizer action and containing the full split centre as lineality. Section 2.3 sets `N = Nplus`.

### From TauCetiRoadmap.RealSemisimpleLieGroups

The carrier there is LieGroups Layer 9's `CartanInvolution` and `IwasawaData`, the same as here. Its Layers 3–4 take a minimal parabolic datum whose `M` meets every component of `G`; §3.5 supplies one for every Iwasawa triple satisfying the component condition, and for the restriction of every Iwasawa triple to `G⁰`. Only statements about a single such datum are consumed; the conjugacy of triples in its §3.1 is replaced here by §2.6 (equal split central parts).

- §0.2 (`exists_conj_cartanInvolution`): any two Cartan involutions `σ, σ'` of a real semisimple Lie algebra satisfy `σ' = e^{ad Z} σ e^{−ad Z}` for some `Z` in the `−1`-eigenspace of `σ`. It also defines `Int(𝔤₀)` with its adjoint `CartanInvolution` datum. Consumed in §§1.2, 2.5 and 6.3.
- §1.2: for a real Lie algebra with a reductive Cartan involution and a maximal abelian `𝔞 ⊆ 𝔭`, the restricted roots form a possibly non-reduced root system, read on `[𝔤, 𝔤]` with every root vanishing on `𝔭 ∩ 𝔷`; its indivisible subsystem is reduced with the same Weyl group and chambers; positive systems correspond bijectively to bases of the indivisible subsystem, the simple roots being indivisible; `W(Σ)` acts simply transitively on positive systems; every root is an integer combination of `Π` with coefficients all `≥ 0` or all `≤ 0`. Consumed in Conventions and §§2.1, 2.3, 2.5, 2.6, 4.1, 4.2 and 6.3.
- §2.3: for `G` with an `IwasawaData`, `W_G = W(Σ)` when `M` meets every component of `G`, in particular for connected `G`, and `W_G` is then generated by the simple reflections; and `M` meets every component of `𝐆(ℝ)` for `𝐆` connected reductive over `ℝ` with the transpose-inverse datum of a transpose-stable realization. Consumed in §§2.4, 2.5 (for `G⁰`) and 8.1.
- §3.1: the definition of a minimal parabolic datum, an `IwasawaData` with `N = Nplus` together with `M`, `P`, `Σ⁺` and the conclusions listed there. Supplied here by §3.5.
- §§3.2–3.3: for a minimal parabolic datum whose `M` meets every component, `N_G(𝔞) ∩ P = MA`, `MA` normal in `N_G(𝔞)` with quotient `W_G`, the big cell `N̄ × M × A × N → G` a diffeomorphism onto an open dense subset, the `TauCeti.TitsSystem` with `B = P`, `N = N_G(𝔞)` and simple reflections `s_α`, `α ∈ Π`, and the Bruhat cells `PwP`, embedded submanifolds with `NwP/P ≅ N ∩ wN̄w⁻¹` of dimension `Σ m_λ` over the `λ ∈ Σ⁺` with `w⁻¹λ < 0`. `exists_titsSystem` is its statement for connected groups with semisimple Lie algebra and finite centre. Consumed in §§4.2 and 7.3.
- §4.1: for a minimal parabolic datum, `𝔮_{Π'}` is a subalgebra, `Π' ↦ 𝔮_{Π'}` is an inclusion-preserving bijection onto the subalgebras containing `𝔮_∅`, `𝔮_{Π'} = 𝔩_{Π'} ⊕ 𝔫_{Π'}` with `𝔩_{Π'} = Z_𝔤(𝔞_{Π'}) = 𝔮_{Π'} ∩ dθ𝔮_{Π'}`, and for `X` in the closed positive chamber with `{α ∈ Π : α(X) = 0} = Π'`, `𝔮_{Π'}` is `nonnegEigenSubmodule X`, the sum of the eigenspaces of `ad X` with nonnegative eigenvalue. Consumed in Conventions and §§6.2, 6.3 and 7.3, through the restriction to `G⁰` where no component condition is assumed.
- §4.2: `Q_{Π'}`, the `standardParabolic` of the Tits system for the reflections in `Π'`; `Π' ↦ Q_{Π'}` is an inclusion-preserving bijection onto the subgroups containing `P`; `Q_{Π'} = N_G(𝔮_{Π'})` is closed and self-normalizing with Lie algebra `𝔮_{Π'}`. Consumed in §§6.2 and 7.3.
- §4.3: `L_{Π'} = Z_G(𝔞_{Π'}) = Q_{Π'} ∩ θ(Q_{Π'})`, `M_{Π'} × A_{Π'} ≅ L_{Π'}`, `Q_{Π'} = L_{Π'} ⋉ N_{Π'}` and the Langlands decomposition `M_{Π'} × A_{Π'} × N_{Π'} ≅ Q_{Π'}`. Consumed in §§5.1, 6.2 and 7.2.
- §4.4: `dynamicalParabolic X = Q_{Π'}` for `X` in the closed positive chamber with `{α ∈ Π : α(X) = 0} = Π'`; parabolic subalgebras as the `Ad(G)`-conjugates of the `𝔮_{Π'}`, and the criterion that a real subalgebra is parabolic iff its complexification contains a `TauCeti.borelSubalgebra`. Consumed in §§6.2, 6.3 and 7.3. Its uniqueness of the type of a parabolic subgroup is the second statement of §6.1 for that Tits system; §6.1 is stated for an arbitrary Tits system and does not consume it.

### From TauCetiRoadmap.RootSystems

Only its section "Exact supplier contracts" is consumed, as the record of the root-system declarations of Mathlib (`RootPairing`, `RootPairing.Base`, `RootPairing.IsReduced`, `RootPairing.weylGroup`) and Tau Ceti (`TauCeti.stabilizer_eq_closure_wallReflections`, `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`) listed above, all for finite reduced crystallographic pairings. No target of RootSystems is an input: §2.1 cites those declarations directly. Non-reduced systems are handled in §2.1 by passing to the indivisible subsystem.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

- ALS.F.1 (`LocallySymmetric.realPoints_lieGroup` and its `maximalCompact` API): `𝐇(ℝ)` is a closed subgroup of `GL_N(ℝ)` with finitely many components whose Lie algebra is `Lie(𝐇)`. For reductive `𝐇` with a transpose-stable embedding, `K = 𝐇(ℝ) ∩ O(N)` is maximal compact and the polar decomposition holds.
- ALS.0.1 (`IsCartanInvolution`, `IsCartanInvolution.conj`, `LocallySymmetric.IsCartanInvolution.transposeInverse`): algebraic Cartan involutions and their conjugacy.
- ALS.0.2: the Lie-theoretic Cartan datum of real points, stated for `𝐆 = Res_{F/ℚ} G` with `G` connected reductive over a number field `F`.

These are consumed in Layer 8 only.

## How to read the build

Layer 1 adds the compatible form to the full base Cartan datum, restricts it to the identity component and proves conjugacy of its involutions with the same split centre. Layer 2 handles restricted roots: the simple-root subsystems and chamber stabilizers of a possibly non-reduced `Σ`, the conjugacy of maximal abelian subspaces under `K⁰`, the bridge to the base's `IwasawaData`, the comparison of the base restricted Weyl group `W_G` with `W(Σ)` and the component condition that equates them, and conjugacy of Iwasawa triples. Layer 3 builds `M`, `N` and `P = MAN`, proves that centralizers of subspaces of `𝔞` inherit the datum, proves the Langlands decomposition of `P`, and packages the result as a minimal parabolic datum, which opens RealSemisimpleLieGroups Layers 3–4 to this roadmap's class. Layer 4 proves the Bruhat decomposition over `W_G` with cell coordinates for every Iwasawa triple, reducing to the identity component, where RealSemisimpleLieGroups §3.3 applies. Layer 5 is the group `⁰L` and the split component of an arbitrary datum. Layer 6 proves the equality of conjugate standard parabolics in an abstract Tits system, the dynamical description without the component condition, and the complexification criterion for a reductive Lie algebra with centre. Layer 7 is the self-adjoint matrix model: closed, transpose-stable matrix groups with finitely many components, their Lie algebras and dynamic subgroups (§§7.1–7.2), the minimal parabolic with its Langlands and Bruhat decompositions, its conjugacy, the regular dynamical description and the component condition, without that condition, and the overgroups of `P` and the Tits system under it (§7.3), and the splitting off of the invariant split centre (§7.4); these are the statements pinned in Lean. Layer 8 places the real points of connected reductive `ℝ`-groups in that model. Layers 1–6 depend only on the base roadmap, RealSemisimpleLieGroups, Mathlib and Tau Ceti (RootSystems is cited only as the record of the root-system declarations). Layer 7 depends on Layers 1–6, and Layer 8 adds ArithmeticLocallySymmetricSpaces.

## Layer 1: Reductive Cartan data and their conjugacy

### 1.1 Reductive Cartan data

Define a **reductive Cartan datum** on `G` as a full LieGroups `CartanInvolution I G`, denoted `C`, together with a bilinear form `B` on `𝔤`. Retain every field of `C`, including its finite central matrix-cover model; write `θ = C.θ`. Require `B` symmetric, nondegenerate, invariant under `Ad(g)` for every `g ∈ G` and under `dθ`, negative definite on `𝔨` and positive definite on `𝔭`, with `𝔨 ⊥ 𝔭`. This adds the compatible form to the base carrier; it gives Knapp's axioms (i)–(iv), without requiring axiom (v), `Ad(G) ⊆ Int(𝔤_ℂ)` (Knapp 2002, Ch. VII §2). Use the base polar diffeomorphism `K × 𝔭 → G`, `(k, X) ↦ k·lieExp X`, and its compactness and component conclusions. *Needs:* LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, differentiated at `0` to turn the `Ad(G)`-invariance of `B` into the `ad`-invariance behind the `B_θ`-symmetry and skewness of `ad X`; `g·lieExp X·g⁻¹ = lieExp(Ad g X)`, for the polar map of a transported datum), Layer 9 (`CartanInvolution`, `FiniteCartanMatrixModel`, `cartan_polar_decomposition`); Mathlib `LinearMap.BilinForm`.

Prove the following API.

- Forgetting `B` gives exactly `C`, retaining the chosen global model.
- `B_θ(X, Y) = −B(X, dθ Y)` is an inner product. For `X ∈ 𝔭`, `ad X` is `B_θ`-symmetric; for `X ∈ 𝔨` it is `B_θ`-skew.
- `dθ` restricted to `[𝔤, 𝔤]` is a Cartan involution: the negative Killing form twisted by `dθ` is positive definite.
- Reductivity criterion. Let `𝔥` be a finite-dimensional real Lie algebra with an inner product for which the adjoint of every `ad X`, `X ∈ 𝔥`, is `ad X'` for some `X' ∈ 𝔥`. Then the orthogonal complement of an ideal is an ideal, and `𝔥` is the orthogonal direct sum of its centre and its derived algebra, which is semisimple: a nonzero abelian ideal `𝔟` of `𝔷(𝔥)^⊥` would have the complementary ideal `𝔟^⊥ ∩ 𝔷(𝔥)^⊥`, with `⁅𝔟, 𝔟^⊥⁆ ⊆ 𝔟 ∩ 𝔟^⊥ = 0`, and so would be central in `𝔥` and zero; hence `𝔷(𝔥)^⊥` has trivial radical, is semisimple and equals `⁅𝔥, 𝔥⁆`. These are the two reductivity fields of LieGroups' `CartanInvolution`. For a `dθ`-stable subalgebra of `𝔤` with `B_θ`, `X' = −dθX`, by invariance of `B`; for a transpose-stable Lie algebra of real matrices with `⟨X, Y⟩ = tr(XYᵀ)`, `X' = Xᵀ`, because `tr(⁅X, Y⁆Zᵀ) = tr(Y⁅Xᵀ, Z⁆ᵀ)`.
- `𝔷 = (𝔷 ∩ 𝔨) ⊕ 𝔷_𝔭`. Use the base central-period identification: `lieExp` identifies `𝔷_𝔭` with a closed vector subgroup `A_G` central in `G⁰`; components of `G` may act nontrivially on it.
- Transport by `g ∈ G` has involution `c_g θ c_g⁻¹` and form `B ∘ (Ad(g⁻¹) × Ad(g⁻¹)) = B`. Its fixed group is `gKg⁻¹` and its negative eigenspace is `Ad(g)𝔭`. For a model covering `π : G → H`, transport the covering to `π ∘ c_g⁻¹ : G → H`; retain `H` and its transpose-inverse. Conjugacy assertions concern the involution and geometric choices, not equality with an independently selected model.
- Restriction to the identity component: `θ` preserves `G⁰`, and `K ∩ G⁰ = K⁰` because the polar diffeomorphism carries `K⁰ × 𝔭` onto the component of `1`. The covering restricts to `G⁰ → H⁰`, where `H⁰` is closed, preserved by transpose-inverse and connected, with kernel the finite central `ker π ∩ G⁰`. With `B` unchanged this is a reductive Cartan datum on `G⁰` with the same `𝔤`, `𝔨` and `𝔭`, so with the reductivity fields of `C` and the compact fixed group `K⁰`.

**Checks.**

- For `GL_n(ℝ)` with `θ(g) = (gᵀ)⁻¹` and `B(X, Y) = tr(XY)`: `𝔭` is the symmetric matrices and `𝔨` the skew ones. At `n = 2`, `B(diag(1, −1), diag(1, −1)) = 2 > 0` and `B(Y, Y) = tr(Y²) = −2 < 0` for `Y = ((0, 1), (−1, 0))`. The polar map is the polar decomposition, and `K = O(2)` meets both components. A form with the opposite sign fails the definiteness fields.
- For `SU(2)` with `θ = Ad(diag(i, −i))`: the fixed set `U(1)` is compact and `𝔰𝔲(2)` is semisimple, so those two fields alone hold, but the required base global model cannot exist: `Y = ((0, 1), (−1, 0)) ∈ 𝔭` has `lieExp(πY) = −1 ∈ K`, so `(1, πY)` and `(−1, 0)` have the same image and the polar map is not injective. The Killing form is negative definite on `𝔰𝔲(2)`, so no `B` is positive on `𝔭 ≠ 0`. This is neither a base `CartanInvolution` nor a reductive Cartan datum.
- For `S¹ = ℝ/ℤ` with `θ(x) = −x`: the fixed set `{0, 1/2}` is compact and `𝔭 = ℝ`, but `lieExp(1) = 0`, so the polar map is not injective. It fails the base global-model requirement as well as the reductive datum.
- For `ℝ^×` with `θ(x) = x⁻¹`: `K = {±1}`, `𝔭 = 𝔤 = ℝ`, `B(X, Y) = XY`, and `(±1, t) ↦ ±e^t` is a homeomorphism. `𝔷_𝔭 = ℝ`, `A_G = ℝ_{>0}`. Its restriction to `G⁰ = ℝ_{>0}` has `K ∩ G⁰ = {1} = K⁰`, while `K` has two elements.
- For `O(1,1) = {g ∈ GL_2(ℝ) : gᵀ J g = J}`, `J = diag(1, −1)`: `K = {diag(±1, ±1)}` has four elements, `G⁰ = SO₀(1,1) = {exp(tY)}` with `Y = ((0, 1), (1, 0))`, and `K ∩ G⁰ = {1} = K⁰`. The restricted model is the inclusion of `SO₀(1,1)`, closed and transpose-stable.
- For compact `G` with `θ = id`: `𝔭 = 0` and `B` is any negative definite invariant form, obtained by averaging over `G`. The polar map is the identity of `G`.
- The reductivity criterion on `𝔤𝔩_2(ℝ)` with `tr(XYᵀ)`: the adjoint of `ad E₁₂` is `ad E₂₁`, and `𝔤𝔩_2 = ℝ·1 ⊕ 𝔰𝔩_2` orthogonally. On the upper triangular algebra `𝔟`, which is not transpose-stable, the adjoint of `ad E₁₂|_𝔟` sends `E₁₂` to `E₂₂ − E₁₁`, whereas every `ad Y|_𝔟` sends `E₁₂` into `ℝE₁₂`; so the hypothesis fails, and so does the conclusion: the orthogonal complement in `𝔟` of the ideal `ℝE₁₂` is the diagonal algebra, which is not an ideal (`⁅E₁₂, diag(1, 0)⁆ = −E₁₂`), and `𝔷(𝔟) ⊕ ⁅𝔟, 𝔟⁆ = ℝ·1 ⊕ ℝE₁₂ ≠ 𝔟`.
- Non-example: for `n ≥ 2`, the Euclidean motion group `ℝ^n ⋊ O(n)` with `θ(v, k) = (−v, k)` has compact fixed group `O(n)`, but its Lie algebra has the noncentral radical `ℝ^n`. It already fails the base reductivity fields. At `n = 1` its Lie algebra is central `ℝ` and the group `ℝ ⋊ C₂` does admit the datum of §1.2; at `n = 0` the group is trivial.

### 1.2 Conjugacy of the underlying Cartan involutions

Let `D = (C, B)` and `D' = (C', B')`, with underlying involutions `θ, θ'`, be reductive Cartan data on `G`.

- If `𝔷 ∩ 𝔭 = 𝔷 ∩ 𝔭'`, then there are `X ∈ 𝔭` and `Z ∈ 𝔷_𝔭` such that, with `g = lieExp(X)·lieExp(Z) ∈ G⁰`, `θ' = c_g ∘ θ ∘ c_g⁻¹`, `K' = gKg⁻¹` and `𝔭' = Ad(g)𝔭`.
- Conversely, involutions conjugate under `G⁰` have the same split central part.
- In particular, when `𝔤` is semisimple the underlying involutions of any two reductive Cartan data are conjugate under `G⁰`. No equality of `B`, `B'` or of independently chosen matrix models is asserted.

(Knapp 2002, Ch. VI §2 for the Lie algebra; Ch. VII §2 for reductive groups. ALS.0.1 `IsCartanInvolution.conj` is the algebraic analogue.) RealSemisimpleLieGroups §5.4 proves the semisimple case by another route, through the conjugacy of maximal compact subgroups; this section allows a centre, with equal split central parts, and gives the conjugating element in the form `lieExp(X)·lieExp(Z)`.

Proof sketch:

1. Apply RealSemisimpleLieGroups §0.2 to `[𝔤, 𝔤]` with the Cartan involutions `dθ` and `dθ'` restricted to it (§1.1): `dθ' = e^{ad X} dθ e^{−ad X}` on `[𝔤, 𝔤]` for some `X ∈ 𝔭 ∩ [𝔤, 𝔤]`. Transporting `D` by `lieExp(X)` gives `dθ' = dθ` on `[𝔤, 𝔤]`. Both preserve `𝔷`, and `𝔷 ∩ 𝔨 = 𝔷 ∩ 𝔨'` (both are the Lie algebra of the maximal compact subgroup of `Z(G⁰)⁰`), so `dθ' = dθ`. Then `θ' = θ` on `G⁰`, and `K'⁰ = K⁰`. Also `τ = θ'θ` is trivial on `G⁰`, so `x⁻¹τ(x) ∈ Z_G(G⁰)` for every `x`.
2. Write `k' ∈ K'` as `k·lieExp(Y)` with `k ∈ K` and `Y ∈ 𝔭` (polar decomposition for `D`). Then `θ'(k') = k'` gives `τ(k) = k·lieExp(2Y)`, so `lieExp(2Y) ∈ Z_G(G⁰)` and `e^{2 ad Y} = 1`. Hence `ad Y = 0` and `Y ∈ 𝔷_𝔭`. `Y` depends only on the class of `k` in `K/K⁰`, and it satisfies `Y(k₁k₂) = Ad(k₂⁻¹)Y(k₁) + Y(k₂)`.
3. Averaging over the finite group `K/K⁰` gives `Z ∈ 𝔷_𝔭` with `Y(k) = Ad(k⁻¹)Z − Z`. Conjugation by `lieExp(Z)` fixes `dθ` and carries `K` onto `K'`.
4. Both global involutions satisfy `θ(k exp X) = k exp(−X)`, so they agree.

*Needs:* this roadmap §1.1; RealSemisimpleLieGroups §0.2; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, and `g·lieExp X·g⁻¹ = lieExp(Ad g X)` for the cocycle of steps 2–3); Tau Ceti `map_lieExp` and `lieMap_injective`, applied to the restrictions on the preconnected finite-dimensional Lie group `G⁰`.

**Checks.**

- For `G = ℝ × S¹` and `c ∈ ℝ`, `θ_c(t, s) = (−t, s − 2ct)` is a smooth involutive automorphism. Its fixed set is `{0} × S¹`, and `𝔭_c = {(x, cx)}`. The form with `B((0,1),(0,1)) = −1`, `B((1,c),(1,c)) = 1` and these two vectors orthogonal is admissible. The polar map `(s, (x, cx)) ↦ (x, s + cx)` is a homeomorphism. The shear `(t, s) ↦ (t, s − ct)` transports the standard faithful model of `ℝ × S¹` and its Cartan involution, so each `θ_c` underlies a reductive Cartan datum. `G` is abelian, so conjugation is trivial, and `θ_c ≠ θ_{c'}` for `c ≠ c'`: data with different split central parts `𝔭_c ≠ 𝔭_{c'}` need not be conjugate. The unconditional statement "any two Cartan involution data are conjugate" is false.
- For `G = ℝ ⋊ ℤ/2` (the generator acting by `−1`), `θ_a(t, ε) = (−t + aε, ε)` is a reductive Cartan datum for every `a`, with `K_a = {(0, 0), (a/2, 1)}`. All have `𝔷_𝔭 = ℝ`. Conjugation by `lieExp(a/4)` carries `θ_0` to `θ_a`, an element of `exp(𝔷_𝔭)`; it is the cocycle step of the proof. An element of `exp(𝔭 ∩ [𝔤,𝔤]) = {1}` alone cannot do it.
- For `GL_n(ℝ)`: `θ` and `c_g θ c_g⁻¹` for `g` positive definite symmetric have the same split central part `ℝ·1`, and they are conjugate by `g = lieExp(½ log(gᵀg))`.
- For `SL_2(ℝ)`, `θ(g) = (gᵀ)⁻¹` and `θ' = c_h θ c_h⁻¹` with `h = diag(2, 1/2)`: both have split central part `0`, and the statement holds with `X = diag(log 2, −log 2) ∈ 𝔭`, `Z = 0` and `g = lieExp(X) = h ∈ G⁰`. For any `a`, `c_a θ c_a⁻¹ = c_{aaᵀ} ∘ θ`, so `θ' = c_{diag(4, 1/4)} ∘ θ` and `θ'θ = c_{lieExp(2X)}`. Conjugating by `lieExp(2X) = diag(4, 1/4)` would give `c_{diag(16, 1/16)} ∘ θ ≠ θ'`, and by `lieExp(X/2)` would give `c_{diag(2, 1/2)} ∘ θ ≠ θ'`: the conjugating element is the square root of `θ'θ`.

**Checks (forms).**

- On `ℝ^×`, `B(x,y) = xy` and `B'(x,y) = 2xy` give the same inversion, split centre, `𝔞 = ℝ` and `Σ⁺ = ∅`. Conjugation is trivial, so transport leaves `B(1,1) = 1`, whereas `B'(1,1) = 2`. The involutions agree with `g = 1`; whole-datum equality does not follow. Scaling an admissible form by `2` has the same obstruction on a nonzero semisimple group.

### Examples

`GL_n(ℝ)`, `SL_2(ℂ)` viewed as a real group, `ℝ^×` and compact groups are reductive Cartan data. `SU(2)` with a non-trivial involution and `S¹` with inversion fail both the base global-model requirement and the reductive Cartan datum. `ℝ × S¹` exhibits non-conjugate data.

### Dependencies

LieGroups Layer 0 (`lieExp`), Layer 1 (`Ad`, `Ad(lieExp X) = exp(ad X)`, `g·lieExp X·g⁻¹ = lieExp(Ad g X)`), Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`), Layer 3 (`lieMap`), Layer 9 (`CartanInvolution`); RealSemisimpleLieGroups §0.2; Tau Ceti `map_lieExp`, `lieMap_injective`; Mathlib `LinearMap.BilinForm`, `LieAlgebra.IsSemisimple`, `NormedSpace.exp`.

## Layer 2: Restricted roots, positive systems and the two Weyl groups

### 2.1 Simple-root subsystems and chamber stabilizers

Let `(D, 𝔞, Σ⁺)` be an Iwasawa triple and `Σ = Σ(𝔤, 𝔞)` its restricted root system, a possibly non-reduced finite crystallographic root system (LieGroups Layer 9), with the positive system `Σ⁺`, its simple roots `Π` and its indivisible subsystem `Σ_ind` (Conventions). RealSemisimpleLieGroups §1.2 proves that `Σ_ind` is reduced with the same reflections, Weyl group and chambers, that `Σ⁺ ↦ Σ⁺ ∩ Σ_ind` matches positive systems of `Σ` with bases of `Σ_ind` (`Π` being the base, of indivisible roots), that `W(Σ)` acts simply transitively on positive systems, and that every root is an integer combination of `Π` with coefficients all `≥ 0` or all `≤ 0`. Prove in addition (Bourbaki, Ch. VI §1):

- For `Π' ⊆ Π`, `Σ_{Π'} = Σ ∩ span(Π')` is closed under negation, and it is a root system in `span(Π')` with positive system `Σ⁺ ∩ Σ_{Π'}`, simple roots `Π'` and Weyl group `W_{Π'}`.
- The stabilizer in `W(Σ)` of a point of the closed positive chamber, or of a subspace of `𝔞` pointwise, is generated by the reflections it contains (Bourbaki, Ch. V §3 no. 3). For a point `x` of the closed chamber this is `TauCeti.stabilizer_eq_closure_wallReflections` applied to `Σ_ind` in its span. For a subspace `𝔰 ⊆ 𝔞`, choose `x ∈ 𝔰` off the kernels of the finitely many roots that do not vanish on `𝔰`, each of which meets `𝔰` in a proper subspace (`x = 0` when `𝔰 = 0`); the roots vanishing at `x` are then exactly those vanishing on `𝔰`. Some `w ∈ W(Σ)` carries `x` into the closed chamber (`TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, applied in the same way), so the stabilizer of `x` is `w⁻¹·Stab(wx)·w`. It is generated by the conjugates `w⁻¹s_αw = s_{α∘w}` of the simple reflections with `α(wx) = 0`, that is, by reflections `s_β` with `β(x) = 0`. These fix `𝔰` pointwise, and the pointwise stabilizer of `𝔰` lies in the stabilizer of `x ∈ 𝔰`, so the two groups are equal.

Proof sketch: `Π'` is linearly independent, so a root lies in `span(Π')` iff its sign-coherent expansion is supported in `Π'`; this gives the positive system and simple roots of `Σ_{Π'}`, and `Π' ⊆ Σ_ind` is a base of the indivisible subsystem `Σ_ind ∩ span(Π')` of `Σ_{Π'}` in the sense of `RootPairing.Base`, whose Weyl group is generated by its simple reflections. The stabilizer statement passes to `Σ_ind`, which has the same Weyl group and chambers.

*Needs:* Conventions; RealSemisimpleLieGroups §1.2; LieGroups Layer 9 (the possibly non-reduced finite crystallographic restricted root system); Mathlib `RootPairing`, `RootPairing.Base`, `RootPairing.IsReduced`, `RootPairing.weylGroup`; Tau Ceti `TauCeti.stabilizer_eq_closure_wallReflections` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (strict ordered ring, finite, crystallographic, pairing and flip reduced).

**Checks.**

- `BC₁ = {±λ, ±2λ}`: `Σ_ind = {±λ}`, the positive systems are `{λ, 2λ}` and `{−λ, −2λ}`, and `Π = {λ}`, so `Σ_Π = Σ` with simple root `λ`. The full `BC₁` has no `RootPairing.Base`. Declaring `2λ` simple fails: `λ ∈ Σ⁺` is not a combination of it with integer coefficients.
- `A₂`: six positive systems, permuted simply transitively by `S₃`. The stabilizer of `v` with `α₁(v) = 0`, `α₂(v) > 0` is `{1, s_{α₁}}`, which is `W_{Π'}` for `Π' = {α₁}`.
- Pointwise stabilizers of subspaces. In `A₁ = {±α}` with `𝔰 = 𝔞`, the pointwise stabilizer of `𝔰` is `{1}`, generated by no reflection, while the stabilizer of the point `0 ∈ 𝔰` is all of `W = {1, s_α}`: the auxiliary point must avoid the kernels of the roots not vanishing on `𝔰`, and any `x ≠ 0` does, with stabilizer `{1}`. In `A₂` with `𝔰 = ker α₁`, a point `x ∈ 𝔰` off `ker α₂` and `ker(α₁ + α₂)` has stabilizer `{1, s_{α₁}}`, which is the pointwise stabilizer of `𝔰`.
- `BC₂`: `Σ_ind = B₂`, with `|W| = 8` and 8 positive systems. `Π = {e₁ − e₂, e₂}`, and `Σ_{{e₂}} = Σ ∩ span({e₂}) = {±e₂, ±2e₂}`, of type `BC₁` with simple root `e₂` and Weyl group `{1, s_{e₂}}`. A definition of `Σ_{Π'}` using only coefficient-one combinations of `Π'` would miss `±2e₂`.

### 2.2 Conjugacy of maximal abelian subspaces of 𝔭

Let `D` be a reductive Cartan datum on `G` and `𝔞 ⊆ 𝔭` a maximal abelian subspace. Prove (Knapp 2002, Ch. VI §5):

- (a) `𝔭 = ⋃_{k ∈ K⁰} Ad(k)𝔞`.
- (b) Every maximal abelian subspace `𝔞' ⊆ 𝔭` is `Ad(k)𝔞` for some `k ∈ K⁰`.
- (c) `K = N_K(𝔞)·K⁰` and `G = N_K(𝔞)·G⁰`.
- (d) `𝔷_𝔭 ⊆ 𝔞`, since adjoining a vector of `𝔷_𝔭` to `𝔞` keeps it abelian.
- (e) For each `β ∈ Σ` and non-zero `X ∈ 𝔤^β` there is `c ∈ ℝ` such that `k = lieExp(c(X + dθX))` lies in `K⁰`, normalizes `𝔞` and acts on it by `Ad` as the reflection `s_β`. So every reflection of `W(Σ)` has a representative in `N_{K⁰}(𝔞)`.

LieGroups Layer 9 proves `Ad(K)𝔞 = 𝔭`, and RealSemisimpleLieGroups §1.3 proves (a) and (b) for a semisimple Lie algebra under `K_θ ⊆ Int(𝔤₀)`; this section proves the form (a) under `K⁰`, the conjugacy (b) of two maximal abelian subspaces, the factorizations (c) and the reflection representatives (e) in `K⁰`, with centre and for disconnected `G`.

Proof sketch:

1. Regular elements. `ad 𝔞` is a commuting family of `B_θ`-symmetric operators (§1.1), so `𝔤` is the direct sum of the joint eigenspaces of `ad 𝔞`, and there are finitely many nonzero joint eigenvalues `λ ∈ 𝔞*`. Choose `H ∈ 𝔞` outside their kernels, a finite union of proper subspaces. Then `Z_𝔤(H) = Z_𝔤(𝔞)`, so `Z_𝔭(H) = Z_𝔭(𝔞) = 𝔞` by maximality.
2. For (a): fix `X ∈ 𝔭`. `K⁰` is compact, being closed in the compact `K`, and `lieExp(tZ) ∈ K⁰` for `Z ∈ 𝔨` and real `t`. Let `k₀ ∈ K⁰` maximize `k ↦ B(Ad(k)X, H)` and put `Y = Ad(k₀)X`, which lies in `𝔭` because `Ad(k₀)` commutes with `dθ`. Differentiating along `t ↦ lieExp(tZ)k₀` at `t = 0` gives `B(⁅Z, Y⁆, H) = B(Z, ⁅Y, H⁆) = 0` for every `Z ∈ 𝔨`. Since `⁅Y, H⁆ ∈ ⁅𝔭, 𝔭⁆ ⊆ 𝔨` and `B` is negative definite on `𝔨`, `⁅Y, H⁆ = 0`, so `Y ∈ Z_𝔭(H) = 𝔞`. This is the symmetric-pair argument of Layer 9's `Ad(K)𝔞 = 𝔭`, run on the compact group `K⁰`.
3. For (b): choose `H' ∈ 𝔞'` with `Z_𝔭(H') = 𝔞'` (step 1 for `𝔞'`) and, by (a), `k ∈ K⁰` with `Ad(k)H' ∈ 𝔞`. Then `𝔞 ⊆ Z_𝔭(Ad(k)H') = Ad(k)𝔞'`, which is abelian, and maximality of `𝔞` gives `𝔞 = Ad(k)𝔞'`.
4. For (c): for `k ∈ K`, `Ad(k)𝔞` is maximal abelian in `𝔭`, so by (b) it is `Ad(k₁)𝔞` with `k₁ ∈ K⁰`; then `k₁⁻¹k ∈ N_K(𝔞)` and `k ∈ K⁰·N_K(𝔞) = N_K(𝔞)·K⁰`, as `K⁰` is normal in `K`. The polar decomposition `G = K·lieExp 𝔭` with `lieExp 𝔭 ⊆ G⁰` gives `G = N_K(𝔞)·G⁰`.
5. For (e): `dθX ∈ 𝔤^{−β}`, because `dθ` is a Lie algebra automorphism equal to `−1` on `𝔞`, and `Z = X + dθX` is fixed by the involution `dθ`, so `Z ∈ 𝔨`. The bracket `⁅X, dθX⁆` has weight `β − β = 0` and is negated by `dθ`, so it lies in `Z_𝔭(𝔞) = 𝔞`, and invariance of `B` gives `B(⁅X, dθX⁆, H) = β(H)·B(X, dθX)` for `H ∈ 𝔞`. Hence `⁅X, dθX⁆ = −|X|²·H'_β`, a negative multiple of the `B`-dual `H'_β ∈ 𝔞` of `β` (`B(H'_β, H) = β(H)`), where `|X|² = B_θ(X, X) > 0`. So `ad Z` is zero on `𝔞 ∩ ker β`, sends `H ∈ 𝔞` to `−β(H)(X − dθX)` and sends `X − dθX` to `2|X|²·H'_β`; on the plane spanned by `H'_β` and `X − dθX` it satisfies `(ad Z)² = −ω²` with `ω² = 2|X|²·β(H'_β) > 0`. For `c = π/ω`, `Ad(lieExp(cZ)) = exp(c·ad Z)` is `−1` on that plane and the identity on `𝔞 ∩ ker β`, so it preserves `𝔞` and acts there as `s_β`. The path `t ↦ lieExp(tcZ)` from `1` stays in `K`, since `θ(lieExp Y) = lieExp(dθY)`, so `k ∈ K⁰`.

*Needs:* §1.1 (the form `B`, its `Ad(G)`-invariance and definiteness, the `B_θ`-symmetry of `ad X` for `X ∈ 𝔭`); LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`), Layer 9 (compactness of `K`, polar decomposition); Tau Ceti `map_lieExp` (applied to `θ`, so that `lieExp 𝔨 ⊆ K`); Mathlib `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute`.

**Checks.**

- In `GL_n(ℝ)`, a maximal abelian subspace of the symmetric matrices is conjugate under `SO(n)` to the diagonal one (spectral theorem). For `n = 2`, take `𝔞` diagonal, the regular `H = diag(1, −1)` (`(e₁ − e₂)(H) = 2`) and `S = ((0, 1), (1, 0))`. For the rotation `R_φ` through `φ`, `Ad(R_φ)S = ((−sin 2φ, cos 2φ), (cos 2φ, sin 2φ))` and `B(Ad(R_φ)S, H) = −2 sin 2φ`, maximal at `φ = −π/4`, where `Ad(R_{−π/4})S = diag(1, −1) ∈ 𝔞` and `R_{−π/4} ∈ SO(2) = K⁰`. For (b), `𝔞' = ℝ·1 ⊕ ℝS` has `Z_𝔭(S) = {((a, b), (b, a))} = 𝔞'`, and `Ad(R_{−π/4})𝔞' = 𝔞`.
- Regularity is needed in step 2: in `GL_2(ℝ)` the scalar `H = 1` has `Z_𝔭(1) = 𝔭`, and `k ↦ B(Ad(k)S, 1) = tr S = 0` is constant, so `k₀ = 1` maximizes it although `S ∉ 𝔞`.
- Maximality is needed in (b): in `GL_2(ℝ)` the line `ℝS` is abelian in `𝔭` but misses `𝔷_𝔭 = ℝ·1`, so no `Ad(k)` carries it onto the two-dimensional `𝔞`, and `Z_𝔭(S) = 𝔞' ⊋ ℝS`.
- `O(1,1)`: `K⁰ = {1}` and `𝔭 = 𝔞 = ℝY`, `Y = ((0, 1), (1, 0))`, so (a) and (b) hold with `k = 1`. All four elements of `K = {diag(±1, ±1)}` normalize `𝔞` (`diag(1, −1)` acts by `−1`), so (c) reads `K = K·{1}`, and `G = K·G⁰` has four components.
- For `ℝ^×`, `𝔞 = 𝔭 = ℝ` is the only choice. For compact `G`, `𝔭 = 0` and `𝔞 = 0`, and (c) reads `K = K·K⁰`.
- (e) in `SL_2(ℝ)` with `𝔞 = ℝ·diag(1, −1)`, `β = e₁ − e₂`, `X = E₁₂` and `dθX = −E₂₁`: `⁅X, dθX⁆ = −diag(1, −1)`, and `diag(1, −1)` is the `B`-dual of `β` for `B(X, Y) = tr(XY)`, so the multiple is `−|X|² = −1`, negative as step 5 says; `ω² = 2·1·2`, so `|c| = π/2`. With `c = −π/2`, `lieExp(c(X + dθX)) = ((0, −1), (1, 0)) ∈ SO(2) = K⁰`, which sends `diag(1, −1)` to `−diag(1, −1)`. The value `c = −π/4` gives the rotation through `π/4`, which sends `diag(1, −1)` to `((0, 1), (1, 0)) ∉ 𝔞`, so not every `c` normalizes `𝔞`.
- (e) needs `X ≠ 0`: for `X = 0`, `k = 1` for every `c`, and it acts on `𝔞` trivially, not as `s_β`. For `O(1,1)` and for compact `G`, `Σ = ∅` and (e) says nothing; there `N_{K⁰}(𝔞)` acts trivially and `W(Σ) = 1`.

### 2.3 The base `IwasawaData` of an Iwasawa triple

For an Iwasawa triple construct the base structure `IwasawaData I G` with:

- `cartan` the underlying `CartanInvolution`, `K = G^θ`, `𝔞`, `A = lieExp 𝔞`;
- `restrictedRoots = Σ`, exactly the nonzero simultaneous weights with nonzero root space, `positiveRestrictedRoots = Σ⁺`, and `restrictedRootSpace β = 𝔤^β`;
- `N = Nplus = lieExp 𝔫` for `𝔫 = ⨁_{β ∈ Σ⁺} 𝔤^β`;
- `chamber` the closed positive chamber `{H ∈ 𝔞 : β(H) ≥ 0 for all β ∈ Σ⁺}`.

Prove every field:

- the roots are exactly the nonzero weights; negation, positive-root sign choice, exclusion of opposite positives and closure under addition hold; the root spaces satisfy the simultaneous-eigenspace equations;
- `𝔞` lies in `𝔭`, is abelian and maximal there, and `A = lieExp 𝔞`;
- `N` and `Nplus` are closed and connected with `N = lieExp(Lie(N))`, `Lie(N) = 𝔫` and `Lie(Nplus)` equal to the span of the positive root spaces;
- `lieExp` is injective on `𝔞`, by the polar homeomorphism;
- `⁅𝔞, 𝔫⁆ ⊆ 𝔫`;
- `𝔤 = (𝔨 ⊕ 𝔞) ⊕ 𝔫`;
- the chamber lies in `𝔞`, has exactly the positive-root inequalities, is closed in the canonical tangent-space topology, is closed under addition and nonnegative scaling, and spans `𝔞`;
- every `H ∈ 𝔞` has an `N_{K⁰}(𝔞)`-translate in the chamber. Choose `H₁ ∈ 𝔞` off the kernels of the roots and `ε > 0` so small that `β(H + εH₁)` has the sign of `β(H)` for every root with `β(H) ≠ 0`. Then `H' = H + εH₁` lies off every root kernel, and `H` lies in the closed chamber of the positive system `Σ'⁺ = {β ∈ Σ : β(H') > 0}`, since `β(H) < 0` would force `β(H') < 0`. Some `w ∈ W(Σ)` carries `Σ'⁺` onto `Σ⁺` (RealSemisimpleLieGroups §1.2), so `wH` lies in the chamber. Each reflection `s_β` is `Ad(k)|_𝔞` for some `k = lieExp(c(X + dθX)) ∈ N_{K⁰}(𝔞)` (§2.2 (e)), so `w`, a product of reflections, is `Ad(k)|_𝔞` for some `k ∈ N_{K⁰}(𝔞) ⊆ N_K(𝔞)`;
- adding any `Z ∈ 𝔷 ∩ 𝔞` preserves the chamber, since every root vanishes on `Z`.

Consequently `iwasawaDecomposition` and `kakDecomposition` of the base apply to `(K, A, N)` and to this chamber (Knapp 2002, Ch. VI §4). *Needs:* §1.1; §2.2 (step 1, the decomposition of `𝔤` into the joint eigenspaces of `ad 𝔞`, and (e), the reflection representatives in `K⁰`); Conventions (positive systems, RealSemisimpleLieGroups §1.2, with the simple transitivity of `W(Σ)` on positive systems); LieGroups Layer 9 (`IwasawaData`, `iwasawaDecomposition`, `kakDecomposition`, the Lie-algebra Iwasawa decomposition, the closedness of `N`).

**Checks.**

- For `GL_n(ℝ)` the datum is `(O(n), positive diagonal, upper unitriangular)`. The base decomposition agrees with `Matrix.GeneralLinearGroup.existsUnique_iwasawa`: Gram–Schmidt, the `QR` decomposition with positive diagonal.
- For `SL_2(ℝ)` the chamber is `{diag(t, −t) : t ≥ 0}`, which spans `𝔞`. The empty cone would fail `chamber_span`.
- For `SL_2(ℝ)`, building `𝔫` from all of `Σ` instead of `Σ⁺` gives `𝔤^β ⊕ 𝔤^{−β} = ℝE₊ ⊕ ℝE₋`. This space contains `𝔨 = ℝ(E₋ − E₊)`, and the dimensions add to `1 + 1 + 2 = 4 > 3`, so the complement field fails. The open chamber `{H : β(H) > 0}` does not contain `0`, so it fails closure under scaling by `c = 0`.
- For `GL_2(ℝ)`, the chamber is `{diag(h₁,h₂) : h₁ ≥ h₂}` and contains the entire scalar line: both `diag(1,1)` and `diag(−1,−1)`. For `H = diag(0, 1)`, `Σ'⁺ = {e₂ − e₁}`, and `s_{e₁−e₂}` is realized by `X = E₁₂`, `dθX = −E₂₁`, `c = π/2`: the rotation `k = ((0, 1), (−1, 0)) ∈ SO(2) = K⁰` carries `diag(0, 1)` to `diag(1, 0)`, in the chamber. Requiring all diagonal entries nonnegative would wrongly exclude `−1`.
- For `O(1,1)`, `Σ = ∅`, the chamber is all of `𝔞` and `k = 1` serves: the coverage holds with `K⁰ = {1}`, although `W_G ≠ W(Σ)` there (§2.4).
- For compact `G`, `𝔭 = 0`, so `𝔞 = 0`, `Σ⁺ = ∅`, `𝔫 = 0` and `A = N = {1}`. The chamber is `{0}`, which spans `𝔞 = 0`, and the base Iwasawa decomposition reduces to `G = K`.

### 2.4 The two Weyl groups

For an Iwasawa triple, let `W_G = N_K(𝔞)/Z_K(𝔞)` be LieGroups Layer 9's restricted Weyl group, acting faithfully on `𝔞` by `Ad`, with its normalizer representatives of the reflections `s_β` (exact supplier contracts). The restriction of the datum to `G⁰` (§1.1) has fixed group `K⁰` and the same `𝔞` and `Σ`, and §2.3 gives it an `IwasawaData`; RealSemisimpleLieGroups §2.3 for the connected group `G⁰` gives `N_{K⁰}(𝔞)/Z_{K⁰}(𝔞) = W(Σ)` as groups of linear maps of `𝔞`. By §2.2 (e) the reflections `s_β` have representatives `lieExp(c(X + dθX))` in `N_{K⁰}(𝔞)`; the base representatives lie in `N_K(𝔞)`, possibly outside `K⁰`. Prove the following for every Iwasawa triple (Knapp 2002, Ch. VI §5):

- `W_G` permutes `Σ`, preserving the multiplicities `dim 𝔤^β`, and `W(Σ)` is a normal subgroup of `W_G`.
- `N_G(𝔞) = N_K(𝔞)·A` and `Z_G(𝔞) = M·A` with `M ∩ A = 1`, so `N_G(𝔞)/Z_G(𝔞) ≅ W_G`. RealSemisimpleLieGroups §3.2 states the first equality for a minimal parabolic datum whose `M` meets every component; here it holds without the component condition and is an input to the construction of `P` in §3.2.

Proof sketch:

- For normality: for `n ∈ N_K(𝔞)`, `Ad(n)` carries `𝔤^β` onto `𝔤^{β ∘ Ad(n)⁻¹}`, so `n s_β n⁻¹ = s_{β ∘ Ad(n)⁻¹}`.
- For `N_G(𝔞)`: write `g = k·lieExp X`. Then `θ(g)` also normalizes `𝔞`, so `e^{−2 ad X}` preserves `𝔞`. Hence `ad X` preserves `𝔞`, `⁅X, 𝔞⁆ ⊆ 𝔞 ∩ 𝔨 = 0` and `X ∈ 𝔞`.

*Needs:* §§1.1, 2.1–2.2, 2.3 (for `G⁰`); RealSemisimpleLieGroups §2.3; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`), Layer 9 (the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)`, root spaces, polar decomposition); Tau Ceti `map_lieExp` (applied to `θ`, so that `g⁻¹θ(g) = lieExp(−2X)` for `g = k·lieExp X`).

**Checks.**

- For `GL_n(ℝ)`, `W_G ≅ S_n`, agreeing with `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm`. Here `N_G(𝔞)` is the monomial matrices and `Z_G(𝔞)` the invertible diagonal ones.
- For `SL_2(ℝ)`, `W_G` has order two, generated by the class of `((0, −1), (1, 0))`. That element acts on `𝔞 = ℝ·diag(1, −1)` by `−1`, and it is the representative in `K⁰` of §2.2 (e) for `X = E₁₂`, `c = −π/2` (§2.2, Checks), so here `W_G = W(Σ)`.
- For `O(1,1)`: `𝔤 = 𝔞 = ℝ·((0, 1), (1, 0))`, `Σ = ∅` and `W(Σ) = 1`. But `diag(1, −1) ∈ K` acts on `𝔞` by `−1`, so `W_G ≅ ℤ/2` and `W(Σ)` is a proper normal subgroup. Here `K = {diag(±1, ±1)}` and `K⁰ = {1}`, so `N_{K⁰}(𝔞)/Z_{K⁰}(𝔞) = 1 = W(Σ)`, as the comparison says; `W_G = W(Σ)` needs the component condition of §2.5. `N_G(𝔞) = G = N_K(𝔞)·A` and `Z_G(𝔞) = {±exp(tY)} = M·A` with `M = {±1}`, of index two.

### 2.5 The component condition

Say that an Iwasawa pair `(D, 𝔞)` satisfies the **component condition** if every connected component of `G` meets `M = Z_K(𝔞)`, that is, `G = M·G⁰`; an Iwasawa triple satisfies it when its pair does. RealSemisimpleLieGroups §2.3 proves that it implies `W_G = W(Σ)`. Prove (Knapp 2002, Ch. VII §§2, 5):

- Conversely, `W_G = W(Σ)` implies the component condition, and both are equivalent to `N_K(𝔞) = M·N_{K⁰}(𝔞)` and to: the stabilizer of one (equivalently every) positive system in `N_K(𝔞)` is `M`.
- The condition does not depend on the choice of `𝔞`, because any two choices are `K⁰`-conjugate (§2.2) and `M` moves with them.
- It holds whenever Knapp's axiom (v) holds: `Ad(g)` lies, for every `g ∈ G`, in the subgroup of `Aut(𝔤_ℂ)` generated by the `e^{ad Z}`, `Z ∈ 𝔤_ℂ`.
- It holds when `G` is connected, and when `G` is compact.

Proof sketch for the equivalences: `K = N_K(𝔞)·K⁰` and `G = N_K(𝔞)·G⁰` (§2.2(c)), and `N_{K⁰}(𝔞)/Z_{K⁰}(𝔞) = W(Σ)` (§2.4) together with the simple transitivity of `W(Σ)` on positive systems (RealSemisimpleLieGroups §1.2) finishes.

Proof sketch for axiom (v). By the equivalences it suffices that every `n ∈ N_K(𝔞)` fixing `Σ⁺` lies in `M`. Put `𝔰 = [𝔤, 𝔤]`, so that `𝔤 = 𝔷 ⊕ 𝔰` and `𝔞 = 𝔷_𝔭 ⊕ (𝔞 ∩ 𝔰)` (§§1.1, 2.2(d)).

1. The compact form. `𝔲 = (𝔨 ∩ 𝔰) ⊕ i(𝔭 ∩ 𝔰)` is a compact real form of `𝔰_ℂ`: the Killing form is negative definite on it, because `dθ|_𝔰` is a Cartan involution (§1.1). Its conjugation `τ` is then a Cartan involution of `𝔰_ℂ` as a real Lie algebra, and `φ ↦ τφτ` integrates it on the connected semisimple centre-free group `Int(𝔰_ℂ)`, the identity component of `Aut(𝔰_ℂ)`. The polar decomposition of LieGroups Layer 9 for this group gives `Int(𝔰_ℂ) = K_τ·exp(ad i𝔲)`, with `K_τ` the elements preserving `𝔲`; `K_τ` is connected because `Int(𝔰_ℂ)` is, so it is the compact connected group `Int(𝔲)`.
2. Under (v), `Ad(n)` is a product of maps `e^{ad Z}`, `Z ∈ 𝔤_ℂ`, each trivial on `𝔷_ℂ` and acting on `𝔰_ℂ` by `e^{ad Z_𝔰}`, `Z_𝔰` the `𝔰_ℂ`-component of `Z`. As `n ∈ K`, `Ad(n)` commutes with `dθ` and preserves `𝔰`, hence `𝔲`; so `Ad(n)|_{𝔰_ℂ} ∈ Int(𝔲)` by step 1. The same holds for `mn` with `m ∈ M⁰ ⊆ G⁰`.
3. Let `𝔱` be maximal abelian in `𝔪`; the closure of `lieExp 𝔱` is a maximal torus of the compact connected group `M⁰` with Lie algebra `𝔱`. `Ad(n)` preserves `𝔪 = Z_𝔨(𝔞)`, so `Ad(n)𝔱` is again maximal abelian in `𝔪`; by conjugacy of maximal tori and the transitivity of the Weyl group on positive systems (LieGroups Layer 6, for `M⁰`) there is `m ∈ M⁰` such that `n' = mn` preserves `𝔱` and a fixed positive system `Δ_𝔪⁺` of the roots of `(𝔪_ℂ, 𝔱_ℂ)`. Then `𝔱_𝔲 = (𝔱 ∩ 𝔰) ⊕ i(𝔞 ∩ 𝔰)` is maximal abelian in `𝔲` (an element of `𝔲` commuting with it has its `𝔨`-part in `𝔪 ∩ 𝔰` commuting with `𝔱 ⊇ 𝔷 ∩ 𝔨`, hence in `𝔱`, and its `i𝔭`-part in `i(Z_𝔭(𝔞) ∩ 𝔰) = i(𝔞 ∩ 𝔰)`), so it is the Lie algebra of a maximal torus `T_𝔲` of `Int(𝔲)`, which `Ad(n')` normalizes.
4. The roots of `(𝔰_ℂ, (𝔱_𝔲)_ℂ)` are those of `(𝔤_ℂ, (𝔱 ⊕ 𝔞)_ℂ)`; a root not vanishing on `𝔞` restricts to an element of `Σ`, and a root vanishing on `𝔞` is a root of `(𝔪_ℂ, 𝔱_ℂ)`, since `Z_𝔤(𝔞) = 𝔪 ⊕ 𝔞`. Call a root positive if its restriction to `𝔞` lies in `Σ⁺`, or if it vanishes on `𝔞` and lies in `Δ_𝔪⁺`; this is the positive system cut out by `H₀ + εT₀`, for `H₀` in the open chamber of `Σ⁺`, `T₀ ∈ i𝔱` with `Δ_𝔪⁺ = {α : α(T₀) > 0}` and small `ε > 0`, the roots being real on `𝔞 ⊕ i𝔱`. `Ad(n')` preserves it, because `n` fixes `Σ⁺`, `m` is trivial on `𝔞` and `n'` preserves `Δ_𝔪⁺`. LieGroups Layer 6 identifies `N(T_𝔲)/T_𝔲`, acting on `𝔱_𝔲`, with the root Weyl group, which acts freely on chambers; so `Ad(n')` is trivial on `𝔱_𝔲`, in particular on `𝔞 ∩ 𝔰`, and on `𝔷_𝔭` by step 2. Hence `n' ∈ M` and `n = m⁻¹n' ∈ M`.

*Needs:* §§1.1, 2.2, 2.4; RealSemisimpleLieGroups §§0.2 (`Int(𝔰_ℂ)` for the real Lie algebra underlying `𝔰_ℂ`, the identity component of its automorphism group, with its adjoint `CartanInvolution` datum for the Cartan involution `τ`), 1.2, 2.3; LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)`, so that `n` carries the maximal torus of `M⁰` with Lie algebra `𝔱` to the one with Lie algebra `Ad(n)𝔱`, and an element of `M⁰` conjugating the latter onto the former carries `Ad(n)𝔱` onto `𝔱`), Layer 6 (`isConj_of_isMaximalTorus`, and `weylGroup` acting on the torus Lie algebra as the root Weyl group, transitively and freely on chambers), Layer 7 (the complexification `𝔤 ⊗_ℝ ℂ`), Layer 9 (`cartan_polar_decomposition`, for the connected semisimple group `Int(𝔰_ℂ)` with trivial centre).

**Checks.**

- `GL_n(ℝ)` for `n ≥ 1`: `M` is the `2^n` diagonal sign matrices and contains `diag(−1, 1, …, 1)`, which meets the determinant-negative component. The condition holds.
- `O(1,1)` (§2.4): `M = {±1}` meets two of the four components, so the condition fails, matching `W_G ≠ W(Σ)`.
- `Aut(𝔰𝔩_3(ℝ))`, a transpose-stable closed subgroup of `GL(𝔰𝔩_3(ℝ))` with two components, contains `σ(X) = −Xᵀ`. The element `σ·Ad(w₀)`, with `w₀` the antidiagonal permutation, lies in `K` and acts on `𝔞` by `diag(h₁, h₂, h₃) ↦ −diag(h₃, h₂, h₁)`. It interchanges `e₁ − e₂` and `e₂ − e₃`, preserves `Σ⁺`, and is not in `W(A₂)`. So `|W_G| = 12` and the condition fails.
- Compact `O(4)`: `𝔞 = 0` and `M = O(4)`, so the condition holds. A determinant-negative element acts on `𝔰𝔬(4, ℂ)` by an outer automorphism, so axiom (v) fails. The component condition is strictly weaker than (v).
- The axiom (v) route on `GL_2(ℝ)`: `Ad(g)` is conjugation by `g` in the connected `GL_2(ℂ)`, so (v) holds. `n = diag(−1, 1) ∈ N_K(𝔞)` fixes `Σ⁺ = {e₁ − e₂}`; `𝔪 = 0`, so `𝔱 = 0` and `m = 1`, and `𝔱_𝔲 = iℝ·diag(1, −1)`, which `Ad(n)` fixes pointwise. So `n ∈ M`, as step 4 concludes.
- `O(1,1)`: `𝔤_ℂ = ℂY` is abelian, so every `e^{ad Z}` is the identity, while `Ad(d) = −1` on `𝔤` for `d = diag(1, −1)`. Axiom (v) fails, as it must, since the condition fails.

### 2.6 Conjugacy of Iwasawa triples

Let `(D, 𝔞, Σ⁺)` and `(D', 𝔞', Σ'⁺)` be Iwasawa triples on `G` with `𝔷 ∩ 𝔭 = 𝔷 ∩ 𝔭'`. There is `g ∈ G⁰` with `θ' = c_g θ c_g⁻¹`, `K' = gKg⁻¹`, `𝔭' = Ad(g)𝔭`, `Ad(g)𝔞 = 𝔞'` and `Ad(g)` carrying `Σ⁺` onto `Σ'⁺`. This does not identify `B` with `B'` or arbitrary matrix-model choices. For `D = D'` and `𝔞 = 𝔞'`, the elements of `K` doing this for fixed `Σ⁺, Σ'⁺` form one coset of the stabilizer of `Σ⁺` in `N_K(𝔞)`, which is `M` under the component condition (Knapp 2002, Ch. VI §§2, 5). RealSemisimpleLieGroups §3.1 proves the conjugacy of triples under `G` for connected groups with semisimple Lie algebra and finite centre; here `𝔤` may have a centre, `G` may be disconnected, and the conjugating element lies in `G⁰`. *Needs:* §§1.2, 2.2, 2.4–2.5; RealSemisimpleLieGroups §1.2 (simple transitivity on positive systems).

**Checks.**

- `SL_3(ℝ)`: the six positive systems of `A₂` for diagonal `𝔞` are permuted by the permutation matrices with signs fixed to determinant one. These realize `S₃`.
- `ℝ × S¹` (§1.2): all `θ_c` have `Σ = ∅`, so the triples are `(θ_c, 𝔭_c, ∅)`. Their involutions and maximal abelian subspaces are conjugate only for equal `c`.
- On `ℝ^×` with forms `xy` and `2xy`, inversion, `𝔞 = ℝ` and `Σ⁺ = ∅` agree, and `g = 1` gives the asserted conjugacy, although the forms differ.

### Examples

`GL_n(ℝ)` (`W = S_n`, component condition holds); `SO₀(n, 1)` for `n ≥ 2` (`Σ = {±λ}`, multiplicity `n − 1`); `SO₀(1,1) = A` has no roots; `SU(n, 1)` for `n ≥ 2` (`Σ = BC₁`, multiplicities `2(n − 1)` and `1`); `Sp_4(ℝ)` (`Σ = C₂`); `O(1,1)` and `Aut(𝔰𝔩_3(ℝ))` (component condition fails).

### Dependencies

Layer 1; RealSemisimpleLieGroups §§0.2, 1.2, 2.3; LieGroups Layers 1, 6, 7, 9; Tau Ceti `TauCeti.stabilizer_eq_closure_wallReflections`, `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`, `map_lieExp`; Mathlib `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute`, `RootPairing`, `RootPairing.Base`, `RootPairing.IsReduced`, `RootPairing.weylGroup` (recorded in RootSystems, "Exact supplier contracts").

## Layer 3: The minimal parabolic subgroup

### 3.1 Centralizers of subspaces of 𝔞

Let `(D, 𝔞)` be an Iwasawa pair and `𝔰 ⊆ 𝔞` a subspace. Prove the following (Knapp 2002, Ch. VII §2):

- `L = Z_G(𝔰)` is a closed `θ`-stable subgroup with Lie algebra `𝔩 = Z_𝔤(𝔰) = 𝔪 ⊕ 𝔞 ⊕ ⨁_{β|_𝔰 = 0} 𝔤^β`.
- `(θ|_L, B|_𝔩)` is a reductive Cartan datum on `L` with fixed group `K ∩ L` and polar decomposition `L = (K ∩ L)·lieExp(𝔩 ∩ 𝔭)`. Its global model is the restriction of the covering `π : G → H` of `C` to `L = π⁻¹(Z_H(dπ 𝔰))`: `π(g)` centralizes the matrices `dπ 𝔰` iff `Ad(g)` fixes `𝔰`, since `dπ ∘ Ad(g) = Ad(π(g)) ∘ dπ` and `dπ` is injective. `Z_H(dπ 𝔰)` is closed; it is transpose-stable because `dπ 𝔰 ⊆ dπ 𝔭` consists of symmetric matrices; and it has finitely many components, because the polar decomposition of `H` restricts to it (the argument of step 1, in `H`) with compact first factor `K_H ∩ Z_H(dπ 𝔰)`. The kernel of `π` is central, so it lies in `L`, and `L → Z_H(dπ 𝔰)` is a finite central covering compatible with transpose-inverse, fixing the compact preimage. `𝔩` is `dθ`-stable, and the reductivity criterion of §1.1 for `B_θ` gives its reductivity fields.
- `𝔞` is maximal abelian in `𝔩 ∩ 𝔭`, the restricted roots are `{β ∈ Σ : β|_𝔰 = 0}`, and `Z_{K∩L}(𝔞) = M`.
- If `G` satisfies the component condition, so does `L`.

Proof sketch:

1. For `l = k·lieExp X ∈ L`, `θ(l)⁻¹ l = lieExp(2X) ∈ L`. So `e^{2 ad X}` fixes `𝔰`, which forces `⁅X, 𝔰⁆ = 0`.
2. For the component condition: an element of `K⁰ ∩ L` can be moved into `N_{K⁰}(𝔞)` by `(K ∩ L)⁰` (§2.2 for `L`). It then acts on `𝔞` by an element of `W(Σ)` fixing `𝔰` pointwise. That element is generated by reflections `s_β` with `β|_𝔰 = 0` (§2.1), which are realized in `(K ∩ L)⁰` (§2.2 (e), for `L`).

*Needs:* §§1.1 (the reductivity criterion), 2.1–2.2, 2.4–2.5; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, for step 1 and for `Lie(L) = Z_𝔤(𝔰)`; `g·lieExp X·g⁻¹ = lieExp(Ad g X)`, which with `map_lieExp` gives `dπ ∘ Ad(g) = Ad(π(g)) ∘ dπ`; `Ad` on `GL (Fin n) ℝ` is conjugation), Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`, `lieSubalgebraOfSubgroup`), Layer 3 (`lieMap`, for `dπ`), Layer 9 (`FiniteCartanMatrixModel`, the root decomposition, the polar decomposition); Tau Ceti `map_lieExp` (applied to `θ`, so that `θ(l)⁻¹l = lieExp(2X)` in step 1, and to `π`).

**Checks.**

- `G = GL_3(ℝ)`, `𝔰 = ℝ·diag(1, 1, −2)`: `L = GL_2(ℝ) × GL_1(ℝ)` block diagonal, with roots `±(e₁ − e₂)`. For the identity model, `Z_H(𝔰) = L` is closed and transpose-stable with four components, and `𝔩 = 𝔤𝔩_2 ⊕ 𝔤𝔩_1` has centre `ℝ·diag(1, 1, 0) ⊕ ℝ·diag(0, 0, 1)` and derived algebra `𝔰𝔩_2`, as the reductivity fields require.
- `𝔰 = 0` gives `L = G`. `𝔰 = 𝔞` gives `L = MA`, with no roots.
- `G = SL_2(ℂ)` as a real group, `𝔰 = 𝔞`: `L = MA` with `M = {diag(e^{iφ}, e^{−iφ})} ≅ U(1)`. A positive-dimensional `M` is allowed.

### 3.2 The groups M, N and P

For an Iwasawa triple define:

- `M = Z_K(𝔞) = {k ∈ K : Ad(k)H = H for all H ∈ 𝔞}`;
- `N = lieExp 𝔫`, the subgroup of §2.3;
- the **minimal parabolic subgroup** `P = M·A·N`.

AutomorphicFormsOnReductiveGroups §2.3a owns these objects and the facts below for the real points of connected reductive `ℝ`-groups, and RealSemisimpleLieGroups §3.1, built on it, for connected groups with semisimple Lie algebra and finite centre; here they are stated for every Iwasawa triple of a reductive Cartan datum, and on those two classes they are theirs (Knapp 2002, Ch. VI §4; Ch. VII §7). *Needs:* §1.1 (polar coordinates, for `Z(G) ⊆ MA`), §2.3 (`N = Nplus = lieExp 𝔫`), §2.4 (`Z_G(𝔞) = M·A`, `M ∩ A = 1`); LieGroups Layer 0 (`lieExp`), Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)` and `Ad(lieExp X) = exp(ad X)`: `M = Z_K(A)`, `M` and `A` commute, and `M` and `A` normalize `N`), Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`, `lieSubalgebraOfSubgroup`), Layer 9 (compactness of `K`, closedness and connectedness of `N`, injectivity of `lieExp` on `𝔞`, `iwasawaDecomposition`); Mathlib `Subgroup.centralizer`.

Prove the following API.

- `M` is a compact subgroup, possibly disconnected, with `Lie(M) = 𝔪`. `M = Z_K(A)`, because `A = lieExp 𝔞` is connected with Lie algebra `𝔞`. `M` preserves every `𝔤^β`.
- `A` is a closed subgroup, and `lieExp : 𝔞 → A` is an isomorphism of Lie groups from the vector group `𝔞`.
- `N` is closed, simply connected and nilpotent, and `lieExp : 𝔫 → N` is a diffeomorphism.
- `M` and `A` commute, `M ∩ A = 1`, and `MA = Z_G(𝔞) ≅ M × A`. `M` and `A` normalize `N`.
- `P` is a subgroup and `Z(G) ⊆ MA ⊆ P`.

**Checks.**

- `SL_2(ℝ)`, `𝔞 = ℝ·diag(1, −1)`, `Σ⁺ = {α}` with `α(diag(1, −1)) = 2`: `M = {±1}`, `A` positive diagonal, `N` upper unitriangular, `P` upper triangular. The `M`-factor of `((−2, 3), (0, −1/2))` is `−1` (sign convention above). Taking the identity component `M⁰ = {1}` in place of `M` would miss `−1` and make `P` connected, which fails `P ⊇ Z(G) = {±1}`.
- `GL_n(ℝ)`: `M` has order `2^n` and `P = TauCeti.upperTriangularGroup`.
- `SL_2(ℂ)`: `M ≅ U(1)`, `N = {((1, z), (0, 1)) : z ∈ ℂ}` with `dim N = 2 = m_α`.
- Compact `G` and `ℝ^×`: `P = G`.

### 3.3 The Langlands decomposition of P

For an Iwasawa triple prove (Knapp 2002, Ch. VII §§2, 7; Warner 1972, Ch. 1 §1.2):

- (a) `P` is closed and `N` is normal in `P`.
- (b) The multiplication `M × A × N → P` is a diffeomorphism, and `Lie(P) = 𝔪 ⊕ 𝔞 ⊕ 𝔫`.
- (c) `P ∩ θ(P) = MA`, with `θ(P) = M A N̄`.
- (d) `G = KAN = KP`, `K ∩ P = M`, and `kM ↦ kP` is a `K`-equivariant homeomorphism `K/M → G/P`; in particular `G/P` is compact.
- (e) `P` and `D` determine the rest: `𝔫` is the `B`-orthogonal of `Lie(P)`, `MA = P ∩ θ(P)`, `𝔞 = Lie(P ∩ θ(P)) ∩ 𝔭`, `M = Z_K(𝔞)`, and `Σ⁺ = {β ∈ Σ : 𝔤^β ⊆ Lie(P)}`.
- (f) Under the component condition, `P = N_G(𝔫) = N_G(P)`. Hence `P` is normal in `G` only if `P = G`, and `P = G` iff `Σ = ∅`.

These are the conclusions that AutomorphicFormsOnReductiveGroups §2.3a and RealSemisimpleLieGroups §3.1 list for their two classes, here for every Iwasawa triple, with (f) under the component condition.

Proof sketch:

- For (c): an element of `N̄` has unbounded `lieExp(−tH₀)`-conjugates for regular `H₀` in the positive chamber, while elements of `P` have bounded ones. So `P ∩ N̄ = 1`.
- For (d): `G = KAN` is §2.3 with base `iwasawaDecomposition`. `K ∩ MAN = M` follows from its uniqueness.
- For (f): if `k ∈ K` normalizes `𝔫`, it normalizes `dθ𝔫` and `(𝔫 ⊕ dθ𝔫)^⊥ = 𝔪 ⊕ 𝔞`. Since `𝔭 ∩ (𝔪 ⊕ 𝔞) = 𝔞`, `k ∈ N_K(𝔞)` fixes `Σ⁺`, so `k ∈ M` (§2.5). For `N_G(P)`: it normalizes `Lie(P)` and hence its `B`-orthogonal `𝔫`.

*Needs:* §§2.3–2.6, 3.1–3.2; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)` and `g·lieExp X·g⁻¹ = lieExp(Ad g X)`, for the `lieExp(−tH₀)`-conjugates in (c)), Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`), Layer 9 (`iwasawaDecomposition`).

**Checks.**

- `SL_2(ℝ)`: `θ(P)` is lower triangular, `P ∩ θ(P)` is the diagonal subgroup `MA`, and `G/P ≅ SO(2)/{±1} ≅ ℙ¹(ℝ)`. For `a = diag(t, t⁻¹)`, `det(Ad(a)|_𝔫) = t²`.
- `SO₀(n, 1)` for `n ≥ 2` with `𝔞 = ℝ(E_{n,n+1} + E_{n+1,n})`: `M ≅ SO(n − 1)`, `N ≅ ℝ^{n−1}` abelian, `P` is the stabilizer of the isotropic line `ℝ(e_n + e_{n+1})`, and `G/P ≅ S^{n−1}`.
- `O(1,1)`: `P = MA = {±exp(tY)}` has index two in `G`, so `P` is normal and `N_G(P) = G ≠ P` while `Σ = ∅`. This is the negative control for the component condition in (f).
- `GL_2(ℝ)`: the nilradical of `Lie(P)` is `ℝE₁₂ ⊕ ℝ·1`, two-dimensional, while `𝔫 = ℝE₁₂`. So "`𝔫` is the nilradical of `Lie(P)`" is false when `𝔷 ≠ 0`. The `B`-orthogonal of `Lie(P)` is `ℝE₁₂`, as in (e).

### 3.4 Minimal parabolic subgroups form one conjugacy class

Call a subgroup a **minimal parabolic subgroup** of `(G, D)` if it is `P(D', 𝔞, Σ⁺)` for some Iwasawa triple whose datum `D'` has the same split central part as `D`. Prove that these form a single `G⁰`-conjugacy class. For a fixed `D`, prove that they form a single `K⁰`-conjugacy class (Knapp 2002, Ch. VI §5; Ch. VII §7). *Needs:* §§2.6, 3.2; LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)`, so that `gPg⁻¹` is the minimal parabolic subgroup of the triple transported by `g`; `Ad(lieExp X) = exp(ad X)`, so that `Ad(G⁰)` fixes `𝔷` and transport by `G⁰` keeps the split central part).

**Checks.**

- `SL_2(ℝ)`: the minimal parabolics are the stabilizers of the points of `ℙ¹(ℝ)`, all conjugate to the upper triangular group.
- Real rank one with nonempty `Σ`: `Σ ⊆ {±λ, ±2λ}` with `Σ⁺ = Σ ∩ {λ, 2λ}`, and the minimal parabolics containing `MA` are exactly `P` and `θ(P) = MAN̄`. Here `𝔞` is one-dimensional and `Σ ≠ ∅`, so the two positive systems give two distinct subgroups. For `SO₀(1,1) = A`, `Σ = ∅`, `P = G` and the quotient is a point.
- The tilted `ℝ × S¹` data of §1.2 all give `𝔞 = 𝔭_c`, `Σ = ∅`, `M = S¹`, `N = 1` and `P = G`. For a fixed split centre `𝔭_c`, permitted triples retain that same line. Equality of their subgroup `P` does not recover an involution: `θ_c ≠ θ_{c'}` for `c ≠ c'`, and this abelian group cannot conjugate them.

### 3.5 The minimal parabolic datum

For an Iwasawa triple, §2.3 gives LieGroups' `IwasawaData` with `N = Nplus`, and §§3.2–3.4 prove every conclusion that RealSemisimpleLieGroups §3.1 lists for a minimal parabolic datum: the facts on `M`, `A` and `N`, `MA = Z_G(𝔞)`, the closedness, Lie algebra and Langlands decomposition of `P`, `P ∩ θ(P) = MA`, `G = KP` and, under the component condition, `P = N_G(𝔫) = N_G(P)`. The conjugacy of triples holds among data with the same split central part, by an element of `G⁰` (§2.6); across different split central parts it fails (§1.2). Prove (Knapp 2002, Ch. VI §§4–5 and Ch. VII §§2, 5, 7, for the facts collected):

- If the triple satisfies the component condition, it is a minimal parabolic datum in the sense of RealSemisimpleLieGroups §3.1, with that conjugacy clause, whose `M` meets every component of `G`; the statements of RealSemisimpleLieGroups Layers 3–4 about a single such datum apply to it.
- For every Iwasawa triple, the restriction to `G⁰` (§1.1) with the same `𝔞` and `Σ⁺` has minimal parabolic subgroup `P ∩ G⁰ = Z_{K⁰}(𝔞)·A·N`, satisfies the component condition (§2.5), and is a minimal parabolic datum on the connected group `G⁰`.

The equality `P ∩ G⁰ = Z_{K⁰}(𝔞)·A·N` holds because `A` and `N` are connected and `M ∩ G⁰ = M ∩ K⁰` (§1.1). *Needs:* §§1.1, 2.3, 2.5–2.6, 3.2–3.4; RealSemisimpleLieGroups §3.1.

**Checks.**

- `SL_2(ℝ)`: `M = {±1}` meets the single component, and the datum is RealSemisimpleLieGroups' minimal parabolic datum of `SL_2(ℝ)`, with `P` upper triangular.
- `O(1,1)`: `P = MA ≠ N_G(𝔫) = G`, so without the component condition the triple is not a minimal parabolic datum. Its restriction to `G⁰ = SO₀(1,1) = A` has `P ∩ G⁰ = A = G⁰`, `Z_{K⁰}(𝔞) = {1}`, and is one.
- `ℝ × S¹` with `θ_0` and `θ_1` (§1.2): both triples satisfy the component condition and give `P = G`, but they are not conjugate, since their split central parts `𝔭_0 ≠ 𝔭_1` differ. Only the conjugacy clause for equal split central parts holds.
- `GL_2(ℝ)`: `M = {diag(±1, ±1)}` meets both components, `P` is upper triangular, and `P ∩ G⁰` is the upper triangular group with positive determinant, `Z_{K⁰}(𝔞) = {±1}`.

### Examples

`SL_2(ℝ)`, `GL_n(ℝ)` (`P` upper triangular, `M` the sign matrices), `SO₀(n, 1)` for `n ≥ 2`, `SU(n, 1)` for `n ≥ 2` (`𝔫 = 𝔤^λ ⊕ 𝔤^{2λ}` Heisenberg of dimension `2n − 1`), `SL_2(ℂ)` (`M = U(1)`), compact `G` and `ℝ^×` (`P = G`).

### Dependencies

Layers 1–2; RealSemisimpleLieGroups §3.1; LieGroups Layers 0, 1, 2, 3, 9; Tau Ceti `map_lieExp`; Mathlib `Subgroup.normalizer`, `Subgroup.centralizer`.

## Layer 4: The Bruhat decomposition over the restricted Weyl group

### 4.1 Fixed points of A on G/P

For an Iwasawa triple, prove the following:

- `𝔭 ∩ (𝔪 ⊕ 𝔞 ⊕ 𝔫) = 𝔞`. If `X = m + a + n` lies in `𝔭`, then `2m + n + dθ n = 0`, which forces `m = n = 0`.
- Consequently, for `g = kp` (§3.3(d)), `Ad(g)(𝔪 ⊕ 𝔞 ⊕ 𝔫) ⊇ 𝔞` iff `k ∈ N_K(𝔞)`. So the minimal parabolic subalgebras containing `𝔞` are `𝔪 ⊕ 𝔞 ⊕ ⨁_{β ∈ Σ'⁺} 𝔤^β` for the positive systems `Σ'⁺`, permuted simply transitively by `W(Σ)`.
- For `H₀` regular, the fixed points of `t ↦ lieExp(tH₀)` on `G/P` are the `kP` with `k ∈ N_K(𝔞)`. These are the `|W_G|` distinct points `n_w P`, `w ∈ W_G`, because `n_w P = n_{w'} P` iff `n_w⁻¹n_{w'} ∈ K ∩ P = M` (§3.3(d)). Under the component condition they are the `|W|` points indexed by `W(Σ)`.

(Knapp 2002, Ch. VII §4.) *Needs:* §§2.4–2.5, 3.3; RealSemisimpleLieGroups §1.2 (simple transitivity on positive systems); LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)`: `lieExp(tH₀)` fixes `gP` iff `lieExp(t·Ad(g⁻¹)H₀) ∈ P`), Layer 2 (`lieSubalgebraOfSubgroup`: for the closed `P`, `lieExp(tY) ∈ P` for all real `t` iff `Y ∈ Lie(P)`).

**Checks.**

- `SL_2(ℝ)` on `ℙ¹(ℝ)`: `diag(e^t, e^{−t})` fixes exactly the lines `[e₁]` and `[e₂]`, which are `eP` and `n_s P`.
- `SL_3(ℝ)`: six fixed flags, the coordinate flags, matching `|S₃| = 6`.
- `O(1,1)`: `H₀ = Y`, and both `P` and `dP`, `d = diag(1, −1)`, are fixed, two points for `|W_G| = 2` while `|W(Σ)| = 1`.

### 4.2 The Bruhat decomposition

For every Iwasawa triple prove (Knapp 2002, Ch. VII §4; Warner 1972, Ch. 1 §1.2):

- `G = ⨆_{w ∈ W_G} P n_w P`, a disjoint union indexed by `W_G = N_K(𝔞)/M` (§2.4), independent of the representatives `n_w`.
- With `N_w = N ∩ n_w N̄ n_w⁻¹ = lieExp(⨁_{β ∈ Σ⁺, w⁻¹β ∈ −Σ⁺} 𝔤^β)`, the map `N_w × P → P n_w P`, `(u, p) ↦ u n_w p`, is a homeomorphism onto `P n_w P`. This cell is a locally closed embedded submanifold of dimension `dim P + Σ_{β ∈ Σ⁺, w⁻¹β < 0} dim 𝔤^β`.
- The open cells are the `P n_w P` with `w⁻¹Σ⁺ = −Σ⁺`, one for each element of the stabilizer of `Σ⁺` in `W_G`; when there are several, none is dense.

Under the component condition the triple is a minimal parabolic datum (§3.5) and RealSemisimpleLieGroups §§3.2–3.3 apply to it: `W_G = W(Σ)` (§2.5), so the union is indexed by `W(Σ)`; for the longest element `w₀` the cell `P n_{w₀} P` is the unique open cell, it is dense, and `N̄ × M × A × N → G` is a diffeomorphism onto `N̄MAN = n_{w₀}⁻¹ P n_{w₀} P`; and `P` and `N_G(𝔞)` are the `B` and `N` of a `TauCeti.TitsSystem` on `G` with Weyl group `N_G(𝔞)/MA ≅ W(Σ)` and simple reflections the classes of the `n_{s_α}`, `α ∈ Π`, whose `TauCeti.TitsSystem.bruhatCell` of `w` is `P n_w P` (Bourbaki, Ch. IV §2). The three statements above hold without that condition.

Proof sketch (reduction to the identity component):

1. `G = N_K(𝔞)·G⁰` (§2.2(c)). Let `S` be the stabilizer of `Σ⁺` in `N_K(𝔞)`. The image `W(Σ)` of `N_{K⁰}(𝔞)` (§2.4) acts simply transitively on positive systems (RealSemisimpleLieGroups §1.2), so `N_K(𝔞) = N_{K⁰}(𝔞)·S` and `G = G⁰·S`. Each `s ∈ S` normalizes `𝔞`, `𝔫`, `K` and `K⁰`, hence `M`, `A`, `N` and `P`. The restriction to `G⁰` is a minimal parabolic datum with minimal parabolic `P ∩ G⁰ = Z_{K⁰}(𝔞)·A·N` (§3.5).
2. For `G⁰`, RealSemisimpleLieGroups §3.3 gives `G⁰ = ⨆_{w ∈ W(Σ)} (P ∩ G⁰) n_w (P ∩ G⁰)` with `n_w ∈ N_{K⁰}(𝔞)` (§2.4), each cell an embedded submanifold with `N_w n_w (P ∩ G⁰)/(P ∩ G⁰) ≅ N_w`.
3. Back in `G`: for `g₀ ∈ G⁰` and `s ∈ S`, `g₀ s ∈ (P ∩ G⁰) n_w (P ∩ G⁰) s ⊆ P n_w s P` because `s` normalizes `P`; so `G = G⁰·S ⊆ ⋃_{n ∈ N_K(𝔞)} P n P`. Moreover `P n P = N_n n P` for `n ∈ N_K(𝔞)`, because `n` normalizes `MA` and `N = N_n·(N ∩ nNn⁻¹)`. Every point of `N_n n P/P` converges to `nP` as `t → −∞` under `a_t = lieExp(tH₀)`, since `a_t u a_{−t} → 1` for `u ∈ N` and `n` normalizes `A`; so two cells `P n P`, `P n' P` meet only if `nP = n'P`, that is, `n⁻¹n' ∈ M` (§3.3(d)). The `N_n`-coordinate is unique because `N̄ ∩ P = 1` (§3.3(c)), and the `N̄MAN` chart is open because `𝔤 = 𝔫̄ ⊕ 𝔪 ⊕ 𝔞 ⊕ 𝔫`.

*Needs:* §§2.2, 2.4–2.5, 3.3, 3.5, 4.1; RealSemisimpleLieGroups §§1.2, 3.2–3.3; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, and `g·lieExp X·g⁻¹ = lieExp(Ad g X)` for `a_t u a_{−t} → 1`); Tau Ceti `TauCeti.TitsSystem`, `TauCeti.TitsSystem.bruhatCell`; Mathlib `DoubleCoset.doubleCoset`.

**Checks.**

- `SL_2(ℝ)`: `G = P ⊔ P n_s P`, with `P n_s P = {g : g₂₁ ≠ 0}` open dense of dimension `3 = 2 + 1`. For `GL_2` this is `TauCeti.GL2Borel.mem_doubleCoset_weyl_iff`.
- `SL_3(ℝ)`: six cells of dimensions `5, 6, 6, 7, 7, 8`, with `dim P = 5` and `ℓ(w)` added.
- `SU(2, 1)`: two cells. The big cell has dimension `dim P + 3 = 8 = dim G`, with `m_λ + m_{2λ} = 2 + 1`. Counting only `m_λ` would give 7.
- `O(1,1)`: `W_G = ℤ/2` (§2.4) and `G = P ⊔ dP` for `d = diag(1, −1)`, two cells, both open of dimension `1 = dim P` since `Σ⁺ = ∅`, and neither dense. The union over `W(Σ) = 1` is `P ≠ G`: the `W(Σ)`-indexed form and the density of a big cell need the component condition; the decomposition over `W_G` does not.
- `Aut(𝔰𝔩_3(ℝ))`: twelve cells, indexed by `W_G` of order 12 (§2.5), two of them open, for `w₀` and for `w₀` composed with the class of `σ·Ad(w₀)`. Its `N_G(𝔞)/Z_G(𝔞)` of order 12 is not generated by the two simple reflections, so these `B`, `N` and simple reflections satisfy no Tits system, as the component condition predicts.
- `GL_n(ℝ)` for `n ≥ 1`: `P` is the upper triangular group and `N_G(𝔞)` the monomial matrices, the subgroups of `TauCeti.glTitsSystem ℝ (n − 1)`, whose Weyl group is identified with `S_n` by `TauCeti.glTitsSystemWeylGroupMulEquivPerm`. At `n = 0`, `G = P = 1`, `W = 1` and there is one cell; natural subtraction gives `0 − 1 = 0`, so that native expression instead describes `GL_1`, and it is not used at `n = 0`.
- Compact `G`: `𝔞 = 0`, `N_K(𝔞) = K = M`, `W_G = 1` and the single cell is `G = P`.

### Examples

`SL_2(ℝ)`, `SL_3(ℝ)` (six cells), `SO₀(n, 1)` for `n ≥ 2` and `SU(n, 1)` for `n ≥ 1` (two cells each), `GL_n(ℝ)` for `n ≥ 1` (agreement with `TauCeti.glTitsSystem`); `GL_0(ℝ)` (one cell), compact `G` (one cell), `O(1,1)` (two open cells) and `Aut(𝔰𝔩_3(ℝ))` (twelve cells).

### Dependencies

Layers 2–3; RealSemisimpleLieGroups §§1.2, 3.2–3.3; LieGroups Layers 1, 2, 9; Tau Ceti `TauCeti.TitsSystem`, `TauCeti.TitsSystem.bruhatCell`, `TauCeti.glTitsSystem`; Mathlib `DoubleCoset.doubleCoset`.

## Layer 5: The group ⁰L and the split component

### 5.1 The group ⁰L and the split component

For a group `L` with a reductive Cartan datum `(C_L, B_L)`, define `⁰L = {l ∈ L : χ(l) = 1 for every continuous homomorphism χ : L → (ℝ_{>0}, ·)}`. Put `V = 𝔷(𝔩) ∩ 𝔭_L`, `F = V^{Ad(L)}` and `V₀ = F^⊥ ∩ V`, with orthogonality for `B_θ`. Define the datum's split component `A_L = lieExp V`. The action on `V` factors through the finite component group `L/L⁰`; it is orthogonal since `Ad(K_L)` preserves `B_θ`. Prove the following (Knapp 2002, Ch. VII §2; Wallach 1988, Ch. 2 §2.2 for the trivial-action specialization; finite-component extension by the averaging argument below):

- `⁰L` is closed and normal, and `Lie(⁰L) = [𝔩, 𝔩] ⊕ (𝔷(𝔩) ∩ 𝔨_L) ⊕ V₀`, the joint kernel of the differentials `dχ`.
- `⁰L = K_L·lieExp((𝔭_L ∩ [𝔩,𝔩]) ⊕ V₀)`.
- The datum restricts to `⁰L` with fixed group `K_L`. Its Lie algebra is an ideal of `𝔩` containing `[𝔩, 𝔩]`, so its derived algebra is the semisimple `[𝔩, 𝔩]` and its centre is `(𝔷(𝔩) ∩ 𝔨_L) ⊕ V₀`, which are the reductivity fields. Restrict its finite matrix cover to the image of `⁰L`; closedness, transpose stability and finite components follow from this polar description. The finite covering kernel lies in `K_L ⊆ ⁰L`, so restriction remains a covering onto its image with the full compact preimage fixed.
- Multiplication `⁰L × lieExp(F) → L` is an isomorphism of Lie groups. The second factor is central in all of `L`.
- `⁰L` is intrinsic. Both `A_L` and the selected complementary subgroup `lieExp(F)` depend on the datum.
- If components act trivially on `V`, then `F = V`, `V₀ = 0`, and `⁰L × A_L → L` is the direct product. This applies under the component condition: `L = Z_{K_L}(𝔞_L)·L⁰` fixes `V ⊆ 𝔞_L`.

RealSemisimpleLieGroups §4.3 proves `M_{Π'} × A_{Π'} ≅ L_{Π'}` for the Levi subgroups of a minimal parabolic datum with the component condition, where `M_{Π'}`, the joint kernel of the `|χ|` for continuous `χ : L_{Π'} → ℝ^×`, is `⁰L_{Π'}`; for `L = L_{Π'}`, which carries a reductive Cartan datum with the component condition (§3.1) and whose `𝔷(𝔩_{Π'}) ∩ 𝔭` is `𝔞_{Π'}`, that is the last bullet. This section treats an arbitrary reductive Cartan datum, whose components may move the split centre.

Proof route: average the finite component action over `L/L⁰`, whose cardinality is a positive integer, to obtain the orthogonal projection `pr_F : V → F`. For polar coordinates `l = k exp X`, project the central part of `X` in `𝔭_L = (𝔭_L ∩ [𝔩,𝔩]) ⊕ V` by `pr_F`. This defines a continuous homomorphism `h : L → (F,+)`, with `h(k) = 0` and `h(exp v) = pr_F(v)`. To prove additivity, first use the central/derived splitting on `L⁰`; compact central periods project to zero, so the central logarithm descends. Invariance under components then extends it over `L = K_L L⁰`. Every positive character kills `K_L` and the derived algebra, and its differential on `V` is component invariant; thus it is exactly `exp ∘ ℓ ∘ h` for a unique `ℓ ∈ F*`. Consequently `ker h = ⁰L`, while `h(exp f) = f` for `f ∈ F`, giving the asserted product. No centrality of `A_L` in disconnected `L` is presumed. *Needs:* §1.1; LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)` and `Ad(lieExp X) = exp(ad X)`: `L⁰` acts trivially on `𝔷(𝔩)` and `lieExp F` is central), Layers 3, 9 (Lie map, central periods and polar coordinates); for the component-condition clause, §2.2(d) (`V ⊆ 𝔞_L`) and §2.5 (the condition); for the comparison with RealSemisimpleLieGroups §§4.1, 4.3, §3.1 (the datum and the condition on `L_{Π'}`) and §3.5 (the minimal parabolic datum to which RealSemisimpleLieGroups §4.3 is applied).

**Checks.**

- `L = ℝ ⋊ C₂` with inversion action: every positive character kills the translations, since its differential obeys `ℓ(−t) = ℓ(t)`, and kills the finite quotient. Thus `⁰L = L`, `V = V₀ = ℝ`, `F = 0`, `pr_F = h = 0`, and the product is `L × 1 → L`. The product `⁰L × A_L` would have the nontrivial fibre over `1`, `{(exp(−t), exp t) : t ∈ ℝ}`.
- `L = ℝ^×`: the continuous homomorphisms to `ℝ_{>0}` are `x ↦ |x|^s`, so `⁰L = {±1}`, `V = F = ℝ`, `V₀ = 0`, `h(x) = log|x|` and `A_L = ℝ_{>0}`.
- `L = GL_n(ℝ)` for `n ≥ 1`: `V = F = ℝ·1`, `V₀ = 0`, `h(g) = (log|det g|/n)·1`, `⁰L = {g : |det g| = 1}` and `A_L = ℝ_{>0}·1`. Here `n > 0` justifies the denominator. At `n = 0`, `V = F = V₀ = 0`, `h = 0` and both groups are trivial.
- `L` compact: `V = F = V₀ = 0`, `h = 0`, `⁰L = L` and `A_L = 1`.
- `L = ℝ × S¹` with the tilted data `θ_c` of §1.2: `⁰L = {0} × S¹` for every `c`, while `A_L = {(t, ct)}` depends on `c`. Here `V = F = 𝔭_c`, `V₀ = 0`, `h(t,s) = (t,ct)`, and in every case `L = ⁰L × A_L`. So `⁰L` is intrinsic and `A_L` is not.
- For `L = ℝ² ⋊ C₂` with the component swapping coordinates, use the standard vector-group datum. Then `F = {(u,u)}`, `V₀ = {(v,−v)}`, and averaging sends `(3,1)` to `(2,2)` with residual `(1,−1)`. Thus `h((3,1),0) = (2,2)` and `⁰L = V₀ ⋊ C₂`; both fixed and moving central directions occur.
- Defining `⁰L` as `K_L` alone fails for `GL_2(ℝ)`: `O(2) ≠ {|det| = 1}`, since `diag(2, 1/2)` has `|det| = 1` and is not orthogonal.

### Examples

`GL_n(ℝ)` (`⁰L = {|det| = 1}`), `ℝ^×` (`⁰L = {±1}`), compact `L` (`⁰L = L`), `ℝ ⋊ C₂` (`⁰L = L`, `F = 0`), `ℝ² ⋊ C₂` (fixed and moving central directions).

### Dependencies

Layers 1–3 (Layers 2–3 for the component-condition clause and the comparison only); RealSemisimpleLieGroups §§4.1, 4.3 (comparison only); LieGroups Layers 1, 3, 9.

## Layer 6: Parabolic subgroups and subalgebras in general

### 6.1 Conjugate standard parabolics of a Tits system

For an arbitrary `TauCeti.TitsSystem` with subgroup `B` and `J, J' ⊆ S`:

- if `g B g⁻¹ ⊆ P_J`, then `g ∈ P_J`;
- if `g P_J g⁻¹ = P_{J'}`, then `J = J'` and `g ∈ P_J`;
- if `g P_J g⁻¹ ⊆ P_{J'}`, then `J ⊆ J'` and `g ∈ P_{J'}`.

(Bourbaki, Ch. IV §2 nos. 5–6; Borel–Tits 1965, Corollaire 5.18 (ii), p. 101.) The three statements are packaged as one equivalence, `conj_standardParabolic_le_iff`: `g P_J g⁻¹ ⊆ P_{J'}` holds iff `J ⊆ J'` and `g ∈ P_{J'}`. The first statement is its case `J = ∅`, because `P_∅ = B` (`TauCeti.TitsSystem.standardParabolic_empty`); the third is its forward direction; the second follows by applying it to `g` and to `g⁻¹`. RealSemisimpleLieGroups §4.4 states the uniqueness of the type of a parabolic subgroup, which with the self-normalization of its §4.2 is the second statement for the Tits system `(P, N_G(𝔞))` of a minimal parabolic datum whose `M` meets every component; this section states all three for an arbitrary Tits system, with no topology, field or finiteness, and the first and third statements, about conjugation into a larger standard parabolic, are not stated there. FlagVarieties §§3.1, 3.2 and 5.2 state all three for a connected reductive group `G` over an algebraically closed field `k` and `g ∈ G(k)`, through Borel conjugacy (Scope and ownership); this section needs neither the algebraic group nor the field.

Proof sketch:

1. Write `g ∈ BwB` (`TauCeti.TitsSystem.existsUnique_mem_bruhatCell`) with `g = b n b'`, `n` a representative of `w`. Since `B ⊆ P_{J'}`, `g B g⁻¹ ⊆ P_{J'}` gives `n B n⁻¹ ⊆ P_{J'}`, hence `B n B n⁻¹ B ⊆ P_{J'}`.
2. Induction on the length of `w`. If `w ≠ 1`, write `w = s w'` with `s` simple and `ℓ(w') = ℓ(w) − 1`. Then `BsB·Bw'B = BwB` and `Bw'⁻¹B·BsB = Bw⁻¹B` (`TauCeti.TitsSystem.bruhatCell_mul_eq_of_wordLength_le` and its right-handed form `TauCeti.TitsSystem.bruhatCell_mul_eq_of_wordLength_le_right`), so `B n B n⁻¹ B = BwB·Bw⁻¹B = BsB·(Bw'B·Bw'⁻¹B)·BsB ⊇ BsB·BsB = B ∪ BsB` (`TauCeti.TitsSystem.bruhatCell_mul_self_eq_union_of_mem_simple`). Hence `BsB ⊆ P_{J'}`, so `s ∈ J'` (`TauCeti.TitsSystem.bruhatCell_subset_standardParabolic_iff`). Writing `n = n_s n' b''` with `n_s ∈ BsB ⊆ P_{J'}` and `n'` a representative of `w'`, `n' B n'⁻¹ ⊆ n_s⁻¹ P_{J'} n_s = P_{J'}`; by induction `w' ∈ W_{J'}`, so `w ∈ W_{J'}` and `g ∈ P_{J'}` (`TauCeti.TitsSystem.mem_standardParabolic_iff`).
3. If `g P_J g⁻¹ ⊆ P_{J'}`, steps 1–2 give `g ∈ P_{J'}`, so `P_J ⊆ g⁻¹ P_{J'} g = P_{J'}` and `J ⊆ J'` (`TauCeti.TitsSystem.standardParabolic_le_standardParabolic_iff`). The converse is immediate from `P_J ⊆ P_{J'}`.

*Needs:* Tau Ceti `TauCeti.TitsSystem.standardParabolic`, `TauCeti.TitsSystem.standardParabolic_empty`, `TauCeti.TitsSystem.mem_standardParabolic_iff`, `TauCeti.TitsSystem.existsUnique_mem_bruhatCell`, `TauCeti.TitsSystem.bruhatCell_mul_eq_of_wordLength_le`, `TauCeti.TitsSystem.bruhatCell_mul_eq_of_wordLength_le_right`, `TauCeti.TitsSystem.bruhatCell_mul_self_eq_union_of_mem_simple`, `TauCeti.TitsSystem.bruhatCell_subset_standardParabolic_iff`, `TauCeti.TitsSystem.standardParabolic_le_standardParabolic_iff`.

**Checks.**

- In `TauCeti.glTitsSystem` for `GL_3(k)`, `k` a field with `kˣ` nontrivial as that declaration requires: the two maximal standard parabolics, with blocks `(2, 1)` and `(1, 2)`, are not conjugate; they stabilize a plane and a line respectively. A permutation matrix outside `W_J` conjugates `B` out of `P_J`.
- With `S = ∅` (`B = G`) the statements are trivial: `P_∅ = G`, both sides of the equivalence hold for every `g` and `J = J' = ∅`.
- Rank one, `S = {s}` (for instance `SL_2(ℝ)` with `B = P`): `P_∅ = B` and `P_S = G`. For `g ∈ BsB` the equivalence with `J = J' = ∅` says `gBg⁻¹ ⊄ B`, which is the axiom `sBs ≠ B` of `TauCeti.TitsSystem`; with `J = ∅`, `J' = S` it holds for every `g`. A version claiming `J' ⊆ J` instead of `J ⊆ J'` would fail at `J = ∅`, `J' = S`, `g = 1`.
- `SL_3(ℝ)` with the Tits system `(P, N_G(𝔞))` of RealSemisimpleLieGroups §3.3: the second statement, like the uniqueness of type of RealSemisimpleLieGroups §4.4, says that `Q_{{α₁}} = {g : g₃₁ = g₃₂ = 0}` and `Q_{{α₂}} = {g : g₂₁ = g₃₁ = 0}` are not conjugate. The first statement, for a representative `n_{w₀}` of the longest element, says that the lower triangular group `n_{w₀}Pn_{w₀}⁻¹` lies in no proper standard parabolic, since `w₀ ∉ W_{Π'}` for `Π' ≠ Π`; directly, a lower triangular matrix with `g₂₁ ≠ 0` and `g₃₂ ≠ 0` lies in neither `Q_{{α₁}}` nor `Q_{{α₂}}`. RealSemisimpleLieGroups §4.4 does not state this containment form.

### 6.2 The dynamical description

Let `X ∈ 𝔞` lie in the closed positive chamber, with `Π' = {α ∈ Π : α(X) = 0}`. Define:

- `Q(X) = {g ∈ G : {lieExp(−tX)·g·lieExp(tX) : t ≥ 0} is relatively compact}`;
- `N(X) = {g ∈ G : lieExp(−tX)·g·lieExp(tX) → 1 as t → +∞}`.

Prove:

- (i) Without further hypotheses, `Q(X)` and `N(X)` are subgroups, and `Q(X) ⊆ N_G(𝔮_{Π'})`. For regular `X` (`Π' = ∅`), moreover, `N(X) = N` and `Q(X) = ⨆ P n_w P` over the `w ∈ W_G` with `wX = X`.
- (ii) Under the component condition, `Q(X)` is RealSemisimpleLieGroups' `dynamicalParabolic X`, equal to `Q_{Π'}` by its §4.4 for the minimal parabolic datum of §3.5; with the decomposition `Q_{Π'} = L_{Π'} ⋉ N_{Π'}` of its §4.3 this gives `N(X) = N_{Π'}`, `Q(X) ∩ Q(−X) = Z_G(X) = L_{Π'}` and `θ(Q(X)) = Q(−X)`.

RealSemisimpleLieGroups §4.4 states the identification `Q(X) = Q_{Π'}` under the component condition; part (i) holds for every Iwasawa triple, and the clauses of (ii) after `Q(X) = Q_{Π'}` are not stated there. Under the component condition, (ii) gives `Q(X) = Z_G(X)·N(X)` with `N(X) = lieExp(⨁_{β(X) > 0} 𝔤^β)`, the roots positive on `X` being those of `Σ⁺ ∖ Σ_{Π'}`; this is the Lie-group counterpart of the description of a parabolic subgroup by an order on the roots of a split torus, with the centralizer of the torus as Levi subgroup (Borel–Tits 1965, Théorème 4.15, pp. 90–91). The boundedness description of `Q(X)` is the Lie-group form of the limit description `TauCeti.Cocharacter.parabolic` (Conventions; Knapp 2002, Ch. VII §7). Proof sketch:

- For (i), decompose `Ad(g)` into blocks `E_μ → E_λ` between eigenspaces of `ad X`. Conjugation by `lieExp(−tX)` multiplies the block by `e^{t(μ − λ)}`. Boundedness forces the blocks with `μ > λ` to vanish, so `Ad(g)` preserves the filtration `⨁_{λ ≥ c} E_λ`, in particular `𝔮_{Π'}`, which is the sum of the eigenspaces with `λ ≥ 0` by RealSemisimpleLieGroups §4.1 applied to the restriction to `G⁰` (§3.5).
- For the regular case of (i), write `g = u n_w p` by §4.2 (over `W_G`). Conjugation by `lieExp(−tX)` sends `u ∈ N` to `1` as `t → +∞`, sends `p = man` to a family converging to `ma`, and sends `n_w` to `n_w·lieExp(t(X − w⁻¹X))`, which is bounded iff `wX = X` and converges iff `wX = X` (`lieExp` is injective on `𝔞` with closed image). So `Q(X)` is the union of the cells with `wX = X`; and `g ∈ N(X)` forces `wX = X`, then `n_w ∈ K ∩ P = M`, so `w = 1`, `u = 1` and `ma = 1`, that is, `g ∈ N`.
- For (ii): `θ(lieExp(−tX) g lieExp(tX)) = lieExp(tX) θ(g) lieExp(−tX)` since `dθX = −X`, and `θ` is a homeomorphism, so `θ(Q(X)) = Q(−X)`. Hence `Q(X) ∩ Q(−X) = Q_{Π'} ∩ θ(Q_{Π'}) = L_{Π'}` (RealSemisimpleLieGroups §4.3). `Z_G(X)` lies in both, its conjugates being constant, and contains `L_{Π'} = Z_G(𝔞_{Π'})` because `X ∈ 𝔞_{Π'}`. For `g = l·n` with `l ∈ L_{Π'}` and `n ∈ N_{Π'}`, `lieExp(−tX) g lieExp(tX) = l·lieExp(−tX) n lieExp(tX)`, and the second factor tends to `1` because `ad X` has positive eigenvalues on `𝔫_{Π'}`; so `g ∈ N(X)` iff `l = 1`.

*Needs:* §§3.3, 3.5, 4.2; RealSemisimpleLieGroups §§4.1, 4.3, 4.4; LieGroups Layer 1.

**Checks.**

- `GL_2(ℝ)`, `X = diag(1, 0)`: `Q(X)` is the upper triangular group, `N(X)` the upper unitriangular group and `Z_G(X)` the diagonal group, as in the sign witness. `X = diag(0, 1)` gives the lower triangular group; it is not in the positive chamber of `e₁ − e₂`.
- `X = 0`: `Q(0) = G` and `N(0) = 1`.
- For `GL_2(ℝ)` and `X = diag(1, 0)`, the conjugates `lieExp(−tX)·lieExp(Y)·lieExp(tX)` of Conventions (sign conventions, dynamical description) are `I + e^{t}E₂₁`, unbounded, for `Y = E₂₁ ∈ 𝔤^{e₂−e₁}`, where `(e₂ − e₁)(X) = −1`; `I + e^{−t}E₁₂ → I` for `Y = E₁₂ ∈ 𝔤^{e₁−e₂}`, where `(e₁ − e₂)(X) = 1`; and constantly `I` for `Y = 0` in either root space. So the hypothesis `Y ≠ 0` is needed in both equivalences stated there: `Y = 0 ∈ 𝔤^{e₂−e₁}` gives a bounded family converging to `I` although the root is negative on `X`.
- `Aut(𝔰𝔩_3(ℝ))` with `X₀ = diag(1, 0, −1)` regular: `σ·Ad(w₀)` sends `X₀` to `−diag(−1, 0, 1) = X₀`, so it commutes with `lieExp(tX₀)` and lies in `Q(X₀) ∩ Q(−X₀)` and in `Z_G(X₀)`, but not in `MA = Z_G(𝔞)`. The stabilizer of `X₀` in `W_G` is `{1, σ·Ad(w₀)}`, so `Q(X₀) = P ⊔ σ·Ad(w₀)·P ⊋ P`, while `N(X₀) = N`; this is `N_G(𝔮_∅)`, since `σ·Ad(w₀)` preserves `Σ⁺`. For the regular `X₁ = diag(3,1,−4)`, `σ·Ad(w₀)` sends it to `diag(4,−1,−3) ≠ X₁`; its stabilizer in `W_G` is trivial, so `Q(X₁) = P ⊊ N_G(𝔮_∅) = P ⊔ σ·Ad(w₀)P`. Both satisfy the containment `Q(X) ⊆ N_G(𝔮_∅)` of (i); `N(X₀) = N(X₁) = N`. Without the component condition `Q(X)` depends on more than `Π'`.

### 6.3 Parabolic subalgebras through the complexification

Let `(D, 𝔞, Σ⁺)` be an Iwasawa triple on `G`, with no component condition, and let `𝔮 ⊆ 𝔤` be a real Lie subalgebra. A **parabolic subalgebra** is an `Ad(G)`-conjugate of some `𝔮_{Π'}`, as in RealSemisimpleLieGroups §4.4. Then `𝔮` is parabolic iff `𝔮` contains the centre `𝔷` and `𝔮 ⊗ ℂ ∩ [𝔤, 𝔤]_ℂ` contains `TauCeti.borelSubalgebra 𝔥 b` for some splitting Cartan subalgebra `𝔥` of the semisimple `[𝔤, 𝔤]_ℂ` and some base `b` of its root system (Knapp 2002, Ch. VII §7). RealSemisimpleLieGroups §4.4 states the criterion, under the component condition, with a Borel subalgebra of `𝔤 ⊗ ℂ`, which `TauCeti.borelSubalgebra` defines for a Killing Lie algebra only; this section is its form for a reductive `𝔤` with centre, where the Borel condition alone does not see the centre (Checks), and for every Iwasawa triple. Every parabolic subalgebra contains `𝔷`: `𝔷 = (𝔷 ∩ 𝔨) ⊕ 𝔷_𝔭 ⊆ 𝔪 ⊕ 𝔞 ⊆ 𝔮_{Π'}` (§§1.1, 2.2) and `𝔷` is `Ad(G)`-stable. Proof sketch:

- Every `Ad(G)`-conjugate of a `𝔮_{Π'}` is an `Ad(G⁰)`-conjugate of some `𝔮_{Π''}`. By §2.2(c), `G = G⁰·N_K(𝔞)`. For `n ∈ N_K(𝔞)`, `Ad(n)` preserves `𝔪 ⊕ 𝔞` and carries `𝔤^β` onto `𝔤^{n·β}`, where `n·β = β ∘ Ad(n)⁻¹`. The image of `N_{K⁰}(𝔞)` in `GL(𝔞)` contains `W(Σ)` (§2.4), which acts simply transitively on positive systems (RealSemisimpleLieGroups §1.2), so some `n₀ ∈ N_{K⁰}(𝔞)` has `n₀n·Σ⁺ = Σ⁺`. Then `n₀n` permutes `Π`, and `Ad(n₀n)𝔮_{Π'} = 𝔮_{n₀n·Π'}`. Hence `Ad(g₀n)𝔮_{Π'} = Ad(g₀n₀⁻¹)𝔮_{n₀n·Π'}` for `g₀ ∈ G⁰`, with `g₀n₀⁻¹ ∈ G⁰`. `Ad(G⁰)` is trivial on `𝔷` and acts on `[𝔤, 𝔤]` as `Int([𝔤, 𝔤])`, since `ad Z = 0` for `Z ∈ 𝔷`.
- `𝔮_{Π'} = 𝔷 ⊕ 𝔮'_{Π'}`, where `𝔮'_{Π'}` is the standard parabolic subalgebra of `[𝔤, 𝔤]` for the Cartan involution `dθ|_{[𝔤,𝔤]}`, the maximal abelian `𝔞' = 𝔞 ∩ [𝔤, 𝔤]` of `𝔭 ∩ [𝔤, 𝔤]` (`𝔞 = 𝔷_𝔭 ⊕ 𝔞'`, §2.2), and the restrictions of `Σ⁺` and `Π'`: every root vanishes on `𝔷_𝔭`, the root spaces agree, and `𝔪 ⊕ 𝔞 = 𝔷 ⊕ (Z_{𝔨 ∩ [𝔤,𝔤]}(𝔞') ⊕ 𝔞')`.
- A subalgebra `𝔮 ⊇ 𝔷` equals `𝔷 ⊕ (𝔮 ∩ [𝔤, 𝔤])`, and `(𝔮 ∩ [𝔤, 𝔤]) ⊗ ℂ = 𝔮 ⊗ ℂ ∩ [𝔤, 𝔤]_ℂ`.
- So `𝔮` is parabolic iff `𝔮 ⊇ 𝔷` and `𝔮 ∩ [𝔤, 𝔤]` is an `Int([𝔤, 𝔤])`-conjugate of some `𝔮'_{Π'}`, a parabolic subalgebra for the connected group `Int([𝔤, 𝔤])`, which has semisimple Lie algebra, trivial centre and the adjoint datum of RealSemisimpleLieGroups §0.2. With the Killing form of `[𝔤, 𝔤]` as compatible form that datum is a reductive Cartan datum (§1.1), and `Int([𝔤, 𝔤])` is connected, so it satisfies the component condition (§2.5) and §3.5 here supplies its minimal parabolic datum. The criterion of RealSemisimpleLieGroups §4.4 for `Int([𝔤, 𝔤])` finishes.

*Needs:* §§1.1, 2.2, 2.4, 2.5, 3.5; RealSemisimpleLieGroups §§0.2, 1.2, 4.1, 4.4; LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`: `Ad(G⁰)` is trivial on `𝔷` and acts on `[𝔤, 𝔤]` through `Int([𝔤, 𝔤])`), Layer 7 (complexification); Tau Ceti `TauCeti.borelSubalgebra`.

**Checks.**

- `SL_2(ℝ)`: `𝔮_∅ ⊗ ℂ` is the upper triangular `𝔟 ⊆ 𝔰𝔩_2(ℂ)`. The real subalgebra `𝔰𝔬(2)` has complexification `ℂ·((0, 1), (−1, 0))`, a Cartan subalgebra that contains no Borel, and it is not parabolic.
- `SU(2)` (compact): the only parabolic subalgebra is `𝔤`, and `𝔰𝔲(2) ⊗ ℂ = 𝔰𝔩_2(ℂ)` contains a Borel. The diagonal `𝔱 ⊆ 𝔰𝔲(2)` complexifies to a Cartan subalgebra that contains none.
- `SL_2(ℂ)` as a real group: identify `𝔰𝔩_2(ℂ) ⊗_ℝ ℂ` with `𝔰𝔩_2(ℂ) ⊕ 𝔰𝔩_2(ℂ)` by `X ⊗ z ↦ (zX, zX̄)`. The upper triangular `𝔮_∅` becomes the sum of the two upper triangular Borel subalgebras, a Borel subalgebra of the sum.
- `GL_2(ℝ)` with `𝔮 = {((a, b), (0, −a))}`, the trace-zero upper triangular matrices: `𝔮 ⊗ ℂ ∩ 𝔰𝔩_2(ℂ) = 𝔮 ⊗ ℂ` is the upper triangular Borel subalgebra, so the Borel condition holds, but `1 ∉ 𝔮`, and `dim 𝔮 = 2` while `dim 𝔮_∅ = 3` and `dim 𝔮_Π = 4`: `𝔮` is not parabolic, and the centre condition is necessary. `𝔮 ⊕ ℝ·1 = 𝔮_∅` satisfies both conditions. `𝔮 = ℝ·1` contains the centre but no Borel after complexification, and is not parabolic.
- `Aut(𝔰𝔩_3(ℝ))`, where the component condition fails (§2.5): `σ(X) = −Xᵀ` carries the `(2, 1)`-block upper triangular `𝔮_{{α₁}}` to the `(2, 1)`-block lower triangular algebra `{X : X₁₃ = X₂₃ = 0}`, the stabilizer of the line `ℝe₃`. It is not standard, but it is `Ad(w₀)𝔮_{{α₂}}`, with `𝔮_{{α₂}}` the `(1, 2)`-block upper triangular stabilizer of `ℝe₁` and `Ad(w₀) ∈ Int(𝔰𝔩_3(ℝ)) = G⁰`. In the notation of the proof sketch, `σ ∈ N_K(𝔞)` acts on `𝔞` by `−1`, `n₀ = Ad(w₀) ∈ N_{K⁰}(𝔞)` restores `Σ⁺`, and `n₀σ` acts by `diag(h₁, h₂, h₃) ↦ −diag(h₃, h₂, h₁)`, carrying `α₁` to `α₂`. Its complexification contains the lower triangular Borel subalgebra and `𝔷 = 0`, so both sides of the criterion hold.
- `O(1,1)`, where the component condition fails: `𝔤 = 𝔷 = ℝY` is abelian, `𝔨 = 0` and `𝔮_∅ = 𝔪 ⊕ 𝔞 = 𝔤`. `[𝔤, 𝔤] = 0`, whose only Borel subalgebra is `0`, so the criterion reduces to `𝔮 ⊇ 𝔷`. Of the two subalgebras `0` and `𝔤`, only `𝔤` contains `𝔷`, and only `𝔤` is parabolic.

### Examples

`SL_2(ℝ)` and `SL_3(ℝ)` (dynamical description of `P` and of the block parabolics), `GL_n(ℝ)` (flags of given dimension type; parabolic subalgebras contain `ℝ·1`), `SO₀(n, 1)` (stabilizers of isotropic lines), `Aut(𝔰𝔩_3(ℝ))` (`Q(X)` without the component condition), `GL_3(k)` (non-conjugate maximal standard parabolics).

### Dependencies

Layers 1–4; RealSemisimpleLieGroups §§0.2, 1.2, 4.1, 4.3, 4.4; LieGroups Layers 1, 7; Tau Ceti `TauCeti.TitsSystem` with its Bruhat-cell, word-length and standard-parabolic declarations (§6.1), `TauCeti.borelSubalgebra`.

## Layer 7: The self-adjoint linear model

All statements of this layer are about a subgroup `G` of `GL (Fin n) ℝ`, with `θ(g) = (gᵀ)⁻¹`, `K = {k ∈ G : kᵀk = 1}` (that is, `G ⊓ unitarySubgroup (GL (Fin n) ℝ)`, written `G ∩ O(n)`) and the exponential `NormedSpace.exp` on `Matrix (Fin n) (Fin n) ℝ`. They are the pinned statement forms of Layers 1–6 and of the RealSemisimpleLieGroups sections those layers apply. Matrices are not a Lie ring by instance search at the pin (exact supplier contracts), so `ad Y` is the map `Z ↦ YZ − ZY` and a Lie subalgebra of matrices is a subspace closed under commutators.

### 7.1 Self-adjoint linear groups

Define `IsSelfAdjointLinearGroup G`: `G` is closed in `GL (Fin n) ℝ`, `G` is stable under transposition, and `G` has finitely many connected components. Define `linearLieAlgebra G`, the set of matrices `X` such that `NormedSpace.exp (t • X)` is the matrix of an element of `G` for every real `t`. Use LieGroups Layer 9 with the identity covering to obtain the involution `θ(g) = (gᵀ)⁻¹`, the global model, the compact fixed group `K = G ∩ O(n)` (closed in the compact `O(n)`) and the polar structure of a self-adjoint linear group. The identification of its intrinsic Lie algebra with `linearLieAlgebra G` through the matrix inclusion is Tau Ceti's, and is applied, not rebuilt: for a closed subgroup `K` of the units of a finite-dimensional real normed algebra `R`, `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff` says that `x ∈ R` lies in `lieSubalgebraOfSubgroup K` (read through `TauCeti.Lie.unitsLieAlgebraLieEquiv`) iff `TauCeti.expUnit (t • x) ∈ K` for every real `t`; take `R = Matrix (Fin n) (Fin n) ℝ` with one of Mathlib's scoped matrix norms, so that `TauCeti.expUnit_coe` turns `TauCeti.expUnit` into `NormedSpace.exp` (which does not depend on the norm), and `TauCeti.Lie.unitsLieAlgebraEquiv_Ad` makes `Ad g` conjugation by `g`. Under this identification prove that `linearLieAlgebra G` is transpose-stable and `B(X,Y) = tr(XY)` supplies the compatible form of §1.1, with `𝔨` skew and `𝔭` symmetric. Prove the two reductivity fields of the base datum: on the transpose-stable `linearLieAlgebra G`, `(ad X)ᵀ = ad(Xᵀ)` for `⟨X, Y⟩ = tr(XYᵀ)`, so the reductivity criterion of §1.1 makes it the direct sum of its centre and its semisimple derived algebra. This is the form adapter, not a second polar construction or a second tangent identification (Wallach 1988, Ch. 2 §2.1; Knapp 2002, Ch. VII §2). *Needs:* §1.1 (the reductivity criterion); LieGroups Layers 0–1 (the matrix shadows: on `GL (Fin n) ℝ`, `lieExp` is the matrix exponential and `Ad g` is conjugation by `g`), Layer 2 (closed-subgroup Lie structure) and Layer 9 (identity-cover Cartan and polar theorem); Tau Ceti `map_lieExp` (for the inclusion of `G` in `GL (Fin n) ℝ`), `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`, `TauCeti.expUnit_coe`, `TauCeti.Lie.unitsLieAlgebraEquiv_Ad`; Mathlib `Matrix.exp_transpose`, `ConnectedComponents`.

Prove the following API.

- For closed `G`, `linearLieAlgebra G` is closed under sums, scalars and commutators, and it is the Lie algebra of `G` as an embedded Lie subgroup (LieGroups Layer 2, `isEmbeddedLieSubgroup_of_isClosed`). When `G` is transpose-stable, so is `linearLieAlgebra G`, since `exp(tXᵀ) = exp(tX)ᵀ` (Mathlib `Matrix.exp_transpose`).
- `K = G ∩ O(n)` is the fixed group of `θ`, and it is compact when `G` is closed.
- For a self-adjoint linear group, every `g ∈ G` is uniquely `k·exp(X)` with `k ∈ K` and `X` a symmetric element of `linearLieAlgebra G` (LieGroups Layer 9, identity cover).
- For `X` symmetric in `linearLieAlgebra G`, `ad X` is diagonalizable over `ℝ` on all of `Matrix (Fin n) (Fin n) ℝ`, being symmetric for `⟨Y, Z⟩ = tr(YZᵀ)`.

**Checks.**

- `GL_n(ℝ)`, `SL_n(ℝ)` (the range of `Matrix.SpecialLinearGroup.toGL`), `O(p, q)` (as `{g : gᵀ J g = J}`), `Sp_{2n}(ℝ)` (as `{g ∈ GL (Fin (2n)) ℝ : g J' gᵀ = J'}`, where `J'` is the matrix `Matrix.J` of `Matrix.symplecticGroup` reindexed along `Fin n ⊕ Fin n ≃ Fin (2n)`; transpose-stable by `SymplecticGroup.transpose_mem`) and the real points of `SU(p, q)` embedded in `GL_{2(p+q)}(ℝ)` are self-adjoint linear groups. `IsSelfAdjointLinearGroup` takes a `Subgroup` of some `GL (Fin m) ℝ`, so it applies to these subgroups and not to Mathlib's `Matrix.symplecticGroup` itself, a `Submonoid` of `Matrix (l ⊕ l) (l ⊕ l) ℝ`, nor to the type `Matrix.SpecialLinearGroup (Fin n) ℝ`.
- The closed discrete subgroup `{diag(2^k, 2^{−k}) : k ∈ ℤ}` is transpose-stable with infinitely many components. Its Lie algebra is `0`, so the polar map `K × 𝔭 → G` is not surjective. The finiteness field is necessary.
- The Lie algebra of `GL_n(ℝ)` is all of `Matrix (Fin n) (Fin n) ℝ`; for `n ≥ 1` its centre is `ℝ·1` and its derived algebra `𝔰𝔩_n`, as the reductivity fields require.
- The Lie algebra of `SL_n(ℝ)` is the trace-zero matrices. For `n ≥ 1`, `E₁₁` is excluded, since `det exp(tE₁₁) = e^t`; for `n = 0` the tangent algebra is `0`.
- Every real `t` is needed in the definition of the Lie algebra: for the trivial group `G = {1}` in `GL_2(ℝ)`, `X = 2π·((0, −1), (1, 0))` has `exp(X) = 1`, so a definition testing only `t = 1` (or only integers `t`) would put this `X` in the Lie algebra of `{1}`; at `t = 1/4`, `exp(tX) = ((0, −1), (1, 0)) ∉ G`.
- `G = {((1, t), (0, 1)) : t ∈ ℝ}` is closed with one component but not transpose-stable. Its Lie algebra is `ℝE₁₂`, a Lie subalgebra, but `E₁₂ᵀ = E₂₁` is not in it, so transposition stability of the Lie algebra needs a transpose-stable `G`. Here `K = G ∩ O(2) = {1}` and the symmetric part of `ℝE₁₂` is `0`, so the polar map is not surjective. The transpose field is necessary.
- The closed upper triangular group of `GL_2(ℝ)` has four components and is not transpose-stable. Its algebra `𝔟` fails the reductivity fields: `𝔷(𝔟) ⊕ ⁅𝔟, 𝔟⁆ = ℝ·1 ⊕ ℝE₁₂ ≠ 𝔟` (§1.1, Checks). The unitriangular algebra `ℝE₁₂` of the previous Check is abelian, hence reductive; that group fails the polar decomposition, not the reductivity fields.

### 7.2 The dynamic subgroups of a symmetric element

For `G` and a matrix `X`, define:

- `dynamicParabolic G X`: the elements `g ∈ G` for which the family `NormedSpace.exp (−t • X) * g * NormedSpace.exp (t • X)`, `t ≥ 0`, is bounded entrywise: there is `C` with `|(NormedSpace.exp (−t • X) * g * NormedSpace.exp (t • X)) i j| ≤ C` for all `t ≥ 0` and all `i, j`;
- `dynamicUnipotent G X`: those for which this tends to `1` as `t → +∞`;
- `dynamicLevi G X`: those commuting with `X`.

Prove the following API, for an arbitrary subgroup `G` and matrix `X` unless stated, with `θG = {θ(g) : g ∈ G}`.

- `dynamicLevi G X` is a subgroup, closed when `G` is closed. `dynamicUnipotent G X` and `dynamicLevi G X` lie in `dynamicParabolic G X`: a convergent family is bounded, and an element commuting with `X` has constant conjugates.
- Transport: `θ` maps `dynamicParabolic G X` onto `dynamicParabolic (θG) (−Xᵀ)`, `dynamicUnipotent G X` onto `dynamicUnipotent (θG) (−Xᵀ)` and `dynamicLevi G X` onto `dynamicLevi (θG) Xᵀ`. The first two use `θ(exp(−tX) g exp(tX)) = exp(tXᵀ) θ(g) exp(−tXᵀ)` (Mathlib `Matrix.exp_transpose`) and the conjugates of `g⁻¹`: the matrices whose conjugate family is bounded form a unital subalgebra of `Matrix (Fin n) (Fin n) ℝ`, which contains the inverse of each of its invertible elements by the Cayley–Hamilton theorem, and inversion is continuous at `1`. The third transposes `gX = Xg`.
- When `G` is transpose-stable and `X` is symmetric, `θG = G` and `−Xᵀ = −X`: `θ` maps `dynamicParabolic G X` onto `dynamicParabolic G (−X)` and `dynamicUnipotent G X` onto `dynamicUnipotent G (−X)`, and `dynamicLevi G X` is `θ`-stable. Neither hypothesis can be dropped from these same-`G`, `±X` forms (Checks).
- For closed `G` and `X ∈ linearLieAlgebra G`, `dynamicParabolic G X` is RealSemisimpleLieGroups' `dynamicalParabolic X` for the Lie group `G` under the adapter of §7.1, and `Q(X)` of §6.2 when `X ∈ 𝔞`: the conjugates `exp(−tX) g exp(tX)` lie in `G` and all have determinant `det g ≠ 0`, so a bounded family has compact closure inside `GL (Fin n) ℝ`, hence inside the closed `G`; conversely a family with compact closure in `G` is bounded.

Prove `dynamicLevi_decomposition`. Let `G` be closed in `GL (Fin n) ℝ` and transpose-stable, and let `X` be symmetric. At this generality the following subgroup assertions hold; for the factorization also assume `exp(tX) G exp(−tX) = G` for every real `t` (sufficiently, `X ∈ linearLieAlgebra G`). Finitely many components is not required:

- the three sets are closed subgroups;
- `dynamicUnipotent G X` is normal in `dynamicParabolic G X`;
- under the normalization hypothesis, every element of `dynamicParabolic G X` factors uniquely as `l·u` with `l ∈ dynamicLevi G X` and `u ∈ dynamicUnipotent G X`;
- `dynamicParabolic G X ∩ θ(dynamicParabolic G X) = dynamicLevi G X`.

Proof sketch: in an orthonormal eigenbasis of `X`, an element of `dynamicParabolic G X` is block upper triangular, an element of `dynamicUnipotent G X` block unipotent and an element of `dynamicLevi G X` block diagonal, so the three sets are `G` intersected with closed subgroups of `GL (Fin n) ℝ`. The block-diagonal part `l = lim_{t→+∞} exp(−tX) g exp(tX)` of `g ∈ dynamicParabolic G X` is invertible and, under the normalization hypothesis, lies in `G`: the entire convergent family belongs to `G` and `G` is closed; `θ` interchanges block upper and block lower triangular. The subgroup, normality and intersection assertions use only intersections with the ambient block groups. The factorization uses normalization to keep the limit in `G`; then `u = l⁻¹g ∈ G`. Section 7.3 applies the theorem to `X ∈ 𝔞 ⊆ linearLieAlgebra G` only. This is the matrix form of the Langlands decomposition `Q_{Π'} = L_{Π'} ⋉ N_{Π'}` of RealSemisimpleLieGroups §4.3 and of §6.2 (Knapp 2002, Ch. VII §7), and the analogue of Tau Ceti's `TauCeti.Cocharacter.limit`. *Needs:* §§6.2, 7.1; RealSemisimpleLieGroups §4.4 (`dynamicalParabolic`, for the comparison bullet only); Mathlib `NormedSpace.exp`, `Matrix.exp_conj`, `Filter.Tendsto`.

**Checks.**

- `G = GL_2(ℝ)`, `X = diag(1, 0)`: the conjugates of `((a, b), (c, d))` have entries `a`, `e^{−t}b`, `e^{t}c`, `d`, bounded for `t ≥ 0` by `C = max(|a|, |b|, |d|)` iff `c = 0`; the three groups are upper triangular, upper unitriangular and diagonal. `((2, 3), (0, 5)) = diag(2, 5)·((1, 3/2), (0, 1))`. Factoring as `u·l` instead would give `((1, 3/5), (0, 1))·diag(2, 5)`, a different unipotent factor; the stated order is `l·u`.
- `X = 0`: the dynamic parabolic and Levi subgroups are `G` and the dynamic unipotent subgroup is `1`. A scalar `X` gives the same three groups.
- `X = diag(0, 1)` in `GL_2(ℝ)` gives the lower triangular, lower unitriangular and diagonal groups. Reversing the direction of `t` in the definitions would interchange the upper and lower groups.
- `G = GL_2(ℝ)` with the skew `X = ((0, 1), (−1, 0))`: the conjugates `exp(−tX) g exp(tX)` are rotations of `g`, with entries bounded by the operator norm of `g`, at most `2·max|g_ij|`, so the dynamic parabolic is all of `G`. But the dynamic unipotent subgroup is `{1}` and the centralizer of `X` is `{aI + bX}`, so `l·u` covers only that centralizer. The symmetry hypothesis is necessary.
- `G = SL_2(ℝ)` with `X = diag(1, 0)`, which is symmetric but not in `𝔰𝔩_2(ℝ)`: the three groups are the upper triangular, upper unitriangular and diagonal subgroups of `SL_2(ℝ)`, `((a, b), (0, a⁻¹)) = diag(a, a⁻¹)·((1, b/a), (0, 1))`, and all four conclusions hold. Although `X ∉ 𝔰𝔩_2(ℝ)`, diagonal conjugation preserves determinant and normalizes `SL_2(ℝ)`, so the normalization hypothesis includes this instance.
- Transport without symmetry: `G = GL_2(ℝ)`, `X = ((1, 1), (0, 0))` and `g = I + X = ((2, 1), (0, 1))`. Then `gX = Xg = ((2, 2), (0, 0))`, so `g` lies in the dynamic Levi, hence in the dynamic parabolic, of `X`. In the eigenbasis `S = ((1, −1), (0, 1))`, with `S⁻¹XS = diag(1, 0)`, the image `θ(g) = ((1/2, 0), (−1/2, 1))` becomes `S⁻¹θ(g)S = ((0, 1), (−1/2, 3/2))`, so the conjugates `exp(tX)·θ(g)·exp(−tX)` have upper-right entry `e^t` in that basis and are unbounded: `θ(g)` is not in the dynamic parabolic of `−X`. But `θ(g)` commutes with `Xᵀ = ((1, 0), (1, 0))`, so it lies in the dynamic parabolic of `−Xᵀ`, as the general transport says. For the symmetric `X = diag(1, 0)`, `θ` carries the upper triangular group onto the lower triangular group, the dynamic parabolic of `−X`.
- Transport without transpose stability: `G = {((1, s), (0, 1)) : s ∈ ℝ}`, closed but not transpose-stable, and the symmetric `X = 0`. Then the dynamic Levi subgroup of `0` is `G`, while `θ((1, 1), (0, 1)) = ((1, 0), (−1, 1)) ∉ G`. It lies in `θG`, the lower unitriangular group, which is the dynamic Levi subgroup of `0` in `θG`.
- Let `O = ½[[√3,−1],[1,√3]]`, `G = OᵀSL_2(ℤ)O` and `X = diag(1,0)`. This closed transpose-stable discrete group contains `g = [[2+√3,2],[0,2−√3]]`. Its ambient conjugation limit is `l = diag(2+√3,2−√3)`, but `(OlOᵀ)₁₂ = 3/2`, so `l ∉ G`. Hence normalization fails, and any factorization `g = l'u` would force `l' = l`, which is impossible. The subgroup and intersection assertions still hold.
- Boundedness and compact closure agree on conjugate families: for `GL_2(ℝ)`, `X = diag(1, 0)` and `g = ((1, 1), (0, 1))`, the family `((1, e^{−t}), (0, 1))`, `t ≥ 0`, is bounded and its closure adds only `I`, so it is compact in `GL_2(ℝ)`. A bounded set of invertible matrices can have closure leaving `GL_n(ℝ)`, as `{diag(1/k, 1) : k ≥ 1}` does, but its determinants `1/k` are not constant; a conjugate family has constant determinant, which is why the two notions agree on it.

### 7.3 Maximal abelian subspaces, the minimal parabolic and the component condition

For `G`, a subspace `𝔞` of `Matrix (Fin n) (Fin n) ℝ` and matrices `H₀`, `Y`, define:

- `IsMaximalAbelianSymmetric G 𝔞`: every element of `𝔞` is a symmetric element of `linearLieAlgebra G`, any two elements of `𝔞` commute, and every symmetric element of `linearLieAlgebra G` that commutes with all of `𝔞` lies in `𝔞`;
- `IsRegularElement G 𝔞 H₀`: `H₀ ∈ 𝔞`, and every element of `linearLieAlgebra G` commuting with `H₀` commutes with all of `𝔞`;
- `orthogonalCentralizer G 𝔞`, the group `M = Z_K(𝔞)`: the `m ∈ G` with `mᵀm = 1` and `mH = Hm` for every `H ∈ 𝔞`;
- `orthogonalNormalizer G 𝔞`, the group `N_K(𝔞)`: the `k ∈ G` with `kᵀk = 1` and `kHkᵀ ∈ 𝔞` for every `H ∈ 𝔞`;
- `minimalParabolic G 𝔞 H₀`, the set `P = M·exp(𝔞)·N` of the products `m·exp(H)·u` with `m ∈ M`, `H ∈ 𝔞` and `u ∈ N = dynamicUnipotent G H₀`;
- `LinearComponentCondition G 𝔞`: every `g ∈ G` lies in the connected component, in `G`, of some element of `M`; this is §2.5 for the datum of §7.1;
- `nonnegEigenspaces Y`: the sum over `c ≥ 0` of the eigenspaces of `ad Y : Z ↦ YZ − ZY` on `Matrix (Fin n) (Fin n) ℝ` with eigenvalue `c`.

For a self-adjoint linear group `G`, `linearLieAlgebra G` is the Lie algebra `𝔤` of `G` and `𝔭` is its symmetric part (§7.1), so `IsMaximalAbelianSymmetric G 𝔞` says that `𝔞` is a maximal abelian subspace of `𝔭`. Since `Z_𝔤(H₀) = 𝔪 ⊕ 𝔞 ⊕ ⨁_{β(H₀) = 0} 𝔤^β`, `IsRegularElement G 𝔞 H₀` says that no restricted root vanishes at `H₀`; then `(𝔞, Σ⁺)` with `Σ⁺ = {β ∈ Σ : β(H₀) > 0}` is an Iwasawa triple of the datum of §7.1. By §6.2 (i), regular case, `dynamicUnipotent G H₀` is `N = lieExp 𝔫`, so `minimalParabolic G 𝔞 H₀` is the minimal parabolic subgroup `P` of §3.2, with `M = orthogonalCentralizer G 𝔞` and `N_K(𝔞) = orthogonalNormalizer G 𝔞`, for every self-adjoint linear group and without any component condition. For `X ∈ 𝔞`, `ad X` is diagonalizable on `Matrix (Fin n) (Fin n) ℝ` (§7.1) and preserves `𝔤`, so `linearLieAlgebra G ∩ nonnegEigenspaces X` is the sum of the eigenspaces of `ad X` on `𝔤` with non-negative eigenvalue, RealSemisimpleLieGroups' `nonnegEigenSubmodule X` (its §4.1). *Needs:* §§3.2, 6.2, 7.1–7.2; Mathlib `Matrix.orthogonalGroup`, `connectedComponentIn`, `LinearMap.mulLeft`, `LinearMap.mulRight`, `Module.End.eigenspace`.

Prove the following API.

- For closed `G`, `IsMaximalAbelianSymmetric G 𝔞` makes `𝔞` a maximal abelian subspace of the symmetric part of the subspace `linearLieAlgebra G`: a symmetric `Z ∈ 𝔤` commuting with `𝔞` spans with `𝔞` an abelian subspace of `𝔭`. Maximal abelian subspaces exist, by finite dimension.
- If `IsMaximalAbelianSymmetric G 𝔞` and `G` is self-adjoint linear, an `H₀ ∈ 𝔞` off the kernels of the finitely many restricted roots satisfies `IsRegularElement G 𝔞 H₀` (§2.2, step 1), and two regular elements on the same side of every root kernel give the same `N` and the same `P`.
- For every subgroup `G` and subspace `𝔞`, `orthogonalCentralizer G 𝔞` and `orthogonalNormalizer G 𝔞` are subgroups of `K`, the first normal in the second, and the quotient acts faithfully on `𝔞` by `H ↦ kHkᵀ`: for `k ∈ K`, `kHkᵀ ∈ 𝔞` for all `H ∈ 𝔞` already gives `k𝔞kᵀ = 𝔞`, by dimension, and `kHkᵀ = H` for all `H ∈ 𝔞` says that `k` commutes with `𝔞`. For closed `G` both groups are compact, being closed in the compact `K`. For a self-adjoint linear group `G` with `IsMaximalAbelianSymmetric G 𝔞`, the quotient is `W_G` (§2.4).
- For a self-adjoint linear group with `IsMaximalAbelianSymmetric G 𝔞` and `IsRegularElement G 𝔞 H₀`, `minimalParabolic G 𝔞 H₀` is a closed subgroup containing the centre of `G` (§3.2), and it contains `M`, `exp(𝔞)` and `N`.
- For a self-adjoint linear group, `LinearComponentCondition G 𝔞` has the same truth value for every `𝔞` with `IsMaximalAbelianSymmetric G 𝔞`: an element of the identity component `K⁰` carrying one maximal abelian subspace onto another (§2.2) carries the corresponding groups `M` onto each other and fixes every component of `G` (§2.5).
- For symmetric `Y`, `nonnegEigenspaces Y` is closed under commutators, since eigenvalues of `ad Y` add under commutators; it contains the centralizer of `Y`, and its intersection with `nonnegEigenspaces (−Y)` is that centralizer.

Let `G` be a self-adjoint linear group, `IsMaximalAbelianSymmetric G 𝔞` and `IsRegularElement G 𝔞 H₀`, and write `M`, `N`, `P` as above. The following statements assume no component condition.

- `minimalParabolic_langlands`: `P` is a closed subgroup of `GL (Fin n) ℝ`; every element of `P` is `m·exp(H)·u` for unique `m ∈ M`, `H ∈ 𝔞` and `u ∈ N`; every `g ∈ G` is `k·p` with `k ∈ K` and `p ∈ P`; and the elements of `K` lying in `P` are exactly those of `M` (§3.3 (a), (b) and (d)).
- `exists_conj_minimalParabolic`: for a second pair `𝔞'`, `H₀'` with `IsMaximalAbelianSymmetric G 𝔞'` and `IsRegularElement G 𝔞' H₀'`, there is `k` in the identity component of `K` with `k𝔞kᵀ ⊆ 𝔞'`, `kᵀ𝔞'k ⊆ 𝔞`, and `g ∈ minimalParabolic G 𝔞' H₀'` iff `k⁻¹gk ∈ P` (§2.2 (b) for the subspaces, then the elements of `N_{K⁰}(𝔞')` realizing `W(Σ)` of §2.4 for the positive systems: §3.4 for a fixed datum).
- `bruhat_decomposition_linear`: for every `g ∈ G` there is `k ∈ N_K(𝔞)` with `g ∈ P k P`. If `k, k' ∈ N_K(𝔞)` and `P k P` meets `P k' P`, then `k⁻¹k'` commutes with `𝔞` (§4.2, the decomposition over `W_G`).
- `doubleCoset_cell_coordinates`: for `k ∈ N_K(𝔞)`, every element of `P k P` is `u·k·p` for a unique pair of `u ∈ N` with `k⁻¹uk ∈ N̄ = dynamicUnipotent G (−H₀)` and `p ∈ P`; that is, `(u, p) ↦ u·k·p` is a bijection from `N_k × P` onto `P k P`, where `N_k = N ∩ k N̄ k⁻¹` (§4.2, the cell coordinates; `N̄ = θ(N)` by the transport of §7.2). Existence: `k` normalizes `M·exp(𝔞)`, so `P k P = N k P`, and `N = N_k·(N ∩ kNk⁻¹)` with `k⁻¹(N ∩ kNk⁻¹)k ⊆ N`. Uniqueness: `u k p = u' k p'` puts `k⁻¹u'⁻¹uk` in `N̄ ∩ P = {1}`; in an eigenbasis of `H₀` an element of `N̄` has entries `g_ij = δ_ij` wherever `λ_i ≥ λ_j` and an element of `P` has `g_ij = 0` wherever `λ_i < λ_j`.
- `dynamicParabolic_eq_iUnion_doubleCoset`: `dynamicParabolic G H₀` is the union of the double cosets `P k P` over the `k ∈ N_K(𝔞)` commuting with `H₀`, that is, over the stabilizer of `H₀` in `W_G` (§6.2 (i), regular case, with §7.2's comparison of `dynamicParabolic` and `Q(X)`).
- `exists_eq_nonnegEigenspaces_of_le`: let `𝔮₀ = linearLieAlgebra G ∩ nonnegEigenspaces H₀`, the sum of the eigenspaces of `ad H₀` on `𝔤` with non-negative eigenvalue. Every subspace of `𝔤` that is closed under commutators and contains `𝔮₀` is `linearLieAlgebra G ∩ nonnegEigenspaces Y` for some `Y ∈ 𝔞`. For `X, Y ∈ 𝔞` with `𝔮₀ ⊆ nonnegEigenspaces X` and `𝔮₀ ⊆ nonnegEigenspaces Y`, the sums `linearLieAlgebra G ∩ nonnegEigenspaces X` and `linearLieAlgebra G ∩ nonnegEigenspaces Y` are equal iff `X` and `Y` have the same centralizer in `𝔤`. Route: RealSemisimpleLieGroups §4.1 for the restriction to `G⁰` (§3.5); such an `X` lies in the closed positive chamber, its sum is `𝔮_{Π'}` for its vanishing simple roots `Π'`, and `Π'` determines and is determined by its centralizer `𝔪 ⊕ 𝔞 ⊕ ⨁_{β(X) = 0} 𝔤^β`, because `{β ∈ Σ : β(X) = 0} = Σ_{Π'}` by the sign-coherent expansion in `Π` (RealSemisimpleLieGroups §1.2).
- `linearComponentCondition_iff`: `LinearComponentCondition G 𝔞` holds iff every `k ∈ N_K(𝔞)` with `kNk⁻¹ ⊆ N` commutes with `𝔞`, and iff every `g ∈ G` with `gPg⁻¹ ⊆ P` lies in `P`. The first form is §2.5's "the stabilizer of the positive system in `N_K(𝔞)` is `M`": `k ∈ N_K(𝔞)` carries `𝔫` onto the `𝔫` of the positive system `k·Σ⁺`, so `kNk⁻¹ ⊆ N` iff `k·Σ⁺ = Σ⁺`. For the second, under the condition `P` is the `B` of a Tits system (`exists_titsSystem_linear` below) and §6.1 with `J = J' = ∅` gives `g ∈ P`; without it, an element of the stabilizer of `Σ⁺` in `N_K(𝔞)` outside `M` normalizes `M`, `exp(𝔞)` and `N`, hence `P`, and lies outside `P` because `K ∩ P = M`. The self-normalization `P = N_G(P)` of §3.3 (f) is the case `gPg⁻¹ = P`.

Assume now `LinearComponentCondition G 𝔞`.

- `eq_dynamicParabolic_of_le`: `dynamicParabolic G H₀ = P`; every subgroup `Q` with `P ⊆ Q ≤ G` equals `dynamicParabolic G X` for some `X ∈ 𝔞`; and for `X, Y ∈ 𝔞` with `P` contained in both dynamic parabolics, the two parabolics are equal iff `X` and `Y` have the same centralizer in `𝔤`. The first clause follows from `dynamicParabolic_eq_iUnion_doubleCoset`: under the condition `W_G = W(Σ)` (§2.5) acts freely on regular elements, so only the elements of `M` commute with `H₀` among those of `N_K(𝔞)`. The other two are RealSemisimpleLieGroups §§4.2 and 4.4 for the minimal parabolic datum of §3.5, with §7.2's comparison of `dynamicParabolic` and `dynamicalParabolic`.
- `exists_titsSystem_linear`: there is a `TauCeti.TitsSystem G` whose `subgroupB` is `P` and whose `subgroupN` is `N_G(𝔞) = {g ∈ G : g𝔞g⁻¹ ⊆ 𝔞}` (§4.2, from RealSemisimpleLieGroups §3.3). RealSemisimpleLieGroups' `exists_titsSystem` is the statement for connected groups with semisimple Lie algebra and finite centre; this one allows disconnected linear groups with reductive Lie algebra.

These are the matrix forms of Knapp 2002, Ch. VI §§4–5 and Ch. VII §§2, 4–5, 7, and of Bourbaki, Ch. IV §2 for the Tits system. *Needs:* §§2.2, 2.4–2.5, 3.2–3.5, 4.2, 6.1, 6.2, 7.1–7.2; RealSemisimpleLieGroups §§1.2, 3.3, 4.1, 4.2, 4.4; Tau Ceti `TauCeti.TitsSystem`; Mathlib `connectedComponentIn`, `DoubleCoset.doubleCoset`, `Module.End.eigenspace`.

**Checks.**

- Maximal abelian subspaces of `𝔭`. In `GL_2(ℝ)` the diagonal matrices form one. The line `ℝ·diag(1, −1)` consists of commuting symmetric elements but is not maximal: `1` is symmetric, commutes with it and is not in it, so a definition without the maximality clause would accept it. In `SL_2(ℝ)` both `ℝ·diag(1, −1)` and `ℝ·((0, 1), (1, 0))` are maximal, and their span is not abelian: `diag(1, −1)·S − S·diag(1, −1) = 2·((0, 1), (−1, 0)) ≠ 0` for `S = ((0, 1), (1, 0))`. For `G ≤ O(n)` every element of the Lie algebra is skew, so `𝔭 = 0` and `𝔞 = 0`; the line `ℝ·((0, 1), (−1, 0))` is maximal abelian in `𝔰𝔬(2)` but fails the symmetry clause.
- Regular elements. In `GL_2(ℝ)` with diagonal `𝔞`, `diag(1, 0)` is regular (its centralizer is diagonal) and `1` is not (`E₁₂` commutes with `1` but not with `diag(1, 0)`). In `SL_3(ℝ)`, `diag(1, 0, −1)` is regular and `diag(1, 1, −2)` is not: `E₁₂` commutes with it but not with `diag(1, −1, 0) ∈ 𝔞`. In `O(1,1)` with `𝔞 = ℝ·((0, 1), (1, 0))`, `Σ = ∅` and every element of `𝔞`, `0` included, is regular; `0` is regular exactly when `Σ = ∅`.
- The group `M`. For `GL_n(ℝ)` with diagonal `𝔞` it is the `2^n` diagonal sign matrices. For `SL_2(ℝ)` it is `{±1}`: the rotation `R_φ` sends `diag(1, −1)` to `((cos 2φ, sin 2φ), (sin 2φ, −cos 2φ))`, equal to `diag(1, −1)` exactly when `cos 2φ = 1`, that is, `R_φ = ±1`. The weaker condition `sin 2φ = 0` also admits `φ = ±π/2`, where the image is `−diag(1, −1)`: it cuts out the four elements of `N_K(𝔞)` of the next Check, not `M`. For `𝔞 = 0`, `M = K`. Using the identity component of `M` instead would give `{1}` for `SL_2(ℝ)` and miss `−1 ∈ Z(G)` (§3.2, Checks). Compactness needs `G` closed: the rotations with rational entries, such as `((3/5, −4/5), (4/5, 3/5))`, form an infinite, hence dense and not closed, transpose-stable subgroup of `SO(2)`; for `𝔞 = 0` its `M` and `N_K(𝔞)` are the whole group, which is not compact.
- The group `N_K(𝔞)`. For `GL_n(ℝ)` with diagonal `𝔞` it is the `2^n·n!` signed permutation matrices, with quotient `S_n` by `M`, agreeing with `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm`. For `SL_2(ℝ)` it is `{±1, ±((0, −1), (1, 0))}`; the rotation through `π/4` sends `diag(1, −1)` to `((0, 1), (1, 0)) ∉ 𝔞`. For `O(1,1)` it is all of `K = {±1, ±diag(1, −1)}`, with quotient of order `2` by `M = {±1}`.
- The minimal parabolic. For `SL_2(ℝ)`, `H₀ = diag(1, −1)`: `N` is upper unitriangular and `P` upper triangular, and `((−2, 3), (0, −1/2)) = (−1)·diag(2, 1/2)·((1, −3/2), (0, 1))`, with `M`-factor `−1`. With `−H₀` instead, `N` is lower unitriangular and `P` lower triangular: the positive system is that of `H₀`. For `GL_n(ℝ)`, `n ≥ 1`, and `H₀ = diag(n, n − 1, …, 1)`, `P` is `TauCeti.upperTriangularGroup`. For `O(1,1)`, `H₀ = Y`, `N = {1}` and `P = {±exp(tY)}` has index two. For compact `G`, `𝔞 = 0`, `N = {1}` and `P = M = K = G`. Maximality of `𝔞` is needed for the centre: in `GL_2(ℝ)` the pair `𝔞 = 0`, `H₀ = 0` satisfies `IsRegularElement`, and `M = O(2)`, `N = {1}`, so the set `minimalParabolic G 𝔞 H₀` is `O(2)`, which misses the central `2·1`.
- Cell coordinates. In `SL_2(ℝ)` with `H₀ = diag(1, −1)` and `k = ((0, −1), (1, 0))`: `k N̄ k⁻¹ = N`, so `N_k = N` and `P k P = {g : g₂₁ ≠ 0}`; for `g = ((a, b), (c, d))` with `c ≠ 0` the coordinates are `u = ((1, a/c), (0, 1))` and `p = ((c, d), (0, 1/c))`, and `u·k·p = g` uses `ad − bc = 1`. For `k = 1`, `N_1 = N ∩ N̄ = {1}`, so `u = 1` and `p = g`; dropping the condition `k⁻¹uk ∈ N̄` would make every `u ∈ N` a coordinate of `g ∈ P`, as `g = u·(u⁻¹g)`. In `O(1,1)`, `N = {1}`, so for every `k ∈ K` the cell is `P k P = kP` and `g = 1·k·(k⁻¹g)` is its only decomposition. In `Aut(𝔰𝔩_3(ℝ))`, `k = σ·Ad(w₀)` preserves `Σ⁺`, so no positive root becomes negative under `k⁻¹`, `N_k = {1}` and `P k P = kP`, a cell of dimension `dim P`. For `GL_n(ℝ)`, `n ≥ 1`, with `H₀ = diag(n, n − 1, …, 1)` and `k` the permutation matrix of `w`, `N_k` is the group of upper unitriangular matrices lying in `k N̄ k⁻¹`, Tau Ceti's `TauCeti.unitriangularInversionGroup ℝ w`, and the coordinates are those of `TauCeti.mem_doubleCoset_permutationGL_iff` and `TauCeti.eq_and_eq_of_mul_permutationGL_mul_eq`.
- The component condition. For `GL_n(ℝ)`, `n ≥ 1`, `M` contains `diag(−1, 1, …, 1)` of negative determinant, and the condition holds. For `O(1,1)`, `M = {±1}` meets two of the four components and it fails. For `O(p, q)` with `p > q ≥ 1` and `𝔞` spanned by the `E_{i, p+i} + E_{p+i, i}`, `i ≤ q`, `M` contains `diag(ε, k', ε)` with `ε ∈ {±1}^q` and `k' ∈ O(p − q)`, whose block determinants `(Πε·det k', Πε)` take all four values, so it holds; for `p = q ≥ 1` only `(1, 1)` and `(−1, −1)` occur and it fails; for `p = q = 0`, `O(0, 0) = 1`, `𝔞 = 0`, `M = G` and it holds. For `Aut(𝔰𝔩_3(ℝ))` it fails (§2.5). Independence of `𝔞` needs maximality: in `O(1,1)` the non-maximal `𝔞 = 0` has `M = K = {±1, ±diag(1, −1)}`, one element in each of the four components, so the condition holds for it, while for the maximal `ℝY` it fails.
- The eigenspace sums. For `Y = diag(1, 0)` in `2 × 2` matrices, `ad Y` has eigenvalue `1` on `E₁₂`, `−1` on `E₂₁` and `0` on the diagonal, so the sum is the upper triangular algebra; with "non-positive" in place of "non-negative" it would be the lower triangular one, and with "positive" only `ℝE₁₂`, missing the diagonal. For `Y = 0` or a scalar `Y` the sum is all matrices. For `X = diag(1, 1, −2)` in `𝔰𝔩_3(ℝ)` the eigenvalues of `ad X` on `E₁₂, E₂₁, E₁₃, E₂₃, E₃₁, E₃₂` are `0, 0, 3, 3, −3, −3`, and the sum meets `𝔰𝔩_3(ℝ)` in the `(2, 1)`-block upper triangular algebra, of dimension `2 + 2 + 2 = 6`.
- `GL_n(ℝ)` for `n ≥ 1`, `𝔞` diagonal, `H₀ = diag(n, n − 1, …, 1)`: the condition holds. The Bruhat representatives are the signed permutation matrices, identified with `S_n` modulo diagonal signs. The Tits system is `TauCeti.glTitsSystem ℝ (n − 1)`, and the subalgebras containing `𝔮₀`, the upper triangular matrices, are the `2^{n−1}` block upper triangular algebras, each the non-negative eigenspace sum of a block-scalar diagonal `Y`. At `n = 0`, `G = P = 1`, `𝔞 = 0` and the sole subalgebra is `0`; no `n − 1` indexing is used.
- `O(1,1)` with `𝔞 = ℝY`, `Y = ((0, 1), (1, 0))`, and `H₀ = Y`: `M = {±1}`, `N = {1}`, `P = {±exp(tY)}`, and `K = {±1, ±d}` with `d = diag(1, −1)`, all of whose elements normalize `𝔞`. `G = P ⊔ dP`, so the Bruhat statement holds: `P k P` meets `P k' P` only if `k⁻¹k' ∈ P ∩ K = {±1}`, which commutes with `𝔞`. The Langlands statement holds, with `G = K·P` and `K ∩ P = M`. But `d·exp(tY)·d = exp(−tY)`, so `exp(−tY)·d·exp(tY) = exp(−2tY)·d` is unbounded, the dynamic parabolic of `Y` is `P`, of index two, and that of `0` is `G`. The component condition fails; `d` normalizes `N = {1}` without commuting with `𝔞`, and `dPd⁻¹ = P` with `d ∉ P`; and `0` and `Y` have the same centralizer `𝔤` but different dynamic parabolics. This is the negative control for both forms of the component condition, for the "iff" of the subgroups containing `P` and for the Tits system (`P` is normal in `G`, so the axiom `sBs ≠ B` fails for every candidate reflection), not for the Langlands, conjugacy, Bruhat or regular dynamical statements.
- `Aut(𝔰𝔩_3(ℝ))` in `GL_8(ℝ)` with `𝔞 = ad(diagonal)` and `H₀ = ad(diag(1, 0, −1))`: `σ·Ad(w₀) ∈ K` fixes `H₀` (§6.2, Checks), so it lies in the dynamic parabolic of `H₀` but not in `P`, since `K ∩ P = M` and it acts on `𝔞` by `−w₀`. The dynamic parabolic of `H₀` is `P ⊔ σ·Ad(w₀)·P`, the union over the stabilizer `{1, σ·Ad(w₀)}` of `H₀` in `W_G`, as the regular dynamical statement says, and it is not `P`: the first clause of the statement on subgroups containing `P` needs the condition. With the dynamic parabolic of `H₀` in place of `P`, the uniqueness clause of the Bruhat statement fails: `k = 1` and `k' = σ·Ad(w₀)` give the same double coset, and `k⁻¹k'` does not commute with `𝔞`. The hypothesis-free statement needs `P = M·exp(𝔞)·N`.
- `SL_3(ℝ)` with `X = diag(1, 1, −2)` and `Y = diag(2, 2, −4)`: these have the same centralizer, the same dynamic parabolic and the same non-negative eigenspace sum, the `(2, 1)`-block upper triangular algebra. `X` and `diag(1, 0, −1)` have different centralizers and different parabolics. In `GL_2(ℝ)`, `Y = 0` and the scalar `Y = 1` have the same centralizer and the same eigenspace sum `𝔤`.
- Conjugacy under `K⁰`. In `SL_2(ℝ)`, the pairs `(ℝ·diag(1, −1), diag(1, −1))` and `(ℝ·diag(1, −1), −diag(1, −1))` give the upper and lower triangular groups, conjugate by `((0, −1), (1, 0)) ∈ SO(2) = K⁰`. In `O(1,1)`, `K⁰ = {1}` and `(ℝY, Y)`, `(ℝY, −Y)` give the same `P = {±exp(tY)}`, so `k = 1` serves. In `GL_2(ℝ)`, the diagonal `𝔞` and `𝔞' = ℝ·1 ⊕ ℝ·((0, 1), (1, 0))` are carried onto each other by the rotation through `π/4` in `SO(2)` (§2.2, Checks).

### 7.4 The split component of a self-adjoint linear group

Define `positiveCharacterKernel G`, the group `⁰G` of §5.1 for the datum of §7.1: the `g ∈ G` at which every continuous homomorphism `G → (ℝ, +)` vanishes. Through `log`, these homomorphisms are exactly the logarithms of the continuous homomorphisms `G → (ℝ_{>0}, ·)`, so this is §5.1's definition. Let `F` be the set of symmetric elements of `linearLieAlgebra G` that commute with every element of `linearLieAlgebra G` and with every element of `G`: the fixed vectors `V^{Ad(G)}` of the split centre `V = 𝔷(𝔤) ∩ 𝔭`. *Needs:* §§5.1, 7.1; Mathlib `Multiplicative`, `MonoidHom`.

Prove the following API.

- `positiveCharacterKernel G` is a normal subgroup of `G`, closed when `G` is closed, and it contains every compact subgroup of `G` (a continuous homomorphism from a compact group to `(ℝ, +)` is trivial) and every commutator.
- For a self-adjoint linear group, `positiveCharacterKernel G = K·exp((𝔭 ∩ [𝔤, 𝔤]) ⊕ V₀)` with `V₀` the orthogonal complement of `F` in `V` for `⟨X, Y⟩ = tr(XYᵀ)` (§5.1).
- `F` is a subspace of `V`, and `exp` maps it isomorphically onto a closed vector subgroup central in `G`.

Prove `positiveCharacterKernel_mul_exp`: for a self-adjoint linear group `G`, every `g ∈ G` is `l·exp(X)` with `l ∈ positiveCharacterKernel G` and `X ∈ F`, both unique. This is the matrix form of the product `⁰L × lieExp(F) ≅ L` of §5.1; the components of `G` may act nontrivially on `V`, and only the fixed part `F` splits off. When components act trivially on `V`, in particular under the component condition, `F = V` and `exp(V)` is the split component `A_G` (Knapp 2002, Ch. VII §2; Wallach 1988, Ch. 2 §2.2). *Needs:* §§5.1, 7.1.

**Checks.**

- `G = GL_1(ℝ) = ℝ^×`: the continuous homomorphisms to `(ℝ, +)` are `x ↦ s·log|x|`, so `⁰G = {±1}`, `F = V = ℝ`, and `x = sgn(x)·exp(log|x|)`.
- `G = GL_n(ℝ)`, `n ≥ 1`: `⁰G = {g : |det g| = 1}`, `F = V = ℝ·1`, and `g = l·exp((log|det g|/n)·1)` with `l = |det g|^{−1/n}·g`; the denominator `n` is nonzero. Defining `⁰G` as `K` alone would fail: `diag(2, 1/2)` has `|det| = 1` and is not orthogonal. At `n = 0`, `G = ⁰G = 1`, `F = 0` and `1 = 1·exp(0)`.
- Compact `G`: `⁰G = G` and `F = 0`, since the symmetric part of the Lie algebra is `0`.
- `G = O(1,1)`: the Lie algebra is `V = ℝY` with `Y = ((0, 1), (1, 0))`, and `d = diag(1, −1)` sends `Y` to `−Y`, so `F = 0`. A continuous `χ : G → (ℝ, +)` satisfies `χ(exp(tY)) = χ(d exp(tY) d) = χ(exp(−tY))`, so it vanishes on `exp(ℝY)` and on the finite `K`, and `⁰G = G`. The product `⁰G × exp(V)` would have the nontrivial fibre `{(exp(−tY), exp(tY))}` over `1`: only `F`, not `V`, splits off.
- The positive diagonal matrices together with the antidiagonal matrices with positive entries form a self-adjoint linear group `G ≤ GL_2(ℝ)` with two components, whose Lie algebra is the diagonal algebra `V`. The swap fixes `F = ℝ·1` and negates `V₀ = ℝ·diag(1, −1)`. For `g = diag(e³, e)`, `g = diag(e, e^{−1})·exp(2·1)`, matching the averaging `(3, 1) ↦ (2, 2)` of §5.1 with residual `(1, −1)`, and `⁰G` is generated by `exp(V₀)` and the antidiagonal elements of determinant `−1`.
- `G = ℝ^× × ℝ^×`, the invertible diagonal matrices in `GL_2(ℝ)`: closed, transpose-stable, with four components, and the real points of `(Res_{E/ℚ} 𝔾_m)_ℝ` for a real quadratic field `E` in the setting of §8.1. Its Lie algebra is the diagonal algebra, all of it symmetric and commuting with every element of `G`, so `F = V` has dimension `2`. The continuous homomorphisms to `(ℝ, +)` are `(x, y) ↦ s·log|x| + t·log|y|`, so `⁰G = {diag(±1, ±1)}` and `exp(V)` is the positive diagonal group, of dimension `2`; `diag(2, 1/2) = 1·exp(diag(log 2, −log 2))` is its decomposition, with nonzero exponent. The rational split component `A_G(ℝ)⁰` of AdelicAlgebraicGroups §2.1 for `𝔾_m` over `E` is the positive scalars, of dimension `1`, and does not contain `diag(2, 1/2)`. Reading this section's split component as the rational one would replace `⁰G` by `{|xy| = 1}`, the joint kernel of the absolute values of the rational characters (generated by the norm `(x, y) ↦ xy`), which contains `diag(2, 1/2)` although `log|x|` takes the value `log 2 ≠ 0` on it.

### Examples

`GL_n(ℝ)`, `SL_n(ℝ)`, `Sp_{2n}(ℝ)`, `O(p, q)` for `p ≠ q` (component condition holds), `O(p, p)` for `p ≥ 1` (fails) and `O(0, 0) = 1` (holds), `O(1,1)` (fails, with `⁰G = G`), `Aut(𝔰𝔩_3(ℝ))` in `GL_8(ℝ)` (fails), `ℝ^×` (`⁰G = {±1}`), the positive diagonal group extended by the swap (fixed and moving central directions), `ℝ^× × ℝ^×` (the real points of `Res_{E/ℚ} 𝔾_m` for a real quadratic `E`: split component of dimension `2`, against `1` for the rational one).

### Dependencies

Layers 1–6; RealSemisimpleLieGroups §§1.2, 3.3, 4.1, 4.2, 4.4; LieGroups Layers 0–1 (the matrix shadows of `lieExp` and `Ad`), Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`) and Layer 9 (identity-cover polar theorem); Tau Ceti `map_lieExp`, `TauCeti.TitsSystem`; Mathlib `Matrix.GeneralLinearGroup`, `Matrix.orthogonalGroup`, `unitarySubgroup`, `NormedSpace.exp`, `Matrix.exp_transpose`, `Matrix.exp_conj`, `ConnectedComponents`, `connectedComponentIn`, `Filter.Tendsto`, `DoubleCoset.doubleCoset`, `LinearMap.mulLeft`, `LinearMap.mulRight`, `Module.End.eigenspace`, `Multiplicative`.

## Layer 8: Real points of connected reductive groups over ℝ

Throughout this layer:

- `𝐇` is a connected reductive linear algebraic group over `ℝ`, embedded in `GL_n` with transpose-stable image;
- `G = 𝐇(ℝ)` or `G = 𝐇(ℝ)⁰`, with `θ(g) = (gᵀ)⁻¹`.

ALS.F.1 makes `𝐇(ℝ)` a closed subgroup of `GL_n(ℝ)` with finitely many components and Lie algebra `Lie(𝐇)(ℝ)`.

### 8.1 Real points as self-adjoint linear groups

Prove that `G` is a self-adjoint linear group (§7.1), so that it carries the reductive Cartan datum of §7.1 and the statements of Layer 7 apply to it, and that it satisfies the component condition. For `G = 𝐇(ℝ)` the three fields of §7.1 are ALS.F.1 and the transpose-stable embedding. For `G = 𝐇(ℝ)⁰`: it is open in `𝐇(ℝ)`, hence closed, it is preserved by the continuous automorphism `θ` and by inversion, hence by transposition, and it is connected, so the condition holds (§2.5). For `G = 𝐇(ℝ)` the condition is RealSemisimpleLieGroups §2.3, which proves that `M` meets every component of `𝐇(ℝ)` for this transpose-inverse datum; the condition does not depend on `𝔞` (§2.5). ALS.0.1 (`LocallySymmetric.IsCartanInvolution.transposeInverse`) says that `θ` is an algebraic Cartan involution of `𝐇`. For `𝐇 = (Res_{F/ℚ} G)_ℝ` with `G` connected reductive over a number field `F`, the datum agrees with ALS.0.2's Lie-theoretic Cartan datum of `G(F_∞)` (Knapp 2002, Ch. VII §2). *Needs:* ALS.F.1; ALS.0.1; ALS.0.2; RealSemisimpleLieGroups §2.3; §§2.5, 7.1.

In the matrix model, for `G = 𝐇(ℝ)`, this is `isSelfAdjointLinearGroup_of_zeroLocus`. Describe `𝐇` by a set `S` of real polynomials in the `n²` matrix entries, and suppose that the zero locus `Gℂ` of `S` in `GL_n(ℂ)` is a subgroup, connected in the classical topology and stable under transposition. Then the zero locus `G` of `S` in `GL_n(ℝ)` is a self-adjoint linear group, and `LinearComponentCondition G 𝔞` holds for every `𝔞` with `IsMaximalAbelianSymmetric G 𝔞`. These hypotheses are those of this layer: `Gℂ` is a Zariski-closed subgroup stable under complex conjugation, hence the complex points of an `ℝ`-subgroup `𝐇` of `GL_n` whose real points are `G`; `𝐇` is connected because a complex linear algebraic group is Zariski-connected iff its complex points are connected; and `𝐇` is reductive because `Gℂ` is stable under conjugate transposition, the transpose composed with complex conjugation, so that `θ` is an algebraic Cartan involution of `𝐇` (ALS.0.1). The hypothesis is the connectedness of `Gℂ`, not of `G`. *Needs:* the paragraph above; Mathlib `MvPolynomial.eval`, `MvPolynomial.map`, `Matrix.GeneralLinearGroup`.

**Checks.**

- `𝐇 = GL_n` for `n ≥ 1`: `M` is the sign matrices, which meet both components of `GL_n(ℝ)`. At `n = 0` the group has one element and one component.
- `𝐇 = PGL_2` realized as `SO(2, 1)` for `x₁² + x₂² − x₃²`, with `𝔞 = ℝ(E₂₃ + E₃₂)`: `𝐇(ℝ) = SO(2, 1)` has two components, and `M = {1, diag(1, −1, −1)}`. `diag(1, −1, −1)` reverses the time orientation, so `M` meets both components.
- `𝐇 = O(1,1)` is not connected, and §2.5 shows the conclusion fails for it. The connectedness hypothesis is necessary. In the polynomial description, `O(1,1)` is cut out by `gᵀJg = J`, `J = diag(1, −1)`, and its complex points form `O(2, ℂ)`, with two components (`det g = ±1`), so the hypothesis on `Gℂ` excludes it.
- `𝐇 = SO(1,1)`, cut out by `gᵀJg = J` and `det g = 1`: the complex points `{((a, b), (b, a)) : a² − b² = 1} ≅ ℂ^×` (by `(a, b) ↦ a + b`) are connected and transpose-stable, while the real points `{±exp(tY)}`, `Y = ((0, 1), (1, 0))`, have two components. `M = {±1}` meets both, so the component condition holds for a disconnected `G`; a hypothesis "`G` connected" in its place would exclude this group, and would make the condition trivial.
- `𝐇 = 𝔾_m × SO(2)`, with real points `ℝ^× × S¹` embedded block-diagonally in `GL_3`: transpose-inverse is `(x, s) ↦ (x⁻¹, s)`, which on the identity component `ℝ_{>0} × S¹`, identified with `ℝ × S¹` through `log`, is the `c = 0` datum of §1.2. It is the only algebraic Cartan involution, since an algebraic homomorphism from the split torus to the anisotropic `SO(2)` is trivial. The tilts `(x, s) ↦ (x⁻¹, s − 2c·log|x|)`, `c ≠ 0`, which restrict to the `θ_c` of §1.2 on the identity component, are reductive Cartan data on the Lie group (fixed group `{±1} × S¹`) but not algebraic.

### Examples

`GL_n(ℝ)`, `SO(2, 1)`, `SO(1,1)` (disconnected real points, connected complex points), `Sp_4(ℝ)`, `𝔾_m × SO(2)`.

### Dependencies

Layers 2, 7; RealSemisimpleLieGroups §2.3; ALS.F.1, ALS.0.1–ALS.0.2; Mathlib `MvPolynomial.eval`, `MvPolynomial.map`.

## Downstream consumers

- **Archimedean representation theory.** The minimal parabolic `P = MAN` of §§3.3 and 3.5, finite central covers and groups that are not real points of an algebraic group included, is the subgroup from which principal series are induced. For the real-algebraic class of AutomorphicFormsOnReductiveGroups §2.3a it is the subgroup defined there by the same recipe `M = Z_K(𝔞)`, `A = lieExp 𝔞`, `N = lieExp 𝔫`; AutomorphicSpectralTheoryPartII §1.5 induces from that subgroup, taken from AutomorphicFormsOnReductiveGroups §§2.1–2.4.
- **Rank-one geometry.** For `SO₀(n, 1)` with `n ≥ 2` (among them `SO₀(3, 1) ≅ PSL_2(ℂ)`), `SL_2(ℝ)` and `PU(1, n)` with `n ≥ 1`, the group `P` of §3.3 is the stabilizer of a point of the boundary sphere `K/M` of the symmetric space, and a parabolic element, having exactly one fixed point on that sphere, lies in a conjugate of `P`. These are the groups that contain the parabolic elements of Kleinian and Fuchsian groups, as in KleinianGroups Layer 3 (the parabolic elements of the Bianchi groups and the cusps they fix) and FuchsianOrbifolds Layer 3 (parabolic fixed points and cusps).
- **Further consumers.** Higgs bundles for real groups (the parabolics `P_Θ` of real forms in Bradlow–Collier–García-Prada–Gothen–Oliveira 2024, Introduction), homogeneous dynamics and Zimmer's programme (Brown–Fisher–Hurtado 2022, Brown–Rodriguez Hertz–Wang 2022), harmonic analysis on `G`, and Cartan subgroups.

## Worked examples

- **`SL_2(ℝ)`.**
  - Data: `θ(g) = (gᵀ)⁻¹`, `K = SO(2)`, `𝔞 = ℝ·diag(1, −1)`, `Σ = {±α}`, `M = {±1}`.
  - Parabolics: `P` is upper triangular, and its conjugates are the point stabilizers on `ℙ¹(ℝ)` (§3.4).
  - Bruhat: `G = P ⊔ P n_s P` (§4.2), a rank-one Tits system.
  - Dynamics: for `X = diag(1, −1)`, `Q(X) = P` (§6.2).
- **`GL_n(ℝ)`.**
  - `M` is the `2^n` sign matrices; `P = TauCeti.upperTriangularGroup`; `W = S_n`.
  - `G = KP` is `Matrix.GeneralLinearGroup.existsUnique_iwasawa`, and for `n ≥ 1` the Tits system of §4.2 is `TauCeti.glTitsSystem ℝ (n − 1)`. For `n = 0`, `G = P = 1` and `W = 1`.
  - `⁰L = {|det| = 1}` and `A_L = ℝ_{>0}·1` (§5.1). The standard parabolics of RealSemisimpleLieGroups §4.2 are the block upper triangular groups for compositions of `n`, each `dynamicParabolic G Y` for a block-scalar diagonal `Y` (§7.3).
- **`SL_3(ℝ)`.** `W = S₃`, six Bruhat cells of dimensions `5, 6, 6, 7, 7, 8` (§4.2); `X = diag(1, 1, −2)` has non-negative eigenspace sum the `(2, 1)`-block upper triangular algebra (§7.3).
- **`SO₀(n, 1)`, `n ≥ 2`.** Rank one, `Σ = {±λ}` with multiplicity `n − 1`, `N ≅ ℝ^{n−1}`, `G/P ≅ S^{n−1}`. At `n = 1`, `G = A`, `Σ = ∅`, `N = 1`, `P = G` and `G/P` is one point.
- **`Sp_4(ℝ)`.** `Σ = C₂`, `Π = {e₁ − e₂, 2e₂}`, and `|W| = 8` Bruhat cells (§4.2).
- **`SU(n, 1)`, `n ≥ 2`.** `Σ = BC₁`, `𝔫 = 𝔤^λ ⊕ 𝔤^{2λ}` Heisenberg, and the big cell has dimension `dim P + 2(n − 1) + 1`.
- **`SL_2(ℂ)` as a real group.** `M = U(1)`, `m_α = 2`, `G/P ≅ ℂℙ¹`.
- **Compact `G`, `ℝ^×`.** `P = G`, `Σ = ∅`, with `𝔭 = 0` and `𝔭 ≠ 0` respectively.
- **Negative controls.**
  - The Euclidean motion group `ℝ^n ⋊ O(n)` for `n ≥ 2`: not reductive; for `n = 1` the datum exists as in §1.2.
  - `SU(2)` with `Ad(diag(i, −i))`: no base global matrix-cover datum, as the polar map has a collision.
  - `ℝ × S¹`: non-conjugate underlying Cartan involutions for different split central lines.
  - `O(1,1)` and `Aut(𝔰𝔩_3(ℝ))`: the component condition fails, and with it `P = N_G(P)`, the minimal parabolic datum and the Tits system, so RealSemisimpleLieGroups Layers 3–4 do not apply to `G`; for `Aut(𝔰𝔩_3(ℝ))` the dynamic parabolic of the regular `ad(diag(1, 0, −1))` is also strictly larger than `P`, while for `O(1,1)` the dynamic parabolic of `Y` is still `P`. The Langlands decomposition of `P`, the Bruhat decomposition over `W_G`, with two and twelve cells, and the regular dynamical description survive.

## References

- **knapp2002**: A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Progress in Mathematics 140, Birkhäuser, 2002. Ch. VI §§2, 4–5 (Cartan involutions, Iwasawa decomposition, uniqueness); Ch. VII §2 (reductive groups and their axioms), §4 (Bruhat decomposition), §5 (structure of `M`), §7 (parabolic subgroups, Lemma 7.73, Proposition 7.76, Langlands decompositions). Cited by section.
- **warner1972**: G. Warner, *Harmonic Analysis on Semi-Simple Lie Groups I*, Springer, 1972. Ch. 1, §§1.1–1.2. Cited by section.
- **wallach1988**: N. R. Wallach, *Real Reductive Groups I*, Academic Press, 1988. Ch. 2, §§2.1–2.2 (real reductive groups, `⁰L`). Cited by section.
- **bourbaki-lie4-6**: N. Bourbaki, *Lie Groups and Lie Algebras, Chapters 4–6*, Springer, 2002. Ch. IV §2 nos. 1–7 (Tits systems and parabolic subgroups); Ch. V §3 no. 3 (stabilizers in a group generated by reflections); Ch. VI §1 (root systems, non-reduced systems, positive systems). Cited by section.
- **borel-tits1965**: A. Borel, J. Tits, *Groupes réductifs*, Publ. Math. IHÉS 27 (1965), 55–150. Théorème 4.15 (pp. 90–91), Corollaire 5.18 (ii) (p. 101).
- **brown-fisher-hurtado2022**: A. Brown, D. Fisher, S. Hurtado, *Zimmer's conjecture: subexponential growth, measure rigidity, and strong property (T)*, Ann. of Math. 196 (2022), 891–940; arXiv 1608.04995v4, §3.1 (standard parabolic subalgebras and subgroups).
- **brown-rodriguezhertz-wang2022**: A. Brown, F. Rodriguez Hertz, Z. Wang, *Invariant measures and measurable projective factors for actions of higher-rank lattices on manifolds*, Ann. of Math. 196 (2022), 941–981; arXiv 1609.05565v2, §1.2, equation (1).
- **bradlow-collier-garciaprada-gothen-oliveira2024**: S. Bradlow, B. Collier, O. García-Prada, P. Gothen, A. Oliveira, *A general Cayley correspondence and higher rank Teichmüller spaces*, Ann. of Math. 200 (2024), 803–892; arXiv 2101.09377v2, Introduction (the Θ-positive parabolic subgroups `P_Θ ⊂ G_ℝ`; a consumer-side reference).
