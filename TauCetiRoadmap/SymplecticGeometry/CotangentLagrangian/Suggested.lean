module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Symplectic.Lagrangian.Basic
public import TauCeti.Geometry.Symplectic.Cotangent.Liouville
public import TauCeti.Geometry.Symplectic.SymplecticTransport
public import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace

/-!
# Cotangent bundles and Lagrangian geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only the
simple definitions those statements need. Stated: the canonical symplectic form of `T*M` as
`canonicalForm_exists` (a symplectic `SmoothTwoForm` on `T*M` exists whose expression in every
cotangent chart is `strongDualCotangentSymplecticForm`), the Liouville one-form identities
`liouville_inChart` and `liouville_section`, the Lagrangian embedding predicate, the C2.1
group theorems: `U(n)` is maximal compact in `GL(n, ℂ)`, the realified `U(n)` is maximal compact
in `Sp(2n, ℝ)`, and both ambient groups are connected; and the linear step of C4, the symplectic
Witt-extension lemma `symplectic_subspace_extension` against the pinned `TauCeti.SymplecticForm`.

Not statable at the pins, and therefore absent:

* the identity `ω = −dλ` for the canonical two-form of `T*M`: Tau Ceti has no exterior
  derivative taking a one-form on a manifold to a `SmoothTwoForm`;
* the C3 generating-function symplectomorphisms, the C3.1 chain dictionary and the convex
  billiard map: there is no carrier for a symplectomorphism between open cotangent domains;
* the C4 relative Moser and neighborhood-germ theorems: there is no carrier for a
  symplectomorphism germ along a submanifold or for a symplectic bundle isomorphism over an
  embedding. Only their linear step, `symplectic_subspace_extension`, is stated.
-/
noncomputable section
@[expose] public section
open scoped Manifold ContDiff
open Bundle
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## C1: Intrinsic cotangent phase space -/

/-- The cotangent bundle `T*M` as Mathlib's total space of the bundle of continuous linear
functionals on tangent spaces. -/
abbrev Cotangent (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] := TotalSpace (E →L[ℝ] ℝ) (fun x : M ↦ TangentSpace I x →L[ℝ] ℝ)

/-- The model with corners of `T*M`: the base model times the dual of the base model space. -/
abbrev cotangentModel := I.prod 𝓘(ℝ, E →L[ℝ] ℝ)

example : IsManifold (cotangentModel I) ∞ (Cotangent I M) := inferInstance

/-- The tautological covector evaluated on the derivative of projection. -/
def liouville (z : Cotangent I M) : TangentSpace (cotangentModel I) z →L[ℝ] ℝ :=
  z.2.comp (mfderiv (cotangentModel I) I (fun y : Cotangent I M ↦ y.1) z)

/-- The canonical symplectic form of the cotangent bundle: a smooth two-form on `T*M` exists
which is symplectic (closed and fiberwise nondegenerate) and whose expression in every cotangent
chart is the linear model `strongDualCotangentSymplecticForm`, that is `Σ dqᵢ ∧ dpᵢ` in the
family's `ω = −dλ` convention (Cannas da Silva, §§2.2–2.3). At the chart centre the chart
expression is the form itself (`SmoothTwoForm.inChartAt_extChartAt_self`), so the chart identity
fixes the form. -/
theorem canonicalForm_exists [FiniteDimensional ℝ E] :
    ∃ σ : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M), σ.IsSymplectic ∧
      ∀ (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ)),
        w ∈ (extChartAt (cotangentModel I) z₀).target →
        ∀ v : Fin 2 → (E × (E →L[ℝ] ℝ)),
          σ.inChartAt z₀ w v = TauCeti.strongDualCotangentSymplecticForm (v 0) (v 1) := by
  sorry

/-- Liouville read in cotangent chart coordinates is the existing linear Liouville form. -/
theorem liouville_inChart [I.Boundaryless] [FiniteDimensional ℝ E]
    (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ))
    (hw : w ∈ (extChartAt (cotangentModel I) z₀).target)
    (v : E × (E →L[ℝ] ℝ)) :
    liouville I ((extChartAt (cotangentModel I) z₀).symm w)
      (mfderiv 𝓘(ℝ, E × (E →L[ℝ] ℝ)) (cotangentModel I)
        (extChartAt (cotangentModel I) z₀).symm w v) =
      TauCeti.cotangentLiouvilleForm w (fun _ : Fin 1 ↦ v) := by
  sorry

variable {I}

/-- Adapter to the degree-one `SmoothForm`/`ContMDiffSection` carrier; the equivalence
is a C1 target, not a second one-form library. -/
def IsSmoothOneForm (α : (x : M) → TangentSpace I x →L[ℝ] ℝ) : Prop :=
  ContMDiff I (cotangentModel I) ∞
    (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M))

