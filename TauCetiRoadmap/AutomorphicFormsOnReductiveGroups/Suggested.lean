import Mathlib

/-!
# Automorphic forms on reductive groups: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for targets on pinned Mathlib and Tau Ceti carriers;
discharging them finishes neither a layer nor the roadmap. `sorry` marks theorem targets.
Light definitions and proved examples fix conventions on those carriers. The adelic function spaces,
real representation theory, global Hecke module, coherent cohomology and algebraic-modular-form
carriers are specified in the README, and the automorphic-form carrier, constant terms and cusp forms are
those of `ArithmeticLocallySymmetricSpaces` ALS.F.6.

Design choices.
* Growth is measured against an arbitrary real-valued height with a real exponent; the
  arithmetic fixed-exponent spaces use the dual-augmented submultiplicative height `≥ 1`.
  Polynomial height comparison preserves the unions, allowing changes of exponent.
* Right translation is `R(y) f (g) = f (g * y)`, so `R(y * z) = R(y) ∘ R(z)`, and a right level
  `J` becomes `y J y⁻¹` after translation by `y`.
* Rational invariance, level and central-character conditions are predicates on functions on an
  abstract group; the arithmetic specialization supplies `G(F) ⊆ G(𝔸)` and the central subgroup.
* `IsGFinite` and its elementary API form the independent algebraic prefix of README §2.1.
  Banach and Hilbert specializations forget continuity and restrict the underlying representation;
  `IsKFinite` abbreviates that predicate on `(π.restrict K.subtype).toRepresentation`.
  `isGFinite_toRepresentation_iff` identifies it with the actual continuous-representation orbit span.
  The Banach comparison `gFiniteSubmodule_dense` expresses SmoothBanachRepresentations
  SB4's compact-group density input as density of `gFiniteSubmodule π.toRepresentation`.
  README §2.1 constructs the complete locally convex integration/projector comparison.
* Lie tests and Banach smooth vectors use SmoothBanachRepresentations SB1–SB4. The smooth
  carrier has the supplied derivative topology, with its separate continuous inclusion;
  the identity-on-vectors `smoothVectorTopologyEquiv` compares it with the enveloping/Sobolev
  topology. The complete locally convex extensions and Fréchet Dixmier–Malliavin are README targets.
* Cuspidality is the kernel condition for a family of linear constant-term maps; the arithmetic
  specialization indexes it by all proper rational parabolics.
* Infinitesimal characters of `GLₙ(ℝ)` are `n`-tuples of complex numbers: L-algebraic means
  integral entries, C-algebraic means entries in `(n - 1)/2 + ℤ`.
  Cohomological weight zero means the Weyl orbit of the trivial parameter `ρ`, rather than
  the raw purity condition that the sums of Langlands exponents are zero.
* `HasCohomologyWith` uses full `K`. The centrally balanced `HasConnectedCohomologyWith`
  uses `(𝔤/𝔞,K°)` and retains the component action; full-`K` cohomology takes invariants.
  The coefficient promise in `galoisConjugate_cuspidal` uses the connected predicate.
* Local coefficient lattices use `Submodule.IsLattice`; characteristic-zero integral models
  are supplied by EtaleCohomologyFoundations F.4.0.
* Universal anemic eigensystems in README §5.8 are algebra maps from a two-generator-per-place
  polynomial presentation; the acting Hecke image carries its own relations. The arithmetic
  coordinates are primary, with a named complex unitary conversion in §7.3.
* The shared `IsAdelicLift` predicate of §7.2 retains the level character: right invariance is
  its trivial-character case, and uniqueness uses the stated adelic decomposition.
* GSp₄ coherent weights use the four positive `C₂` coroot evaluations `(x - y, x, x + y, y)`.
  Their full parameters have infinitesimal central weight opposite to the coefficient.
* Algebraic modular forms use Gross's rational covariance `F(γ g) = ρ(γ) F(g)`, `F(g u) = F(g)`.
  The level and central-character models specialize QuaternionicModularForms' common carrier;
  inversion identifies its opposite Hecke action with the right-coset convention.
-/

namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

noncomputable section

open scoped Classical

/-! ## Layer 0: Smooth adelic functions, growth and convolution -/

section Growth

variable {X : Type*}

/-- Polynomial growth against a supplied height: `‖f x‖ ≤ C * height x ^ N`.
Arithmetic heights are at least one (README §0.4). -/
def HasModerateGrowth (height : X → ℝ) (f : X → ℂ) : Prop :=
  ∃ C N : ℝ, 0 ≤ C ∧ 0 ≤ N ∧ ∀ x, ‖f x‖ ≤ C * height x ^ N

