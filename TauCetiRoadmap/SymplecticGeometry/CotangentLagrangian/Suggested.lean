module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville
public import TauCeti.Geometry.Symplectic.Cotangent.GeneratingFunction.MixedHessian
public import TauCeti.Geometry.Symplectic.Lagrangian.Embedding.Basic
public import TauCeti.Geometry.Symplectic.Lagrangian.Manifold

/-!
# Cotangent bundles and Lagrangian geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with only the simple definitions those
statements need.

Stated here:

* README §3.0a: the generating-function symplectomorphism between open subsets of two cotangent
  bundles (`exists_diffeomorph_opens_cotangent_of_isInvertible_mixedHessian`);
* README §3.1: the dictionary between critical configurations of a cyclic action and periodic
  states of a chain of generated symplectomorphisms, whose case `N = 1` is the
  fixed-point/critical-point correspondence (`exists_equiv_periodic_of_generating`), and the
  periodic billiard trajectories of a strictly convex table (`exists_billiard_periodic_reflection`);
* README Layer 4: the relative Moser theorem (§4.2, `exists_diffeomorph_opens_of_eq_along`), the
  point-germ relative Darboux theorem (§4.4, `exists_diffeomorph_opens_of_mpullback_eq`), the
  neighborhood theorem with prescribed ambient derivative (§4.5,
  `exists_diffeomorph_opens_mfderiv_eq`), Weinstein's Lagrangian neighborhood theorem (§4.7,
  `exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding`) and the uniqueness of coisotropic
  neighborhoods (§4.8, `exists_diffeomorph_opens_of_isCoisotropicMap`).

A symplectomorphism of open sets is a `Diffeomorph` between `TopologicalSpace.Opens` whose
pullback, by `TauCeti.SmoothForm.mpullback`, of one restricted form is the other. A covector at
`q` is a point of the pinned cotangent bundle, and the partial differentials `d_q S`, `d_Q S` of
a function on a product are Mathlib's `mvfderiv` of its restrictions to the two factors.

The results of the roadmap that the pinned Tau Ceti already proves are named in the README's
supplier contracts and are not restated here.

Not statable at the pins, and therefore absent:

* the README §2.2 Kodaira–Thurston example is compact, symplectic and not Kähler: there is no
  carrier for a Kähler structure on a smooth manifold (the pinned Kähler form
  `TauCeti.AlmostComplexStructure.kahlerForm` is linear);
* the README §3.0 composition of Lagrangian correspondences: there is no manifold structure on a
  transverse fibre product (the pin has only its local equations,
  `PartialDiffeomorph.fiberProductEquation`);
* the README §3.1 twist, area and measure-preservation theorems of the convex billiard map: the
  next-collision map is a construction whose existence, uniqueness and smoothness are themselves
  the first billiard theorem of §3.1, so it is a README target with its intended signature and
  not a carrier at the pins;
* the README §4.6 symplectic neighborhood theorem: there is no carrier for the symplectic normal
  bundle `TQ^ω` of a symplectic submanifold as a smooth subbundle of `i*TM` with its fibre form
  (the pinned smooth distributions, `TauCeti.IsContMDiffDistribution`, are subbundles of a
  tangent bundle, not of a pulled-back one);
* the existence half of the README §4.8 coisotropic embedding theorem: its model is the total
  space of the dual of the kernel distribution of a presymplectic form, which has no manifold
  structure at the pins (a smooth distribution is a smooth vector bundle only through local
  instances depending on its smoothness proof,
  `TauCeti.IsContMDiffDistribution.contMDiffVectorBundle`).

The three abbreviations below name the pinned cotangent bundle, its model with corners and its
canonical symplectic form; HamiltonianReduction R1 states its cotangent momentum theorem against
these names, and the Layer 3 and Layer 4 theorems below use them.
-/
noncomputable section
@[expose] public section
open scoped Manifold ContDiff
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## Layer 1: intrinsic cotangent phase space -/

/-- The cotangent bundle `T*M`: the pinned `TauCeti.CotangentBundle`, Mathlib's total space of
the bundle whose fibre at `x` is the space of continuous linear functionals on
`TangentSpace I x`. -/
abbrev Cotangent (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] := TauCeti.CotangentBundle I M