/-- Pulling tautological Liouville back along a smooth section recovers its covector. -/
theorem liouville_section (α : (x : M) → TangentSpace I x →L[ℝ] ℝ)
    (hα : IsSmoothOneForm α) (x : M) (v : TangentSpace I x) :
    liouville I (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x))
      (mfderiv I (cotangentModel I)
        (fun x ↦ (TotalSpace.mk' (E →L[ℝ] ℝ) x (α x) : Cotangent I M)) x v) = α x v := by
  sorry

/-! ## C2: Embedded Lagrangians -/

/-- Embedded Lagrangians reuse the pinned embedding and tangent-range APIs: the image of each
tangent space is a Lagrangian subspace for the symplectic form at that point. -/
def IsLagrangianEmbedding {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    [TopologicalSpace K] (J : ModelWithCorners ℝ F K)
    [TopologicalSpace Q] [ChartedSpace K Q]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsNondegenerate)
    (i : TauCeti.SmoothEmbedding J I ∞ Q M) : Prop :=
  ∀ q, (hσ.symplecticFormAt (i q)).IsLagrangian (i.tangentRange q (by simp))

/-! ## C2.1: Compact intersections and group applications -/

/-- Realification of a complex `n × n` matrix, `X + iY ↦ [[X, −Y], [Y, X]]` on the real index
`Fin n ⊕ Fin n`: the matrix of multiplication by `X + iY` on `ℂⁿ = ℝⁿ ⊕ iℝⁿ` in the C2.1
coordinates `(x, y) ↔ x + iy`, so that multiplication by `i` is `Matrix.J`. -/
def realify {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ :=
  Matrix.fromBlocks (A.map Complex.re) (-(A.map Complex.im)) (A.map Complex.im) (A.map Complex.re)

/-- `U(n)` is a maximal compact subgroup of `GL(n, ℂ)`: the image of `Matrix.unitaryGroup` under
`Unitary.toUnits` is compact in the units of the matrix algebra, and every compact subgroup
containing it equals it (C2.1, by the growth of `Re tr(Pᵏ)` on a positive polar factor `P ≠ 1`). -/
theorem unitaryGroup_maximal_compact (n : ℕ) :
    Maximal (fun K : Subgroup (Matrix (Fin n) (Fin n) ℂ)ˣ ↦
        IsCompact (K : Set (Matrix (Fin n) (Fin n) ℂ)ˣ))
      (Unitary.toUnits (R := Matrix (Fin n) (Fin n) ℂ)).range := by
  sorry

/-- The realified `U(n)`, identified in C2.1 with `Sp(2n, ℝ) ∩ O(2n)`, is a maximal compact
subgroup of `Sp(2n, ℝ)`: a compact subgroup `K` of the real units whose matrices are symplectic
and which contains `realify U` for every unitary `U` consists of such matrices (C2.1, by the
symplectic polar decomposition and trace growth). -/
theorem realifiedUnitary_maximal_compact_symplectic (n : ℕ)
    (K : Subgroup (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ)
    (hKsp : ∀ A ∈ K,
      (A : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ) ∈ Matrix.symplecticGroup (Fin n) ℝ)
    (hK : IsCompact (K : Set (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)ˣ))
    (hU : ∀ U ∈ Matrix.unitaryGroup (Fin n) ℂ,
      ∃ A ∈ K, (A : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ) = realify U) :
    ∀ A ∈ K, ∃ U ∈ Matrix.unitaryGroup (Fin n) ℂ,
      (A : Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ) = realify U := by
  sorry

/-- `GL(n, ℂ)`, the units of the complex matrix algebra with the units topology, is connected
(C2.1: a path `t ↦ exp(itH)` in `U(n)` to the unitary polar factor, then the positive path `Pᵗ`). -/
theorem generalLinearGroup_connectedSpace (n : ℕ) :
    ConnectedSpace (Matrix (Fin n) (Fin n) ℂ)ˣ := by
  sorry

/-- `Sp(2n, ℝ)` is connected as a subset of the real matrix space (C2.1: the polar factors of a
symplectic matrix are symplectic, so the same two paths run inside `Sp(2n, ℝ)`). -/
theorem symplecticGroup_isConnected (n : ℕ) :
    IsConnected
      (Matrix.symplecticGroup (Fin n) ℝ : Set (Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ)) := by
  sorry

/-! ## C4: Relative symplectic germs, the linear step -/

/-- Symplectic Witt extension for arbitrary subspaces, including degenerate ones (C4): a linear
isomorphism `f` between subspaces `S ⊆ V` and `T ⊆ W` of symplectic vector spaces of equal finite
dimension which carries the restriction of `ω₀` to `S` to the restriction of `ω₁` to `T` extends
to a linear symplectomorphism `e : V ≃ W` agreeing with `f` on `S`. The restrictions of the forms
to `S` and `T` may be degenerate; the equal-dimension hypothesis is needed (no linear equivalence
exists otherwise) and the form hypothesis on `f` is needed (`f = 2·id` on a symplectic plane
`S = V` has no symplectic extension). -/
theorem symplectic_subspace_extension {V W : Type*} [AddCommGroup V] [Module ℝ V]
    [AddCommGroup W] [Module ℝ W] [FiniteDimensional ℝ V] [FiniteDimensional ℝ W]
    (ω₀ : TauCeti.SymplecticForm V) (ω₁ : TauCeti.SymplecticForm W)
    (hdim : Module.finrank ℝ V = Module.finrank ℝ W)
    (S : Submodule ℝ V) (T : Submodule ℝ W) (f : S ≃ₗ[ℝ] T)
    (hf : ∀ u v : S, ω₁ (f u) (f v) = ω₀ u v) :
    ∃ e : V ≃ₗ[ℝ] W, TauCeti.SymplecticForm.IsSymplectomorphism ω₀ ω₁ e ∧
      ∀ u : S, e u = f u := by
  sorry

end TauCetiRoadmap.SymplecticGeometry
