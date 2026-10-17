import Mathlib
import TauCeti.NumberTheory.HeckeRing.GL2.Degree

/-!
# Automorphic forms on reductive groups: representative target signatures

The mathematical roadmap is `README.md`. This file records suggested forms for the light definitions and the
statements that can already be made against the pinned Mathlib and Tau Ceti APIs. It is not an
exhaustive list of the targets of any layer: the adelic function spaces, the real representation
theory, the global Hecke module, the coherent cohomology and the algebraic-modular-form carriers
are specified in the README, and the automorphic-form carrier, constant terms and cusp forms are
those of `ArithmeticLocallySymmetricSpaces` ALS.F.6.

Design choices.
* Growth is measured against an arbitrary real-valued height with a real exponent; the
  arithmetic specialization uses heights `≥ 1` with polynomial translation and inversion bounds.
* Right translation is `R(y) f (g) = f (g * y)`, so `R(y * z) = R(y) ∘ R(z)`, and a right level
  `J` becomes `y J y⁻¹` after translation by `y`.
* Rational invariance, level and central-character conditions are predicates on functions on an
  abstract group; the arithmetic specialization supplies `G(F) ⊆ G(𝔸)` and the central subgroup.
* Compact-finiteness is finite dimensionality of the linear span of an orbit, with no topology.
* Cuspidality is the kernel condition for a family of linear constant-term maps; the arithmetic
  specialization indexes it by all proper rational parabolics.
* Infinitesimal characters of `GLₙ(ℝ)` are `n`-tuples of complex numbers: L-algebraic means
  integral entries, C-algebraic means entries in `(n - 1)/2 + ℤ`.
* Local coefficient lattices use `Submodule.IsLattice`; characteristic-zero integral models
  are supplied by EtaleCohomologyFoundations F.4.0.
* GSp₄ coherent weights use the four positive `C₂` coroot evaluations `(x - y, x, x + y, y)`.
  Their full parameters have infinitesimal central weight opposite to the coefficient.
* Algebraic modular forms use Gross's rational covariance `F(γ g) = ρ(γ) F(g)`, `F(g u) = F(g)`.
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