/-- The model with corners of `T*M`: the base model times the dual of the base model space. -/
abbrev cotangentModel := I.prod 𝓘(ℝ, E →L[ℝ] ℝ)

/-- The canonical symplectic form `ω = −dλ` of `T*M`: the pinned
`TauCeti.CotangentBundle.symplecticForm`, whose expression in every cotangent chart is
`TauCeti.strongDualCotangentSymplecticForm`, that is `Σ dqᵢ ∧ dpᵢ` (Cannas da Silva,
§§2.2–2.3). -/
abbrev canonicalForm : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M) :=
  TauCeti.CotangentBundle.symplecticForm I M

variable {I}
variable {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace K]
  {J : ModelWithCorners ℝ F K} [TopologicalSpace Q] [ChartedSpace K Q] [IsManifold J ∞ Q]

/-! ## Layer 3: correspondences and generating functions -/

open TopologicalSpace in
/-- Generating functions on manifolds (Cannas da Silva, §4.2, pp. 23–24, in coordinates):
a smooth function `S` on an open set `W ⊆ Q × Q'` whose mixed Hessian `d_Q (d_q S)` is invertible
at `x₀ ∈ W` generates a symplectomorphism `φ` between open subsets of `T*Q` and `T*Q'`. Its graph
is the relation `p = d_q S (q, Q)`, `P = −d_Q S (q, Q)` with `(q, Q) ∈ W`, and it is the branch of
that relation through `(q₀, d_q S (x₀)) ↦ (Q₀, −d_Q S (x₀))`. -/
theorem exists_diffeomorph_opens_cotangent_of_isInvertible_mixedHessian
    {F' K' Q' : Type*} [NormedAddCommGroup F'] [NormedSpace ℝ F'] [TopologicalSpace K']
    {J' : ModelWithCorners ℝ F' K'} [TopologicalSpace Q'] [ChartedSpace K' Q']
    [IsManifold J' ∞ Q']
    [FiniteDimensional ℝ F] [J.Boundaryless] [FiniteDimensional ℝ F'] [J'.Boundaryless]
    {S : Q × Q' → ℝ} {W : Set (Q × Q')} (hW : IsOpen W)
    (hS : ContMDiffOn (J.prod J') 𝓘(ℝ) ∞ S W) {x₀ : Q × Q'} (hx₀ : x₀ ∈ W)
    (hH : (TauCeti.mixedHessian J J' S x₀).IsInvertible) :
    ∃ (U : Opens (Cotangent J Q)) (V : Opens (Cotangent J' Q'))
      (φ : U ≃ₘ⟮cotangentModel J, cotangentModel J'⟯ V),
      (∃ h : Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) x₀.1 (mvfderiv J (fun q ↦ S (q, x₀.2)) x₀.1) ∈ U,
        (φ ⟨_, h⟩ : Cotangent J' Q') =
          Bundle.TotalSpace.mk' (F' →L[ℝ] ℝ) x₀.2 (-mvfderiv J' (fun y ↦ S (x₀.1, y)) x₀.2)) ∧
      (∀ z : U, ((z : Cotangent J Q).1, (φ z : Cotangent J' Q').1) ∈ W ∧
        (z : Cotangent J Q).2 =
            mvfderiv J (fun q ↦ S (q, (φ z : Cotangent J' Q').1)) (z : Cotangent J Q).1 ∧
        (φ z : Cotangent J' Q').2 =
            -mvfderiv J' (fun y ↦ S ((z : Cotangent J Q).1, y)) (φ z : Cotangent J' Q').1) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → Cotangent J' Q') contMDiff_subtype_val
            (canonicalForm J')) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → Cotangent J Q) contMDiff_subtype_val
          (canonicalForm J) := by
  sorry

open TopologicalSpace in
/-- Periodic states and critical points of the cyclic action (for `N = 1`, Cannas da Silva,
Prop. 5.1, p. 29): let `S i` be smooth on open sets `W i ⊆ Q × Q`, for `i : ZMod N`, and let the
relation `p = d_q S i (q, Q)`, `P = −d_Q S i (q, Q)` over `W i` be the graph of `φ i`. The cyclic
sequences of states `z i` with `φ i (z i) = z (i + 1)` correspond, by their base points, to the
critical points of `A (q) = Σ_i S i (q i, q (i + 1))` on the configurations whose every edge
`(q i, q (i + 1))` lies in `W i`. -/
theorem exists_equiv_periodic_of_generating {N : ℕ} [NeZero N]
    {S : ZMod N → Q × Q → ℝ} {W : ZMod N → Set (Q × Q)} (hW : ∀ i, IsOpen (W i))
    (hS : ∀ i, ContMDiffOn (J.prod J) 𝓘(ℝ) ∞ (S i) (W i))
    {U V : ZMod N → Opens (Cotangent J Q)}
    (φ : ∀ i, U i ≃ₘ⟮cotangentModel J, cotangentModel J⟯ V i)
    (hφ : ∀ i (z : U i), ((z : Cotangent J Q).1, (φ i z : Cotangent J Q).1) ∈ W i ∧
      (z : Cotangent J Q).2 =
        mvfderiv J (fun q ↦ S i (q, (φ i z : Cotangent J Q).1)) (z : Cotangent J Q).1 ∧
      (φ i z : Cotangent J Q).2 =
        -mvfderiv J (fun y ↦ S i ((z : Cotangent J Q).1, y)) (φ i z : Cotangent J Q).1)
    (hW' : ∀ i, ∀ x ∈ W i, ∃ z : U i,
      (z : Cotangent J Q) = Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) x.1
        (mvfderiv J (fun q ↦ S i (q, x.2)) x.1) ∧ (φ i z : Cotangent J Q).1 = x.2) :
    ∃ e : {z : ZMod N → Cotangent J Q //
          ∀ i, ∃ h : z i ∈ U i, (φ i ⟨z i, h⟩ : Cotangent J Q) = z (i + 1)} ≃
        {q : ZMod N → Q // (∀ i, (q i, q (i + 1)) ∈ W i) ∧
          mvfderiv (ModelWithCorners.pi fun _ : ZMod N ↦ J)
            (fun c : ZMod N → Q ↦ ∑ i, S i (c i, c (i + 1))) q = 0},
      ∀ z i, (e z : ZMod N → Q) i = (z.1 i).1 := by
  sorry

/-- Periodic billiard trajectories in a strictly convex table: let `χ` be a smooth `L`-periodic
unit-speed parametrization of a simple closed plane curve whose tangent lines meet it only at
their points of tangency (the convexity hypothesis of Cannas da Silva, §5.2, p. 30). For every
`N ≥ 2` there are `N` points `χ (s k)`, `k : ZMod N`, with distinct consecutive points,
satisfying the reflection law at each: the incoming and outgoing unit chords have equal
components along the tangent. Such polygons are the inscribed polygons of critical perimeter,
which are the periodic billiard trajectories (Cannas da Silva, §5.2, p. 32); a
perimeter-maximizing inscribed `N`-gon is one. -/
theorem exists_billiard_periodic_reflection {L : ℝ} (hL : 0 < L)
    {χ : ℝ → EuclideanSpace ℝ (Fin 2)}
    (hχ : ContDiff ℝ ∞ χ) (hper : Function.Periodic χ L) (hunit : ∀ s, ‖deriv χ s‖ = 1)
    (hinj : Set.InjOn χ (Set.Ico 0 L))
    (hconv : ∀ s t (c : ℝ), χ t = χ s + c • deriv χ s → χ t = χ s)
    {N : ℕ} (hN : 2 ≤ N) :
    ∃ s : ZMod N → ℝ, (∀ k, χ (s (k + 1)) ≠ χ (s k)) ∧
      ∀ k, inner ℝ (‖χ (s k) - χ (s (k - 1))‖⁻¹ • (χ (s k) - χ (s (k - 1)))) (deriv χ (s k)) =
        inner ℝ (‖χ (s (k + 1)) - χ (s k)‖⁻¹ • (χ (s (k + 1)) - χ (s k))) (deriv χ (s k)) := by
  sorry

/-! ## Layer 4: relative symplectic germs -/

open TopologicalSpace in
/-- Relative Moser theorem (Cannas da Silva, Thm. 7.4, p. 45): two symplectic forms on `M` that
agree on every ambient tangent space along a compact embedded submanifold `i : Q → M` are
related by a diffeomorphism between open neighborhoods of `i(Q)` that fixes `i(Q)` pointwise. -/
theorem exists_diffeomorph_opens_of_eq_along
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    {σ₀ σ₁ : TauCeti.SmoothTwoForm I M} (h₀ : σ₀.IsSymplectic) (h₁ : σ₁.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    (hσ : ∀ q, σ₀.1 (i q) = σ₁.1 (i q)) :
    ∃ (U₀ U₁ : Opens M) (φ : U₀ ≃ₘ⟮I, I⟯ U₁),
      (∀ q, ∃ h : i q ∈ U₀, (φ ⟨i q, h⟩ : M) = i q) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : U₁ → M) contMDiff_subtype_val σ₁) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U₀ → M) contMDiff_subtype_val σ₀ := by
  sorry

open TopologicalSpace Topology in
/-- Point-germ relative Darboux theorem (for `Q` a point: Cannas da Silva, Thm. 8.1, p. 46): two
symplectic forms on `M` with equal pullbacks to an embedded submanifold `i : Q → M`, of
arbitrary and possibly varying rank, are related near each point `i q₀` by a diffeomorphism
between open sets that fixes `i(Q)` near `q₀`. No compactness of `Q` is assumed. -/
theorem exists_diffeomorph_opens_of_mpullback_eq
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ F] [J.Boundaryless]
    {σ₀ σ₁ : TauCeti.SmoothTwoForm I M} (h₀ : σ₀.IsSymplectic) (h₁ : σ₁.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    (hσ : TauCeti.SmoothForm.mpullback i hi.contMDiff σ₀ =
      TauCeti.SmoothForm.mpullback i hi.contMDiff σ₁) (q₀ : Q) :
    ∃ (U₀ U₁ : Opens M) (φ : U₀ ≃ₘ⟮I, I⟯ U₁),
      (∀ᶠ q in 𝓝 q₀, ∃ h : i q ∈ U₀, (φ ⟨i q, h⟩ : M) = i q) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : U₁ → M) contMDiff_subtype_val σ₁) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U₀ → M) contMDiff_subtype_val σ₀ := by
  sorry

