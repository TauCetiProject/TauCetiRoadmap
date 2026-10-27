import Mathlib
import TauCeti.Geometry.Manifold.DerivationBundle

/-!
# Pseudodifferential operators and elliptic analysis on bundles: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that are statable there: the scalar
cotangent and derivation dictionaries of P1.0, the inverse principal symbol of an elliptic
classical symbol (P2/P6), the Euclidean quantization on Schwartz input with its Sobolev
mapping theorem for compactly x-supported symbols and the uniform order-zero
Calderón–Vaillancourt theorem (P3/P5), and the ordinary Fredholm path lemma of P7.
Local symbols use smooth continuous-linear coefficients and all mixed derivative bounds;
quantization uses Mathlib's Fourier transform with the angular-frequency symbol evaluated
at ξ = 2πζ.

Not statable at the pins, for lack of a carrier:
* the complexified derivation dictionary `Der_ℂ(A_ℂ) ≃ ℂ ⊗ Γ∞(TM)` of P1.0 with its
  formula `δ(u+iv) = Xu − Yv + i(Yu + Xv)`: there is no real/imaginary-part map on
  `C^∞⟮I, M; 𝓘(ℝ, ℂ), ℂ⟯` and no module structure of complex smooth functions on sections;
* jet bundles, differential operators between bundles and their principal symbols (P1.0),
  Peetre's theorem (P1.1): there is no bundle differential-operator or bundle
  distribution carrier;
* the global pseudodifferential classes, parametrices, bundle Sobolev Fredholm theory and
  elliptic regularity (P4–P6): there is no compact-bundle Sobolev scale `H^s(M;E)`;
* elliptic powers, the equivariant product index and finite-deck isospectrality
  (P7, P7a): these need the bundle Sobolev scale and the self-adjoint realizations of
  Laplace-type operators on it;
* wave front sets, distribution pullback and pushforward (P8): there is no distribution
  carrier on manifolds.
-/

noncomputable section

namespace TauCetiRoadmap.PseudodifferentialOperators

open scoped ContDiff FourierTransform SchwartzMap RealInnerProductSpace
open MeasureTheory

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

omit [SecondCountableTopology M] in
/-- The field of `D` evaluates on `df_x` to `(D f)(x)`. -/
theorem derivationVectorField_apply
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯)
    (f : C^∞⟮I, M; ℝ⟯) (x : M) :
    mvfderiv I f x (derivationVectorField D x) = (D f) x := by
  change tangentToPointDerivation x
    (pointDerivationEquivTangentSpace x BoundarylessManifold.isInteriorPoint
      (Derivation.evalAt x D)) f = (D f) x
  rw [tangentToPointDerivation_pointDerivationEquivTangentSpace]
  rfl

omit [SecondCountableTopology M] in
/-- The pointwise field is linear over smooth functions: `field(fD)(x) = f(x) field(D)(x)`. -/
theorem derivationVectorField_smul (f : C^∞⟮I, M; ℝ⟯)
    (D : Derivation ℝ C^∞⟮I, M; ℝ⟯ C^∞⟮I, M; ℝ⟯) (x : M) :
    derivationVectorField (f • D) x = f x • derivationVectorField D x := by
  unfold derivationVectorField
  have heval : Derivation.evalAt x (f • D) = f x • Derivation.evalAt x D := by
    ext g
    rfl
  rw [heval, map_smul]

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

end ScalarDifferentialCore

/-- The ordinary index is constant on a continuous Fredholm family over a
preconnected parameter space; in particular this applies to a path on [0,1]. -/
theorem fredholmIndex_eq_of_preconnected
    {𝕜 X Y B : Type*} [NontriviallyNormedField 𝕜] [CompleteSpace 𝕜]
    [NormedAddCommGroup X] [NormedAddCommGroup Y]
    [NormedSpace 𝕜 X] [NormedSpace 𝕜 Y] [CompleteSpace X]
    [TopologicalSpace B] [PreconnectedSpace B]
    (T : B → X →L[𝕜] Y) (hT : Continuous T)
    (hFredholm : ∀ b, (T b).IsFredholm) (a b : B) :
    (T a).index = (T b).index := by
  apply TotallyDisconnectedSpace.eq_of_continuous (fun c ↦ (T c).index)
  exact continuous_iff_continuousAt.mpr fun c ↦
    (hFredholm c).index_continuousAt.comp hT.continuousAt

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

/-- Actual single integral; integrability is a separate theorem, not built into notation. -/
def quantizeSchwartzValue {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) : W :=
  ∫ ζ : CoordinateSpace n,
    Complex.exp (((2 * Real.pi * inner ℝ x ζ : ℝ) : ℂ) * Complex.I) •
      a.coefficient (x, (2 * Real.pi) • ζ) ((𝓕 u) ζ)

theorem integrable_quantizeSchwartz {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) (x : CoordinateSpace n) :
    Integrable (fun ζ : CoordinateSpace n =>
      Complex.exp (((2 * Real.pi * inner ℝ x ζ : ℝ) : ℂ) * Complex.I) •
        a.coefficient (x, (2 * Real.pi) • ζ) ((𝓕 u) ζ)) := by
  sorry

theorem contDiff_quantizeSchwartzValue {m : ℝ} (a : Symbol n V W m)
    (u : SchwartzMap (CoordinateSpace n) V) :
    ContDiff ℝ ∞ (quantizeSchwartzValue a u) := by
  sorry

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

end TauCetiRoadmap.PseudodifferentialOperators