/-- Polynomially comparable heights give the same union of growth spaces, allowing exponent changes. -/
theorem moderateGrowth_iff_of_comparable (h h' : X → ℝ)
    (h1 : ∀ x, 1 ≤ h x) (h1' : ∀ x, 1 ≤ h' x)
    (hcomp : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h x ≤ C * h' x ^ M)
    (hcomp' : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h' x ≤ C * h x ^ M)
    (f : X → ℂ) : HasModerateGrowth h f ↔ HasModerateGrowth h' f := sorry

/-- Right translation preserves moderate growth for the selected submultiplicative height. -/
theorem moderateGrowth_rightTranslate {G : Type*} [Group G]
    (height : G → ℝ) (h1 : ∀ x, 1 ≤ height x)
    (hmul : ∀ x y, height (x * y) ≤ height x * height y)
    {f : G → ℂ} (hf : HasModerateGrowth height f) (y : G) :
    HasModerateGrowth height (fun x => f (x * y)) := sorry

/-- A uniform norm bound gives moderate growth with exponent zero. -/
example (height : X → ℝ) (f : X → ℂ) (C : ℝ) (hC : 0 ≤ C)
    (hf : ∀ x, ‖f x‖ ≤ C) : HasModerateGrowth height f :=
  ⟨C, 0, hC, le_rfl, fun x => by simpa using hf x⟩

/-- A bounded height cannot accommodate the identity function on the real line. -/
example : ¬HasModerateGrowth (fun _ : ℝ => 1) (fun x : ℝ => (x : ℂ)) := by
  rintro ⟨C, N, hC, -, h⟩
  have h1 := h (C + 1)
  rw [Real.one_rpow, mul_one, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (by linarith)] at h1
  linarith

/-- Exponential growth fails the polynomial-height condition. -/
theorem exp_not_hasModerateGrowth : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

/-- On the positive component of the multiplicative real group, a smooth vector can grow
so fast that its pairing with a rapidly decreasing group Schwartz function diverges. -/
theorem schwartzAction_growth_obstruction :
    ¬MeasureTheory.IntegrableOn
      (fun t : ℝ => Real.exp (-t ^ 2 - (t⁻¹) ^ 2) *
        Real.exp (t ^ 4 + (t⁻¹) ^ 4) / t) (Set.Ioi 0) := sorry

end Growth

section Equivariance

variable {G : Type*} [Group G]

/-- Rational left invariance, with the rational subgroup supplied by the specialization. -/
def IsLeftInvariant (Γ : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ γ ∈ Γ, ∀ g, f (γ * g) = f g

/-- Right invariance under a fixed finite level; no smoothness is asserted. -/
def IsLevelInvariant (J : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ u ∈ J, ∀ g, f (g * u) = f g

/-- Right translation, with `R(y * z) = R(y) ∘ R(z)`. -/
def rightTranslate (y : G) (f : G → ℂ) : G → ℂ := fun g => f (g * y)

/-- The action law retains the order of the right-translation parameters. -/
theorem rightTranslate_mul (y z : G) (f : G → ℂ) :
    rightTranslate (y * z) f = rightTranslate y (rightTranslate z f) := sorry

/-- Rational left invariance survives right translation. -/
theorem leftInvariant_rightTranslate (Γ : Subgroup G) {f : G → ℂ}
    (hf : IsLeftInvariant Γ f) (y : G) :
    IsLeftInvariant Γ (rightTranslate y f) := sorry

/-- Right translation by `y` changes the level `J` to `y J y⁻¹`. -/
theorem levelInvariant_rightTranslate (J : Subgroup G) {f : G → ℂ}
    (hf : IsLevelInvariant J f) (y : G) :
    IsLevelInvariant (J.map (MulAut.conj y).toMonoidHom) (rightTranslate y f) := sorry

/-- Full left invariance forces constancy. -/
example {f : G → ℂ} (hf : IsLeftInvariant ⊤ f) : f = fun _ => f 1 := by
  funext g
  simpa using hf g (Subgroup.mem_top g) 1

/-- The trivial rational subgroup imposes no condition. -/
example (f : G → ℂ) : IsLeftInvariant ⊥ f := fun γ hγ g => by
  rw [Subgroup.mem_bot.mp hγ, one_mul]

/-- The trivial level imposes no condition. -/
example (f : G → ℂ) : IsLevelInvariant ⊥ f := fun u hu g => by
  rw [Subgroup.mem_bot.mp hu, mul_one]

/-- Full right invariance forces constancy. -/
example {f : G → ℂ} (hf : IsLevelInvariant ⊤ f) : f = fun _ => f 1 := by
  funext g
  simpa using hf g (Subgroup.mem_top g) 1

end Equivariance

/-! ## Layer 2: real reductive representations and globalizations -/

section CompactOrbits

variable {𝕜 K V : Type*} [Field 𝕜] [Group K] [AddCommGroup V] [Module 𝕜 V]

/-- The common finite-orbit-span predicate over any field, independent of the analytic
compact-finiteness theorems. -/
def IsGFinite (ρ : Representation 𝕜 K V) (v : V) : Prop :=
  FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => ρ k v))

/-- Forgetting continuity identifies the shared predicate with the actual orbit-span condition
over any field, without compactness or completeness hypotheses. -/
theorem isGFinite_toRepresentation_iff [TopologicalSpace V] [IsTopologicalAddGroup V]
    (π : ContRepresentation 𝕜 K V) (v : V) :
    IsGFinite π.toRepresentation v ↔
      FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => π k v)) :=
  Iff.rfl