open TopologicalSpace in
/-- Neighborhood theorem with prescribed ambient derivative (the Lagrangian case without the
prescription is Cannas da Silva, Thm. 8.4, p. 48): let `i : Q → M` and `j : Q' → N` be smooth
embeddings into symplectic manifolds, `Q` compact, and `f : Q → Q'` a diffeomorphism. A smooth
family of linear isomorphisms `A q : T_(i q) M → T_(j (f q)) N`, symplectic and extending
`df_q` (`A q ∘ di_q = dj_(f q) ∘ df_q`), is the derivative along `Q` of a symplectomorphism
`Φ` between open neighborhoods of `i(Q)` and `j(Q')` with `Φ ∘ i = j ∘ f`. Smoothness of `A` is
smoothness of its expression in tangent coordinates, Mathlib's `inTangentCoordinates`. -/
theorem exists_diffeomorph_opens_mfderiv_eq
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
    {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold I' ∞ N]
    {F' K' Q' : Type*} [NormedAddCommGroup F'] [NormedSpace ℝ F'] [TopologicalSpace K']
    {J' : ModelWithCorners ℝ F' K'} [TopologicalSpace Q'] [ChartedSpace K' Q']
    [IsManifold J' ∞ Q']
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ E'] [I'.Boundaryless] [T2Space N] [SecondCountableTopology N]
    [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    [FiniteDimensional ℝ F'] [J'.Boundaryless]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {τ : TauCeti.SmoothTwoForm I' N} (hτ : τ.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    {j : Q' → N} (hj : Manifold.IsSmoothEmbedding J' I' ∞ j)
    (f : Q ≃ₘ⟮J, J'⟯ Q')
    (A : ∀ q : Q, TangentSpace I (i q) ≃L[ℝ] TangentSpace I' (j (f q)))
    (hA : ∀ q₀ : Q, ContMDiffAt J 𝓘(ℝ, E →L[ℝ] E') ∞
      (inTangentCoordinates I I' i (fun q ↦ j (f q))
        (fun q ↦ ((A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))))) q₀) q₀)
    (hAω : ∀ q, (τ.1 (j (f q))).compContinuousLinearMap
        (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))) = σ.1 (i q))
    (hAi : ∀ q, (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q))) ∘L
        mfderiv J I i q = mfderiv J' I' j (f q) ∘L mfderiv J J' f q) :
    ∃ (U : Opens M) (V : Opens N) (Φ : U ≃ₘ⟮I, I'⟯ V),
      (∀ q, ∃ h : i q ∈ U, (Φ ⟨i q, h⟩ : N) = j (f q) ∧
        mfderiv I I' (fun x : U ↦ (Φ x : N)) ⟨i q, h⟩ =
          (A q : TangentSpace I (i q) →L[ℝ] TangentSpace I' (j (f q)))) ∧
      TauCeti.SmoothForm.mpullback Φ Φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → N) contMDiff_subtype_val τ) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val σ := by
  sorry

open TopologicalSpace in
/-- Weinstein's Lagrangian neighborhood theorem (Cannas da Silva, Thm. 9.3, p. 51): a compact
embedded Lagrangian `i : Q → M` has an open neighborhood symplectomorphic to an open
neighborhood of the zero section of `T*Q` with its canonical form, by a map sending `i q` to the
zero covector at `q`. -/
theorem exists_diffeomorph_opens_cotangent_of_isLagrangianEmbedding
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {i : Q → M} (hi : hσ.isNondegenerate.IsLagrangianEmbedding J i) :
    ∃ (U : Opens M) (V : Opens (Cotangent J Q)) (φ : U ≃ₘ⟮I, cotangentModel J⟯ V),
      (∀ q, ∃ h : i q ∈ U,
        (φ ⟨i q, h⟩ : Cotangent J Q) = Bundle.TotalSpace.mk' (F →L[ℝ] ℝ) q 0) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → Cotangent J Q) contMDiff_subtype_val
            (canonicalForm J)) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val σ := by
  sorry

open TopologicalSpace in
/-- Uniqueness of coisotropic neighborhoods (Cannas da Silva, Thm. 8.6, p. 49, for two forms on
one ambient manifold): two coisotropic embeddings `i : Q → M` and `j : Q → N` of a compact
manifold that induce the same two-form on `Q` have symplectomorphic open neighborhoods, by a
map sending `i q` to `j q`. -/
theorem exists_diffeomorph_opens_of_isCoisotropicMap
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
    {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold I' ∞ N]
    [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [FiniteDimensional ℝ E'] [I'.Boundaryless] [T2Space N] [SecondCountableTopology N]
    [FiniteDimensional ℝ F] [J.Boundaryless] [CompactSpace Q]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {τ : TauCeti.SmoothTwoForm I' N} (hτ : τ.IsSymplectic)
    {i : Q → M} (hi : Manifold.IsSmoothEmbedding J I ∞ i)
    {j : Q → N} (hj : Manifold.IsSmoothEmbedding J I' ∞ j)
    (hci : hσ.isNondegenerate.IsCoisotropicMap J i)
    (hcj : hτ.isNondegenerate.IsCoisotropicMap J j)
    (hστ : TauCeti.SmoothForm.mpullback i hi.contMDiff σ =
      TauCeti.SmoothForm.mpullback j hj.contMDiff τ) :
    ∃ (U : Opens M) (V : Opens N) (φ : U ≃ₘ⟮I, I'⟯ V),
      (∀ q, ∃ h : i q ∈ U, (φ ⟨i q, h⟩ : N) = j q) ∧
      TauCeti.SmoothForm.mpullback φ φ.contMDiff
          (TauCeti.SmoothForm.mpullback (Subtype.val : V → N) contMDiff_subtype_val τ) =
        TauCeti.SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val σ := by
  sorry

end TauCetiRoadmap.SymplecticGeometry