/-- Polynomially comparable heights give the same growth space. -/
theorem moderateGrowth_iff_of_comparable (h h' : X → ℝ)
    (h1 : ∀ x, 1 ≤ h x) (h1' : ∀ x, 1 ≤ h' x)
    (hcomp : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h x ≤ C * h' x ^ M)
    (hcomp' : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h' x ≤ C * h x ^ M)
    (f : X → ℂ) : HasModerateGrowth h f ↔ HasModerateGrowth h' f := sorry

/-- Right translation preserves moderate growth for a submultiplicative height. -/
theorem moderateGrowth_rightTranslate {G : Type*} [Group G]
    (height : G → ℝ) (h1 : ∀ x, 1 ≤ height x)
    (hmul : ∀ x y, height (x * y) ≤ height x * height y)
    {f : G → ℂ} (hf : HasModerateGrowth height f) (y : G) :
    HasModerateGrowth height (fun x => f (x * y)) := sorry

/-- Constants have moderate growth with exponent zero. -/
example (height : X → ℝ) (c : ℂ) : HasModerateGrowth height (fun _ => c) :=
  ⟨‖c‖, 0, norm_nonneg _, le_rfl, fun x => by simp⟩

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
example : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

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

/-- In `S₃` the two conjugation directions give different translated levels.
Here `f(g) = g(2)`, `J` fixes `2`, `y = (0 1 2)` and `j = (0 1)`. -/
example :
    let y : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2
    let j : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let f : Equiv.Perm (Fin 3) → ℂ := fun g => ((g 2).val : ℂ)
    rightTranslate y f (y * j * y⁻¹) = rightTranslate y f 1 ∧
      rightTranslate y f (y⁻¹ * j * y) ≠ rightTranslate y f 1 := by
  norm_num [rightTranslate, Equiv.Perm.mul_apply, Equiv.swap_apply_def, Fin.ext_iff]

/-- A constant function is rationally invariant. -/
example (Γ : Subgroup G) (c : ℂ) : IsLeftInvariant Γ (fun _ => c) := fun _ _ _ => rfl

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

/-- The identity parameter acts identically. -/
example (f : G → ℂ) : rightTranslate 1 f = f := by
  funext g
  simp [rightTranslate]

/-- Evaluation specifies the action, beyond its composition law. -/
example (y g : G) (f : G → ℂ) : rightTranslate y f g = f (g * y) := rfl

end Equivariance

/-! ## Layer 2: real reductive representations and globalizations -/

section CompactOrbits

variable {K V : Type*} [Group K] [AddCommGroup V] [Module ℂ V]

/-- A vector is `K`-finite when the linear span of its orbit is finite-dimensional.
Smoothness and differentiated covariance belong to the compatible-module contract. -/
def IsKFinite (ρ : Representation ℂ K V) (v : V) : Prop :=
  Module.Finite ℂ (Submodule.span ℂ {w : V | ∃ k : K, ρ k v = w})

/-- Every vector of a finite-dimensional representation is `K`-finite. -/
theorem kFinite_of_finiteDimensional [FiniteDimensional ℂ V]
    (ρ : Representation ℂ K V) (v : V) : IsKFinite ρ v := sorry

/-- The zero vector is `K`-finite without a finite-dimensional ambient space. -/
example (ρ : Representation ℂ K V) : IsKFinite ρ 0 := sorry

/-- In a trivial representation every orbit spans at most a line. -/
example (v : V) : IsKFinite (1 : Representation ℂ K V) v := sorry

/-- For a trivial acting group every representation has one-point orbits. -/
example [Subsingleton K] (ρ : Representation ℂ K V) (v : V) : IsKFinite ρ v := sorry

/-- An infinite cyclic regular orbit spans infinitely many independent point masses. -/
example : ¬IsKFinite (Representation.leftRegular ℂ (Multiplicative ℤ))
    (MonoidAlgebra.single 1 1) := sorry

end CompactOrbits

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

/-- The zero function satisfies every central-character equation. -/
example (Z : Subgroup G) (χ : Z →* ℂˣ) :
    HasCentralCharacter Z χ (fun _ => 0) := fun _ _ => by simp

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

/-- A family of zero maps imposes no condition; the arithmetic family must be complete. -/
example (v : V) : IsCuspidalFor (fun _ : P => (0 : V →ₗ[ℂ] W)) v := fun _ => rfl

end ConstantTerms

/-! ## Layer 5: cohomological parameters and arithmetic coefficients -/

section Algebraicity

/-- An infinitesimal character of `GLₙ(ℝ)`, as an `n`-tuple, is L-algebraic when every entry
is an integer. -/
def IsLAlgebraicGL {n : ℕ} (μ : Fin n → ℂ) : Prop := ∀ i, ∃ m : ℤ, μ i = m

/-- It is C-algebraic when every entry lies in `(n - 1)/2 + ℤ`, the class of `ρ`. -/
def IsCAlgebraicGL {n : ℕ} (μ : Fin n → ℂ) : Prop :=
  ∀ i, ∃ m : ℤ, μ i = m + ((n : ℂ) - 1) / 2

/-- C-algebraicity is L-algebraicity after the norm twist `|det|^{(n-1)/2}`. -/
theorem isCAlgebraicGL_iff_twist {n : ℕ} (μ : Fin n → ℂ) :
    IsCAlgebraicGL μ ↔ IsLAlgebraicGL (fun i => μ i + ((n : ℂ) - 1) / 2) := sorry

/-- The trivial representation of `GL₂(ℝ)`, with parameter `(1/2, -1/2)`, is C-algebraic. -/
example : IsCAlgebraicGL ![(1 : ℂ) / 2, -1 / 2] := by
  intro i
  fin_cases i
  · exact ⟨0, by norm_num⟩
  · exact ⟨-1, by norm_num⟩

/-- The trivial representation of `GL₂(ℝ)` is not L-algebraic. -/
example : ¬IsLAlgebraicGL ![(1 : ℂ) / 2, -1 / 2] := by
  intro h
  obtain ⟨m, hm⟩ := h 0
  have h2 : ((1 : ℝ) / 2) = m := by
    have := congrArg Complex.re hm
    simpa using this
  have h3 : (2 * m : ℤ) = 1 := by
    have : (2 : ℝ) * m = 1 := by linarith
    exact_mod_cast this
  omega

/-- The half determinant twist makes the trivial parameter integral: `(1, 0)`. -/
example : IsLAlgebraicGL ![(1 : ℂ), 0] := by
  intro i
  fin_cases i
  · exact ⟨1, by norm_num⟩
  · exact ⟨0, by norm_num⟩

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

/-- Rank one gives the trivial group; rank zero is only the numerical zero extension. -/
example (r₁ r₂ : ℕ) :
    ell0ResPGL r₁ r₂ 0 = 0 ∧ symDimResPGL r₁ r₂ 0 = 0 ∧
      q0ResPGL r₁ r₂ 0 = 0 ∧ ell0ResPGL r₁ r₂ 1 = 0 ∧
      symDimResPGL r₁ r₂ 1 = 0 ∧ q0ResPGL r₁ r₂ 1 = 0 := by
  simp [ell0ResPGL, symDimResPGL, q0ResPGL]

/-- `PGL₂/ℚ` has `(q₀, ℓ₀) = (1, 0)`; over an imaginary quadratic field `(1, 1)`. -/
example : (q0ResPGL 1 0 2, ell0ResPGL 1 0 2) = (1, 0) ∧
    (q0ResPGL 0 1 2, ell0ResPGL 0 1 2) = (1, 1) := by decide

/-- Over an imaginary quadratic field the `PGL₂` symmetric space has dimension three. -/
example : symDimResPGL 0 1 2 = 3 := by decide

/-- `PGL₃/ℚ` has a five-dimensional symmetric space and `(q₀, ℓ₀) = (2, 1)`. -/
example : symDimResPGL 1 0 3 = 5 ∧ (q0ResPGL 1 0 3, ell0ResPGL 1 0 3) = (2, 1) := by decide

end Defect

namespace CoefficientLattices

/-- In rank zero the zero lattice is full and stable, including at `p = 2`. -/
example (p : ℕ) [Fact p.Prime] (J : Subgroup (GL (Fin 0) ℚ_[p])) :
    Submodule.IsLattice ℚ_[p] (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])) ∧
      ∀ g ∈ J, ∀ v ∈ (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])),
        (g : Matrix (Fin 0) (Fin 0) ℚ_[p]).mulVec v ∈
          (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])) := sorry

