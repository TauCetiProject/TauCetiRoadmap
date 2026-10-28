import Mathlib
import TauCeti.FieldTheory.FunctionField.ConstantExtension.Algebraic
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus

/-!
# Algebraic curves — function fields, divisors, and Riemann–Roch: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not
already prove, on the pinned carriers `TauCeti.IsFunctionField`, `TauCeti.constantCompositum` and
`TauCeti.genus`.

The headline theorems of Layers 0–7 and 10, and Layer 9's one-dimensionality of Kähler
differentials, are proved at the Tau Ceti pin and are cited by name in the README instead
of being restated here: the trdeg characterization
`TauCeti.isFunctionField_iff_trdeg_eq_one`, the product formula
`TauCeti.Divisor.degree_principal`, Riemann's theorem, the Riemann–Roch theorem
`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor`, Clifford's theorem
`TauCeti.Divisor.two_mul_dim_le_degree_add_two`, the Hurwitz genus formula
`TauCeti.hurwitz_genus_formula`, genus invariance under finite separable constant
extension `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`, the hyperelliptic genus
`TauCeti.genus_eq_of_sq_eq` and the Hurwitz bound
`TauCeti.natCard_le_eighty_four_mul_genus_sub_one`.

Headline theorems that are not statable at the pins, with the missing carrier:

* the residue theorem for Kähler differentials over an arbitrary constant field (Layer 9):
  the pins have no residue of a differential at a place of a function field;
* the smooth-model base change of the canonical regular projective model and its
  projectivity (Layer 12B), and the anti-equivalence between regular projective curves
  over `k` and function fields of one variable over `k` (Layer 12C): the pins have no
  regular projective model attached to a function field and no category of regular
  projective curves over a field.
-/

namespace TauCetiRoadmap.AlgebraicCurves

open scoped IntermediateField TensorProduct

universe u u' v v' w

/-! ## Layer 8: constant-field extensions -/

/-- **Regular function fields stay domains under every constant extension** (Layer 8,
item 2): if `k` is the exact constant field of the function field `F` and `F` has a
separating transcendental element `x` (`F / k(x)` finite separable), then `F / k` is a
regular extension, so `K ⊗[k] F` is an integral domain for every field extension `K / k`.
Both hypotheses are load-bearing: `ℂ ⊗[ℝ] ℂ(x) ≅ ℂ(x) × ℂ(x)` (constants not exact), and for
`k = 𝔽_p(a, b)`, `F = k(x, y)` with `y ^ p = a + b x ^ p` (exact constants, no separating
element) the element `y - a ^ (1/p) - b ^ (1/p) x` of `K ⊗[k] F`, for
`K = k(a ^ (1/p), b ^ (1/p))`, is a nonzero nilpotent. -/
theorem isDomain_tensorProduct_of_isSeparable {k : Type u} {F : Type v} [Field k] [Field F]
    [Algebra k F] (hF : TauCeti.IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
    (hsep : ∃ x : F, Transcendental k x ∧ FiniteDimensional k⟮x⟯ F ∧
      Algebra.IsSeparable k⟮x⟯ F)
    (K : Type w) [Field K] [Algebra k K] :
    IsDomain (K ⊗[k] F) :=
  sorry

/-- **The genus never increases under algebraic constant extension** (Layer 8, the
genus-drop theorem): if `k` is the exact constant field of the function field `F`, `k' / k`
is algebraic and `F'` is the compositum `F · k'`, then `g(F' / k') ≤ g(F / k)`. No
separability of `k' / k` and no exactness of `k'` in `F'` is assumed; when `k'` is not exact
in `F'` the left side is the pin's truncated value `max 0 ([k̃' : k'](g' − 1) + 1)`, which is
at most `[k̃' : k'] g'`, the dimension of `H¹` of the normalized component, so the bound
still holds. Equality for finite separable `k' / k` is
`TauCeti.genus_eq_genus_of_constantCompositum_eq_top`; the inequality is strict for
`y² = x^p − t` over `𝔽_p(t)` with `p` odd and `k' = k(t^(1/p))`, where the genus drops from
`(p − 1)/2` to `0`. -/
theorem genus_le_genus_of_constantCompositum_eq_top {k : Type u} {k' : Type u'} {F : Type v}
    {F' : Type v'} [Field k] [Field k'] [Field F] [Field F'] [Algebra k k'] [Algebra k F]
    [Algebra k F'] [Algebra k' F'] [Algebra F F'] [IsScalarTower k k' F']
    [IsScalarTower k F F'] [Algebra.IsAlgebraic k k'] (hF : TauCeti.IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (h : TauCeti.constantCompositum F k' F' = ⊤) :
    TauCeti.genus k' F' ≤ TauCeti.genus k F :=
  sorry

/-! ## Layer 11: automorphisms -/

/-- **Finiteness of the automorphism group in genus at least two** (Layer 11, the headline
finiteness theorem): over an algebraically closed field `k` of characteristic zero, a
function field of genus `g ≥ 2` has finitely many `k`-automorphisms. The genus hypothesis is
load-bearing: `Aut(k(x)/k) ≅ PGL₂(k)` is infinite in genus `0`, and the translations by
`Cl⁰(F)`, infinite over algebraically closed `k`, act in genus `1`. -/
theorem finite_algEquiv_of_two_le_genus {k : Type u} {F : Type v} [Field k] [Field F]
    [Algebra k F] [IsAlgClosed k] [CharZero k] (hF : TauCeti.IsFunctionField k F)
    (hg : 2 ≤ TauCeti.genus k F) :
    Finite (F ≃ₐ[k] F) :=
  sorry

end TauCetiRoadmap.AlgebraicCurves
