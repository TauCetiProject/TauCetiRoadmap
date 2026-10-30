import Mathlib
import TauCeti.Geometry.Manifold.DerivationBundle

/-!
# Pseudodifferential operators and elliptic analysis on bundles: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that are statable there: the scalar
cotangent, real derivation and complexified derivation dictionaries of P1.0, the inverse principal symbol of an elliptic
classical symbol (P2/P6), Borel asymptotic summation (P2), and Euclidean quantization
on Schwartz input with its Sobolev mapping theorem for compactly x-supported symbols and the uniform order-zero
Calderón–Vaillancourt theorem (P3/P5).
Local symbols use smooth continuous-linear coefficients and all mixed derivative bounds;
quantization uses Mathlib's Fourier transform with the angular-frequency symbol evaluated
at ξ = 2πζ.

Not statable at the pins, for lack of a carrier:
* jet bundles, differential operators between bundles and their principal symbols (P1.0),
  the Bochner decomposition and Peetre's theorem (P1): there is no bundle
  differential-operator or bundle distribution carrier;
* the manifold Schwartz kernel theorem (P3): the bundle test-section and
  bundle distribution carriers, including their density-valued duals, are missing;
* the complex/real interpolation identifications and bundle Besov/Zygmund
  mapping theorems (P5): the compatible-couple interpolation, bundle Besov and
  bundle Zygmund carriers are missing;
* the global pseudodifferential classes, parametrices, bundle Sobolev Fredholm theory and
  elliptic regularity (P4–P6): there is no compact-bundle Sobolev scale `H^s(M;E)`;
* elliptic powers, the equivariant product index, elliptic-complex Hodge theory and
  finite-deck isospectrality
  (P7, P7a): these need the bundle Sobolev scale and the self-adjoint realizations of
  Laplace-type operators on it;
* wave front sets, distribution pullback and pushforward (P8): there is no distribution
  carrier on manifolds.
-/

noncomputable section

namespace TauCetiRoadmap.PseudodifferentialOperators

open scoped ContDiff FourierTransform SchwartzMap RealInnerProductSpace
open MeasureTheory

/-! ## Layer 1: Differential operators, jets and symbols -/

section ScalarDifferentialCore

open scoped Manifold Derivation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [SecondCountableTopology M]

/-- The ordinary global vanishing ideal, using the existing smooth-function algebra. -/
def smoothVanishingIdeal (x : M) : Ideal C^∞⟮I, M; ℝ⟯ :=
  RingHom.ker (ContMDiffMap.evalRingHom x)

/-- The square is an algebraic ideal product, so membership uses finite sums. -/
theorem mem_smoothVanishingIdeal_sq_iff
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
    (x : M) (f : C^∞⟮I, M; ℝ⟯) :
    f ∈ smoothVanishingIdeal x ^ 2 ↔
      f x = 0 ∧ mfderiv I 𝓘(ℝ, ℝ) f x = 0 := by
  sorry

section RealVectorFields

variable [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]

/-- The algebraic cotangent space `I_x/I_x²` of the vanishing ideal is the cotangent space
`T_x*M`, the class of `f ∈ I_x` going to its differential `df_x`. -/
theorem exists_smoothCotangentEquiv (x : M) :
    ∃ e : (smoothVanishingIdeal (I := I) x).Cotangent ≃ₗ[ℝ] (TangentSpace I x →L[ℝ] ℝ),
      ∀ f : smoothVanishingIdeal (I := I) x,
        e ((smoothVanishingIdeal (I := I) x).toCotangent f) =
          mvfderiv I (f : C^∞⟮I, M; ℝ⟯) x := by
  sorry

/-- The pointwise field uses the native tangent/point-derivation equivalence. -/
def derivationVectorField
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) : TangentSpace I x :=
  pointDerivationEquivTangentSpace x BoundarylessManifold.isInteriorPoint
    (Derivation.evalAt x D)

/-- The pointwise field of an arbitrary algebraic derivation is a smooth section of the
tangent bundle. -/
theorem contMDiff_derivationVectorField
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) :
    ContMDiff I I.tangent ∞
      (fun x ↦ (⟨x, derivationVectorField D x⟩ : TangentBundle I M)) := by
  sorry