/-- A sum of two finite-orbit-span vectors has finite orbit span. -/
theorem gFinite_add (ρ : Representation 𝕜 K V) {v w : V}
    (hv : IsGFinite ρ v) (hw : IsGFinite ρ w) : IsGFinite ρ (v + w) := sorry

/-- Scalar multiples preserve finite orbit span. -/
theorem gFinite_smul (ρ : Representation 𝕜 K V) (a : 𝕜) {v : V}
    (hv : IsGFinite ρ v) : IsGFinite ρ (a • v) := sorry

/-- The common submodule of vectors with finite-dimensional orbit span. -/
def gFiniteSubmodule (ρ : Representation 𝕜 K V) : Submodule 𝕜 V where
  carrier := {v | IsGFinite ρ v}
  zero_mem' := by sorry
  add_mem' := gFinite_add ρ
  smul_mem' := fun a _ hv => gFinite_smul ρ a hv

/-- The finite-orbit-span submodule is invariant under the representation. -/
theorem gFiniteSubmodule_invariant (ρ : Representation 𝕜 K V) (k : K) {v : V}
    (hv : v ∈ gFiniteSubmodule ρ) : ρ k v ∈ gFiniteSubmodule ρ := sorry

/-- Equivariant linear maps preserve finite orbit spans. -/
theorem gFinite_map {W : Type*} [AddCommGroup W] [Module 𝕜 W]
    (ρ : Representation 𝕜 K V) (τ : Representation 𝕜 K W)
    (f : ρ.IntertwiningMap τ) {v : V} (hv : IsGFinite ρ v) :
    IsGFinite τ (f v) := sorry

end CompactOrbits

/-! ## Milestone: comparison with supplied Banach compact-finite density -/

