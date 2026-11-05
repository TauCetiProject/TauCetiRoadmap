module

public import Mathlib
public import TauCeti.Algebra.Homology.DG.Module.Right.Defs
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic

/-!
# Morse and Floer homology with DG local coefficients: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them. Discharging the statements here finishes neither a layer
nor the roadmap.

Stated here:

* the twisted complex of a twisting cocycle over a DG algebra (README Layer 4 items 1–2): the
  twisted differential of a DG right module squares to zero and raises the total degree by one;
* the mod-2 vanishing theorem (README Layer 1 item 4): a simply connected space with vanishing
  reduced mod-2 singular homology has uniquely 2-divisible higher homotopy groups;
* the torus criterion (README Layer 11 item 3): a compact connected Lie group is aspherical
  exactly when it is a torus.

Not statable at the pins, each with the carrier it lacks:

* Theorems A and C (contractible almost existence on hypersurfaces of `T*Q`, README Layer 10
  item 5): closed characteristics of a hypersurface and 1-periodic orbits of a time-dependent
  Hamiltonian flow on a symplectic manifold; at the pins `cotangentSymplecticForm` lives on the
  model space only and there is no Hamiltonian-flow carrier on a symplectic manifold.
* Theorems L and M (capacity bounds, README Layer 10 items 1–2): the relative and
  `π₁`-sensitive Hofer–Zehnder capacities and the spectral invariants.
* Theorem J and the comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` (README Layer 8 item 6):
  the Hamiltonian Floer complex, hence moduli spaces of Floer cylinders.
* Theorem K, the DG Viterbo isomorphism (README Layer 9 item 3): symplectic homology `SH_*` and
  DG Morse homology of the free loop space.
* The fibration theorem `H_*(B; C_*(F')) ≅ H_*(E)` (README Layer 5 item 4): the DG Morse
  complex, hence compactified Morse trajectory spaces with corners and the DG algebra of cubical
  chains on Moore loops.
* The Arnold bound on contractible 1-periodic orbits (README Layer 7.C.6g): nondegenerate
  1-periodic orbits of a time-dependent Hamiltonian flow and `c₁` on spherical classes.
* The degree-one Hurewicz isomorphism (README Layer 1 item 1): AlgebraicTopology Stage 8.3's
  Hurewicz map on native singular homology, of which the theorem asserts bijectivity.
* The Serre spectral sequences (README Layer 1 item 2): the Serre-fibration predicate and the
  filtered-complex spectral sequence, both targets of README Layer 1.
* The Floer–Novikov torsion invariant (README Layer 7.T.8): Floer complexes over Novikov rings.

In Layer 4, `P → M` stands for `M ⊗_A K_m`, where `K_m` is the twisted complex of free left
modules of the README; the coefficient `m x y` acts on the right of `α`. The twisting equation is
written in the source's homological sign convention on a cohomologically graded algebra, through
the grading bridge `C^{-n} = C_n` of the README (standing conventions).
-/

@[expose] public section

namespace TauCetiRoadmap.DGFloer

open scoped unitInterval ContDiff

/-! ## Layer 1: topological prerequisites -/

open scoped Topology in
/-- **Mod-2 vanishing** (README Layer 1 item 4). A simply connected space `Y` whose singular
homology with coefficients in the abelian group `ℤ/2` vanishes in every positive degree has
every higher homotopy group uniquely 2-divisible: squaring is a bijection on `π_{n+2}(Y, y)`.
The coefficients are Mathlib's singular homology with values in `ModuleCat ℤ`, evaluated on the
`ℤ`-module `ZMod 2`. The proof is the one-step lemma of the README, iterated through the
Whitehead tower, with the mod-2 Serre spectral sequence and the vanishing of
`H̃_*(K(A, n); 𝔽₂)` for a `ℤ[1/2]`-module `A`. -/
theorem bijective_sq_homotopyGroup_of_mod_two_acyclic (Y : TopCat.{0}) [SimplyConnectedSpace Y]
    (hY : ∀ n : ℕ, 1 ≤ n → Subsingleton
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ (ZMod 2))).obj Y))
    (n : ℕ) (y : Y) : Function.Bijective (fun a : π_ (n + 2) Y y ↦ a ^ 2) := sorry

/-! ## Layer 4: twisting cocycles and the twisted complex -/

section Twisting

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]
  {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜] {d : A →ₗ[R] A}

/-- A **twisting cocycle** over the DG algebra `(𝒜, d)` on a finite set `P` of generators
graded by `ind` (README Layer 4 item 1). In homological notation `m x y` has degree
`ind x - ind y - 1`, so under the grading bridge it lies in cohomological degree
`ind y - ind x + 1`. The twisting equation is the source's
`∂m_{x,y} = Σ_z (-1)^{ind x - ind z} m_{x,z} m_{z,y}`.

The one-sidedness condition is part of the data: it does not follow from the degree and the
twisting equation over an arbitrary DG algebra (README Layer 4 item 1), but it is automatic over
a cohomologically nonpositive algebra. -/
structure TwistingCocycle (h : TauCeti.IsDGAlgebra 𝒜 d) (P : Type*) [Fintype P] (ind : P → ℤ)
    where
  /-- The coefficient of `y` in the twisted differential of `x`. -/
  m : P → P → A
  mem_graded : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)
  twisting : ∀ x y, d (m x y) = ∑ z, (ind x - ind z).negOnePow • (m x z * m z y)
  /-- Strict upper-triangularity for the order by `ind`. -/
  one_sided : ∀ x y, ind x ≤ ind y → m x y = 0