end RealVectorFields

/-- Every algebraic derivation of `C∞(M, ℝ)`, with no continuity assumed, is a smooth vector
field: the derivations correspond linearly and bijectively to smooth sections of the tangent
bundle, the section at `x` being the point derivation `f ↦ (D f)(x)`. -/
theorem exists_derivationEquivSmoothVectorField
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M] :
    ∃ e : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯ ≃ₗ[ℝ]
        ContMDiffSection I E ∞ (fun x : M ↦ TangentSpace I x),
      ∀ D x, e D x = derivationVectorField D x := by
  sorry

/-- Complex addition and multiplication are smooth for the real manifold structure of `ℂ`,
so complex-valued smooth functions on a real manifold form a commutative ring. -/
instance realComplexContMDiffRing : ContMDiffRing 𝓘(ℝ, ℂ) ∞ ℂ :=
  { instNormedSpaceLieAddGroup with
    contMDiff_mul := by
      rw [contMDiff_iff]
      refine ⟨continuous_mul, fun x y ↦ ?_⟩
      simp only [mfld_simps]
      rw [contDiffOn_univ]
      exact contDiff_mul }

/-- Constant complex functions, as a ring map into the complex smooth functions `A_ℂ`. -/
def complexSmoothConstants : ℂ →+* C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯ where
  toFun z := ContMDiffMap.const z
  map_zero' := by ext x; rfl
  map_one' := by ext x; rfl
  map_add' z w := by ext x; rfl
  map_mul' z w := by ext x; rfl

/-- The `ℂ`-algebra structure of `A_ℂ` given by constant complex functions. -/
instance complexSmoothFunctionsAlgebra : Algebra ℂ C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯ :=
  (complexSmoothConstants (I := I) (M := M)).toAlgebra

/-- A real smooth function viewed as a complex smooth function. -/
def ofRealSmooth (f : C^∞⟮I, M; ℝ⟯) : C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯ :=
  ⟨fun x ↦ (f x : ℂ), Complex.ofRealCLM.contDiff.contMDiff.comp f.contMDiff⟩

open scoped TensorProduct in
/-- The complexified derivation dictionary: complex-linear derivations of `A_ℂ` correspond
complex-linearly and bijectively to `ℂ ⊗[ℝ] Γ∞(TM)`, the derivation `δ` going to `1 ⊗ X + i ⊗ Y`
exactly when `δ u = X u + i (Y u)` for every real smooth `u`; equivalently
`δ (u + i v) = X u − Y v + i (Y u + X v)`. -/
theorem exists_complexDerivationEquivComplexifiedVectorField
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M] :
    ∃ e : Derivation ℂ C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯ C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯ ≃ₗ[ℂ]
        ℂ ⊗[ℝ] ContMDiffSection I E ∞ (fun x : M ↦ TangentSpace I x),
      ∀ δ X Y, e δ = (1 : ℂ) ⊗ₜ[ℝ] X + Complex.I ⊗ₜ[ℝ] Y ↔
        ∀ (u : C^∞⟮I, M; ℝ⟯) (x : M), δ (ofRealSmooth u) x =
          (mvfderiv I (u : C^∞⟮I, M; ℝ⟯) x (X x) : ℂ) +
            (mvfderiv I (u : C^∞⟮I, M; ℝ⟯) x (Y x) : ℂ) * Complex.I := by
  sorry

end ScalarDifferentialCore

/-! ## Layer 2: Symbols and asymptotic expansions -/

/-- The Euclidean coordinate space `ℝⁿ` of a chart. -/
abbrev CoordinateSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- An iterated coordinate derivative; smoothness later makes permutations equivalent. -/
def coordinateDeriv {n : ℕ} {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]
    (indices : List (Fin n)) (f : CoordinateSpace n → A) : CoordinateSpace n → A :=
  match indices with
  | [] => f
  | j :: js => fun x => fderiv ℝ (coordinateDeriv js f) x (PiLp.single 2 j 1)

/-- First differentiate in frequency, then in the spatial variables. -/
def mixedDeriv {n : ℕ} {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]
    (α β : List (Fin n)) (a : CoordinateSpace n × CoordinateSpace n → A)
    (x ξ : CoordinateSpace n) : A :=
  coordinateDeriv α (fun y => coordinateDeriv β (fun η => a (y, η)) ξ) x