/-- SmoothBanachRepresentations SB4's compact-group G-finite Banach density input,
expressed on the algebraic submodule of README §2.1. Strongly continuous complex Banach
representations of every compact Hausdorff group are included; operator-norm continuity
is not required. -/
theorem gFiniteSubmodule_dense {K E : Type*} [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    (π : ContRepresentation ℂ K E) (hπ : ∀ v : E, Continuous fun k : K => π k v) :
    Dense (gFiniteSubmodule π.toRepresentation : Set E) := sorry

section CompactRestriction

variable {K V : Type*} [Group K] [AddCommGroup V] [Module ℂ V]

/-- Compact-finiteness abbreviates the shared algebraic predicate on the subgroup representation.
For a continuous Banach or Hilbert representation, first forget continuity and restrict to the
subgroup. Its addition theorem is `gFinite_add`; smoothness and covariance are separate data. -/
abbrev IsKFinite (ρ : Representation ℂ K V) (v : V) : Prop := IsGFinite ρ v

/-- The compact-finite submodule is the shared finite-orbit-span submodule. -/
abbrev kFiniteSubmodule (ρ : Representation ℂ K V) : Submodule ℂ V := gFiniteSubmodule ρ

/-- Every vector of a finite-dimensional representation is `K`-finite. -/
theorem kFinite_of_finiteDimensional [FiniteDimensional ℂ V]
    (ρ : Representation ℂ K V) (v : V) : IsKFinite ρ v := sorry

/-- The zero vector is `K`-finite without a finite-dimensional ambient space. -/
theorem kFinite_zero (ρ : Representation ℂ K V) : IsKFinite ρ 0 := sorry

/-- In a trivial representation every orbit spans at most a line. -/
theorem kFinite_trivial (v : V) : IsKFinite (1 : Representation ℂ K V) v := sorry

/-- For a trivial acting group every representation has one-point orbits. -/
theorem kFinite_subsingleton [Subsingleton K] (ρ : Representation ℂ K V) (v : V) : IsKFinite ρ v := sorry

/-- An infinite cyclic regular orbit spans infinitely many independent point masses. -/
theorem not_kFinite_regular_int : ¬IsKFinite (Representation.leftRegular ℂ (Multiplicative ℤ))
    (MonoidAlgebra.single 1 1) := sorry

end CompactRestriction

section InductionInversion

variable {G : Type*} [Group G]

/-- Inversion identifies left covariance by a character with right covariance by its inverse.
For normalized induction the character includes the half-modulus; the SL₂ specialization
compares general induction with NoncompactQuantumSymmetry M4's supplied smooth models. -/
theorem induction_inversion_covariance (P : Subgroup G) (χ : P →* ℂˣ) (f : G → ℂ) :
    (∀ (p : P) (g : G), f ((p : G) * g) = (χ p : ℂ) * f g) ↔
      ∀ (g : G) (p : P), f ((g * (p : G))⁻¹) = (χ p : ℂ)⁻¹ * f (g⁻¹) := by
  constructor
  · intro hf g p
    simpa only [mul_inv_rev, Subgroup.coe_inv, map_inv, Units.val_inv_eq_inv_val] using
      hf (p⁻¹) (g⁻¹)
  · intro hf p g
    simpa only [mul_inv_rev, Subgroup.coe_inv, inv_inv, map_inv,
      Units.val_inv_eq_inv_val] using hf (g⁻¹) (p⁻¹)

/-- Applying the induction convention adapter twice recovers the original function. -/
theorem induction_inversion_involutive :
    Function.Involutive (fun f : G → ℂ => fun g => f (g⁻¹)) := by
  intro f
  funext g
  simp

/-- Inversion intertwines right translation with the left action by the inverse parameter. -/
theorem induction_inversion_rightTranslate (f : G → ℂ) (y g : G) :
    rightTranslate y f (g⁻¹) = f ((y⁻¹ * g)⁻¹) := by
  simp [rightTranslate]

end InductionInversion

/-! ## Layer 3: adelic modules and their local factors -/

section CentralCharacter

variable {G : Type*} [Group G]

/-- The central-character convention `f(g z) = χ(z) f(g)`; the arithmetic specialization
supplies the central subgroup and a character trivial on its rational points. -/
def HasCentralCharacter (Z : Subgroup G) (χ : Z →* ℂˣ) (f : G → ℂ) : Prop :=
  ∀ z : Z, ∀ g, f (g * z) = (χ z : ℂ) * f g

/-- Constants have the trivial central character. -/
example (Z : Subgroup G) (c : ℂ) : HasCentralCharacter Z 1 (fun _ => c) := fun _ _ => by
  simp

/-- A nonzero value detects the character. -/
example (Z : Subgroup G) (χ : Z →* ℂˣ) {f : G → ℂ}
    (hf : HasCentralCharacter Z χ f) (g : G) (hg : f g ≠ 0) (z : Z)
    (hz : f (g * z) = f g) : χ z = 1 := by
  have h := hf z g
  rw [hz] at h
  exact Units.ext (by simpa using (mul_eq_right₀ hg).mp h.symm)

end CentralCharacter

/-! ## Layer 4: constant terms, cuspidal realizations and Fourier tests -/

section ConstantTerms

variable {P V W : Type*} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]

/-- Kernel formulation on the actual constant-term maps of the proper parabolics. -/
def IsCuspidalFor (constantTerm : P → V →ₗ[ℂ] W) (v : V) : Prop :=
  ∀ p, constantTerm p v = 0

/-- No proper parabolics makes the condition vacuous, as for an anisotropic group. -/
example [IsEmpty P] (constantTerm : P → V →ₗ[ℂ] W) (v : V) :
    IsCuspidalFor constantTerm v := fun p => isEmptyElim p

/-- A nonzero constant term excludes cuspidality. -/
example (constantTerm : P → V →ₗ[ℂ] W) (v : V) (p : P)
    (h : constantTerm p v ≠ 0) : ¬IsCuspidalFor constantTerm v := fun hc => h (hc p)