variable {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M]

/-- The **grading involution** `α ↦ (-1)^{|α|} α` of an internally graded module: on the
homogeneous piece of degree `q` it is multiplication by `(-1)^q`, through the decomposition
`M ≃ ⨁ ℳ q`. It carries the Koszul sign of the twisted differential. -/
noncomputable def gradingInvolution (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] :
    M →ₗ[R] M :=
  (DirectSum.decomposeLinearEquiv ℳ).symm.toLinearMap ∘ₗ
    DirectSum.lmap (fun q : ℤ ↦ q.negOnePow • (LinearMap.id : ℳ q →ₗ[R] ℳ q)) ∘ₗ
    (DirectSum.decomposeLinearEquiv ℳ).toLinearMap

/-- The twisted complex `M ⊗_A K_m`, with `M ⊗ ⟨P⟩` identified with `P → M`, is graded in total
degree `n` by `f x ∈ ℳ (n + ind x)`: the generator `x` sits in cohomological degree `-ind x`. -/
def totalGrading (ℳ : ℤ → Submodule R M) {P : Type*} (ind : P → ℤ) (n : ℤ) :
    Submodule R (P → M) where
  carrier := {f | ∀ x, f x ∈ ℳ (n + ind x)}
  add_mem' hf hg x := add_mem (hf x) (hg x)
  zero_mem' _ := zero_mem _
  smul_mem' c _ hf x := Submodule.smul_mem _ c (hf x)

variable {h : TauCeti.IsDGAlgebra 𝒜 d} {P : Type*} [Fintype P] {ind : P → ℤ}
  {ℳ : ℤ → Submodule R M}

/-- The twisted differential on `M ⊗_A K_m`, identified with `P → M` (README Layer 4 item 2).
Its `y`-component is `(D f) y = ∂(f y) + Σ_x (m_{x,y} acting on the right) (ε (f x))`, where
`ε = gradingInvolution ℳ` carries the Koszul sign. On a homogeneous elementary tensor this is
`D(α ⊗ x) = ∂α ⊗ x + (-1)^{|α|} Σ_y α · m_{x,y} ⊗ y`. The right `A`-action on `M` enters the
construction itself, so the map depends on it (README Layer 4 item 2, Checks).

`R`-linearity needs the two actions on `M` to commute, `[SMulCommClass R Aᵐᵒᵖ M]`; the instance
is bound on the definition and used in `map_smul'`, so it is retained in the signature. -/
noncomputable def twistedDifferential [SMulCommClass R Aᵐᵒᵖ M] (m : TwistingCocycle h P ind)
    (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] (dM : M →ₗ[R] M) :
    (P → M) →ₗ[R] (P → M) where
  toFun f y := dM (f y) + ∑ x, MulOpposite.op (m.m x y) • gradingInvolution ℳ (f x)
  map_add' f g := by
    funext y
    simp only [Pi.add_apply, map_add, smul_add, Finset.sum_add_distrib]
    abel
  map_smul' r f := by
    funext y
    simp only [Pi.smul_apply, map_smul, RingHom.id_apply, smul_add, Finset.smul_sum, smul_comm r]

/-- The twisted differential raises the total degree by one when `M` is a DG right module
(README Layer 4 item 2). -/
theorem twistedDifferential_mem_totalGrading [IsScalarTower R Aᵐᵒᵖ M] [SMulCommClass R Aᵐᵒᵖ M]
    [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
    [DirectSum.Decomposition ℳ] (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) {n : ℤ} {f : P → M} (hf : f ∈ totalGrading ℳ ind n) :
    twistedDifferential m ℳ dM f ∈ totalGrading ℳ ind (n + 1) := sorry

/-- The twisted differential squares to zero when `M` is a DG right module: `D² = 0` is the
twisting equation together with the right Leibniz rule (README Layer 4 item 2). -/
theorem twistedDifferential_sq [IsScalarTower R Aᵐᵒᵖ M] [SMulCommClass R Aᵐᵒᵖ M]
    [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
    [DirectSum.Decomposition ℳ] (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) (f : P → M) :
    twistedDifferential m ℳ dM (twistedDifferential m ℳ dM f) = 0 := sorry

end Twisting

/-! ## Layer 11: the finite cover of a compact connected Lie group -/

/-- **The torus criterion** (README Layer 11 item 3): a compact connected Lie group is
aspherical exactly when it is isomorphic, as a topological group, to a torus `(S¹)^r`. The
proof is through the finite covering `T × K → G` of README Layer 11 item 1 and `π₃(K) ≠ 0` for a
nontrivial compact simply connected semisimple `K` (item 2). -/
theorem isAspherical_iff_exists_continuousMulEquiv_torus
    {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    (I₀ : ModelWithCorners ℝ E H) [TopologicalSpace G] [ChartedSpace H G] [Group G]
    [LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G] :
    TauCeti.IsAspherical G 1 ↔ ∃ r : ℕ, Nonempty (G ≃ₜ* (Fin r → Circle)) := sorry

end TauCetiRoadmap.DGFloer