/-- The zero submodule is not full in positive rank. -/
example (p : ℕ) [Fact p.Prime] :
    ¬Submodule.IsLattice ℚ_[p] (⊥ : Submodule ℤ_[p] (Fin 1 → ℚ_[p])) := sorry

/-- Scaling by `p` gives another stable full lattice. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : Submodule.IsLattice ℚ_[p] L)
    (hstable : ∀ g ∈ J, ∀ v ∈ L,
      (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L) :
    let pL := L.map ((p : ℤ_[p]) • LinearMap.id)
    Submodule.IsLattice ℚ_[p] pL ∧
      ∀ g ∈ J, ∀ v ∈ pL,
        (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ pL := sorry

/-- A full positive-rank lattice is distinct from its `p`-multiple. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 0 < n)
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

/-- A genuine residual scalar eigensystem exists over the field with two elements. -/
example :
    letI : CommRing (ZMod 2) := ZMod.commRing 2
    letI : AddCommGroup (ZMod 2) := (ZMod.commRing 2).toAddCommGroup
    letI : Module (ZMod 2) (ZMod 2) := Semiring.toModule
    Nonempty (TorsionEigenSystem (ZMod 2) (ZMod 2) (ZMod 2)) :=
  ⟨{ sys := RingHom.id _
     c := 1
     ne_zero := by decide
     eigen := fun _ => rfl }⟩

/-- Evaluation at `1` and `-1` gives distinct systems on the same class `4` modulo eight,
with the polynomial action fixed by evaluation at `1`. -/
example :
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

/-- A nonzero central weight tests the balanced tensor and the sign of the dual. -/
example : coherentCoefficient 3 2 0 = (-2, -3, 5) ∧
    harishChandraParameter 3 2 0 = (2, 0, -5) ∧
    dualParameter 3 2 0 = (0, -2, 5) ∧
    (coherentCoefficient 3 2 0).2.2 + (harishChandraParameter 3 2 0).2.2 = 0 := by
  norm_num [coherentCoefficient, harishChandraParameter, dualParameter]

/-- A weight with balanced centre gives zero central coordinates in all three maps. -/
example : coherentCoefficient 4 2 (-3) = (-2, -4, 0) ∧
    harishChandraParameter 4 2 (-3) = (3, 0, 0) ∧
    dualParameter 4 2 (-3) = (0, -3, 0) := by
  norm_num [coherentCoefficient, harishChandraParameter, dualParameter]

/-- A central twist preserves the semisimple parameter and central cancellation. -/
example : coherentCoefficient 3 2 1 = (-2, -3, 7) ∧
    harishChandraParameter 3 2 1 = (2, 0, -7) ∧
    dualParameter 3 2 1 = (0, -2, 7) ∧
    (harishChandraParameter 3 2 1).1 = (harishChandraParameter 3 2 0).1 ∧
    (harishChandraParameter 3 2 1).2.1 = (harishChandraParameter 3 2 0).2.1 ∧
    (coherentCoefficient 3 2 1).2.2 + (harishChandraParameter 3 2 1).2.2 = 0 := by
  norm_num [coherentCoefficient, harishChandraParameter, dualParameter]

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

/-- The weight-gap parameter is the semisimple projection for every central twist. -/
example (k l c_T : ℤ) :
    hcParameter k l = (((harishChandraParameter k l c_T).1 : ℝ),
      ((harishChandraParameter k l c_T).2.1 : ℝ)) := by
  simp [hcParameter, harishChandraParameter]

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

/-- The weight-two wall remains eligible at large `k`: evaluations `11, 11, 11, 0`. -/
example : Separated 5 (hcParameter 12 2).1 (hcParameter 12 2).2 := by
  norm_num [Separated, corootValues, hcParameter, Fin.forall_fin_succ]

/-- The compact wall stays close even when both coordinates are large. -/
example : ¬Separated 5 (hcParameter 12 12).1 (hcParameter 12 12).2 := by
  norm_num [Separated, corootValues, hcParameter, Fin.forall_fin_succ]

/-- A distance equal to the bound does not suffice: the inequality is strict. -/
example : ¬Separated 5 5 0 := by
  norm_num [Separated, corootValues, Fin.forall_fin_succ]

/-- A regular interior weight tests all four root directions. -/
example : corootValues (hcParameter 20 10).1 (hcParameter 20 10).2 = ![11, 19, 27, 8] := by
  norm_num [corootValues, hcParameter]

/-- Long-root coroot evaluations have no factor of two. -/
example : corootValues 3 1 = ![2, 3, 4, 1] := by norm_num [corootValues]

/-- The weight `(1, 2)` has parameter `(0, 0)`, on the compact wall. -/
example : hcParameter 1 2 = (0, 0) := by norm_num [hcParameter]

end CoherentWeights

/-! ## Layer 7: Classical and definite-group dictionaries -/

section AlgebraicForms

variable {A Γ G M : Type*} [CommRing A] [Group Γ] [Group G] [AddCommGroup M] [Module A M]

/-- Gross's rational coefficient convention on supplied rational and finite point groups.
The p-adic level-action convention is a separate README target. -/
def IsAlgebraicModularForm (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) (f : G → M) : Prop :=
  (∀ γ g, f (ι γ * g) = σ γ (f g)) ∧ ∀ g, ∀ u ∈ J, f (g * u) = f g

/-- Values at double-coset representatives determine an equivariant form.
Finiteness of the class set comes from AdelicAlgebraicGroups. -/
theorem algebraicModularForm_ext (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) {I : Type*} (t : I → G)
    (hcover : ∀ g, ∃ (i : I) (γ : Γ) (u : J), g = ι γ * t i * u)
    {f f' : G → M} (hf : IsAlgebraicModularForm ι σ J f)
    (hf' : IsAlgebraicModularForm ι σ J f')
    (ht : ∀ i, f (t i) = f' (t i)) : f = f' := sorry

/-- Zero is always an equivariant form. -/
example (ι : Γ →* G) (σ : Representation A Γ M) (J : Subgroup G) :
    IsAlgebraicModularForm ι σ J (fun _ => 0) :=
  ⟨fun γ g => by simp, fun _ _ _ => rfl⟩

/-- A constant with values in a trivial coefficient is a form at every level. -/
example (ι : Γ →* G) (J : Subgroup G) (m : M) :
    IsAlgebraicModularForm ι (1 : Representation A Γ M) J (fun _ => m) :=
  ⟨fun γ g => by simp, fun _ _ _ => rfl⟩

/-- A constant must satisfy the rational coefficient covariance. -/
example (ι : Γ →* G) (σ : Representation A Γ M) (J : Subgroup G)
    (m : M) (γ : Γ) (hγ : σ γ m ≠ m) :
    ¬IsAlgebraicModularForm ι σ J (fun _ => m) := fun h => hγ (h.1 γ 1).symm

end AlgebraicForms

/-- Over a coefficient ring, unequal central scalars can agree on a nonzero value:
`4 ∈ ℤ/8` is fixed by both `1` and `-1`. -/
example : (4 : ZMod 8) ≠ 0 ∧ (1 : ZMod 8) ≠ -1 ∧ (-1 : ZMod 8) * 4 = 1 * 4 := by decide

/-- The double coset of `diag(1, 2)` has three right cosets, the raw `T₂` scalar on constants. -/
example : (HeckeRing.GLn.diagCoset ![1, 2]).degree = 3 := by
  simpa using HeckeRing.GL2.degree_diagCoset_prime_pow 2 (by decide) 0 1 (by decide)

/-
README definitions requiring additional carriers include `AdelicSmoothFunction`,
`AdelicTestFunction`, `AdelicSchwartzFunction`, `T_sm` and `SmoothAutomorphicForm`;
`relativeKoszulResolution`, `smoothGroupCochains` and `homogeneousPoincareResolution`;
`IsAdmissible`, `IsHarishChandraModule`, `HasInfinitesimalCharacter`, generalized central
characters, normalized induction, `IsTempered`, `IsSquareIntegrable`, their essential
variants, `IrrAdmissible`, `WeilGroupComplex`, `WeilGroupReal`, `IsBoundedParameter`,
`D_k`, `archimedeanUnitaryDual`, `genericUnitaryClassification`, `HasWhittakerModel`,
`GContinuousNorm` and smooth Fréchet globalizations;
`IsAutomorphicRepresentation`, `archimedeanHeckeAlgebra`, `RestrictedTensor`,
`DiscreteOccurrence`, Whittaker coefficients and `HolomorphicSL2Form`;
the shared §4.5 `MaassCuspForm` and its `NormalizedMaassEigenform` subtype, with
`fourierCoefficient`, `fourierExpansion`, `maassHecke`, `maassHeckeRecurrence`,
`maassAdelization` and `maassClassicalEquiv`. The subtype has first coefficient one
in the factor-two expansion, reflection sign `(-1)^δ` and either the real or the
imaginary spectral-parameter branch; the L-function consumer takes its real branch.
The adelic comparisons use the ALS.F.6 cusp carrier and preserve these normalizations;
`IsCAlgebraic`, `IsLAlgebraic`, `IsAlgebraicCT`, `HasCohomologyWith`, the general
`ell0` and `q0`, `A_q`, `StableAdelicLattice`, `galoisTwist`, `rationalityField`,
`IsFieldOfDefinition` and `galoisConjugate_cuspidal`; `HermitianGroupDatum`,
`coherentCochains`, `coherentCohomology`,
`CuspidalCoherentCohomology`, `DiscreteCoherentCohomology`, the GSp₄ character lattices
and chambers, component induction and extensions, `coherentChambers` and scalar
holomorphic series; `adelize`, `LevelAlgebraicModularForm` and
`CentralCharacterAlgebraicModularForm`. Their constructions and comparisons, including
van Est, `recGL`, Flath factorization and the GL₂ dictionary, are specified in the README.
-/
end

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