end ConstantTerms

/-! ## Layer 5: cohomological parameters and arithmetic coefficients -/

section Algebraicity

/-- An infinitesimal character of `GLₙ(ℝ)`, as an `n`-tuple, is L-algebraic when every entry
is an integer. -/
def IsLAlgebraicGL {n : ℕ} (μ : Fin n → ℂ) : Prop := ∀ i, ∃ m : ℤ, μ i = m

/-- It is C-algebraic when every entry lies in `(n - 1)/2 + ℤ`, the class of `ρ`. -/
def IsCAlgebraicGL {n : ℕ} (μ : Fin n → ℂ) : Prop :=
  ∀ i, ∃ m : ℤ, μ i = m + ((n : ℂ) - 1) / 2

/-- A real `GLₙ` infinitesimal parameter has cohomological weight zero when it is in the
Weyl orbit of the trivial representation's parameter `ρ`. -/
def IsCohomologicalWeightZeroGL {n : ℕ} (μ : Fin n → ℂ) : Prop :=
  ∃ w : Equiv.Perm (Fin n), ∀ i,
    μ i = ((n : ℂ) - 1) / 2 - ((w i).val : ℂ)

/-- C-algebraicity is L-algebraicity after the norm twist `|det|^{(n-1)/2}`. -/
theorem isCAlgebraicGL_iff_twist {n : ℕ} (μ : Fin n → ℂ) :
    IsCAlgebraicGL μ ↔ IsLAlgebraicGL (fun i => μ i + ((n : ℂ) - 1) / 2) := sorry

end Algebraicity

section Defect

/-- `ℓ₀` of `Res_{F/ℚ} PGLₙ` for a number field of signature `(r₁, r₂)`. -/
def ell0ResPGL (r₁ r₂ n : ℕ) : ℕ := r₁ * ((n - 1) / 2) + r₂ * (n - 1)

/-- The dimension of the symmetric space of `Res_{F/ℚ} PGLₙ`. -/
def symDimResPGL (r₁ r₂ n : ℕ) : ℕ := r₁ * (n ^ 2 - 1 - n * (n - 1) / 2) + r₂ * (n ^ 2 - 1)

/-- `q₀`, defined by `2 q₀ + ℓ₀ = dim`. -/
def q0ResPGL (r₁ r₂ n : ℕ) : ℕ := (symDimResPGL r₁ r₂ n - ell0ResPGL r₁ r₂ n) / 2

/-- The defining relation `2 q₀ + ℓ₀ = dim` holds exactly, without rounding. -/
theorem two_q0_add_ell0 (r₁ r₂ n : ℕ) :
    2 * q0ResPGL r₁ r₂ n + ell0ResPGL r₁ r₂ n = symDimResPGL r₁ r₂ n := sorry

end Defect

namespace CoefficientLattices

/-- In rank zero the zero lattice is full and stable, including at `p = 2`. -/
theorem rankZero_full_stable (p : ℕ) [Fact p.Prime] (J : Subgroup (GL (Fin 0) ℚ_[p])) :
    Submodule.IsLattice ℚ_[p] (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])) ∧
      ∀ g ∈ J, ∀ v ∈ (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])),
        (g : Matrix (Fin 0) (Fin 0) ℚ_[p]).mulVec v ∈
          (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])) := sorry

/-- The zero submodule is not full in positive rank. -/
theorem rankOne_bot_not_full (p : ℕ) [Fact p.Prime] :
    ¬Submodule.IsLattice ℚ_[p] (⊥ : Submodule ℤ_[p] (Fin 1 → ℚ_[p])) := sorry