variable {n : ℕ} {V W : Type*}
  [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]
  [NormedAddCommGroup W] [NormedSpace ℂ W] [CompleteSpace W]

/-- Local S^m_(1,0), with a bound on every compact spatial set. -/
structure Symbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V] [NormedSpace ℂ V]
    [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  coefficient : CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W
  smooth : ContDiff ℝ ∞ coefficient
  derivative_bound : ∀ (K : Set (CoordinateSpace n)), IsCompact K →
    ∀ (α β : List (Fin n)), ∃ C : ℝ, 0 ≤ C ∧
      ∀ x ∈ K, ∀ ξ,
        ‖mixedDeriv α β coefficient x ξ‖ ≤
          C * (1 + ‖ξ‖ ^ 2) ^ ((m - (β.length : ℝ)) / 2)

/-- Uniform bounds in x are extra data, not consequences of local symbol estimates. -/
def Symbol.IsUniform {m : ℝ} (a : Symbol n V W m) : Prop :=
  ∀ (α β : List (Fin n)), ∃ C : ℝ, 0 ≤ C ∧
    ∀ x ξ, ‖mixedDeriv α β a.coefficient x ξ‖ ≤
      C * (1 + ‖ξ‖ ^ 2) ^ ((m - (β.length : ℝ)) / 2)

/-- Compact spatial support for local weighted Schur estimates. -/
def Symbol.HasCompactSpatialSupport {m : ℝ} (a : Symbol n V W m) : Prop :=
  ∃ K : Set (CoordinateSpace n), IsCompact K ∧
    ∀ x ∉ K, ∀ ξ, a.coefficient (x, ξ) = 0

/-- A homogeneous principal term is smooth away from the zero covector. -/
structure HomogeneousSymbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V]
    [NormedSpace ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  coefficient : CoordinateSpace n × CoordinateSpace n → V →L[ℂ] W
  zero_covector : ∀ x, coefficient (x, 0) = 0
  smooth_away_zero : ContDiffOn ℝ ∞ coefficient {p | p.2 ≠ 0}
  homogeneous : ∀ x ξ, ξ ≠ 0 → ∀ t : ℝ, 0 < t →
    coefficient (x, t • ξ) = (t ^ m) • coefficient (x, ξ)

/-- Cutoff data used in a one-step classical expansion. -/
structure FrequencyCutoff (n : ℕ) where
  toFun : CoordinateSpace n → ℝ
  smooth : ContDiff ℝ ∞ toFun
  zero_near_origin : ∀ ξ, ‖ξ‖ ≤ 1 → toFun ξ = 0
  one_at_infinity : ∀ ξ, 2 ≤ ‖ξ‖ → toFun ξ = 1
  bounds : ∀ ξ, 0 ≤ toFun ξ ∧ toFun ξ ≤ 1

/-- Classical symbols have explicit homogeneous terms and actual symbol remainders. -/
structure ClassicalSymbol (n : ℕ) (V W : Type*) [NormedAddCommGroup V]
    [NormedSpace ℂ V] [NormedAddCommGroup W] [NormedSpace ℂ W] (m : ℝ) where
  symbol : Symbol n V W m
  cutoff : FrequencyCutoff n
  terms : (j : ℕ) → HomogeneousSymbol n V W (m - (j : ℝ))
  remainder : (N : ℕ) → Symbol n V W (m - (N : ℝ))
  remainder_eq : ∀ (N : ℕ) x ξ,
    (remainder N).coefficient (x, ξ) = symbol.coefficient (x, ξ) -
      ∑ j ∈ Finset.range N, cutoff.toFun ξ • (terms j).coefficient (x, ξ)

/-- Borel summation for local symbols: a decreasing sequence of orders tending to minus
infinity admits a symbol whose remainder after the first `N` terms has order `orders N`. -/
theorem exists_asymptoticSum
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (orders : ℕ → ℝ) (hmono : Antitone orders)
    (hlim : Filter.Tendsto orders Filter.atTop Filter.atBot)
    (a : (j : ℕ) → Symbol n V W (orders j)) :
    ∃ b : Symbol n V W (orders 0), ∀ N : ℕ,
      ∃ r : Symbol n V W (orders N), ∀ x ξ,
        b.coefficient (x, ξ) - ∑ j ∈ Finset.range N, (a j).coefficient (x, ξ) =
          r.coefficient (x, ξ) := by
  sorry

/-! ## Layer 3: Oscillatory kernels and local quantization -/

/-- Actual single integral; integrability is a separate theorem, not built into notation. -/
def quantizeSchwartzValue {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) : W :=
  ∫ ζ : CoordinateSpace n,
    Complex.exp (((2 * Real.pi * inner ℝ x ζ : ℝ) : ℂ) * Complex.I) •
      a.coefficient (x, (2 * Real.pi) • ζ) ((𝓕 u) ζ)

/-! ## Layer 5: Sobolev, Lp and Hölder mapping estimates -/

/-- Native all-real-order carrier, without a private completion. -/
def schwartzToSobolev (s : ℝ) (u : SchwartzMap (CoordinateSpace n) V) :
    BesselPotentialSpace (CoordinateSpace n) V s 2 :=
  (u.memSobolev (s := s) (p := 2)).toBesselPotentialSpace

/-- Sobolev mapping for compactly x-supported symbols: the quantization of a symbol of order
`m` extends from Schwartz input to a bounded map `H^s → H^(s-m)` for every real `s`, the
extension acting on Schwartz functions as the quantization integral. -/
theorem exists_quantizeSobolev {m : ℝ} (a : Symbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (ha : a.HasCompactSpatialSupport) (s : ℝ) :
    ∃ T : BesselPotentialSpace (CoordinateSpace n) V s 2 →L[ℂ]
        BesselPotentialSpace (CoordinateSpace n) W (s - m) 2,
      ∀ (u : SchwartzMap (CoordinateSpace n) V) (φ : SchwartzMap (CoordinateSpace n) ℂ),
        (T (schwartzToSobolev s u)).toDistr φ = ∫ x, φ x • quantizeSchwartzValue a u x := by
  sorry

/-- Calderón–Vaillancourt: an order-zero symbol with derivative bounds uniform in `x` on all
of `ℝⁿ` quantizes to a bounded operator on `L² = H^0`, with no compact-support hypothesis. -/
theorem exists_quantizeUniformOrderZero (a : Symbol n V W 0)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsUniform) :
    ∃ T : BesselPotentialSpace (CoordinateSpace n) V 0 2 →L[ℂ]
        BesselPotentialSpace (CoordinateSpace n) W 0 2,
      ∀ (u : SchwartzMap (CoordinateSpace n) V) (φ : SchwartzMap (CoordinateSpace n) ℂ),
        (T (schwartzToSobolev 0 u)).toDistr φ = ∫ x, φ x • quantizeSchwartzValue a u x := by
  sorry

/-! ## Layer 6: Ellipticity, parametrices and Fredholm theory -/

/-- A substantive condition on the actual principal term. -/
def ClassicalSymbol.IsElliptic {m : ℝ} (a : ClassicalSymbol n V W m) : Prop :=
  ∀ x ξ, ξ ≠ 0 → Function.Bijective ((a.terms 0).coefficient (x, ξ))

/-- The pointwise inverse of the principal term of an elliptic classical symbol is itself a
smooth homogeneous symbol of order `-m`, two-sided inverse at every nonzero covector. -/
theorem exists_inversePrincipalSymbol {m : ℝ} (a : ClassicalSymbol n V W m)
    [FiniteDimensional ℂ V] [FiniteDimensional ℂ W] (ha : a.IsElliptic) :
    ∃ b : HomogeneousSymbol n W V (-m), ∀ (x ξ : CoordinateSpace n), ξ ≠ 0 →
      ((b.coefficient (x, ξ)).comp ((a.terms 0).coefficient (x, ξ)) =
          ContinuousLinearMap.id ℂ V ∧
        ((a.terms 0).coefficient (x, ξ)).comp (b.coefficient (x, ξ)) =
          ContinuousLinearMap.id ℂ W) := by
  sorry

end TauCetiRoadmap.PseudodifferentialOperators