/-- Scaling by `p` gives another stable full lattice. -/
theorem scale_full_stable (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : Submodule.IsLattice ℚ_[p] L)
    (hstable : ∀ g ∈ J, ∀ v ∈ L,
      (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L) :
    let pL := L.map ((p : ℤ_[p]) • LinearMap.id)
    Submodule.IsLattice ℚ_[p] pL ∧
      ∀ g ∈ J, ∀ v ∈ pL,
        (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ pL := sorry

/-- A full positive-rank lattice is distinct from its `p`-multiple. -/
theorem scale_ne_self (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 0 < n)
    (L : Submodule ℤ_[p] (Fin n → ℚ_[p])) (hL : Submodule.IsLattice ℚ_[p] L) :
    L.map ((p : ℤ_[p]) • LinearMap.id) ≠ L := sorry

end CoefficientLattices

/-- A torsion or residual Hecke eigensystem: a ring character together with a nonzero class.
Its arithmetic specialization is integral Betti cohomology with its Hecke action. -/
structure TorsionEigenSystem (T : Type*) [CommRing T]
    (H : Type*) [AddCommGroup H] [Module T H]
    (Λ : Type*) [CommRing Λ] [Module Λ H] [SMulCommClass T Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

/-- Finite coefficient fields give maximal kernels without surjectivity. -/
theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*}
    [CommRing T] [AddCommGroup H] [Module T H] [Field Λ] [Finite Λ] [Module Λ H]
    [SMulCommClass T Λ H] (e : TorsionEigenSystem T H Λ) :
    (RingHom.ker e.sys).IsMaximal := sorry

/-- A zero coefficient module has no eigensystem. -/
example {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [CommRing Λ] [Module Λ H] [SMulCommClass T Λ H] [Subsingleton H] :
    IsEmpty (TorsionEigenSystem T H Λ) :=
  ⟨fun e => e.ne_zero (Subsingleton.elim _ _)⟩

/-- Evaluation at `1` and `-1` gives distinct systems on the same class `4` modulo eight,
with the polynomial action fixed by evaluation at `1`. -/
theorem TorsionEigenSystem.same_class_distinct_characters :
    letI : Algebra (Polynomial ℤ) (ZMod 8) :=
      (Polynomial.eval₂RingHom (Int.castRingHom (ZMod 8)) (1 : ZMod 8)).toAlgebra
    ∃ ePlus eMinus : TorsionEigenSystem (Polynomial ℤ) (ZMod 8) (ZMod 8),
      ePlus.sys = Polynomial.eval₂RingHom (Int.castRingHom (ZMod 8)) 1 ∧
      eMinus.sys = Polynomial.eval₂RingHom (Int.castRingHom (ZMod 8)) (-1) ∧
      ePlus.c = 4 ∧ eMinus.c = 4 ∧ ePlus.sys ≠ eMinus.sys := sorry

/-! ## Layer 6: Hermitian pairs and coherent representations -/

namespace CoherentWeights

/-- The coordinate map giving the compact coefficient weight for a dominant split
coherent weight `(a,b;c_T)`, including its central weight. -/
def coherentCoefficient (a b c_T : ℤ) : ℤ × ℤ × ℤ := (-b, -a, a + b + 2 * c_T)

/-- The full parameter coordinate map; its last coordinate gives the infinitesimal central
character in the classified cases and cancels that of the coherent coefficient. -/
def harishChandraParameter (a b c_T : ℤ) : ℤ × ℤ × ℤ :=
  (a - 1, b - 2, -a - b - 2 * c_T)

/-- Contragredience reverses and negates the semisimple coordinates and negates the centre. -/
def dualParameter (a b c_T : ℤ) : ℤ × ℤ × ℤ := (2 - b, 1 - a, a + b + 2 * c_T)

/-- Positive `C₂` coroot evaluations at the semisimple parameter `(x, y)`.
The long roots `2e₁, 2e₂` have coroot evaluations `x, y`, without a factor two. -/
def corootValues (x y : ℝ) : Fin 4 → ℝ := ![x - y, x, x + y, y]

/-- Every nonzero coroot evaluation exceeds the bound in absolute value; zero evaluations,
such as the noncompact wall `y = 0`, are allowed. -/
def Separated (R x y : ℝ) : Prop :=
  ∀ i : Fin 4, corootValues x y i = 0 ∨ R < |corootValues x y i|

/-- Semisimple projection of `harishChandraParameter` for classical weight `(k,l)`;
the full parameter has central coordinate `-k-l-2c_T`. -/
def hcParameter (k l : ℤ) : ℝ × ℝ := ((k : ℝ) - 1, (l : ℝ) - 2)

/-- The elementary weight inequalities imply separation with the same constant. -/
theorem separated_of_weight_gaps (R : ℝ) (hR : 0 < R) (k l : ℤ)
    (hgap : R + 2 < (k : ℝ) - l)
    (hl : l = 2 ∨ R + 2 < (l : ℝ)) :
    Separated R (hcParameter k l).1 (hcParameter k l).2 := sorry

/-- Conversely, for `l ≥ 2` separation gives the weight inequalities with a smaller constant. -/
theorem weight_gaps_of_separated (R : ℝ) (hR : 2 < R) (k l : ℤ)
    (hkl : l ≤ k) (hl : 2 ≤ l)
    (hsep : Separated R (hcParameter k l).1 (hcParameter k l).2) :
    R - 1 < (k : ℝ) - l ∧ (l = 2 ∨ R < (l : ℝ)) := sorry

end CoherentWeights

/-! ## Layer 7: Classical and definite-group dictionaries -/

section AlgebraicForms

variable {A Γ G M : Type*} [CommRing A] [Group Γ] [Group G] [AddCommGroup M] [Module A M]

/-- Gross's rational coefficient convention on supplied rational and finite point groups.
Its arithmetic transport identifies it with QuaternionicModularForms' common level carrier
when the algebraic coefficient action extends to the selected finite points. -/
def IsAlgebraicModularForm (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) (f : G → M) : Prop :=
  (∀ γ g, f (ι γ * g) = σ γ (f g)) ∧ ∀ g, ∀ u ∈ J, f (g * u) = f g

/-- README §7.4, `algebraicModularForm_iff_levelCovariant`: an extending coefficient
representation identifies rational covariance with rational invariance and inverse level
covariance by the change of values `f(g) = ρ(g⁻¹) F(g)`. -/
theorem algebraicModularForm_iff_levelCovariant (ι : Γ →* G) (ρ : Representation A G M)
    (J : Subgroup G) (F : G → M) :
    IsAlgebraicModularForm ι (ρ.comp ι) J F ↔
      let f : G → M := fun g => ρ g⁻¹ (F g)
      (∀ γ g, f (ι γ * g) = f g) ∧
        ∀ g, ∀ u ∈ J, f (g * u) = ρ u⁻¹ (f g) := sorry

/-- Values at double-coset representatives determine a form in Gross's rational covariance model.
The level-action model uses the common abstract evaluation via coefficient transport;
arithmetic class-set finiteness is supplied by AdelicAlgebraicGroups. -/
theorem algebraicModularForm_ext (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) {I : Type*} (t : I → G)
    (hcover : ∀ g, ∃ (i : I) (γ : Γ) (u : J), g = ι γ * t i * u)
    {f f' : G → M} (hf : IsAlgebraicModularForm ι σ J f)
    (hf' : IsAlgebraicModularForm ι σ J f')
    (ht : ∀ i, f (t i) = f' (t i)) : f = f' := sorry

/-- A constant with values in a trivial coefficient is a form at every level. -/
example (ι : Γ →* G) (J : Subgroup G) (m : M) :
    IsAlgebraicModularForm ι (1 : Representation A Γ M) J (fun _ => m) :=
  ⟨fun γ g => by simp, fun _ _ _ => rfl⟩

/-- A constant must satisfy the rational coefficient covariance. -/
example (ι : Γ →* G) (σ : Representation A Γ M) (J : Subgroup G)
    (m : M) (γ : Γ) (hγ : σ γ m ≠ m) :
    ¬IsAlgebraicModularForm ι σ J (fun _ => m) := fun h => hγ (h.1 γ 1).symm

end AlgebraicForms

/-
README definitions requiring additional carriers include `AdelicSmoothFunction`,
`AdelicTestFunction`, `AdelicSchwartzFunction`, `T_sm` and `SmoothAutomorphicForm`;
`relativeKoszulResolution`, `smoothGroupCochains` and `homogeneousPoincareResolution`;
`IsAdmissible`, `IsHarishChandraModule`, `HasInfinitesimalCharacter`, generalized central
characters, normalized induction with its smooth Fréchet and compact-finite carriers,
the SL₂ discrete/limit endpoint sequences and the inversion, circle and Casimir
comparison used by NoncompactQuantumSymmetry M4; `IsTempered`, `IsSquareIntegrable`, their essential
variants, `IrrAdmissible`, `WeilGroupComplex`, `WeilGroupReal`, `IsBoundedParameter`,
`D_k`, `archimedeanUnitaryDual` (the common real/complex Speh and complementary-block
classification, including unitarity, product irreducibility, exhaustion and uniqueness),
`genericUnitaryClassification`, `HasWhittakerModel`,
`GContinuousNorm` and smooth Fréchet globalizations. The archimedean test factor of
`AdelicTestFunction` is SmoothBanachRepresentations SB1's `LieTestFunction` with its
fixed-support derivative and locally convex final topologies. Banach `smoothVectors`
uses SB2's `smoothLieVectors` and its separate complete Fréchet topology, with
`smoothVectorTopologyEquiv` the identity-on-vectors continuous linear equivalence
to the ordered-monomial Sobolev topology, intertwining inclusions and the real and
complexified Lie/enveloping actions. SB4's generic density and native
`StronglyContinuousSemigroup.smoothVectors` comparison precede the compact-Lie
comparison using §2.1. Arbitrary smooth Fréchet `dixmierMalliavin` and the complete
locally convex extensions are specified here; the continuous nondegenerate Schwartz-algebra
action requires `SFRepresentation(G)`, including its moderate-growth hypothesis;
`IsAutomorphicRepresentation`, `archimedeanHeckeAlgebra`, `RestrictedTensor`,
`DiscreteOccurrence`, Whittaker coefficients and `HolomorphicSL2Form`.
The scalar character foundations `standardAddChar`, local and adelic self-duality and the
diagonal self-annihilator theorem are supplied by ArithmeticGaloisRepresentations §2.7.
Section 4.3 constructs `addChar_equiv` from that annihilator and then compact-quotient Fourier
expansion. The `qExpansion` of `HolomorphicSL2Form` includes zero and the totally positive
elements of the cusp-dependent dual fractional ideal; cuspidality kills the zero coefficient
at every cusp. Fixed finite-support Schwartz stages are topological vector spaces; convolution
maps supports `C₁, C₂` into `C₁ C₂`, and the union is an algebra;
the shared §4.5 `MaassCuspForm` and its `NormalizedMaassEigenform` subtype, with
`fourierCoefficient`, `fourierExpansion`, `maassHecke`, `maassHeckeRecurrence`,
`maassAdelization` and `maassClassicalEquiv`. The subtype has first coefficient one
in the factor-two expansion, reflection sign `(-1)^δ` and either the real or the
imaginary spectral-parameter branch; the L-function consumer takes its real branch.
The adelic comparisons use the ALS.F.6 cusp carrier and preserve these normalizations;
`IsCAlgebraic`, `IsLAlgebraic`, `IsAlgebraicCT`, `HasCohomologyWith`,
`HasConnectedCohomologyWith` for a tensor with trivial split-central Lie action, the general
`ell0` and `q0`, `A_q`, `StableAdelicLattice`, `galoisTwist`, `rationalityField`,
`IsFieldOfDefinition` and `galoisConjugate_cuspidal`. Section 5.7 owns these scalar-twist and
rationality interfaces and Clozel finiteness for regular algebraic cuspidal GLₙ over any number
field in cohomological normalization. The conjugation theorem provides nonzero connected-pair
cohomology with the conjugated algebraic coefficient and retains the component action;
full-`K` nonvanishing requires nonzero component invariants. The tempered real GLₙ
classification in §5.5 assumes `IsCohomologicalWeightZeroGL` of the infinitesimal parameter;
its odd-rank alternatives are connected-pair cohomological. `fieldOfRationality` in the CM/totally real consumer
abbreviates `rationalityField` on the same finite-part representation; `HermitianGroupDatum`,
`coherentCochains`, `coherentCohomology`,
`CuspidalCoherentCohomology`, `DiscreteCoherentCohomology`, the GSp₄ character lattices
and chambers, component induction and extensions, `coherentChambers` and scalar
holomorphic series; `adelize`, the common-carrier specialization `LevelAlgebraicModularForm`,
its central submodule `CentralCharacterAlgebraicModularForm`, `inverseActionHeckeEquiv`,
and `automorphicEquiv` with the coefficient-Hom multiplicities `occurrenceMultiplicity`.
The invariants operators `invariantsHecke` and `invariantsHeckeOpposite` distinguish the
ordinary left action from its inverse-coset opposite action. `IsCosetSystem` and
`cosetSystem_volume` identify finite-coset counts with Haar volumes. Section 5.8 specifies
`AnemicHeckePresentation`, `AnemicEigenSystem`, `anemicRealization`, `eigenIdeal`,
`AgreesAwayFromFinite` and `galoisAnemicEigenSystem`, including the relation-kernel condition
for passage to the acting image and the comparison with `TorsionEigenSystem`.
Section 7.2 specifies `IsAdelicLift`, `adelize_isAdelicLift` and `IsAdelicLift.unique` on the
adelic function carrier; §7.3 specifies `arithmeticHeckeSystem` and `unitaryHeckeSystem`.
Their constructions and comparisons, including
van Est, `recGL`, Flath factorization and the GL₂ dictionary, are specified in the README.
-/
end

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
