# Roadmap: hyperelliptic curves — Weierstrass models, genus-2 invariants, minimal models and cluster pictures

A hyperelliptic curve of genus `g ≥ 2` over a field `k` is a smooth projective geometrically
integral curve with a separable degree-`2` map to `ℙ¹` defined over `k`. In every characteristic
such a curve has a **Weierstrass model**

```
y² + h(x) y = f(x),      deg h ≤ g + 1,   deg f ≤ 2g + 2,
```

and everything the LMFDB displays about a genus-2 curve over `ℚ` is computed from one such
equation: the discriminant, the Igusa–Clebsch, Igusa and G2 invariants, the automorphism groups,
the minimal equation, the primes of bad reduction, the cluster pictures at the odd bad primes with
their Tamagawa numbers, root numbers and conductor exponents, the 2-torsion field and the
2-Selmer rank of the Jacobian, the Euler factors, and the local solvability of the curve. This
roadmap builds that equation-level theory, in every characteristic where the statement is true,
and connects it to the function-field theory of the
[algebraic curves roadmap](../AlgebraicCurves/README.md) on one side and to the Néron-model and
Jacobian theory of the
[Néron models and semistable abelian varieties roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
and the [relative Jacobians and integral models roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md)
on the other.

The primary object is the **model** `W = (f, h)`, a pair of polynomials over a commutative ring
`R` with the degree bounds above, written `Model R g`, exactly as Mathlib's `WeierstrassCurve R`
is a quintuple of coefficients rather than a scheme. A **hyperelliptic curve** is a model whose
discriminant is a unit (`IsSmooth`), and two models define the same curve when a change of
coordinates of Layer 1 carries one to the other. Every invariant is first defined on the model
and then proved invariant under the changes of coordinates that preserve the curve; a
“hyperelliptic curve” is never a bundled structure where a model with an `IsSmooth` instance says
the same thing. The genus-`1` case of the carrier **is** Mathlib's `WeierstrassCurve`, and
Layer 0 proves the two discriminants agree, so nothing here forks the elliptic theory.

Suggested home: `TauCeti/AlgebraicGeometry/HyperellipticCurve/`, with files `Model.lean` (the
carrier, the binary-form discriminant, smoothness), `FunctionField.lean` (the bridge to Tau Ceti's
`IsHyperellipticFunctionField`), `VariableChange.lean` (the group `𝒢_g` and the transformation
law), `Involution.lean`, `Twist.lean`, `Aut.lean`, `Genus2/Invariants.lean`, `Genus2/Igusa.lean`
(the isomorphism theorem), `Genus2/Automorphisms.lean`, `Genus2/Mestre.lean`,
`MinimalModel/Local.lean`, `MinimalModel/Global.lean`, `MinimalModel/Genus2.lean` (Liu),
`ClusterPicture/Basic.lean`, `ClusterPicture/Semistability.lean`, `ClusterPicture/SpecialFibre.lean`,
`ClusterPicture/Invariants.lean` (Tamagawa, conductor, root number, deficiency),
`ClusterPicture/Genus2.lean` (the classification table), `Jacobian/TwoTorsion.lean`,
`Jacobian/EulerFactor.lean`, `LocalSolvability.lean`, and `Examples/` for the worked suite.

## Prerequisites

Every milestone lists its direct prerequisites, of four kinds and no other: a declaration of
**Mathlib** at the pin; a declaration of **Tau Ceti** at the pin; an earlier **milestone** of this
roadmap (strictly earlier in document order); or a **named layer of another roadmap** in this
repository, cited by that roadmap's own numbering. The roadmaps consumed are the
[algebraic curves roadmap](../AlgebraicCurves/README.md) (Layers 2–3, 5–7, 10–12), the
[elliptic curves roadmap](../EllipticCurves/README.md) (Layers 4, 4.5a, 4.5b, 5), the
[local fields and ramification roadmap](../LocalFieldsRamification/README.md) (Layers 0–3), the
[stable reduction roadmap](../StableReduction/README.md) (Layers 0–8), the
[Jacobian challenge](../JacobianChallenge/README.md) (Layers D–F), the
[Néron models and semistable abelian varieties roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
(Layers 1–5), the
[relative Jacobians and integral models roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md)
(Layers 3–5), the
[effective Diophantine methods roadmap](../EffectiveDiophantineMethods/README.md) (§3.23), the
[heights, rational points and obstructions roadmap](../HeightsRationalPointsAndObstructions/README.md)
(Layers 0–3 and 6), the
[periods, motivic `L`-values and special-value conjectures roadmap](../PeriodsAndSpecialValues/README.md)
(PS.1.1, PS.1.8, PS.3.3), the
[function field arithmetic roadmap](../FunctionFieldArithmetic/README.md) (§§5.1, 5.3), the
[scheme, stack, cohomology and intersection foundations roadmap](../SchemeAndStackFoundations/README.md)
(§5.11), and the completed
[number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md) (Layer 5, the
local–global dictionary). Nothing rests on anything outside these four kinds.

## Scope and ownership

A predicate or quantity invariant under isomorphism belongs to this roadmap. Label components
beyond the intrinsic prefix, orderings and normal forms fixed by convention, stored lists, and the
completeness of database tables are not targets. Concretely, the genus-2 label
`N.s.D.n` has the intrinsic prefix `(N, D)` = (conductor of the Jacobian, absolute minimal
discriminant), both defined here; the isogeny-class letter `s` and the index `n` are enumerative
and are not.

### Owned here

- The carrier `Model R g`, the characteristic-free discriminant `Δ`, the weighted-projective
  model in `ℙ(1, g+1, 1)`, smoothness `⇔ Δ ≠ 0`, the function field of a model and its
  comparison with Tau Ceti's `IsHyperellipticFunctionField`, the genus-1 comparison with
  `WeierstrassCurve` (Layer 0).
- The group `𝒢_g(R)` of changes of coordinates, its action on models, the transformation law of
  `Δ`, the theorem that every isomorphism of hyperelliptic curves is induced by a change of
  coordinates, the hyperelliptic involution, Weierstrass points and their count, the finite
  automorphism group with its reduced quotient in `PGL₂`, twists (Layer 1).
- The genus-2 invariants `I₂, I₄, I₆, I₁₀`, `J₂, J₄, J₆, J₈, J₁₀`, `(g₁, g₂, g₃)`, their
  covariance, Igusa's theorem that they classify curves up to `k̄`-isomorphism, the classification
  of automorphism groups in every characteristic, and Mestre's obstruction (Layer 2).
- Integral and minimal Weierstrass models over a discrete valuation ring, the minimal
  discriminant, global minimal models over a principal ideal domain and the obstruction class
  over a Dedekind domain, Liu's determination of the stable reduction type of a genus-2 curve from
  its Igusa invariants, and Liu's conductor–discriminant inequality in genus 2 (Layer 3).
- Cluster pictures of Dokchitser–Dokchitser–Maistret–Morgan in odd residue characteristic: the
  combinatorial carrier and its invariants, invariance under isomorphism, the semistability
  criterion, the reduction dictionary for the curve and its Jacobian, the special fibre of the
  minimal regular model, the Tamagawa number, conductor exponent, root number, deficiency and
  minimal discriminant read off the picture, and the classification of semistable genus-2
  reduction types (Layer 4).
- The 2-torsion of the Jacobian of a hyperelliptic curve with its Galois module structure and
  2-torsion field, the odd-degree `x − T` descent, the explicit good Euler factors in genus 2 and
  the bad Euler factors at odd semistable primes, local solvability of hyperelliptic models, the
  conductor bounds for abelian surfaces, the identification of the local factors of `L(J, s)`
  with those of 5.3–5.4, the real period `Ω_J` and the BSD quotient as an implication (Layer 5).

### Consumed, not redefined

- From the [algebraic curves roadmap](../AlgebraicCurves/README.md): the function-field
  vocabulary at the pin (`TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.genus`,
  Mathlib's `IsIntegrallyClosedIn`, divisors, Riemann–Roch); its Layer 10 model class
  `TauCeti.IsHyperellipticFunctionField` with the intrinsic characterisation, the genus formula
  `TauCeti.genus_eq_of_sq_eq`, the ramified places `TauCeti.Place.one_lt_ramificationIdx_iff_of_sq_eq`,
  the branch places `TauCeti.branchPlaces` with `TauCeti.card_branchPlaces`, the uniqueness of the
  index-2 subfield `TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two`, and its Layer 11
  finiteness `TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two` with the restriction
  `TauCeti.restrictAdjoinHom` to `Aut(k(x)/k)`. Layer 0 here maps a model to that function field
  and transports these; it re-proves none of them.
- From the [elliptic curves roadmap](../EllipticCurves/README.md): Mathlib's `WeierstrassCurve`,
  `VariableChange`, `IsIntegral`, `IsMinimal`, the reduction predicates, and Tau Ceti's
  `WeierstrassCurve.IsGlobalMinimal`, `IsSemiGlobalMinimal`, the local minimal discriminant, the
  defect ideal and the Weierstrass class (its Layers 4, 4.5a, 4.5b). Layer 3 here is the
  higher-genus analogue and is stated so that at `g = 1` it specialises to those declarations
  through the Layer 0 bridge; it introduces no second elliptic theory.
- From the [local fields and ramification roadmap](../LocalFieldsRamification/README.md): local
  fields, their finite extensions, the normalised valuation and its unique extension, ramification
  index and residue degree, inertia and the tame quotient, the lower ramification filtration
  (`LocalFieldsRamification.lowerRamificationGroup`), and the different. Layer 4 uses them to say
  “`K(ℛ)/K` has ramification degree at most 2” and to compute the wild conductor term.
- From the [stable reduction roadmap](../StableReduction/README.md): relative curves over a
  discrete valuation ring (`TauCeti.Model`), nodes, regular and minimal regular models, numerical
  types and the dual graph (its Layers 0–6). Layer 4's special-fibre theorem identifies the
  minimal regular model of a semistable hyperelliptic curve; it does not construct regular models.
- From the [Jacobian challenge](../JacobianChallenge/README.md): the Jacobian
  `JacobianVariety X hdim : AbelianVariety k` (Layers D–E; `Pic⁰` is representable with no
  `k`-point), the Abel–Jacobi map `abelJacobi X hdim x₀` of Layer F, which alone needs a rational
  point `x₀`, and the abelian variety carrier `TauCeti.AlgebraicGeometry.AbelianVariety` at the
  pin. Every statement about “the Jacobian of `C`” is about that object applied to the curve of a
  smooth model.
- From the [Néron models and semistable abelian varieties roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md):
  the Néron model and its component group `Φ_A` with rational and geometric points (its §2.2), the
  semistable reduction predicate (§3.1), the Picard–Néron identity comparison for semistable curves
  (§3.8–3.9), the monodromy pairing and the component group as its cokernel with the
  intersection-matrix description (§4.3–4.7), the good-reduction Euler factor (§5.0b–5.0c), the
  conductor interface with independence of `ℓ` (§5.4), the semistable conductor formula
  `f(A) = t` (§5.5), and the local Euler polynomial at bad places (§5.6). This roadmap *reads these
  invariants off the cluster picture*; the invariants themselves are that roadmap's definitions.
- From the [relative Jacobians and integral models roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md):
  Raynaud's Néron comparison for regular models (§3.3), reduction to the full special fibre and
  the component homomorphism (§4.1), torsion bounds at good and bad primes (§4.2–4.3), and the
  normalized-multidegree component formula (§4.4). Layer 4.8 here identifies the Tamagawa number
  of a semistable hyperelliptic Jacobian with the order of that roadmap's rational component
  group.
- From the [effective Diophantine methods roadmap](../EffectiveDiophantineMethods/README.md):
  §3.23, the `x − T` descent for `y² = f(x)` with `f` sextic and `C(ℚ) ≠ ∅`, its items (a)–(d)
  (the homomorphism `J(K) → L_K^×/(L_K^{×2} K^×)`, the unramified-outside-`S` subgroup, the index
  `[ker(x − T) : 2J(K)]`, the local counts) and the resulting rank bound. Layer 5.2 here states the
  odd-degree case in the same four items and consumes the even-degree one.
- From the [heights, rational points and obstructions roadmap](../HeightsRationalPointsAndObstructions/README.md):
  the Kummer maps, Selmer structures and `Ш` (§1.1–1.5), Mordell–Weil and regulators (§1.7–1.8),
  torsion specialization (§1.18), two-coverings and `W[2]` (§1.12), two-Selmer sets (§1.14),
  adelic points (§2.1–2.5) and the local-solubility predicate `IsLocallySoluble` (§6.1), Selmer sets
  of torsors (§3.3), the Cassels–Tate pairing (§3.17a) and the Poonen–Stoll parity of `#Ш`
  (§3.18c). The LMFDB's `two_selmer_rank` is `dim_{𝔽₂} Sel₂(J/ℚ)` for that roadmap's `Sel₂`
  (its §1.3); `locally_solvable` is its `IsLocallySoluble` evaluated on the curve of Layer 0.
- From the [periods, motivic `L`-values and special-value conjectures roadmap](../PeriodsAndSpecialValues/README.md):
  the Euler product of a compatible system and its convergence half-plane (PS.1.1), the
  Hasse–Weil completion `Λ_1(A, s) = Λ(H¹(A), s)` of an abelian variety with its local factors
  through the Néron models roadmap §6.10 and the continuation predicate `SerreC9 A 1` (PS.1.8),
  and the order and leading coefficient of a nonzero meromorphic germ (PS.3.3). Layer 5.7 applies
  them to `A = J` and proves that the local factors are 5.3's and 5.4's.
- From the [function field arithmetic roadmap](../FunctionFieldArithmetic/README.md): the point
  counts `pointCount` with `pointCount_eq` (the number of `𝔽_{q^r}`-points of the regular
  projective model, §5.1) and the `L`-polynomial `L_F = (1 − T)(1 − qT) Z_F` of the function field
  with `zeta_rationality` (§5.3). Layer 5.3 applies them to the function field of a smooth genus-2
  model.
- From the [scheme, stack, cohomology and intersection foundations roadmap](../SchemeAndStackFoundations/README.md):
  the Weil bound `weil_bound_via_surfaces`, `|#C(𝔽_q) − (q + 1)| ≤ 2g√q` for a smooth projective
  geometrically irreducible curve of genus `g` over `𝔽_q` (§5.11), which 5.5 applies to the
  reduction.
- From the completed [number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md):
  the completions `v.adicCompletion K` as local fields and the local–global dictionary (Layer 5),
  which is how a global curve over `ℚ` is handed to the local layers at each prime.
- From Mathlib: everything in *What Mathlib supplies*.

### Not owned here

- **The function-field theory of hyperelliptic curves** — the existence of the index-2 rational
  subfield, the genus formula, Weierstrass gaps, Kummer and Artin–Schreier models, regular
  differentials, the Hurwitz bound: the
  [algebraic curves roadmap](../AlgebraicCurves/README.md), Layers 10–11. Layer 0 here is the
  equation-side dictionary to that theory.
- **Néron models, component groups, conductors and local Euler factors as general notions**, and
  the stable reduction theorem: the
  [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md), the
  [relative Jacobians roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md), and the
  [stable reduction roadmap](../StableReduction/README.md). Here they are computed, not defined.
- **The 2-Selmer group, Mordell–Weil group, rank, generators, regulator, canonical heights and
  torsion subgroup** of the Jacobian: the
  [heights roadmap](../HeightsRationalPointsAndObstructions/README.md) (Layers 1, 3). The LMFDB
  fields `mw_rank`, `mw_gens`, `torsion`, `torsion_order` and `regulator` live there; this roadmap
  supplies the 2-torsion of Layer 5.1, the local data of Layer 4, `tamagawa_product` (5.6), and
  `real_period` and the BSD quotient `analytic_sha` (5.7).
- **The global `L`-function of an abelian variety**, its continuation predicate, and the order and
  leading coefficient of `L(J, s)` at `s = 1` (`analytic_rank`, `leading_coeff`): the
  [periods roadmap](../PeriodsAndSpecialValues/README.md) PS.1.1, PS.1.8 (`Λ_1(A, s)`,
  `SerreC9 A 1`) and PS.3.3. Layer 5.7 identifies its local factors for a genus-2 Jacobian with
  those of 5.3–5.4.
- **Endomorphism algebras, `GL₂`-type, geometric simplicity and decomposition, Sato–Tate groups**
  (`end_alg`, `geom_end_alg`, `real_geom_end_alg`, `is_gl2_type`, `is_simple_geom`,
  `end_lattice`, `st_group`, `st_label`): the sibling `SatoTateGroups` roadmap.
- **Mod-`ℓ` and `ℓ`-adic Galois images in `GSp₄`, non-maximal primes** (`galois_image`,
  `nonmax_primes`, `modell_image`): the sibling `AdelicImagesAndModularCurves` roadmap.
- **Point counts and `L`-polynomials of curves over finite fields**: the zeta function, the point
  counts and the `L`-polynomial are the function field arithmetic roadmap's (§§5.1, 5.3), consumed
  in Layer 5.3 here; the Weil bound is the scheme, stack, cohomology and intersection foundations
  roadmap's §5.11, consumed in 5.5; the Weil polynomial of the reduction is the sibling
  `CurvesOverFiniteFields` roadmap's, and the `av.fq` labels the LMFDB prints beside each good
  Euler factor are that sibling's and `AbelianVarietiesOverFiniteFields`'.
- **Labels, the choice of a reduced minimal equation among all minimal equations, the ordering of
  curves in an isogeny class, completeness of the database**: not targets. In
  particular the *set* of minimal equations and their relation by `𝒢_g(ℤ)` is Layer 3's; which
  representative the LMFDB prints is not.
- **Families of hyperelliptic curves with group actions** (the `hgcwa` `hyperelliptic` column —
  whether a generating vector gives a hyperelliptic curve): the sibling
  `GroupActionsOnRiemannSurfaces` roadmap; the equation-level criterion it needs (in characteristic `≠ 2`, a curve of genus
  `g ≥ 2` is hyperelliptic iff it has an involution with `2g + 2` fixed points, Layer 1.4) is
  supplied here.
- **The Artin conductor and local root number of a general Weil–Deligne representation**: the
  [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) (§3 for
  the conductor, §2.7 `WeilDeligneRep.epsilon` for the local constant) on the
  [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §5.4's
  representation; the finite-image local constants are read from it by the sibling
  `ArtinRepresentations` Layer 6. Layer 4 evaluates them on hyperelliptic curves from the cluster
  picture.
- Hyperelliptic curves in residue characteristic 2 beyond the model theory: cluster pictures are
  stated for odd residue characteristic only, as in their source; the 2-adic invariants of a
  genus-2 curve are reached only through the general theory of the Néron models roadmap.
- Superelliptic curves `yⁿ = f(x)` with `n ≥ 3`, Picard curves, plane quartics, and the moduli
  space `M₂` as a scheme.

### The LMFDB genus-2 page, column by column

The table records, for every field of `g2c_curves`, `g2c_endomorphisms`, `g2c_tamagawa`,
`g2c_ratpts`, `g2c_galrep` and `cluster_pictures` that the page displays or that a search can
filter on, which roadmap owns the mathematics. “Here N.M” is a milestone below.

| LMFDB field | Mathematics | Owner |
| --- | --- | --- |
| `eqn` (minimal equation `[f, h]`) | a minimal model over `ℤ` | here 3.4 (the set); the chosen representative is not a target |
| simplified equation `y² = 4f + h²` | 1.2 (a change of coordinates over `ℤ[1/2]`) | here |
| `disc_sign`, `abs_disc` | minimal discriminant `Δ_min` and its sign | here 0.3, 3.4 |
| `cond` | conductor of the Jacobian | Néron models §5.4; the value at odd `p` from clusters: here 4.9; the prime factorisation: here 5.6 |
| `bad_primes` | primes dividing `Δ_min` | here 3.4, 3.6 |
| `igusa_clebsch_inv`, `igusa_inv`, `g2_inv` | `I₂:I₄:I₆:I₁₀`, `J₂:…:J₁₀`, `(g₁,g₂,g₃)`; the stored representatives of convention 8 | here 2.1, 2.2, 2.5 (the vector `J(W_min)` is intrinsic, 3.4); the sign rule and the `d^k` reduction of `I` are not a target |
| `aut_grp_label`, `aut_grp_tex`, `geom_aut_grp_label`, `geom_aut_grp_tex` | `Aut(C)`, `Aut(C_{ℚ̄})` as abstract groups | here 1.4, 2.6; isomorphism invariants: `FiniteGroupInvariants`; group labels are not a target |
| `num_rat_wpts` | number of `ℚ`-rational Weierstrass points | here 1.3 |
| `locally_solvable`, `non_solvable_places` | `C(ℚ_v) ≠ ∅` for all `v` | predicate: heights roadmap §6.1; hyperelliptic decision: here 5.5 |
| `two_selmer_rank` | `dim_{𝔽₂} Sel₂(J/ℚ)` | heights roadmap §1.3–1.5; descent interface: effective Diophantine methods §3.23 and here 5.2 |
| `two_torsion_field` | `ℚ(J[2])` | here 5.1 |
| `torsion_subgroup`, `torsion_order` | `J(ℚ)_tors` | heights roadmap §1.18, relative Jacobians §4.2–4.3; `J[2](ℚ)` only: here 5.1 |
| `tamagawa_number` at `p` (`g2c_tamagawa`) | `#Φ_J(𝔽_p)` | Néron models §2.2; odd semistable `p`: here 4.8 |
| `local_root_number` at `p` | `w_p(J)` | odd semistable `p`: here 4.12; general: arithmetic Galois representations §2.7 on Néron models §5.4 |
| `cluster_label`, `cluster_pictures.{depth,size,potential_toric_rank,potential_good_reduction,potential_good_jacobian_reduction}` | the cluster picture at odd `p` and its invariants | here 4.1–4.5; the label string is not a target |
| “tame reduction?” | semistable over a tame extension | here 4.5 |
| `bad_lfactors` | `L_p(T)` at bad `p` | Néron models §5.6; odd semistable `p`: here 5.4 |
| `euler_factors` (good `p`) | `L_p(T)` from `#C(𝔽_p), #C(𝔽_{p²})` | here 5.3 with function field arithmetic §5.3 |
| `root_number` | `∏_v w_v` | product of the local ones; archimedean `(-1)^g`: here 4.12 |
| `has_square_sha` | parity of the number of deficient places | here 4.11 with heights roadmap §3.17a, §3.18c |
| `regulator`, `mw_rank`, `mw_gens`, `mw_invs`, `mw_heights`, `rat_pts`, `rat_pts_v`, `mw_gens_v` | Mordell–Weil data and rational points | heights roadmap (Layers 0–1, 3) |
| `analytic_rank`, `leading_coeff`, `real_period`, `analytic_sha` | the order and leading coefficient of `L(J, s)` at `s = 1`, the real period, the BSD quotient | `L(J, s)`, its order and leading coefficient: periods roadmap PS.1.8, PS.3.3, with the local factors identified here in 5.7; `real_period` unconditionally and `analytic_sha` as an implication from `SerreC9 J 1`: here 5.7 |
| `st_group`, `st_label`, `real_geom_end_alg`, `end_alg`, `geom_end_alg`, `is_gl2_type`, `is_simple_geom`, `ring_base`, `ring_geom`, `lattice`, `fod_*`, `spl_*` | endomorphisms, decomposition, Sato–Tate | `SatoTateGroups` |
| `non_maximal_primes`, `modell_image` | Galois images in `GSp₄(𝔽_ℓ)` | `AdelicImagesAndModularCurves` |
| `label`, `class`, `Lhash` | enumerative data beyond the prefix `(N, D)` | not a target (database convention) |

## Pinned conventions

1. **The carrier.** `Model R g` is a pair `(f, h)` of polynomials over a commutative ring `R`
   with `natDegree f ≤ 2g + 2` and `natDegree h ≤ g + 1`, for `g : ℕ` (the equation of a curve of
   genus `g`; `g = 0` and `g = 1` are allowed and the genus-1 case is Mathlib's
   `WeierstrassCurve`). The affine equation is `y² + h(x) y = f(x)`; the **weighted-projective
   model** is the curve `y² + h(x, z) y = f(x, z)` in `ℙ(1, g+1, 1)` with `h(x, z) = z^{g+1} h(x/z)`
   and `f(x, z) = z^{2g+2} f(x/z)`; the points at infinity are the points with `z = 0`, of which
   there are two, one or zero according as the quadratic `T² + h_{g+1} T − f_{2g+2}` has two,
   one or no roots in `k`. There is no second carrier for “curves with a rational
   Weierstrass point” (`deg f = 2g + 1`): that is the sub-case `f_{2g+2} = 0`, `h_{g+1} = 0`.
2. **The binary-form discriminant.** For `n ≥ 1`, `disc_n` is the universal discriminant of a
   binary form of degree `n`: the polynomial `universalDiscr n ∈ ℤ[a_0, …, a_n]` equal to
   Mathlib's `Polynomial.discr` of `a_n X^n + ⋯ + a_0` over `ℤ[a_0, …, a_n]`, evaluated at the
   coefficients of a polynomial `G` of degree `≤ n`. It is **not** `Polynomial.discr G`: when
   `deg G = n − 1` the two differ by the square of the leading coefficient, and when
   `deg G ≤ n − 2` the form has a double root at infinity and `disc_n G = 0` while
   `Polynomial.discr G` need not vanish. `disc_n` is `GL₂`-covariant with weight `n(n−1)` and
   homogeneous of degree `2n − 2` in the coefficients (Layer 0.1).
3. **The discriminant of a model** is
   `Δ(f, h) = 2^{-4(g+1)} · disc_{2g+2}(4f + h²)`, which is a polynomial with **integer**
   coefficients in the coefficients of `f` and `h` (Layer 0.3); over a ring of characteristic 2
   it is this integral polynomial, not a division. This is Liu's normalisation in genus 2
   (`Δ = 2^{-12} disc(4P + Q²)` for `y² + Qy = P`, Liu 1994 §1 eq. (1) with §2), Lockhart's
   `2^{4g} disc(f + h²/4)` in every genus, and the LMFDB knowl `g2c.discriminant`: for
   `deg(f + h²/4) = 6` it is `2^8 disc(f + h²/4)`, and for degree 5 it is
   `2^8 lc(f + h²/4)² disc(f + h²/4)`. At `g = 1` it is exactly Mathlib's `WeierstrassCurve.Δ`
   (Layer 0.5, checked symbolically). For `y² = f(x)` it is `2^{4g} lc(f)^{2} disc(f)` when
   `deg f = 2g + 1` and `2^{4g} disc(f)` when `deg f = 2g + 2`, which is the discriminant `Δ_C` of
   Dokchitser–Dokchitser–Maistret–Morgan Definition 1.21.
4. **Smooth means `Δ` is a unit.** `IsSmooth W` is `IsUnit W.Δ`; over a field, `Δ ≠ 0`. The
   theorem that this is equivalent to smoothness of the weighted-projective model is Layer 0.3,
   valid in characteristic 2 (where the partial derivatives, not `4f + h²`, decide). “Hyperelliptic
   curve” below always means a smooth model with `g ≥ 2`; statements at `g ≤ 1` are marked.
5. **Changes of coordinates.** `𝒢_g(R)` is the group of triples `(M, e, t)` with
   `M = [[a, b], [c, d]] ∈ GL₂(R)`, `e ∈ R^×`, `t ∈ R[X]` of degree `≤ g + 1`, acting on the
   *coordinates* by
   `x = (a x' + b)/(c x' + d)`, `y = (e y' + t(x'))/(c x' + d)^{g+1}`,
   so that the new model is
   `h' = e^{-1}(2t + H)`, `f' = e^{-2}(F − t² − H t)`, with
   `F(x') = (c x' + d)^{2g+2} f((a x' + b)/(c x' + d))` and
   `H(x') = (c x' + d)^{g+1} h((a x' + b)/(c x' + d))` (both polynomials, computed by the
   homogeneous substitution without division). The composition law is the one that makes this
   a left action, `(M₁, e₁, t₁) · (M₂, e₂, t₂) = (M₂M₁, e₁e₂, e₂ t₁ + t₂ ∘_{g+1} M₁)` with
   `(t ∘_{g+1} M)(X) = (cX + d)^{g+1} t((aX + b)/(cX + d))`; note the order `M₂M₁`, so
   `(M, e, t) ↦ M` is an anti-homomorphism to `GL₂(R)`. The **scalar triples**
   `(λ · 1, λ^{g+1}, 0)` for `λ ∈ R^×` form a central subgroup `Λ_g(R)` that acts trivially on
   every model and on the coordinates. The **transformation law** is
   `Δ' = e^{-4(2g+1)} · det(M)^{(2g+1)(2g+2)} · Δ`; at `g = 2` this is `e^{-20} det(M)^{30}`, at
   `g = 1` and `M = [[u², r], [0, 1]]`, `e = u³` it is `u^{-12}`, Mathlib's law. Mathlib's
   `WeierstrassCurve.VariableChange` embeds into `𝒢_1` by `(u, r, s, t) ↦ ([[u², r], [0, 1]], u³,
   s u² X + t)` (Layer 0.5).
6. **The hyperelliptic involution** is `ι(x, y) = (x, −y − h(x))`, the element `(1, −1, −h)` of
   `𝒢_g`; it is central in `Aut(C)` for `g ≥ 2`. **Weierstrass points** are the fixed points of
   `ι` over `k̄`: in characteristic `≠ 2` the `2g + 2` points over the roots of the binary form
   `4f + h²` (including the point at infinity when its degree drops), in characteristic 2 the
   `≤ g + 1` points over the roots of the binary form `h`, each with multiplicity. `num_rat_wpts`
   is the number of `k`-rational ones.
7. **Isomorphism of curves is the orbit relation.** For smooth models `W₁, W₂` of the same genus
   `g ≥ 2` over a field `k`, the curves are `k`-isomorphic iff `W₂ = C • W₁` for some
   `C ∈ 𝒢_g(k)`, and the isomorphism is then unique up to `Aut`; the `k̄`-isomorphism class is the
   orbit over `k̄` (Layer 1.3). For `g = 1` the same holds with the base point at infinity fixed.
8. **Genus-2 invariants.** `I₂, I₄, I₆, I₁₀` of a model `(f, h)` over a ring in which 2 is a unit
   are the Igusa–Clebsch invariants of the **sextic binary form `G = 4f + h²`**, by the root
   formulas of the knowl `g2c.igusa_clebsch_invariants` (so `I₁₀ = disc_6 G = 2^{12} Δ`). The
   **Igusa invariants** `J₂, J₄, J₆, J₈, J₁₀` are Igusa's integral polynomials in the coefficients
   of `(f, h)` (Igusa 1960 §3, Liu 1993 §1), characterised over `ℤ[1/2]` by
   `J₂ = I₂/8`, `J₄ = (4J₂² − I₄)/96`, `J₆ = (8J₂³ − 160 J₂ J₄ − I₆)/576`, `J₈ = (J₂ J₆ − J₄²)/4`,
   `J₁₀ = I₁₀/4096 = Δ`, and satisfying `J₂ J₆ − J₄² = 4 J₈` identically. The point
   `[J₂ : J₄ : J₆ : J₈ : J₁₀] ∈ ℙ(2, 4, 6, 8, 10)` is the **Igusa point**; `J₈` is redundant away
   from characteristic 2 and is kept because the moduli scheme over `ℤ` needs it. The **absolute
   (G2) invariants** are `(g₁, g₂, g₃) = (J₂⁵/J₁₀, J₂³J₄/J₁₀, J₂²J₆/J₁₀)` if `J₂ ≠ 0`,
   `(0, J₄⁵/J₁₀², J₄J₆/J₁₀)` if `J₂ = 0 ≠ J₄`, and `(0, 0, J₆⁵/J₁₀³)` otherwise — the knowl
   `g2c.g2_invariants`, which is what `web_g2c.py` displays. Over `ℚ` the vector
   `(J₂, …, J₁₀)` of a global minimal model (3.4) is itself an invariant of the curve (the
   covariance factor `μ = e^{−4} det(M)^6` between two such models is a positive rational with
   `μ⁵ = 1`). The LMFDB's stored `igusa_inv` is that vector with the odd-weight signs flipped so
   that the first nonzero odd-weight entry is positive (`J_{2k} ↦ (−1)^k J_{2k}`, the action of
   `−1` on `ℙ(1, 2, 3, 4, 5)`; 249.a.249.1 stores `J₁₀ = −249` for `Δ_min = 249`, and
   3125.a.3125.1 stores `J₁₀ = 3125`, so no `d^k` is removed from `J`), and its stored
   `igusa_clebsch_inv` is `I_{2k}/d^k` for the largest admissible `d` followed by the same sign
   rule (the knowl's `(−i)^k` is a misprint for `(−1)^k`; 249 stores `I₁₀ = −31872 = −1019904/2⁵`).
   Both representatives are normal forms, which are not targets; the invariants
   themselves, the intrinsic vector `J(W_min)`, and the fact that each representative is a
   function of the Igusa point, are here.
9. **Automorphism groups** are `Aut(C) = Stab_{𝒢_g(k)}(W)/Λ_g(k)` for a smooth model, the
   stabiliser modulo the scalar triples of convention 5 (which fix every model, so the stabiliser
   itself is infinite over an infinite field), and the geometric automorphism group is the same
   quotient over an algebraic closure; the **reduced automorphism
   group** is `Aut(C)/⟨ι⟩ ↪ PGL₂(k)`. Dihedral groups are written by order: `D_n` has order `n`
   (the LMFDB's `D_4` of order 8 is `D_8` here, its `D_6` is `D_{12}`).
10. **Local base.** In Layers 3–4 the local base is a complete discretely valued field `K` with
    ring of integers `𝒪_K`, uniformiser `π`, normalised valuation `v` (`v(π) = 1`), extended
    uniquely to `K̄` with values in `ℚ`, residue field `k`; for the cluster-picture layer `k` is
    **finite of odd characteristic `p`** (perfect of odd characteristic where a statement needs no
    counting), exactly as in Dokchitser–Dokchitser–Maistret–Morgan. Inertia is `I_K`, Frobenius is
    a chosen `Frob ∈ G_K`.
11. **Integral and minimal models.** A model over `K` is **integral** when `f, h ∈ 𝒪_K[X]`;
    **minimal** when `v(Δ)` is minimal among integral models of the same curve. Over `ℚ` a
    **global minimal model** is one minimal at every prime, and `Δ_min` is its discriminant, with
    the sign; `abs_disc = |Δ_min|`. For `y² = f(x)` in odd residue characteristic this is DDMM's
    Definition 1.21, and DDMM Remark 1.22 records that Liu's notion (integral `(f, h)`) gives the
    same minimal discriminant.
12. **Cluster pictures** follow DDMM Definitions 1.1–1.7, 1.9, 1.11, 1.12 and 1.26 verbatim: the
    roots `ℛ ⊂ K̄` of `G = 4f + h²` (of `f` when `h = 0`), a cluster is `ℛ ∩ D` for a disc
    `D = {x : v(x − z) ≥ d}`, its depth is `d_𝔰 = min_{r, r' ∈ 𝔰} v(r − r')`, relative depth
    `δ_𝔰 = d_𝔰 − d_{P(𝔰)}`, `ν_𝔰 = v(c_f) + Σ_{r ∈ ℛ} d_{r ∧ 𝔰}`, with the vocabulary twin, cotwin,
    even, odd, übereven, principal, `𝔰^*`, `𝔰 ∧ 𝔰'`, and the sign
    `ε_𝔰(σ) ≡ σ(θ_{𝔰^*})/θ_{(σ𝔰)^*} mod 𝔪` for `θ_𝔰 = √(c_f ∏_{r ∉ 𝔰}(z_𝔰 − r))`. The sign of `θ_𝔰` is a choice; the invariants
    read off the picture are independent of it (DDMM Remark 1.13, Example 18.6).
13. **Local invariants of the Jacobian** are the Néron models roadmap's: the Tamagawa number is
    `c_p = #Φ_J(k)`, the order of the rational component group; the conductor exponent `n` is the
    Artin conductor of `H¹_{ét}(C_{K̄}, ℚ_ℓ)`, `n = n_{tame} + n_{wild}`; the local root number `w`
    is that of the Weil–Deligne representation on `H¹`; at an archimedean place `w = (−1)^g`.
    **Deficiency**: `C/K` is deficient when it has no `K`-rational divisor of degree `g − 1`
    (DDMM §1.2, Poonen–Stoll §8).
14. **Euler factors** are written in the LMFDB's orientation `L_p(T) = T^{2g} χ_p(1/T)` with
    `χ_p` the characteristic polynomial of arithmetic Frobenius on the reduction, equivalently
    `det(1 − T · Frob_p | H¹_{ét}(C_{ℚ̄}, ℚ_ℓ)^{I_p})` with geometric Frobenius, so that
    `L_p(1) = #J(𝔽_p)` at good `p`; in genus 2 at good `p`,
    `L_p(T) = 1 + a₁T + a₂T² + p a₁ T³ + p² T⁴`.
15. **Twists.** A twist of `C/k` is a curve `C'/k` with `C'_{k̄} ≅ C_{k̄}`; twists are classified
    by `H¹(k, Aut(C_{k̄}))`. The **quadratic twist** of a model `(f, h)` over any ring by the
    quadratic algebra `R[θ]/(θ² − tθ + n)`, with `D := t² − 4n`, is the model
    `W_{t,n} = (D f − n h², t h)`, whose Weierstrass form is `D · (4f + h²)` — the shape of Tau
    Ceti's `WeierstrassCurve.quadraticTwistOf t n`, to which it specialises exactly at `g = 1`
    after the integral rescaling `([[1, 0], [0, D]], D, 0)` (1.5). In characteristic `≠ 2` take
    `t = 0`, `n = −d`: the curve `y² = d · (4f + h²)`, the classical twist by `d`; in
    characteristic 2 take `t = 1`, `n = c`: the Artin–Schreier twist `(f + c h², h)`. Both are
    the `ι`-twists, the image of `H¹(k, ⟨ι⟩) = k^×/k^{×2}` resp. `k/℘(k)`; the general twist is
    not assumed quadratic.
16. **Targets.** Each milestone below is a definition, construction, theorem or comparison, with
    its hypotheses in the sentence and its source in parentheses; where its definition cannot be
    stated over Mathlib and the pinned Tau Ceti, it ends with **Checks**, the tests a
    formalisation must pass. Backticked names are the names the declarations take when
    formalised. `Suggested.lean` states only what can be stated over Mathlib and the pinned Tau
    Ceti: the carriers and definitions of 0.1–0.6, the changes of coordinates and their action on
    models of 1.1–1.2 (the triples and `C • W`, not the group law), the quadratic twist of 1.5,
    the integral, minimal and global minimal models and the minimal discriminant of 3.1–3.5, the
    cluster-picture carrier and its vocabulary of 4.1–4.2, the combinatorial semistability
    criterion of 4.4, the potential toric rank of 4.5 and the two-torsion field of 5.1, together
    with the theorems about them. Every other target, including the group law of 1.1, the
    automorphism group of 1.4, the genus-2 invariants of Layer 2, the cluster picture of a
    polynomial of 4.1 and the two-torsion rank of 5.1, is specified in this README only.

## What Mathlib supplies

- Polynomials: `Polynomial` with `natDegree`, `coeff`, `eval`, `aeval`, `comp`, `map`,
  `Splits`, `rootSet`, `roots`, `Separable` (smoothness over an imperfect field needs
  separability, not `Squarefree`), `Polynomial.Gal` (`Mathlib/FieldTheory/PolynomialGaloisGroup.lean`), `AdjoinRoot` with its field instance under
  `Fact (Irreducible f)` and `Algebra` tower; `RatFunc k`.
- `Polynomial.resultant`, `Polynomial.sylvester`, `Polynomial.sylvesterDeriv`,
  `Polynomial.discr` with `discr_of_degree_eq_two`, `discr_of_degree_eq_three`,
  `resultant_deriv`, `resultant_eq_prod_roots_sub`
  (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`): the universal discriminant of
  convention 2 is built from `discr` over `MvPolynomial (Fin (n+1)) ℤ`.
- `MvPolynomial` with `IsWeightedHomogeneous` and `weightedHomogeneousComponent`
  (`Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean`) for the weights of `J_{2i}`.
- `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.det`, `Units`, `MulAction`,
  `MulAction.stabilizer`.
- `WeierstrassCurve` with `Δ`, `b₂, b₄, b₆, b₈`, `IsElliptic`, `VariableChange` and its group
  and action, `IsIntegral R W`, `IsMinimal R W`, `minimal`, `reduction`, `HasGoodReduction`,
  `HasMultiplicativeReduction`, `HasAdditiveReduction`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,Reduction}.lean`).
- `IsDiscreteValuationRing`, `IsDedekindDomain.HeightOneSpectrum`, `Localization.AtPrime`,
  `IsFractionRing`, `AddValuation`, `Valued`, `HenselianLocalRing`, `ClassGroup`,
  `IsAlgClosed`, `AlgebraicClosure`, `IsGalois`, `IntermediateField.fixingSubgroup`,
  `Module.finrank`, `ZMod`, `Submodule.torsionBy`.
- `Finset` combinatorics (`powerset`, `offDiag`, `inf'`) for the cluster-picture carrier, and
  `Nat.card`, `Fintype.card` for counts.

## What Tau Ceti supplies

At the pin (`.lake/packages/TauCeti`):

- `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.genus` (both arguments explicit, `genus k F`),
  exactness of constants as Mathlib's `IsIntegrallyClosedIn k F`, divisors, Riemann–Roch spaces, the different, Weierstrass gaps and weights
  (`TauCeti/FieldTheory/FunctionField/*`).
- `TauCeti.IsHyperellipticFunctionField` and its intrinsic characterisation
  `TauCeti.isHyperellipticFunctionField_iff_two_le_genus_and_exists_degree_eq_two_and_two_le_dim`;
  genus two is hyperelliptic away from characteristic 2 (`TauCeti.isHyperellipticFunctionField_of_genus_eq_two`,
  hypothesis `(2 : k) ≠ 0`; the perfect-field form is on main)
  (`TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean`).
- For `y² = f(x)` with `f` squarefree away from characteristic 2: the degree
  `finrank_ratFunc_eq_two_of_sq_eq`, the ramified places
  `Place.one_lt_ramificationIdx_iff_of_sq_eq`, the different degree
  `degree_different_ratFunc_of_sq_eq`, exactness of constants `isIntegrallyClosedIn_of_sq_eq`,
  the genus `genus_eq_of_sq_eq` (`g = ⌊(deg f − 1)/2⌋`), and
  `TauCeti.isHyperellipticFunctionField_of_sq_eq` (`…/Hyperelliptic/Genus.lean`).
- Branch places `branchPlaces` with `card_branchPlaces` (`2g + 2` over an algebraically closed
  field), `smul_mem_branchPlaces`, the degree of the different `degree_different_adjoin`
  (`…/Hyperelliptic/BranchPlaces.lean`); the uniqueness of the index-2 subfield
  `adjoin_eq_adjoin_of_finrank_adjoin_eq_two` and `mem_adjoin_of_finrank_adjoin_le_genus`
  (`…/Hyperelliptic/RationalSubfield.lean`); the restriction homomorphism `restrictAdjoinHom`
  to `Aut(k(x)/k)` with kernel the fixing subgroup of `k(x)` (`ker_restrictAdjoinHom`), of order 2
  by `IntermediateField.natCard_fixingSubgroup_of_finrank_eq_two` (`…/Hyperelliptic/Automorphism.lean`); the permutation
  action on branch places `branchPermHom` with `ker_branchPermHom`, finiteness
  `finite_algEquiv_of_finrank_adjoin_eq_two` and the bound
  `card_algEquiv_le_of_finrank_adjoin_eq_two` (`…/Hyperelliptic/Finite.lean`).
- Elliptic curves: `WeierstrassCurve.IsGlobalMinimal`, `IsSemiGlobalMinimal`, the local minimal
  discriminant, obstruction exponents, defect ideal, Weierstrass class, semistability
  (`TauCeti/AlgebraicGeometry/EllipticCurve/{GlobalMinimalModel,MinimalModel/*}.lean`); the
  quadratic twist `quadraticTwistOf` with `Δ_quadraticTwistOf`
  (`…/EllipticCurve/QuadraticTwist/Basic.lean`); `autGroup` as a stabiliser in `VariableChange`
  (`…/EllipticCurve/Aut.lean`); the `x − T` map `μ`, `M = Aˣ/Aˣ²`, `normM` for an elliptic curve
  (`…/EllipticCurve/MordellWeil/XSubT.lean`); and, on Mathlib's
  `IsDedekindDomain.selmerGroup`, the maps `fromSUnit`, `toClassGroup`, `selmerGroupPi`
  (`TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/*`).
- `TauCeti.AlgebraicGeometry.AbelianVariety` with `baseChange`, `dim`, isogenies
  (`TauCeti/AlgebraicGeometry/AbelianVariety/*`); `TauCeti.Model` over a discrete valuation ring,
  nodes and numerical types (`TauCeti/AlgebraicGeometry/Curves/*`).
- Binary forms of degree `w` as `homogeneousSubmodule (Fin 2) R w` with the substitution action
  `TauCeti.binaryFormRep` / `linearSubstRep (Fin 2) R w`
  (`TauCeti/NumberTheory/ModularForms/BinaryForms.lean`): the homogeneous substitution of 0.1 and
  1.1 is this action written on `R[X]_{≤ w}`.

On Tau Ceti main beyond the pin, cited in prose and not re-specified: the squarefree model
theorem `TauCeti.IsHyperellipticFunctionField.exists_squarefree_sq_eq_aeval` (every hyperelliptic
function field away from characteristic 2 is `y² = f(x)` with `f` squarefree of degree `2g + 1` or
`2g + 2`; `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Model.lean`); the characteristic-2
Artin–Schreier model and genus formula
`TauCeti.exists_sq_sub_self_eq_and_two_mul_genus_add_two_eq_sum` (`…/Hyperelliptic/ArtinSchreier.lean`);
Weierstrass gaps at ramified and unramified rational places and the converse
`TauCeti.isHyperellipticFunctionField_of_isPoleNumber_two` (`…/Hyperelliptic/WeierstrassGaps.lean`);
the different of an odd-degree model (`…/Hyperelliptic/Different.lean`); the regular
differentials `x^i dx/y` (`…/Hyperelliptic/RegularDifferential.lean`); the rational place of an
affine point (`…/Hyperelliptic/RationalPoint.lean`); and the worked genus-2 field `y² = x⁵ − 1`
with its gap sequences (`…/Hyperelliptic/Genus/Two.lean`; on main the pin's
`Hyperelliptic/Genus.lean` has become `Hyperelliptic/Genus/Basic.lean`); and the regular proper
model of any function field, `TauCeti.AlgebraicGeometry.twoChartModel`, glued from the holomorphy
rings of `x` and `1/x`, with `isProper`, `equivPlace` (its codimension-one points are
`TauCeti.Place`), `genus_eq_genus`, `isoOfAlgEquiv` (a `k`-isomorphism of function fields is an
isomorphism of models) and `Scheme.isoTwoChartModel` (every regular proper curve is the model of
its function field; `TauCeti/AlgebraicGeometry/Curves/TwoChartModel/*`). Layer 0.4 here produces
the function field of a model in the form those theorems take, so they apply to it directly, and
identifies the smooth weighted-projective model with `twoChartModel` of its function field.

## What is missing

Everything equation-level: the `Model` carrier and its discriminant, the weighted-projective
model and its smoothness criterion, the group `𝒢_g`, the isomorphism theorem, twists, the
genus-2 invariants and Igusa's theorem, the automorphism classification, Mestre's obstruction,
minimal models in genus `≥ 2`, Liu's reduction types, the whole of cluster pictures, the explicit
2-torsion, the genus-2 Euler-factor formulas, and the hyperelliptic local-solvability decision
procedure. None of it is in Mathlib or Tau Ceti.

## Layer 0: Weierstrass models, the discriminant and the function field

### 0.1 The binary-form discriminant

Define `universalDiscr n : MvPolynomial (Fin (n+1)) ℤ` as `Polynomial.discr` of the universal
polynomial `Σ_i X_i · T^i` over `MvPolynomial (Fin (n+1)) ℤ`, and
`formDiscr n (G : R[X]) : R := aeval (fun i => G.coeff i) (universalDiscr n)` for any commutative
ring `R`. Prove: `formDiscr n G = Polynomial.discr G` when `natDegree G = n`;
`formDiscr n G = (G.leadingCoeff)² · Polynomial.discr G` when `natDegree G = n − 1`;
`formDiscr n G = 0` when `natDegree G ≤ n − 2` and `n ≥ 2`; `formDiscr n` is homogeneous of
degree `2n − 2` in the coefficients (`formDiscr n (C λ * G) = λ^{2n−2} formDiscr n G`); the
`GL₂`-covariance `formDiscr n (G ∘ M) = det(M)^{n(n−1)} formDiscr n G` for the homogeneous
substitution `(G ∘ M)(X) = (cX + d)^n G((aX + b)/(cX + d))` (defined without division as
`Σ_i G_i (aX + b)^i (cX + d)^{n−i}`, which is Tau Ceti's `linearSubstRep (Fin 2) R n` acting on the
binary form with these coefficients, transported to `R[X]` by dehomogenisation — state this
comparison as a theorem); compatibility with ring homomorphisms; and over an
algebraically closed field the root formula `formDiscr n G = lc^{2n−2} ∏_{i<j}(r_i − r_j)²` when
`deg G = n`, with the `n − 1` case reading the root at infinity. Acceptance: `formDiscr 4` of the
cubic `4X³ + b₂X² + 2b₄X + b₆` is `16 · disc` of that cubic (the quartic form has a root at
infinity).
*Prerequisites:* Mathlib `Polynomial.discr`, `resultant_eq_prod_roots_sub`, `MvPolynomial.aeval`.

### 0.2 The model and the weighted-projective curve

Define `Model R g` (convention 1) with its coefficient projections, `map` along ring
homomorphisms, `baseChange`, and the **Weierstrass form** `G = 4f + h²` of degree `≤ 2g + 2`.
Define the weighted-projective scheme `W.toScheme` as the closed subscheme of `ℙ(1, g+1, 1)_R`
(Mathlib's `Proj` of the graded ring `R[x, y, z]` with weights `1, g+1, 1`) cut out by
`y² + h(x, z) y − f(x, z)`, with its two affine charts `z = 1` and `x = 1` glued along
`x = 1/x'`, `y = y'/x'^{g+1}` — the gluing is the change of coordinates
`([[0, 1], [1, 0]], 1, 0)` of convention 5. Prove the chart description, that `W.toScheme → Spec R`
is projective and flat with geometrically connected fibres of dimension 1, and that the points
over a field `k` are the affine solutions together with the points at infinity of convention 1.
Define the degree-2 morphism `π : W.toScheme → ℙ¹_R`, `(x : y : z) ↦ (x : z)`.
*Prerequisites:* Mathlib `AlgebraicGeometry.Proj`, `ProjectiveSpectrum`; the
[Jacobian challenge](../JacobianChallenge/README.md) Layer A for the curve vocabulary.

### 0.3 The discriminant and smoothness

Define `Model.Δ := universalΔ g` evaluated at the coefficients, where `universalΔ g` is the unique
integer polynomial in the coefficients of `(f, h)` with
`2^{4(g+1)} · universalΔ g = universalDiscr (2g+2) ∘ (coefficients of 4f + h²)`; existence of this
integral quotient is the first theorem (it is Igusa's integrality of `J₁₀` in genus 2 and
Lockhart's in general, proved by showing `disc_{2g+2}(4f + h²) ≡ 0 mod 2^{4(g+1)}` in
`ℤ[f_i, h_j]`). Prove `Δ(f, 0) = 2^{4g} formDiscr (2g+2) f`, `Δ` is compatible with `map`, and the
**smoothness criterion**: over a field `k`, `W.toScheme` is smooth over `k` iff `Δ ≠ 0`, iff (when
`char k ≠ 2`) the binary form `4f + h²` of degree `2g + 2` has `2g + 2` distinct roots in `ℙ¹(k̄)`,
i.e. is separable of degree `≥ 2g + 1` (not merely squarefree: over `𝔽₅(t)` the form `x⁵ − t` is
squarefree with `Δ(y² = x⁵ − t) = 2⁸ · 5⁵ t⁴ = 0`),
iff (when `char k = 2`) the system `h(x, z) = 0`, `h'(x, z) y = f'(x, z)` (partials in `x` and in
`z`) has no solution on the curve over `k̄`. State `IsSmooth W := IsUnit W.Δ` and prove it is the
right notion over a Dedekind base (fibrewise smoothness). Geometric integrality of a smooth model
and `g ≥ 1 ⇒` the curve is not rational follow.
*Prerequisites:* 0.1, 0.2; Mathlib `AlgebraicGeometry.Smooth`, the Jacobian criterion.

### 0.4 The function field and the bridge to the algebraic curves roadmap

For a field `k` define `W.equationPolynomial := X² + C(h) X − C(f) ∈ (RatFunc k)[X]` (with
`f, h` mapped into `RatFunc k`) and `W.FunctionField := AdjoinRoot W.equationPolynomial`. Prove:
for a smooth `W` with `g ≥ 1`, `equationPolynomial` is irreducible (so `FunctionField` is a field
with `[FunctionField : k(x)] = 2`), `TauCeti.IsFunctionField k W.FunctionField`, the constant field
is exact (Mathlib's `IsIntegrallyClosedIn k W.FunctionField`), and **`TauCeti.genus k W.FunctionField = g`**
— in characteristic `≠ 2` by `TauCeti.genus_eq_of_sq_eq` applied to the squarefree part of
`4f + h²` after completing the square, in characteristic 2 by the Artin–Schreier genus formula of
the [algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 10 (on Tau Ceti main as
`two_mul_genus_add_two_eq_sum_of_sq_sub_self_eq`). Hence for `g ≥ 2`,
`TauCeti.IsHyperellipticFunctionField k W.FunctionField`. Prove `W.toScheme ≅ twoChartModel` of `W.FunctionField` for smooth `W` (both are
the regular proper model of the function field, Tau Ceti main's `Scheme.isoTwoChartModel`; the two
charts `z = 1`, `x = 1` are the two holomorphy rings), so that the dictionary between the closed
points of `W.toScheme` and `TauCeti.Place k W.FunctionField` is main's `equivPlace` (the
[algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 12 dictionary) transported, not
re-proved, and that the branch places of `x` are the Weierstrass points of convention 6. Conversely, every
hyperelliptic function field over `k` with a `k`-rational degree-2 map to `ℙ¹` is
`W.FunctionField` for a smooth model `W` (Tau Ceti main's
`IsHyperellipticFunctionField.exists_squarefree_sq_eq_aeval` away from characteristic 2; the
Artin–Schreier model in characteristic 2), and two models give `k`-isomorphic function fields iff
they are in the same `𝒢_g(k)`-orbit (proved in 1.3).
*Prerequisites:* 0.2, 0.3; Tau Ceti `IsHyperellipticFunctionField`, `genus_eq_of_sq_eq`,
`isIntegrallyClosedIn_of_sq_eq`; [algebraic curves roadmap](../AlgebraicCurves/README.md)
Layers 10, 12.

### 0.5 Genus 1 is Mathlib's Weierstrass curve

Define `ofWeierstrass : WeierstrassCurve R → Model R 1`, `W ↦ (X³ + a₂X² + a₄X + a₆, a₁X + a₃)`,
and `toWeierstrass` on models with `f` monic of degree 3 and `deg h ≤ 1`. Prove
**`(ofWeierstrass W).Δ = W.Δ`** (an identity of integer polynomials in `a₁, …, a₆`, verified
symbolically), `IsSmooth (ofWeierstrass W) ↔ W.IsElliptic`, and that the embedding
`VariableChange R → 𝒢_1(R)` of convention 5 is a group homomorphism intertwining the two actions.
Every elliptic statement of Layers 1 and 3 restricted along `ofWeierstrass` must agree with the
[elliptic curves roadmap](../EllipticCurves/README.md); this milestone is the contract.
*Prerequisites:* 0.3; Mathlib `WeierstrassCurve.Δ`, `VariableChange`.

### 0.6 Points, the involution and Weierstrass points

Define `W.AffinePoint` (pairs `(x, y)` with `y² + h(x) y = f(x)`), the points at infinity, and
`W.Point k` as the `k`-points of `W.toScheme`; the involution `ι` of convention 6 on points and
on the scheme, with `ι ∘ ι = id` and `π ∘ ι = π`; `ι` acts on `W.FunctionField` as the nontrivial
element of `Gal(FunctionField / k(x))`, i.e. the generator of `ker restrictAdjoinHom`. Define
`weierstrassPoints W ⊆ W.Point k̄` as the fixed points of `ι`, prove the description of
convention 6, `#weierstrassPoints = 2g + 2` in characteristic `≠ 2` (and `≤ g + 1` in
characteristic 2), the identification with Tau Ceti's `branchPlaces` through 0.4, and define
`numRationalWeierstrassPoints W k`. Prove: `deg(4f + h²) = 2g + 1` iff the point at infinity is a
rational Weierstrass point, and a model with a rational Weierstrass point is `𝒢_g(k)`-equivalent
to one with `f_{2g+2} = h_{g+1} = 0`.
*Prerequisites:* 0.2, 0.4; Tau Ceti `branchPlaces`, `card_branchPlaces`, `restrictAdjoinHom`.

## Layer 1: changes of coordinates, isomorphisms, automorphisms and twists

### 1.1 The group `𝒢_g`

Define `CoordChange R g`, the triples `(M, e, t)` with `M ∈ GL₂(R)`, `e ∈ R^×` and `t ∈ R[X]` of
degree `≤ g + 1`, with the multiplication of convention 5,
`(M₁, e₁, t₁) · (M₂, e₂, t₂) = (M₂M₁, e₁e₂, e₂ t₁ + t₂ ∘_{g+1} M₁)`, identity `(1, 1, 0)` and the
inverse this forces, and prove it is a group, that `(M, e, t) ↦ M` is an anti-homomorphism onto
`GL₂(R)` (so `(M, e, t) ↦ M⁻¹` is a homomorphism) with kernel the triples `(1, e, t)` (a
semidirect product `R[X]_{≤ g+1} ⋊ R^×`), that the scalar triples `Λ_g(R)` are central, and `map`
along ring homomorphisms. The **homogeneous substitution** `p ∘_n M := Σ_i p_i (aX + b)^i (cX + d)^{n−i}`
of 0.1 is the building block.
*Prerequisites:* Mathlib `Matrix.GeneralLinearGroup`.

**Checks.**

- (left action) — for the action of 1.2, `(C₁ · C₂) • W = C₁ • (C₂ • W)` and `(1, 1, 0) • W = W`;
  the order `M₂M₁` in the law is forced by this (with `M₁M₂` the first identity fails already for
  `t = 0`, `e = 1`).
- (involution) — for every model `W`, the triple `(1, −1, −h)` fixes `W` (`h' = −(−2h + h) = h`,
  `f' = f − h² + h² = f`) and is its own inverse.
- (scalars) — `(λ · 1, λ^{g+1}, 0) • W = W` for every `λ ∈ R^×` and every `W`, so the action of
  `CoordChange R g` on models is not faithful; over `ℚ`, `(5 · 1, 125, 0)` fixes 169.a.169.1.
- (genus 1) — the map `VariableChange R → CoordChange R 1`,
  `(u, r, s, t) ↦ ([[u², r], [0, 1]], u³, s u² X + t)`, is a group homomorphism for Mathlib's
  law, whose `r`-component `C.r · C'.u² + C'.r` is the upper-right entry of `M_{C'} M_C`.

### 1.2 The action and the transformation law

Define `C • W` by the formulas of convention 5, prove it is a left action of `𝒢_g(R)` on
`Model R g` (degree bounds included), that it commutes with `map`, that `(C • W).toScheme ≅
W.toScheme` over `R` by the coordinate formulas, and the **transformation law**
`Δ(C • W) = e^{−4(2g+1)} det(M)^{(2g+1)(2g+2)} Δ(W)`; in particular `IsSmooth` is invariant. Prove
that the simplified equation `y² = 4f + h²` of a model over a ring in which 2 is a unit is
`(1, 1/2, −h/2) • W` (convention 5 with `M = 1`, `e = 1/2`, `t = −h/2`), and that over `ℤ` it is
**not** obtained by an element of `𝒢_g(ℤ)`: its discriminant is `2^{4(2g+1)} Δ(W)` (`2^{20} Δ(W)` at
`g = 2`), which is why the simplified model is never minimal at 2 (acceptance: 169.a.169.1 below).
*Prerequisites:* 0.3, 1.1.

### 1.3 Isomorphisms are changes of coordinates

For smooth models `W₁, W₂` of genus `g ≥ 2` over a field `k`, prove that every `k`-isomorphism
`W₁.toScheme ≅ W₂.toScheme` is induced by some `C ∈ 𝒢_g(k)` with `C • W₁ = W₂`, unique up to the
scalar triples `Λ_g(k)` of convention 5: the
isomorphism carries the unique degree-2 rational subfield to the unique degree-2 rational
subfield (Tau Ceti `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`), so it covers an automorphism
`M ∈ PGL₂(k)` of `ℙ¹`, and the remaining freedom is `(e, t)`. Hence convention 7, and the
corollary that the `𝒢_g(k)`-orbit of a smooth model is the `k`-isomorphism class of its curve.
For `g = 1` prove the analogue for isomorphisms fixing the points at infinity, agreeing with
Mathlib's `VariableChange` through 0.5. Define `numRationalWeierstrassPoints` as an isomorphism
invariant (consequence).
*Prerequisites:* 0.4, 0.6, 1.2; Tau Ceti `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`; the
[algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 11 (`Aut(k(x)/k) ≅ PGL₂(k)`, on its
Layer 1 `ℙ¹` API).

### 1.4 Automorphism groups

Define `automorphismGroup W` as the quotient of `MulAction.stabilizer (𝒢_g k) W` by the scalar
triples `Λ_g(k)` (convention 9; the stabiliser contains `Λ_g(k)`, so it is infinite over an
infinite field and the quotient is the right object), and prove it is the automorphism
group of the curve (1.3), that it is **finite** for `g ≥ 2` (through 0.4 and Tau Ceti's
`finite_algEquiv_of_finrank_adjoin_eq_two` over `k̄`, then descent), that `ι` is central and
`Aut(C)/⟨ι⟩` injects into `PGL₂(k)` with image in the stabiliser of the set of Weierstrass points
(0.6), with equality over `k̄` in characteristic `≠ 2` (every Möbius map preserving the branch set
lifts), and hence that `#Aut(C_k̄)` is at most twice the order of the stabiliser in `PGL₂(k̄)` of
the set of Weierstrass points. Prove the criterion the `hgcwa` boundary needs: in characteristic `≠ 2`, a smooth
projective curve of genus `g ≥ 2` over `k̄` is hyperelliptic iff it has an involution with exactly
`2g + 2` fixed points (Riemann–Hurwitz for the quotient, the [algebraic curves
roadmap](../AlgebraicCurves/README.md) Layer 7; in characteristic 2 an involution has at most
`g + 1` fixed points, convention 6, and the criterion is that the quotient by an involution has
genus `0`). Define the
**reduced automorphism group** and prove the exact sequence `1 → ⟨ι⟩ → Aut(C) → Aut(C)/⟨ι⟩ → 1`
with the action of the quotient on `ℙ¹`.
*Prerequisites:* 0.6, 1.3; Tau Ceti `finite_algEquiv_of_finrank_adjoin_eq_two`, `branchPermHom`.

**Checks.**

- (169.a.169.1) — `Aut(C) ≅ C₆`, the diamond operators of `X₁(13)`, and `Aut(C_ℚ̄) ≅ D_{12}`, of
  order 12 (stored `aut_grp_label` `6.2`, `geom_aut_grp_label` `12.4`).
- (4096.b.65536.1) — `Aut(C) ≅ C₄`, generated by the class of `(x, y) ↦ (−1/x, y/x³)`, whose
  square is `ι`; `Aut(C_ℚ̄) ≅ GL₂(𝔽₃)` of order 48.
- (3125.a.3125.1) — `Aut(C) = ⟨ι⟩ ≅ C₂` over `ℚ`, while `Aut(C_ℚ̄) ≅ C₁₀`.
- (scalars) — the stabiliser of every model contains `Λ_g(k)`, which is infinite for `k = ℚ`; a
  definition that omits the quotient by `Λ_g(k)` gives an infinite group for 3125.a.3125.1
  and must be rejected.

### 1.5 Twists

Define the twist of a smooth model by a 1-cocycle of `Gal(k^{sep}/k)` in `Aut(C_{k^{sep}})`,
prove it is a smooth model over `k` with `k^{sep}`-isomorphic curve, and that this induces a
bijection between `H¹(k, Aut(C_{k^{sep}}))` and `k`-isomorphism classes of twists (standard
Galois descent for quasi-projective varieties, with the 1.3 description of isomorphisms). Define
the **quadratic twist** `W_{t,n} = (D f − n h², t h)` of convention 15 over any ring, prove
`Δ(W_{t,n}) = D^{2(2g+1)} Δ(W)` (an identity of integer polynomials, through `4f' + h'² = D · G`
and the homogeneity of 0.1), that over a field with `θ² − tθ + n` separable irreducible `W_{t,n}`
is the twist by the cocycle `σ ↦ ι^{[σ(θ) ≠ θ]}` (the isomorphism over `k(θ)` is
`(x, y) ↦ (x, (t − 2θ) y − θ h(x))`, the substitution of Tau Ceti's `quadraticTwistOf`
docstring), and the exact `g = 1` bridge
`ofWeierstrass (E.quadraticTwistOf t n) = ([[1, 0], [0, D]], D, 0) • (ofWeierstrass E)_{t,n}`,
with `Δ_quadraticTwistOf` (`D⁶ Δ`) as its discriminant check. Prove that `Aut(C) = ⟨ι⟩` implies
the twists of `C` are exactly its quadratic twists.
*Prerequisites:* 1.3, 1.4; Tau Ceti `quadraticTwistOf`; Mathlib `groupCohomology` `H¹` or the
explicit cocycle description.

## Layer 2: genus-2 invariants

### 2.1 Igusa–Clebsch invariants

Over an algebraically closed field of characteristic `≠ 2`, define `I₂, I₄, I₆, I₁₀` of a binary
sextic form `G` with roots `x_1, …, x_6` (roots at infinity handled by the form convention of
0.1) by the symmetrised root formulas of convention 8, with `I₁₀ = formDiscr 6 G`: writing `a₀` for
the leading coefficient and `(ij) := (x_i − x_j)²`,
`I₂ = a₀² Σ (12)(34)(56)`, `I₄ = a₀⁴ Σ (12)(23)(31)(45)(56)(64)`,
`I₆ = a₀⁶ Σ (12)(23)(31)(45)(56)(64)(14)(25)(36)` and `I₁₀ = a₀¹⁰ ∏_{i<j} (ij)`, each sum running
over the 15, 10 and 60 distinct products obtained by permuting the roots. Prove they are
polynomials in the coefficients of `G` with integer coefficients (symmetric-function expansion;
the formulas are those printed in Igusa 1960 §3 for `a₀ = 0` and Liu 1994 §2.2 in general), define
them as such over any ring in which 2 is a unit, with `I_{2k}(W) := I_{2k}(4f + h²)` for a
model, and prove **covariance**: `I_{2k}` is a projective invariant of degree `2k` of binary
sextics in the sense of Liu 1993 §1, i.e. homogeneous of degree `2k` in the coefficients
(`I_{2k}(λG) = λ^{2k} I_{2k}(G)`) with `I_{2k}(G ∘ M) = det(M)^{6k} I_{2k}(G)` for the homogeneous
substitution of 0.1; since `C = (M, e, t) ∈ 𝒢_2` sends `G` to `e^{-2}(G ∘ M)` (1.2),
`I_{2k}(C • W) = e^{-4k} det(M)^{6k} I_{2k}(W)`. Acceptance: at `k = 5` this is
`I₁₀(C • W) = e^{-20} det(M)^{30} I₁₀(W)`, the law of 1.2 through `I₁₀ = 2^{12} Δ`; and
`I₂(4G) = 16 I₂(G)`.
*Prerequisites:* 0.1, 1.2; Mathlib symmetric polynomials (`MvPolynomial.symmetricSubalgebra`).

**Checks.**

- (169.a.169.1) — `(I₂, I₄, I₆, I₁₀) = (8, 3172, 30056, −692224)` for
  `G = x⁶ + 4x⁵ + 6x⁴ + 2x³ + x² + 2x + 1`.
- (249.a.249.1, 2916.b.11664.1) — `(−216, 228, −18072, 1019904)` and
  `(−960, 25920, −7672320, −47775744)`; these and the previous values follow from the root
  formulas above.
- (discriminant) — `I₁₀ = formDiscr 6 (4f + h²) = 2^{12} Δ`: `−692224 = −2^{12} · 169` for
  169.a.169.1.
- (root at infinity) — 3125.a.3125.1 has the quintic form `G = 4x⁵ + 1` and
  `(I₂, I₄, I₆, I₁₀) = (0, 0, 0, 12800000)`, with `12800000 = 2^{12} · 5⁵`.
- (homogeneity) — `I₂(4G) = 16 I₂(G)`.

### 2.2 Igusa invariants `J₂, …, J₁₀`

Define `J₂, J₄, J₆, J₈, J₁₀ : Model R 2 → R` over any commutative ring as Igusa's integral
polynomials in the coefficients of `(f, h)` (Igusa 1960 §3; Liu 1993 §1 gives the recipe: compute
on the Witt-vector lift `4P̃ + Q̃²` and reduce), prove the characterisation of convention 8 over
`ℤ[1/2]` (so the definition is forced), `J₁₀ = Δ` (0.3), the relation `J₂J₆ − J₄² = 4J₈`, the
weights (`J_{2k}(C • W) = e^{-4k} det(M)^{6k} J_{2k}(W)`), and Liu's auxiliary invariants
`I₄' := J₂² − 24 J₄` (Liu writes it `I₄`; it is `I₄/4` for the Igusa–Clebsch `I₄` of 2.1, and the
prime keeps the two apart) and `I₁₂ := −8 J₄³ + 9 J₂ J₄ J₆ − 27 J₆² − J₂² J₈`, used by his reduction
criteria (Liu 1993 eq. (2)).
*Prerequisites:* 0.3, 1.2, 2.1; Mathlib `WittVector` for the characteristic-2 construction, or
the direct integral formulas.

**Checks.**

- (169.a.169.1) — `(J₂, J₄, J₆, J₈, J₁₀) = (1, −33, −43, −283, −169)`, with
  `J₂J₆ − J₄² = −1132 = 4J₈`, `8J₂ = I₂ = 8` and `96J₄ = −3168 = 4J₂² − I₄`.
- (249.a.249.1) — `(−27, 28, −32, 20, 249)`, with `J₂J₆ − J₄² = 864 − 784 = 4 · 20`.
- (`J₁₀ = Δ`) — 3125.a.3125.1 has `(0, 0, 0, 0, 3125)` and `Δ = 5⁵`.
- (characteristic 2) — the reduction `y² + y = x⁵` over `𝔽₂` has `(J₂, …, J₁₀) = (0, 0, 0, 0, 1)`,
  the reduction of the integral values, although `I₂, …, I₁₀` are not defined over `𝔽₂`.

### 2.3 The Igusa point and its normal forms

Define the Igusa point `[J₂ : J₄ : J₆ : J₈ : J₁₀] ∈ ℙ(2, 4, 6, 8, 10)(k)` of a smooth genus-2 model
(well defined by 2.2 since `J₁₀ ≠ 0`), prove it is a `𝒢_2(k)`-invariant, hence an invariant of the
`k̄`-isomorphism class (1.3), that the covariance factor of 2.2 is `(e^{−4} det(M)^6)^k` on `J_{2k}`
(so the point also lives in `ℙ(1, 2, 3, 4, 5)`, where `(−1)^k J_{2k}` is the same point), and that
the LMFDB's stored representatives of convention 8 are functions of the point in
`ℙ(1, 2, 3, 4, 5)(ℚ)` (so `igusa_inv` and `igusa_clebsch_inv` are intrinsic once the normal form is
fixed; the normal-form rule itself is not a target).
*Prerequisites:* 1.3, 2.2.

### 2.4 Igusa's theorem: invariants classify geometric isomorphism classes

Over an algebraically closed field `k` of any characteristic: two smooth genus-2 models have the
same Igusa point iff their curves are isomorphic (Igusa 1960, Theorem 2 together with §3–§4: the
coarse moduli scheme of genus-2 curves over `ℤ` is the open subscheme `J₁₀ ≠ 0` of
`Proj ℤ[J₂, J₄, J₆, J₈, J₁₀]/(J₂J₆ − J₄² − 4J₈)`; Liu 1993 §0 and Théorème 2 for the same
statement over `ℤ`). State the comparison with the function-field side:
`W₁.FunctionField ≅ W₂.FunctionField` over `k̄` iff equal Igusa points.
*Prerequisites:* 1.3, 2.2, 2.3.

### 2.5 Absolute invariants

Define `absoluteInvariants W : Fin 3 → k` by the case split of convention 8, prove it is a
`k̄`-isomorphism invariant that determines the Igusa point when `J₂ ≠ 0` (and the point up to the
stated ambiguity otherwise). The LMFDB's `Twists` link searches on these three
numbers; the theorem that curves with the same `(g₁, g₂, g₃)` are `ℚ̄`-isomorphic, hence twists of
one another, is 1.5 with 2.4.
*Prerequisites:* 1.5, 2.4.

**Checks.**

- (first branch, `J₂ ≠ 0`) — 169.a.169.1 gives `(g₁, g₂, g₃) = (−1/169, 33/169, 43/169)`.
- (first branch) — 4096.b.65536.1 gives `(50000, 3750, −125)`; 249.a.249.1 gives
  `(−4782969/83, −183708/83, −7776/83)`.
- (third branch, `J₂ = J₄ = 0`) — 3125.a.3125.1 gives `(0, 0, J₆⁵/J₁₀³) = (0, 0, 0)`.
- (geometric only) — `y² = x⁶ + 1` and 2916.b.11664.1 have the same Igusa point, hence the same
  absolute invariants, and are not `ℚ`-isomorphic (Boundary checks).

### 2.6 Automorphism groups of genus-2 curves

Over an algebraically closed field `k`, prove the classification of `Aut(C)` for a smooth genus-2
curve, as a theorem whose proof is the case analysis of the reduced group acting on the six
Weierstrass points (Igusa 1960 §8, the six cases (1)–(6) with their Rosenhain normal forms; Bolza
1887 in characteristic 0), together with the invariant-theoretic recognition of each stratum
(Liu 1993 §4.1; the `J`-conditions printed there for `C₀ : y² = x⁵ − x` and `C₁ : y² = x⁵ − 1` in
characteristic `≠ 5`):

- `char k ∉ {2, 3, 5}`: `Aut(C)` is one of `C₂` (reduced group trivial; the generic curve), `C₂²`
  (reduced `C₂`; `Aut ≅ V₄`), `D_8` (reduced `V₄`), `D_{12}` (reduced `S₃`), `C₁₀` (reduced `C₅`;
  `y² = x⁵ − 1`, isomorphic to `y² + y = x⁵`), `C₃ ⋊ D_8` of order 24 (reduced `D_{12}`;
  `y² = x⁶ − 1`), `GL₂(𝔽₃)` of order 48 (reduced `S₄`; `y² = x⁵ − x`), and each occurs; the
  GAP identifiers the LMFDB prints are `[2,1], [4,2], [8,3], [12,4], [10,2], [24,8], [48,29]`.
- `char k = 5`: the three strata of orders 10, 24, 48 collapse to the single curve `y² = x⁵ − x`
  whose reduced group is `PGL₂(𝔽₅)` of order 120, so `#Aut = 240`; the other four groups persist
  (Igusa §8, “one modification”; Liu 1993, 4.1.4).
- `char k = 3`: the stratum of order 24 (reduced `D_{12}`) disappears (Igusa §8, case (4)); the
  remaining six occur.
- `char k = 2`: the reduced groups are trivial, `C₂`, `S₃`, elementary abelian of order 16
  (for the normal form `y² − y = x⁵ + αx³`), or the group of order 80 (for `y² − y = x⁵`), and
  `Aut` is the corresponding central extension by `⟨ι⟩` (Igusa §8: the normal forms
  `y² − y = αx + βx⁻¹ + γ(x − 1)⁻¹` with reduced group trivial in general, `C₂` in case (1′) and
  `S₃` in case (2′); `y² − y = x³ + αx + βx⁻¹` with trivial reduced group; `y² − y = x⁵ + αx³`
  with reduced group `(ℤ/2)⁴`, case (3′), and of order 80 for `α = 0`, case (6′); cases (4) and
  (5) disappear; Theorem 7).

Over a general field `k`, `Aut(C)` is the Galois-fixed subgroup of `Aut(C_{k̄})` under the
twisted action; prove the recognition of `Aut(C)` from the factorisation of `4f + h²` and the
action of `Aut(C_{k̄})` on roots, and give the acceptance examples below. The theorem is a finite
case analysis; it is proved, not stored.
*Prerequisites:* 1.4, 2.2, 2.4.

### 2.7 Field of moduli and Mestre's obstruction

For a smooth genus-2 curve over `k̄` with field of moduli `k` (the fixed field of the stabiliser
of its Igusa point) and `char k ∉ {2, 3, 5}`, construct Mestre's conic `L` and cubic `M` in
`ℙ²_k` with coefficients polynomial in `I₂, I₄, I₆, I₁₀` (Mestre 1991), and prove: if
`Aut(C) = C₂`, then `C` has a model over `k` iff `L` has a `k`-point, and when it does the double
cover of `L ≅ ℙ¹` branched along `L ∩ M` is such a model (Mestre 1991); if `Aut(C) ≠ C₂` and
`char k ≠ 2`, the field of moduli is a field of definition (Cardona–Quer 2005). Package this as
`exists_model_over_fieldOfModuli_iff` and the constructor `mestreModel`. Over a finite field every
curve is defined over its field of moduli (Wedderburn); over `ℚ` the obstruction is a quaternion
algebra class, and the worked suite includes a curve for which it vanishes. Prove from the
construction the surjectivity half of the moduli description of 2.4: every point of
`ℙ(2,4,6,8,10)(k̄)` with `J₁₀ ≠ 0` satisfying the `J₈` relation is the Igusa point of a smooth model
(Mestre's conic and cubic in characteristic `∉ {2, 3, 5}`, Igusa's normal forms of §8 otherwise).
*Prerequisites:* 2.1, 2.4, 2.6; Mathlib conics (`Mathlib/NumberTheory/...` quadratic forms in
three variables) or the explicit Legendre criterion over `ℚ`.

## Layer 3: integral and minimal models

### 3.1 Integral models over a discrete valuation ring

Over a DVR `R` with fraction field `K` (convention 10 without completeness where not needed),
define `Model.IsIntegral R W` (coefficients in `R`), prove every model over `K` is
`𝒢_g(K)`-equivalent to an integral one (scale by `(diag(1, π^{−m}), π^{−m(g+1)}, 0)`), that
`Δ` of an integral model lies in `R`, that an integral change of coordinates (`C ∈ 𝒢_g(R)`)
preserves integrality and leaves `v(Δ)` unchanged (`det M` and `e` are units), that an element
of `𝒢_g(K)` between integral models changes `v(Δ)` by a multiple of `2(2g+1)`.
*Prerequisites:* 1.2; Mathlib `IsDiscreteValuationRing`.

### 3.2 Minimal models exist

Define `Model.IsMinimal R W` as: integral, and for every `C ∈ 𝒢_g(K)` with `C • W` integral,
`v(Δ(W)) ≤ v(Δ(C • W))` (written division-free as `∃ r ∈ R, Δ(C • W) = r · Δ(W)`). Prove
existence of a minimal model in every `𝒢_g(K)`-orbit of smooth models (the valuations of `Δ` on
integral models form a nonempty set of naturals), and that `IsMinimal` at `g = 1` agrees with
Mathlib's `WeierstrassCurve.IsMinimal` through 0.5 (Mathlib minimises over `VariableChange`,
which is a proper subgroup of `𝒢_1(K)`; prove the two minima coincide because every element of
`𝒢_1(K)` preserving the point at infinity and integrality is a `VariableChange` up to `𝒢_1(R)`).
*Prerequisites:* 0.5, 3.1; Mathlib `WeierstrassCurve.exists_isMinimal`.

### 3.3 The minimal discriminant; uniqueness of minimal models

Any two minimal models of one curve have the same `v(Δ)` (both realise the minimum of 3.2), so
their discriminants differ by a unit of `R` by 3.1: define `minimalDiscriminantValuation R W : ℕ`
and `localMinimalDiscriminant R W : Ideal R`, prove independence of the model and invariance under
isomorphism, and the comparison `v(Δ(W)) = v(Δ_min) + 2(2g+1) · m` for every integral `W`, with
`m ∈ ℕ` the obstruction exponent (the analogue of the elliptic `12 fᵥ`). At `g = 1` this is Tau
Ceti's `localMinimalDiscriminant` and `obstructionExponentAt`. Prove the **uniqueness theorem**
where it is on record: at `g = 1` two minimal models are related by an element of `𝒢_1(R)`
(Silverman VII.1.3 (d) through 0.5), and at `g = 2` in residue characteristic `≠ 2` two minimal
models are related by an element of `𝒢_2(R)` (Liu 1994). No other milestone uses uniqueness in
residue characteristic 2: the invariants built on minimal models (`v(Δ_min)` here; the sign and
absolute value of `Δ_min` and the vector `J(W_min)` in 3.4) are shown intrinsic without it.
*Prerequisites:* 3.1, 3.2; the [elliptic curves roadmap](../EllipticCurves/README.md) Layer 4
(local minimal discriminant) for the `g = 1` comparison.

### 3.4 Global minimal models over `ℤ` and the obstruction class over a Dedekind domain

Over the fraction field `K` of a Dedekind domain `O`: define `IsGlobalMinimal O W` (minimal at
every height-one prime, through `Localization.AtPrime`), prove it implies integrality over `O`,
define the **minimal discriminant ideal** `∏_v 𝔭_v^{v(Δ_min,v)}` and the **defect ideal**
`∏_v 𝔭_v^{m_v}` of an integral model with the identity
`(Δ(W)) = 𝔇_{C/K} · 𝔍_W^{2(2g+1)}`, and the defect class `[𝔍_W] ∈ ClassGroup O`, independent of
the integral model. Prove: a global minimal model exists iff the defect class is trivial, hence
**always over a principal ideal domain**, in particular over `ℤ` (patch the local minimal changes
of coordinates `(M_v, e_v, t_v)` at the finitely many primes where they are not integral by the
Chinese remainder theorem, exactly as the
[elliptic curves roadmap](../EllipticCurves/README.md) Layer 4.5b does for `VariableChange`, with
`𝒢_g(O_v)` in place of `VariableChange O_v`; Lockhart 1994 and Liu 1994 for genus 2). Over `ℚ`
define `minimalDiscriminant W : ℤ` (with sign) and `absDiscriminant`, and prove that the sign
and absolute value of `Δ_min` are intrinsic: two global minimal models have equal `|Δ|` by
definition, and the law of 1.2 relates their discriminants by the positive rational
`e^{−4(2g+1)} det(M)^{(2g+1)(2g+2)}` (both exponents are even), so the signs agree. Prove likewise
in genus 2 that `(J₂, …, J₁₀)` of a global minimal model is independent of the model: the
covariance factor `μ = e^{−4} det(M)^6` of 2.2 is a positive rational with `μ⁵ = J₁₀'/J₁₀ = 1`.
This is the vector behind the LMFDB's `igusa_inv` (convention 8). At `g = 1` the defect class is
Tau Ceti's `weierstrassDefectClass`.
*Prerequisites:* 2.2, 3.3; Tau Ceti `IsGlobalMinimal`, `weierstrassDefectClass`; the
[elliptic curves roadmap](../EllipticCurves/README.md) Layers 4.5a–4.5b; Mathlib
`Ideal.quotientInfRingEquivPiQuotient` (the Chinese remainder theorem).

### 3.5 Reduction of a minimal model and good reduction

Over a DVR `R` with residue field `k`, define the reduction `W̃ : Model k g` of an integral model
and prove: for a minimal model, `W̃` is smooth iff `v(Δ) = 0`; define `HasGoodReduction R W` as
`v(Δ_min) = 0` (a property of the curve by 3.3), prove it is equivalent to the existence of a
smooth proper model of the curve over `R` with the given generic fibre (the smooth weighted
projective model of a minimal model with unit discriminant is one; conversely a smooth proper
model is unique and its generic-fibre hyperelliptic structure extends), and that good reduction
of the curve implies good reduction of its Jacobian (the Jacobian of the smooth model is an
abelian scheme, the [relative Jacobians roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md)
§2.2–2.3 and the [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§1.8). The converse fails (4.5 gives the criterion and the worked suite a witness).
*Prerequisites:* 3.3, 3.4; the two Jacobian roadmaps cited.

### 3.6 Bad primes of the curve and of the Jacobian

Over `ℚ`: `badPrimes W := {p : p ∣ Δ_min}`, which by 3.5 are exactly the primes of bad reduction of
the curve;
`conductor J` (the [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§5.4 at each `p`, assembled into a positive integer) has support contained in `badPrimes`, and
`p ∤ N` with `p ∣ Δ_min` happens exactly when the curve has bad but the Jacobian good reduction
(acceptance in 4.5). Prove Liu's **conductor–discriminant inequality in genus 2**: for every
prime `p`, `v_p(N) ≤ v_p(Δ_min)` (Liu 1994, *Conducteur et discriminant minimal de courbes de
genre 2*, Compositio Math. 94, main theorem), hence `N ∣ Δ_min`, the statement of the knowl
`g2c.conductor`; and the **Ogg-type formula fails** in genus 2 — `v_p(Δ_min) − v_p(N)` is not the
component count minus one — with a worked witness (Liu, loc. cit.).
*Prerequisites:* 3.4, 3.5; Néron models §5.4; the regular models of the
[stable reduction roadmap](../StableReduction/README.md) Layer 5 (Liu's proof compares `Δ_min`
with the Artin conductor of the minimal regular model).

### 3.7 Liu's reduction types from the Igusa invariants

Over a DVR `R` with fraction field `K` (any residue characteristic), define the **stable
reduction type** of a smooth genus-2 curve as the type (I)–(VII) of the geometric special fibre of
its stable model over the minimal extension where it exists (existence and uniqueness of the
stable model: the [stable reduction roadmap](../StableReduction/README.md) Layers 7–8; the seven
types are defined here, Liu's (I)–(VII): smooth; irreducible with one node; irreducible with two
nodes; three lines; two elliptic curves meeting at a point, smooth or not; one smooth and one
singular component; two singular components), and prove Liu's
**Théorème 1** (Liu 1993): with `ε = 1, 3, 4` according as `char k ∉ {2, 3}`, `= 3`, `= 2`,
`I₂ε := 12^{-1} J₂, J₆, J₈` respectively, and `I₄'`, `I₁₂` as in 2.2, the type is read
off the valuations of `J_{2i}^5 J₁₀^{-i}`, `J_{2i}^6 I₁₂^{-i}`, `I₄' I₁₂^{-1}`, `I₄'^ε I_{2ε}^{-2}`,
`J₁₀^ε I_{2ε}^{-5}`, `I₁₂^ε I_{2ε}^{-6}` exactly as the seven clauses state; in particular
**potentially good reduction iff `J_{2i}^5 / J₁₀^i ∈ R` for all `i`** (clause (I)), and the
modular invariants of the elliptic components in cases (V)–(VII) are given by the stated formulas.
Corollary (the knowl `g2c.g2_invariants`): the absolute invariants of 2.5 are `p`-integral at every
prime `p` where the curve has potentially good reduction, since clause (I) gives
`v_p(J_{2k}) ≥ k · v_p(J₁₀)/5` and the denominators of `g₁, g₂, g₃` are powers of `J₁₀`.
Prove also Liu's determination of the degree of the minimal extension `[L : K]` and, when `L/K`
is tame, the Namikawa–Ueno type of the minimal regular model and the component group `Φ` from the
tables of Liu 1994 §8 (Tables 2.1–3.4), as a theorem whose proof is a checked case table: the
input is the stable type with the thicknesses of its nodes and the Galois action, the output a
Namikawa–Ueno symbol and a finite abelian group. This is the content of `genus2reduction`.
*Prerequisites:* 2.2, 3.3; the [stable reduction roadmap](../StableReduction/README.md)
Layers 5–8; the [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.2 for `Φ`.

## Layer 4: cluster pictures (odd residue characteristic)

Throughout, `K` is as in convention 10 with `p` odd, `C : y² = f(x)` is a smooth model with
`h = 0` (every model is `𝒢_g(K)`-equivalent to one, as 2 is a unit; the invariants below are
isomorphism invariants by 4.3 so nothing depends on this choice), `ℛ` its root set, `c_f` its
leading coefficient, `g ≥ 2`.

### 4.1 Abstract cluster pictures and the cluster picture of a polynomial

Define `ClusterPicture X` for a finite type `X` (DDMM Definition 1.26): a set `Σ` of nonempty
subsets of `X` containing the singletons and `X`, pairwise nested or disjoint, with a depth
`d : Σ → ℚ` on clusters of size `> 1`, strictly increasing along inclusion; and isomorphism of
cluster pictures. Define, for a separable `f ∈ K[X]` with splitting field `L` and the extended
valuation `w` on `L`, `clusterPicture f : ClusterPicture ℛ` by convention 12: its clusters are
the nonempty sets `ℛ ∩ D` for the discs `D = {x ∈ L : w(x − z) ≥ d}` with `z ∈ L` and `d ∈ ℚ`, and
the depth of a cluster `𝔰` of size `> 1` is `d_𝔰 = min w(r − r')` over distinct `r, r' ∈ 𝔰`. Prove
it is a cluster picture. Prove the Galois action of `G_K` (and of `I_K`) on
`ℛ` permutes clusters preserving depth.
*Prerequisites:* Mathlib `Finset`, `Polynomial.rootSet`, `SplittingField`; the
[local fields and ramification roadmap](../LocalFieldsRamification/README.md) Layer 0 (the unique
extension of `v`), Layer 3 (inertia).

**Checks.**

- (169.a.169.1 at 13) — `ℛ` of depth 0, one cluster of size 3 and depth `1/3`, and the six
  singletons.
- (249.a.249.1 at 3) — `ℛ` of depth 0 with one twin of depth `1/2`.
- (3125.a.3125.1 at 5) — `ℛ` of depth `1/4` and its five singletons, no other cluster.
- (336.a.172032.1 at 3) — `ℛ` of depth `−1/2` with one child of size 4 at relative depth `1/2`
  (the LMFDB's stored picture).
- (4.10 on these pictures) — the discriminant formula of 4.10 gives `v(Δ) = 2, 1, 5, 1`
  respectively, the valuations of the discriminants above.

### 4.2 The vocabulary and the numerical invariants

Define children `𝔰' < 𝔰`, parent `P(𝔰)`, `𝔰 ∧ 𝔰'`, proper, even, odd, twin, cotwin, übereven,
principal (DDMM Definitions 1.3–1.5, 1.11), relative depth `δ_𝔰`, `ν_𝔰` (Definition 1.6),
`λ̃_𝔰 = ½(v(c_f) + |𝔰̃| d_𝔰 + Σ_{r ∉ 𝔰} d_{𝔰 ∧ r})` with `𝔰̃` the odd children (Notation 1.18),
`𝔰^*`, the centre `z_𝔰` and its existence (Definition 1.9, Appendix B), `θ_𝔰` and the sign
`ε_𝔰 : G_K → {±1}` with independence of the centre (Definition 1.12, Remark 1.13), and
`ξ_𝔰(a) = ord₂(denominator of |I_K / I_𝔰| · a)`. Prove the elementary identities the rest of the layer uses: the
number of odd and even children, `Σ_{r ∈ ℛ} d_{r ∧ 𝔰} = Σ_{𝔰' ≤ 𝔰}...` (the depth bookkeeping of
DDMM §16), and the integrality criterion for `y² = f(x − z)` (Theorem 13.3), which refines 3.1's
integrality for `h = 0` in odd residue characteristic.
*Prerequisites:* 4.1.

### 4.3 Isomorphic curves have equivalent cluster pictures

Define the equivalence of cluster pictures of DDMM Definition 14.1 (the moves induced by `𝒢_g`:
adding or removing a root at infinity, shifting all depths, redistributing the depth of a child
of `ℛ` of size `≥ g + 1`) and prove Theorem 1.27 (= Theorem 14.4, Corollary 14.7): `K`-isomorphic
curves have equivalent cluster pictures, and every abstract cluster picture equivalent to a
`Σ_C` is `Σ_{C'}` for a curve `C'/K̄` that is `K̄`-isomorphic to `C`. Prove that each invariant
defined in 4.4–4.12 is constant on equivalence classes (so it is an invariant of the curve), and
the balanced representative of Lemma 15.1.
*Prerequisites:* 1.2, 1.3, 4.2.

### 4.4 The semistability criterion

Define `SemistabilityCriterion C` (DDMM Definition 1.7): (1) `K(ℛ)/K` has ramification degree
`≤ 2`; (2) every proper cluster is `I_K`-invariant; (3) every principal cluster has `d_𝔰 ∈ ℤ` and
`ν_𝔰 ∈ 2ℤ`. Prove **Theorem 1.8 (1)** (= Theorem 10.3, via §7): `C` is semistable iff `Jac C` is
semistable iff the criterion holds, where semistability of the curve is the
[stable reduction roadmap](../StableReduction/README.md)'s `HasNodalReduction C 𝒪_K` (its Layer 7:
some proper flat model has a geometrically reduced nodal special fibre) and of the Jacobian the
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §3.1; the equivalent
formulations of Appendix C are proved as corollaries. Prove Theorem 1.8 (4): `C` is tame
(semistable over a tamely ramified extension) iff `K(ℛ)/K` is tame, and that this is automatic
for `p > 2g + 1`; this is `tame_reduction`.
*Prerequisites:* 4.2, 4.3; [stable reduction roadmap](../StableReduction/README.md) Layers 3, 7;
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §3.1, §3.10;
[local fields and ramification roadmap](../LocalFieldsRamification/README.md) Layer 3.

### 4.5 Good and potentially good reduction, potential toric rank

Prove the remaining clauses of DDMM Theorem 1.8: (2) `C` has good reduction iff `K(ℛ)/K` is
unramified, there is no proper cluster of size `< 2g + 1`, and `ν_𝔰 ∈ 2ℤ` for the unique
principal cluster; (3) `C` has potentially good reduction iff there is no proper cluster of size
`< 2g + 1`; (5) `Jac C` has good reduction iff `K(ℛ)/K` is unramified, every cluster `𝔰 ≠ ℛ` is
odd, and principal clusters have `ν_𝔰 ∈ 2ℤ`; (6) `Jac C` has potentially good reduction iff every
cluster `𝔰 ≠ ℛ` is odd; (7) the potential toric rank of `Jac C` is the number of even
non-übereven clusters other than `ℛ`, less 1 if `ℛ` is übereven; (8) `Jac C` has potentially
totally toric reduction iff every cluster has at most two odd children. Here good reduction of
`C` is 3.5 and of `Jac C` the Néron models roadmap §1.8/§5.1; potential toric rank is its §2.3
after base change. These are the fields `potential_good_reduction`,
`potential_good_jacobian_reduction` and `potential_toric_rank` of `cluster_pictures`; `depth` and
`size` of that table are `d_ℛ` and `|ℛ|`.
*Prerequisites:* 3.5, 4.4; [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.3, §3.1, §5.1.

### 4.6 The special fibre of the minimal regular model and its dual graph

For semistable `C`, prove DDMM Theorem 1.10 (= Theorem 8.5 with Proposition 5.5): the special
fibre of the minimal regular model over `𝒪_{K^{nr}}` consists of components `Γ_𝔰`, one for each
principal cluster, with normalisation `Γ̃_𝔰 : y² = c_𝔰 ∏_{odd 𝔬 < 𝔰}(x − red_𝔰(𝔬))`, linked by the
stated chains of `ℙ¹`s (lengths `δ_{𝔰'}/2 − 1`, `δ_{𝔰'} − 1`, `2δ_𝔱 − 1`); and Theorem 1.14
(= Theorem 9.3, Corollary 8.6): the rank of `H₁(Υ_C, ℤ)` is the number `#A` of even non-übereven
clusters other than `ℛ` (less 1 if `ℛ` is übereven), the component count
`m_C = Σ_{odd proper 𝔰 ≠ ℛ} δ_𝔰/2 + Σ_{even 𝔰 ≠ ℛ} 2δ_𝔰 + 1 − rk H₁`, the explicit basis `ℓ_𝔰`,
the length pairing (clause (4)) and the Galois action `σ(ℓ_𝔰) = ε_𝔰(σ) ℓ_{σ(𝔰)}` (clause (5)).
The minimal regular model is the [stable reduction roadmap](../StableReduction/README.md)
Layer 5's; the dual graph is its Layer 1's and `TauCeti.NumericalType` its Layer 6's; the
identification of
`H₁(Υ_C)` with the toric character lattice is the
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §4.2.
*Prerequisites:* 4.4; [stable reduction roadmap](../StableReduction/README.md) Layers 1, 5, 6;
Néron models §4.1–4.2.

### 4.7 The Galois representation

Prove DDMM Theorem 1.19 (= Theorem 10.1): `H¹_{ét}(C) = H¹_{ab} ⊕ H¹_t ⊗ Sp₂` with
`H¹_t = ⊕_𝔰 Ind_{G_𝔰}^{G_K} ε_𝔰 ⊖ ε_ℛ` over orbit representatives of even non-übereven
clusters and `H¹_{ab} = ⊕_𝔰 Ind_{G_𝔰}^{G_K} H¹(Γ̃_𝔰)` over principal non-übereven clusters, with
the `I_𝔰`-module structure `H¹(Γ̃_𝔰) ≅ γ̃_𝔰 ⊗ (ℚ_ℓ[𝔰̃] ⊖ 1) ⊖ ε_𝔰`. The toric–abelian decomposition
is the Néron models roadmap's toric–finite filtration of the Tate module (§3.5) with the Raynaud
extension (§3.13); the étale cohomology of the components is Tau Ceti's and the
`EtaleCohomologyFoundations` roadmap's.
*Prerequisites:* 4.6; Néron models §3.5, §3.13.

### 4.8 Tamagawa numbers

For semistable `C`, prove that the Tamagawa number `c = #Φ_{Jac C}(k)` is determined by the
lattice `H₁(Υ_C, ℤ)` with its length pairing and Frobenius action (DDMM Lemma 2.22 with the
Néron models roadmap's §4.5 cokernel description and the relative Jacobians roadmap's §4.1
rational-component map), give the general formula `c = #coker(Frob-invariants of the monodromy
map)` (Betts, *On the computation of Tamagawa numbers and the component group of Jacobians*,
specialised through 4.6), and in genus 2 the closed values of DDMM Table 8 column `c`
(`n`, `ñ`, `nm`, `nm̃`, `ñm̃`, `t = nm + nk + mk`, `t/d · d̃`, `n + 2k`, `3`, `1`, …, with
`ñ = 2` if `2 ∣ n` and `1` otherwise, `d = gcd(m, n, k)`) as a theorem proved from the lattice
types (DDMM Theorem 18.8 and its proof). The one-component case has `c = 1`.
*Prerequisites:* 4.6; [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.2, §4.5, §4.7; [relative Jacobians roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md)
§4.1, §4.4.

### 4.9 Conductor exponents

Prove DDMM Theorem 1.20 (= Theorem 11.3, Corollary 9.4) for the conductor exponent
`n_C = n_{tame} + n_{wild}` of the Néron models roadmap §5.4: (i)
`n_{wild} = Σ_{r ∈ S} (v(Δ_{K(r)/K}) − [K(r) : K] + f_{K(r)/K})` over representatives of the `G_K`-orbits of `ℛ`, the
discriminant and residue degree being those of the [local fields roadmap](../LocalFieldsRamification/README.md)
Layers 0 and 3 and the completed number-field roadmap's Layer 5 for a global prime; (ii)
`n_{tame} = 2g − dim H¹(C)^{I_K}` with `dim H¹^{I_K} = #(I_K\U) − #(I_K\V) − [|ℛ| and v(c_f) even]`
for the sets `U`, `V` of odd and of proper non-übereven clusters defined through `ξ` and `λ̃`;
(iii) for semistable `C`, `n_C = #A − [ℛ übereven]`, the potential toric rank of 4.5 (this is the
Néron models roadmap's §5.5 specialised). These are `ord(N)` in the local table; the wild term is
zero for `p > 2g + 1`.
*Prerequisites:* 4.4, 4.5, 4.6; Néron models §5.4–5.5; local fields Layers 0, 3; the Galois
representation of 4.7.

### 4.10 Discriminant, integrality and minimality from the picture

Prove DDMM Theorem 1.25 (= Theorem 16.2):
`v(Δ_C) = v(c_f)(4g + 2) + Σ_{proper 𝔰} d_𝔰(|𝔰|² − Σ_{𝔰' < 𝔰} |𝔰'|²)`, and for semistable `C` with `|k| > 2g + 1` the valuation of the minimal
discriminant `v(Δ_C^{min})` by the displayed formula with the correction `E`; Theorem 1.23
(= Theorem 17.2) and Corollary 1.24, the criteria for `y² = f(x)` to be a minimal Weierstrass
equation (in particular: if `f mod 𝔪` has at least two distinct roots, none of multiplicity
`> g + 1`, and unit leading coefficient, the equation is minimal); and the comparison of these
with 3.3 (same minimal discriminant). The LMFDB's `ord(Δ)` column is `v_p(Δ_min)`.
*Prerequisites:* 3.3, 4.2, 4.4.

### 4.11 Deficiency and the parity of `Ш`

Define `IsDeficient C` (convention 13) and prove DDMM Theorem 1.15 (= Theorem 12.4): a semistable
`C` is deficient iff `g` is even and one of the three listed cluster configurations holds (two odd
conjugate halves with odd relative depth; `ℛ` übereven with `ε_ℛ(Frob) = −1` and the stated
condition on non-übereven `𝔰` with `𝔰^* = ℛ`; `ℛ` a cotwin with übereven principal child `𝔯`,
`ε_𝔯(Frob) = −1` and the same condition). Over `ℝ`, prove that `C` is deficient iff `g` is
even and `C(ℝ) = ∅` (every real divisor class of a pointless real curve has even degree), which
for `y² = f(x)` means `f` has no real root and negative leading coefficient. Over `ℚ`, state the
Poonen–Stoll theorem as an
implication: if `Ш(J/ℚ)` is finite, its order is a square if the number of deficient places is
even and twice a square otherwise (Poonen–Stoll 1999 §8: the Cassels–Tate pairing of the
[heights roadmap](../HeightsRationalPointsAndObstructions/README.md) §3.17a and its parity
statement §3.18c); the LMFDB's
`has_square_sha` is the parity of the deficient-place count, defined here unconditionally.
*Prerequisites:* 4.6; heights roadmap §3.17a, §3.18c.

### 4.12 Root numbers

For semistable `C`, prove that the local root number of `Jac C` (the Néron models roadmap §5.4's
Weil–Deligne representation, with the local constant `WeilDeligneRep.epsilon` of the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §2.7)
is `w = ∏_{𝔰} (−ε_𝔰(Frob))` over `Frob`-orbits of even non-übereven clusters contributing a
Frobenius-stable loop, with the precise statement being: `w = (−1)^{a_+}` where `a_+` is the
multiplicity of the eigenvalue `+1` of `Frob` on `H₁(Υ_C, ℚ)`; in genus 2 the values are DDMM
Table 8 column `w` (`+` for good reduction and types `1 ⨯ 1`; `−` for `I_n^+`, `+` for `I_n^-`;
etc.). At an archimedean place `w = (−1)^g`. State the general (non-semistable, tame) root number
through the Galois representation of 4.7 as a milestone consuming the `ε`-factor of an induced
character from `ArtinRepresentations`. The LMFDB marks root numbers at `2` and at wild primes as
conditional on modularity; those are not claimed here.
*Prerequisites:* 4.6, 4.7; Néron models §3.5, §5.4; arithmetic Galois representations §2.7 (local
constants of Weil–Deligne representations); `ArtinRepresentations` Layer 6 (the finite-image case).

### 4.13 The classification of semistable genus-2 reduction types

Define the reduction type of a semistable curve (DDMM Definition 18.1: the dual graph of the
special fibre of the minimal regular model with Frobenius action and genera), prove Lemma 18.2
(it determines `n`, deficiency, `c`, `w`) and Theorem 18.4 (the cluster picture with Frobenius
and `ε` determines it), and in genus 2 prove Theorem 18.7 and Theorem 18.8: the complete list of
cluster pictures of semistable genus-2 curves (Table 7, with the Namikawa–Ueno types) and the
table of invariants `(m_C, H₁, n, w, c, Def, v(Δ_min))` (Table 8) — as a theorem whose proof is
the finite case analysis of DDMM §18, each row verified against 4.6–4.12. The rows of Table 8 are few enough
to prove outright; no stored table is a theorem. Prove also the local constancy Theorem 1.29
(= Corollary 19.3): perturbing `f` modulo `π^{d+1}` for `d` the largest depth leaves the cluster
picture, hence `H¹` (4.7), the conductor, the root number, semistability, the special fibre, the
Tamagawa number and deficiency, unchanged.
*Prerequisites:* 4.6–4.12.

## Layer 5: the Jacobian of a hyperelliptic curve

### 5.1 Two-torsion and the two-torsion field

For a smooth model over a field `k` of characteristic `≠ 2`, with `J = Jac C` (the
[Jacobian challenge](../JacobianChallenge/README.md)'s `JacobianVariety`, defined over `k` with no
rational-point hypothesis), define `twoTorsionRank W` as the `𝔽₂`-dimension `d` of `J(k)[2]`.
Prove the Galois-module isomorphism
`J[2](k^{sep}) ≅ {S ⊆ ℛ_∞ : |S| even}/{∅, ℛ_∞}` where `ℛ_∞` is the set of `2g + 2` Weierstrass
points (Mumford's description; Cassels–Flynn for `g = 2`), the divisor `Σ_{P ∈ S} P − (|S|/2) H`
with `H` the hyperelliptic class representing `S`. Hence `#J[2](k) = 2^{d}` where `2^{d+1}` is the
number of even `S ⊆ ℛ_∞` with `σ(S) ∈ {S, ℛ_∞ ∖ S}` for every `σ ∈ G_k` (the fixed points of the
quotient module; each class has the two representatives `S` and `ℛ_∞ ∖ S`). When `g` is even the
second alternative never occurs (`σ(S) = ℛ_∞ ∖ S` forces `|S| = g + 1`, odd), so `2^{d+1}` is the
number of Galois-stable even subsets: with `m` the number of `G_k`-orbits on `ℛ_∞` (the
irreducible factors of `4f + h²`, plus one for the point at infinity when the form has degree
`2g + 1`), `d = m − 1` if every orbit has even size and `d = m − 2` otherwise. For odd `g` the
stable count is too small: `y² = x⁸ − 2` over `ℚ` has one orbit of size 8, but
`x⁸ − 2 = (x⁴ − √2)(x⁴ + √2)` and the class of the four roots of `x⁴ − √2` is a rational point
of order 2 (acceptance). The **two-torsion field** `k(J[2])` is the splitting field of `4f + h²`
(and of `f` when `h = 0`), its Galois group embeds in `S_{2g+2}` (in `S_6 ≅ Sp₄(𝔽₂)` for `g = 2`),
and `J[2](k)` is an elementary abelian 2-group of rank `d ≤ 2g`. The LMFDB's `two_torsion_field`
is this field, stored as a number field of least degree with that Galois closure (for 169.a.169.1
the sextic `x⁶ − x⁴ − 2x³ + 2x + 1`, whose Galois closure is the degree-18 splitting field of
`G`), and `torsion_order` is even iff `d ≥ 1`.
*Prerequisites:* 0.6, 1.3; [Jacobian challenge](../JacobianChallenge/README.md) Layers D–F;
Mathlib `Polynomial.Gal`, `SplittingField`.

**Checks.**

- (irreducible form) — 169.a.169.1: `d = 0`, one orbit of size 6.
- (orbit count) — `d = 0` for 277.a.277.1 (orbits of sizes 1 and 5), `d = 1` for 249.a.249.1
  (sizes 1, 2, 3) and for 336.a.172032.1 (sizes 2 and 4).
- (root at infinity) — 4096.b.65536.1: `d = 3`, five orbits counting `∞`, and `J(ℚ)_tors ≅ (ℤ/2)³`.
- (odd genus) — `y² = x⁸ − 2` over `ℚ` (`g = 3`): `d ≥ 1`, though the only Galois-stable even
  subsets are `∅` and `ℛ_∞`; a definition counting stable subsets instead of classes fixed up to
  complement must be rejected.

### 5.2 The `x − T` descent and the 2-Selmer rank

Consume the [effective Diophantine methods roadmap](../EffectiveDiophantineMethods/README.md)
§3.23 for `deg f = 6` with `C(ℚ) ≠ ∅` and the
[heights roadmap](../HeightsRationalPointsAndObstructions/README.md) §1.12–1.14 for two-coverings
and Selmer sets, and prove the **odd-degree case** in the same shape: for `y² = f(x)` with `f`
separable of degree `2g + 1` over a number field `K` (no rational-point hypothesis; `∞` is a
rational Weierstrass point), `L = K[T]/(f)`, (a) `x − T : J(K) → L^×/L^{×2}` is a well-defined
homomorphism with kernel `2J(K)` (Schaefer 1995), (b) its image lies in the classes unramified
outside `S ⊇ {v ∣ 2∞ disc f}`, (c) the local images have the stated orders, (d) the resulting
bound `rank J(K) ≤ dim_{𝔽₂} Sel^{(x−T)} − dim_{𝔽₂} J(K)[2]`, with the comparison
`Sel^{(x−T)}(J/K) ≅ Sel₂(J/K)` when `f` has odd degree (Poonen–Schaefer 1997 for the general
cyclic-cover statement, Stoll 2001 for the algorithm). Define `twoSelmerRank J := dim_{𝔽₂} Sel₂(J/ℚ)`
as the heights roadmap's object (its §1.3) and prove `rank J(ℚ) ≤ twoSelmerRank − dim J(ℚ)[2]`, the
knowl `g2c.two_selmer_rank`. The `M = Aˣ/Aˣ²` and `normM` carriers of Tau Ceti's elliptic
`XSubT.lean` are the `g = 1` instance and the shape to follow.
*Prerequisites:* 5.1; effective Diophantine methods §3.23; heights roadmap §1.3–1.5,
§1.12–1.14; Tau Ceti `MordellWeil/XSubT.lean` (shape).

### 5.3 Good Euler factors in genus 2

For a smooth genus-2 model over `𝔽_q`, define `N_i = #C(𝔽_{q^i})` (points of 0.6 over
`𝔽_{q^i}`), and prove that the `L`-polynomial of the curve (the numerator `L_F` of the zeta
function of its function field, the function field arithmetic roadmap §5.3, consumed by name) is
`L(T) = 1 + a₁T + a₂T² + q a₁ T³ + q² T⁴` with `a₁ = N₁ − q − 1`,
`a₂ = (N₂ − q² − 1 + a₁²)/2`, and the explicit point-count formula
`N₁ = q + 1 + Σ_{x ∈ ℙ¹(𝔽_q)} χ(…)` — for `h = 0` and odd `q`, `N₁ = q + 1 + Σ_x (f(x)/𝔽_q)` with
the quadratic character and the usual treatment of infinity. For a curve over `ℚ` with good
reduction at `p` (3.5), prove `L_p(T) = L(T)` of the reduction, where `L_p` is the Euler factor of
the Jacobian (the Néron models roadmap §5.0c); this is `euler_factors`. Acceptance: the factors
of the worked suite.
*Prerequisites:* 0.6, 3.5;
[function field arithmetic roadmap](../FunctionFieldArithmetic/README.md) §5.1 (`pointCount_eq`),
§5.3 (`L_F`); [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §5.0b–5.0c.

### 5.4 Bad Euler factors at odd semistable primes

For `C` semistable over `K` (odd `p`), prove from 4.7 and the Néron models roadmap §5.6 that
`L_p(T) = det(1 − T·Frob | H¹^{I})` is
`∏_{𝔰 ∈ A/Frob, Frob-stable loops}(1 − ε_𝔰(Frob) T^{f_𝔰}) · ∏_{principal 𝔰} L(Γ̃_𝔰/k_𝔰, T^{f_𝔰})`,
the toric factor having degree the potential toric rank
and the abelian factor being the `L`-polynomials of the normalised components over their fields
of definition (orbits of length `f_𝔰`), so that `deg L_p = 2g − n_C`; the LMFDB's “tame
reduction?” column is computed as `deg L_p = 4 − v_p(N)`, and this milestone proves that
equality is equivalent to tameness at a semistable prime (and gives the witnesses where it is
not at additive primes). In genus 2 for type `I_n^±` the factor is `(1 ∓ T) · L(E, T)` with `E`
the normalised genus-1 component.
*Prerequisites:* 4.6, 4.7, 5.3; Néron models §5.6.

### 5.5 Local solvability of hyperelliptic models

For a smooth model over `ℚ`, define `isLocallySolvable W := ∀ v, C(ℚ_v) ≠ ∅` as the
[heights roadmap](../HeightsRationalPointsAndObstructions/README.md) §6.1 predicate
`IsLocallySoluble` on the curve of 0.2, and prove the hyperelliptic decision procedure: (a) over `ℝ`, `C(ℝ) ≠ ∅` iff
`4f + h²` takes a nonnegative value on `ℝ`, iff it has a real root or positive leading
coefficient (the test `web_g2c.py` runs); (b) over `ℚ_p` with `p ∤ 2Δ_min` and `p > 4g²`, the
Weil bound of the reduction gives a smooth `𝔽_p`-point and Hensel lifts it, so `C(ℚ_p) ≠ ∅`; (c)
over `ℚ_p` in general, `C(ℚ_p) ≠ ∅` is decided by a finite search of `x ∈ ℚ_p` modulo `p^m` with
`m` bounded explicitly in `v_p(Δ)` (Hensel's lemma for `y² + h y − f` in `y`, and for the
`x`-coordinate near multiple roots), so the predicate is decidable and
`nonSolvablePlaces W` is a computable finite set. Prove that a curve with a rational point, or a
rational Weierstrass point, or a rational point at infinity, is locally solvable.
*Prerequisites:* 0.6, 3.5, 5.3; heights roadmap §2.5, §6.1;
[scheme, stack, cohomology and intersection foundations roadmap](../SchemeAndStackFoundations/README.md)
§5.11 (`weil_bound_via_surfaces`); Mathlib `HenselianLocalRing`.

### 5.6 The conductor of a genus-2 Jacobian over `ℚ`

Assemble `conductor J := ∏_p p^{n_p}` from the Néron models roadmap §5.4 with 4.9 at odd
semistable primes and 4.9 (i)–(ii) at odd primes in general, prove `N ∣ Δ_min` (3.6), and the
Brumer–Kramer bounds for abelian surfaces `v₂(N) ≤ 20`, `v₃(N) ≤ 10`, `v₅(N) ≤ 9`, `v_p(N) ≤ 4`
for `p ≥ 7` (Brumer–Kramer, *The conductor of an abelian variety*, Compositio 92 (1994)), the
table of the knowl `g2c.conductor`, with the general bound `v_p(N) ≤ 2g + p·r + (p−1) λ_p(r)`
specialised to `g = 2`. The `tamagawa_product` is `∏_p c_p` with `c_p` from §2.2 (4.8 at odd
semistable primes).
*Prerequisites:* 3.6, 4.8, 4.9; Néron models §5.4.

### 5.7 The `L`-function of the Jacobian, the real period and the BSD quotient

The `L`-function of `J` is consumed from the
[periods, motivic `L`-values and special-value conjectures roadmap](../PeriodsAndSpecialValues/README.md):
PS.1.8's `Λ_1(J, s) = Λ(H¹(J), s)`, whose finite part `L(J, s)` is PS.1.1's Euler
product `∏_p P_p(p^{−s})^{−1}` with `P_p(T) = det(1 − T·Frob_p | H¹(J)^{I_p})`, absolutely
convergent on `Re s > 3/2`; PS.1.8's continuation predicate `SerreC9 J 1` (meromorphic
continuation of `Λ_1(J, s)` with `Λ_1(J, s) = w_1 N_1^{1−s} Λ_1(J, 2 − s)`, `w_1 = ±1`,
`N_1 ∈ ℤ_{>0}`); and PS.3.3's order `r` and leading coefficient `L^*` of a nonzero meromorphic
germ, applied to `H¹(J)(1)`, whose `s = 0` is `s = 1` for `L(J, s)`, with the germ supplied by
`SerreC9 J 1` (nonzero, since the Euler product does not vanish on `Re s > 3/2`). Prove the
local-factor bridge: `P_p = L_p` for every prime `p`, with `L_p` the good factor of 5.3 at good
`p` and, at bad `p`, the polynomial of the Néron models roadmap §5.6 (5.4 at odd semistable `p`);
hence on `Re s > 3/2`, `L(J, s)` is Mathlib's `LSeries` of the multiplicative coefficient
sequence `∏_p L_p(p^{−s})^{−1}` expands to, which is how the LMFDB's `euler_factors` and
`bad_lfactors` determine it. The hypothesis the knowls `g2c.hasse_weil_conjecture` and
`g2c.paramodular_conjecture` state is `SerreC9 J 1` with `N_1 = conductor J` (5.6) and
`w_1 = ∏_v w_v` (4.12); it is the content of modularity and is never proved here. Under
`SerreC9 J 1` the LMFDB's `analytic_rank` and `leading_coeff` are PS.3.3's `r` and `L^*` for
`L(J, s)` at `s = 1`.

Define unconditionally `realPeriod J := ∫_{J(ℝ)} |ω₁ ∧ ω₂|` for a `ℤ`-basis `ω₁, ω₂` of the
invariant-differential lattice of the Néron model of `J` over `ℤ` (the Néron models roadmap §1.9
for the global model and §1.11 for the lattice, free because `ℤ` is a principal ideal domain),
independent of the basis, and, under `SerreC9 J 1`, the **BSD quotient**
`analyticSha J := L^* · #J(ℚ)_tors² / (realPeriod J · Reg(J) · ∏_p c_p)` as the real number this
formula defines from the heights roadmap's regulator and torsion (§1.7–1.8, §1.18) and the
Tamagawa product of 5.6. The LMFDB's `real_period` and `analytic_sha` are these numbers; which
curves have the hypothesis as a theorem (`hasse_weil_proved`) is data, not mathematics owned here.
*Prerequisites:* 5.3, 5.4, 5.6; Néron models §1.9, §1.11, §5.6; heights roadmap §1.7–1.8, §1.18;
periods roadmap PS.1.1, PS.1.8, PS.3.3; Mathlib `LSeries`.

## Explicit scope exclusions

- Cluster pictures in residue characteristic 2, and 2-adic Tamagawa numbers, root numbers and
  conductor exponents of genus-2 curves beyond the general theory of the Néron models roadmap.
- The Mordell–Weil group, heights and regulators (the
  [heights roadmap](../HeightsRationalPointsAndObstructions/README.md)); the analytic
  continuation of `L(J, s)` and modularity, which 5.7 takes as the periods roadmap's predicate
  `SerreC9 J 1` and never proves.
- Endomorphism rings, Sato–Tate groups, Galois images (`SatoTateGroups`,
  `AdelicImagesAndModularCurves`).
- The LMFDB's choice of reduced minimal equation among the minimal ones (Stoll's reduction theory
  of binary forms) and the stored normal forms of convention 8; the set of minimal models and the
  invariants are Layers 2–3.
- Curves of genus `≥ 3` beyond what is uniform in `g`: the genus-3 invariants (Shioda), the
  Shaska–Völklein automorphism tables in higher genus, and the moduli of hyperelliptic curves as a
  stack.
- Superelliptic and cyclic covers `yⁿ = f(x)`, `n ≥ 3` (Poonen–Schaefer's general descent is cited
  only for the hyperelliptic case).
- Modular interpretations of specific genus-2 curves (`X₀(N)`, `X₁(N)` quotients) — the
  [modular curves roadmap](../ModularCurves/README.md) and `CanonicalModelsAndGonality`.

## Worked examples (acceptance criteria)

Every number below was computed from the stated equation (the discriminants, invariants, Euler
factors and factorisations with Sage, the cluster data from the `p`-adic factorisations and
Newton polygons, the `ε`-signs from the quadratic character of the cofactor at the node) or is
the LMFDB's stored value where marked. Models are written `y² + h(x) y = f(x)`.

**169.a.169.1** `y² + (x³ + x + 1) y = x⁵ + x⁴` (the modular curve `X₁(13)`).
`G = 4f + h² = x⁶ + 4x⁵ + 6x⁴ + 2x³ + x² + 2x + 1`, irreducible over `ℚ`. `Δ = −169 = −13²`
(0.3; `disc G = −692224 = −2^{12}·13²`). Igusa–Clebsch `(I₂, I₄, I₆, I₁₀) = (8, 3172, 30056,
−692224)` (2.1), Igusa `(J₂, J₄, J₆, J₈, J₁₀) = (1, −33, −43, −283, −169)` (2.2; primitive already,
and `J₂J₆ − J₄² = −43 − 1089 = −1132 = 4·(−283)`), absolute invariants
`(−1/169, 33/169, 43/169)` (2.5). No rational Weierstrass point, no real Weierstrass point, and
`G > 0` on `ℝ` so `C(ℝ)` has two components (0.6, 5.5). `Aut(C) ≅ C₆` — the diamond operators
`(ℤ/13)^×/{±1}` of `X₁(13)` — and `Aut(C_{ℚ̄}) ≅ D_{12}` (stored `aut_grp_label` `6.2`,
`geom_aut_grp_label` `12.4`; acceptance for 2.6). `J[2](ℚ) = 0` since `G` is irreducible
(5.1); `#J(𝔽₅) = L₅(1) = 19` is odd, consistent (stored `torsion_order` `19`). Good Euler factors (5.3):
`L₃ = 1 + 2T + T² + 6T³ + 9T⁴`, `L₅ = 1 − 7T² + 25T⁴`, `L₇ = 1 + 7T² + 49T⁴`,
`L₁₁ = 1 + 11T² + 121T⁴`. At `p = 13`: `G ≡ (x + 4)³(x³ + 5x² + 2x + 12) mod 13` and the Newton
polygon of `G(x + 9)` has slopes `−1/3` (three roots) and `0` (three roots), so the cluster
picture is `ℛ` of depth 0 with one child of size 3 and relative depth `1/3` and three singletons;
`v(Δ) = (1/3)(9 − 3) = 2` (4.10). The size-3 cluster is a proper cluster of size `< 5`, so `C` does
not have potentially good reduction, while every cluster `≠ ℛ` is odd, so `Jac C` has potentially
good reduction (4.5; the stable reduction is two elliptic curves with `j = 0` meeting at a
point); potential toric rank 0; `K(ℛ)/K` has ramification degree 3, so the semistability
criterion fails and the reduction is additive but tame (4.4). Conductor exponent 2 (4.9 (ii):
`U` has four inertia orbits, `V = {the size-3 cluster}`, `|ℛ|` and `v(c_f)` even, so
`dim H¹^{I} = 4 − 1 − 1 = 2`), conductor `169`, and `L₁₃ = 1 + 5T + 13T²` (stored) has degree
`2 = 4 − v₁₃(N)`. The simplified model `y² = G` has `Δ = 2^{20}·(−169)`
and is not minimal at 2 (1.2): minimality is tested on `(f, h)`.

**249.a.249.1** `y² + (x³ + 1) y = x² + x`. `G = x⁶ + 2x³ + 4x² + 4x + 1 = (x + 1)(x² + x + 1)
(x³ − 2x² + 2x + 1)`. `Δ = 249 = 3·83`, `(I₂, I₄, I₆, I₁₀) = (−216, 228, −18072, 1019904)`,
`(J₂, …, J₁₀) = (−27, 28, −32, 20, 249)`, `(g₁, g₂, g₃) = (−4782969/83, −183708/83, −7776/83)`.
One rational Weierstrass point (`x = −1`), two real ones. `J[2](ℚ) ≅ ℤ/2` (the conjugate pair
of roots of `x² + x + 1`; 5.1), consistent with `L₅(1) = 28`, `L₇(1) = 56`, `L₁₁(1) = 112` all
even (stored `torsion_order` `14`, `two_selmer_rank` `1`). The Jacobian has `End = ℤ` (LMFDB
`end_alg = ℚ`), so `Aut(C_{ℚ̄}) = C₂` (2.6). Cluster
pictures: at `3`, `G ≡ (x + 1)(x + 2)²(x³ + x² + 2x + 1)`, one twin of relative depth `1/2` in `ℛ`
of depth 0 (`v(Δ) = (1/2)(4 − 2) = 1`), the two roots conjugate over a ramified quadratic
extension, so the criterion holds and `C` is semistable of type `I₁` with toric rank 1 (4.4–4.6);
the node is split (`ε = +1`: the cofactor value `1` at `x = 1` is a square mod 3), so the type is
`I₁^+`: `c₃ = 1`, `w₃ = −1`, `n₃ = 1`, not deficient, `v₃(Δ_min) = 1` (Table 8). At `83`:
`G ≡ (x + 1)(x + 33)(x + 24)²(x² + x + 1)`, again `I₁^+` (cofactor `69` is a square mod 83):
`c₈₃ = 1`, `w₈₃ = −1`, `n₈₃ = 1`. Conductor `249`, Tamagawa product `1`, root number
`w_∞ w₃ w₈₃ = (+1)(−1)(−1) = +1`, matching the stored analytic rank 0. Euler factors
`L₅ = 1 + 2T² + 25T⁴`, `L₇ = 1 + T − 2T² + 7T³ + 49T⁴`; bad factors `L₃ = (1 − T)(1 + 3T + 3T²)`,
`L₈₃ = (1 − T)(1 + 83T²)` (stored; 5.4: the split node gives the factor `1 − T`, the normalised
genus-1 component the quadratic), of degree `3 = 4 − 1`, so “tame”.

**277.a.277.1** `y² + (x³ + x² + x + 1) y = −x² − x`. `G = x⁶ + 2x⁵ + 3x⁴ + 4x³ − x² − 2x + 1 =
(x + 1)(x⁵ + x⁴ + 2x³ + 2x² − 3x + 1)`. `Δ = 277`, `(I₂, I₄, I₆, I₁₀) = (−256, 5632, −611328,
1134592)`, `(J₂, …, J₁₀) = (−32, −16, 464, −3776, 277)`. One rational Weierstrass point;
`J[2](ℚ) = 0` (orbits of sizes 1 and 5; `L₃(1) = 15` is odd); `End = ℤ`, `Aut(C_{ℚ̄}) = C₂`. At
`277`: `G ≡ (x + 1)(x + 123)(x + 255)²(x² + 199x + 12)`, a twin of relative depth `1/2`, type
`I₁`, and the cofactor value `153` is **not** a square mod 277, so `ε = −1`, type `I₁^−`:
`c₂₇₇ = ñ = 1`, `w₂₇₇ = +1`, `n = 1`, `L₂₇₇ = (1 + T)(1 − 8T + 277T²)` (stored; the non-split node
gives `1 + T`). Root number `+1`, matching analytic rank 0 — this pair of
examples pins the sign convention of `ε` (4.6, 4.12): a split node gives `w = −1`.
`L₃ = 1 + T + T² + 3T³ + 9T⁴`, `L₅ = 1 + T − 2T² + 5T³ + 25T⁴`.

**3125.a.3125.1** `y² + y = x⁵`. `G = 4x⁵ + 1`, degree 5, so the point at infinity is the unique
rational Weierstrass point; `Δ = 2^{-12}·4²·disc(4x⁵ + 1) = 3125 = 5⁵`. `(I₂, I₄, I₆, I₁₀) =
(0, 0, 0, 12800000)`, `(J₂, …, J₁₀) = (0, 0, 0, 0, 3125)`, absolute invariants `(0, 0, 0)`. Over
`ℚ̄` the curve is `y² = x⁵ − 1` (Igusa's case (6)): `Aut(C_{ℚ̄}) = C₁₀`, GAP `[10,2]`; over `ℚ`,
`Aut(C) = C₂` (an automorphism fixes the unique rational Weierstrass point, so is affine in `x`,
and must fix the root sum and permute the roots of `4x⁵ + 1`, forcing `x ↦ x`) (2.6). `J[2](ℚ) = 0`;
`J(ℚ)_{tors} ≅ ℤ/5` (LMFDB), consistent with `L₃(1) = 10`, `L₇(1) = 50`, `L₁₁(1) = 125`. Good
Euler factors `L₃ = 1 + 9T⁴`, `L₇ = 1 + 49T⁴`, `L₁₁ = 1 + T − 9T² + 11T³ + 121T⁴` (5.3; the
supersingular shape at `p ≢ 1 mod 5` is the CM by `ℤ[ζ₅]`, the sibling `SatoTateGroups`' business).
At `5`: `G ≡ 4(x + 4)⁵`, the roots `ζ₅^i·r` with `r⁵ = −1/4` are pairwise at distance `1/4`, so the
picture is `ℛ` of depth `1/4` with five singletons; `v(Δ) = (1/4)(25 − 5) = 5` (4.10); no proper
cluster of size `< 5`, so potentially good reduction (4.5); `K(ℛ)/K` has ramification degree 20,
so not semistable, and wild (4.4): the LMFDB marks the root number at 5 as conditional, and 4.12
does not claim it. Conductor `5⁵` (stored; 4.9 (i)–(ii) must reproduce it) and `L₅ = 1` (stored), so
`deg L₅ = 0 ≠ 4 − 5` and the “tame reduction?” test of 5.4 fails, as it must at a wild prime.

**2916.b.11664.1** `y² + y = x⁶`. `G = 4x⁶ + 1`, `Δ = −11664 = −2⁴·3⁶`, `(J₂, …, J₁₀) =
(−120, 330, 320, −36825, −11664)`, `(I₂, I₄, I₆, I₁₀) = (−960, 25920, −7672320, −47775744)`. No
real Weierstrass point, `G > 0` on `ℝ`. Over `ℚ̄` the curve is `y² = x⁶ + 1` (Igusa's case (4)):
`Aut(C_{ℚ̄}) = C₃ ⋊ D_8` of order 24, GAP `[24,8]` (stored `geom_aut_grp_label` `24.8`), and over `ℚ`
`Aut(C) = ⟨ι, x ↦ −x⟩ ≅ C₂²` (stored `aut_grp_label` `4.2`) (2.6); the stored Sato–Tate identity
component `U(1)` is the sibling's. At `3`:
`G ≡ (x² + 1)³ mod 3`, two clusters of size 3 at relative depth `1/2` (the roots reducing to `i`
and to `−i`), swapped by Frobenius; `v(Δ) = 2·(1/2)(9 − 3) = 6 = v₃(Δ)` (4.10); `Jac C` has
potentially good reduction but `C` does not (4.5); not semistable (ramification degree of
`K(ℛ)/K` divisible by 6), wild at 3; conductor `2²·3⁶` (stored; stored local root numbers `w₂ = w₃ = −1`, both at primes
Layer 4 does not reach, with product `+1` against `w_∞ = +1`). Good factors
`L₅ = 1 + 10T² + 25T⁴`, `L₇ = 1 − 4T + 9T² − 28T³ + 49T⁴`.

**4096.b.65536.1** `y² = x⁵ − x` (the Bolza curve). `G = 4x⁵ − 4x`, `disc(x⁵ − x) = −256`,
`Δ = 2^8·(−256) = −65536 = −2^{16}`. `(I₂, I₄, I₆, I₁₀) = (−640, −20480, 1310720, −268435456)`,
`(J₂, …, J₁₀) = (−80, 480, 1280, −83200, −65536)`, `(g₁, g₂, g₃) = (50000, 3750, −125)`. Four
rational Weierstrass points (`0, ±1, ∞`), three real ones among the finite roots.
`Aut(C_{ℚ̄}) = GL₂(𝔽₃)` of order 48, GAP `[48,29]` (Igusa's case (5); the LMFDB's
`geom_aut_grp_label` for this curve is `48.29`); over `ℚ`, `Aut(C) ≅ C₄`, generated by
`(x, y) ↦ (−1/x, y/x³)`, whose square is `ι` (stored `aut_grp_label` `4.1`; 2.6 over a general
field). `J[2](ℚ) ≅ (ℤ/2)³` (`G` splits as
`x(x − 1)(x + 1)(x² + 1)` with the root at infinity: five orbits, four of odd size, so `d = 3`;
5.1), and this is all of `J(ℚ)_{tors}` (stored `torsion_subgroup` `(ℤ/2)³`; `L₃(1) = 8`). The only
bad prime is 2 (outside Layer 4), conductor `2^{12}`, Tamagawa product `4` and `w₂ = +1` (stored). Good factors `L₃ = 1 − 2T² + 9T⁴`,
`L₅ = 1 − 10T² + 25T⁴`, `L₇ = 1 + 14T² + 49T⁴`, `L₁₇ = 1 + 12T + 70T² + 204T³ + 289T⁴`.

**336.a.172032.1** `y² + (x³ + x) y = −x⁶ + 15x⁴ − 75x² − 56`.
`G = −3x⁶ + 62x⁴ − 299x² − 224 = −(3x² − 32)(x⁴ − 10x² − 7)`, `Δ = −172032 = −2^{13}·3·7`,
`(J₂, …, J₁₀) = (16916, −88822256, 277597802496, −798387183476800, −172032)`. No rational Weierstrass point, four real ones;
`J[2](ℚ) ≅ ℤ/2` (orbits of sizes 2 and 4). At `3` the leading coefficient is not a unit, so apply
`x ↦ 1/x` (1.2): the inverted form `−224x⁶ − 299x⁴ + 62x² − 3` has unit leading coefficient and
reduces to `x²·(x⁴ + x² + 2)`: one twin of relative depth `1/2`, type `I₁`, cofactor value `2` is
not a square mod 3, so `I₁^−`: `c₃ = 1`, `w₃ = +1` (stored), `n₃ = 1`, not deficient. At `7`:
`G ≡ 4x²(x² + 1)(x² + 4)`, twin of depth `1/2`, cofactor `2` is a square mod 7, so `I₁^+`:
`c₇ = 1`, `w₇ = −1`, `n₇ = 1`, not deficient (stored local root numbers `w₂ = −1`, `w₃ = +1`,
`w₇ = −1`, product `+1` with `w_∞`, the stored global root number). At `∞`, `C(ℝ) ≠ ∅` (two
ovals over `3.2645 < |x| < 3.2660`), not deficient; `C(ℚ₂) = ∅` (stored `locally_solvable`
false, `non_solvable_places = [2]`), as deficiency at `2` requires. The stored
analytic order of `Ш` is `2`, twice a square (`has_square_sha` false); by 4.11 and Poonen–Stoll
the number of deficient places is odd, so the deficiency predicate must evaluate to **true at
`2`**, the one place Layer 4 does not reach: this is the acceptance test of the 2-adic exclusion being an exclusion
and not a gap in the parity theorem. Conductor `2⁴·3·7` (stored; the odd part from 4.9).

**Boundary checks.**
- `y² = x⁵ − x³` has `Δ = 0` (double root at 0) and is rejected by `IsSmooth` (0.3); its
  function field has genus 1, not 2.
- `y² = x⁶ + 1` (`Δ = 2⁸ disc(x⁶ + 1) = −2^{14}·3⁶`) and `y² + y = x⁶` (2916.b.11664.1,
  `Δ = −2⁴·3⁶`) have the same Igusa point, so they are `ℚ̄`-isomorphic (2.4): the substitution
  `x = x'/∛2`, `y = (y' − 1)/2` carries `y² + y = x⁶` to `y'² = x'⁶ + 1` over `ℚ(∛2)`. They are
  **not** `ℚ`-isomorphic: over `𝔽₇` the first has `16` points and the second `4` (its `L₇`
  above has `a₁ = −4`), so no element of `𝒢_2(ℚ)` relates them (1.3); nor are they quadratic
  twists of each other, since a quadratic twist changes `a₁` to `−a₁` and `8 ≠ ±(−4)`. The twisting
  cocycle takes its values in the order-3 subgroup `⟨x ↦ ζ₃ x⟩` of `Aut(C_{ℚ̄})` (1.5): the general
  twist is not quadratic. The
  discriminant ratio `2^{10}` is the acceptance value of the composite law of 1.2 for the
  `𝒢_2(ℚ(∛2))`-element realising the isomorphism.
- The Weierstrass identity of 0.5: for `y² + a₁xy + a₃y = x³ + a₂x² + a₄x + a₆`,
  `2^{−8}·formDiscr 4 (4f + h²) = Δ_W` as polynomials in `a₁, …, a₆` (checked symbolically).
- A model over `ℚ₃` with `v(c_f) > 0` (336 at 3 above) may be read either way. The uninverted
  form has `v(c_f) = 1` and the picture `ℛ` of depth `−1/2` with one child of size 4 and relative
  depth `1/2` (the two roots of `3x² − 32` have valuation `−1/2`, the four roots of
  `x⁴ − 10x² − 7` are units at pairwise distance 0; this is the LMFDB's stored picture at 3), and
  4.10 gives `v(Δ) = 10 · 1 + (−1/2)(36 − 16 − 2) = 1`; the inverted form has `v(c_f) = 0` and a
  twin of relative depth `1/2`, giving `(1/2)(4 − 2) = 1`. The two pictures are equivalent by the
  depth-redistribution move of 4.3 (the child of size `4 ≥ g + 1` becomes the complementary
  twin), which is the test that 4.3's equivalence is implemented.
- `y² = x⁵ − 1` over `𝔽₅` is not smooth (`x⁵ − 1 = (x − 1)⁵`); over `𝔽₇` it is, with
  `Aut = C₁₀`; over `𝔽₁₁` (`11 ≡ 1 mod 5`) `Aut(C_{𝔽₁₁}) = C₁₀` already over the ground field.

## Ordering

```
Layer 0 (0.1 → 0.2 → 0.3 → {0.4, 0.5, 0.6})
   │
Layer 1 (1.1 → 1.2 → 1.3 → 1.4 → 1.5)
   ├──────────────────────┬──────────────────────────┐
Layer 2 (2.1 → 2.2 → 2.3 → 2.4 → {2.5, 2.6, 2.7})   Layer 3 (3.1 → 3.2 → 3.3 → 3.4 → 3.5 → 3.6)
   │                                                  │        3.7 needs 2.2 and 3.3
   │                                                  │
   └──────────────► Layer 4 (4.1 → 4.2 → 4.3 → 4.4 → 4.5 → 4.6 → {4.7, 4.8, 4.10, 4.11} → {4.9, 4.12} → 4.13)
                                                      │
                    Layer 5 (5.1 needs 1.3; 5.2 needs 5.1; 5.3 needs 3.5; 5.4 needs 4.7, 5.3;
                             5.5 needs 3.5, 5.3; 5.6 needs 3.6, 4.8, 4.9;
                             5.7 needs 5.3, 5.4, 5.6 and PS.1.1, PS.1.8, PS.3.3)
```

Layers 2 and 3 are independent of each other after Layer 1 and can proceed in parallel; 3.7 is
the one point of contact. Layer 4 needs Layer 3 only through 3.3 (minimal discriminant) and 3.5
(good reduction) and can start at 4.1–4.3 as soon as 1.3 exists. Within Layer 5, 5.1–5.2 depend
only on Layers 0–1, and 5.3 and 5.5 only on 3.5, so three lanes (invariants, local theory,
Jacobian) run concurrently once Layer 1 is in place.

## References

- J.-I. Igusa, *Arithmetic variety of moduli for genus two*, Ann. of Math. 72 (1960), 612–649.
  §3 (the invariants `J₂, …, J₁₀`), Theorem 2 (the moduli scheme), §8 (automorphism groups,
  Lemmas 8–9, cases (1)–(6), (1′)–(6′), Theorem 7). On disk in `references/`.
- Q. Liu, *Courbes stables de genre 2 et leur schéma de modules*, Math. Ann. 295 (1993), 201–222.
  §1 (invariants in every characteristic, the relation `J₂J₆ − J₄² = 4J₈`, `I₄`, `I₁₂`),
  Théorème 1 (stable reduction types from invariants), Théorème 2 and Corollaire 3.1–3.3 (the
  moduli scheme over `ℤ`), §4 (automorphism groups of stable genus-2 curves, 4.1.1–4.1.4 for the
  smooth case). On disk.
- Q. Liu, *Modèles minimaux des courbes de genre deux*, J. reine angew. Math. 453 (1994),
  137–164. §1 (the equation and `Δ`), §2 (affine and projective invariants, the explicit
  `J₂, J₄, J₆`, `J₁₀ = 2^{−12}disc`), §3 (the minimal extension), §4 (the tame case,
  Proposition 4.1.1), §8 Tables 2.1–3.4 (Namikawa–Ueno types and component groups). On disk.
- Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994),
  51–79. The inequality `v_p(N) ≤ v_p(Δ_min)` and the failure of Ogg's formula in genus 2.
- T. Dokchitser, V. Dokchitser, C. Maistret, A. Morgan, *Arithmetic of hyperelliptic curves over
  local fields*, Math. Ann. 385 (2023), 1213–1322 (arXiv:1808.02936). Definitions 1.1–1.7, 1.9,
  1.11, 1.12, 1.21, 1.26; Theorems 1.8, 1.10, 1.14, 1.15, 1.19, 1.20, 1.23, 1.25, 1.27, 1.28, 1.29;
  Lemma 2.22; Theorem 13.3; Lemma 15.1; Definition 18.1, Lemma 18.2, Theorems 18.4, 18.7, 18.8
  with Tables 7–8; Theorem 19.1. On disk.
- P. Lockhart, *On the discriminant of a hyperelliptic curve*, Trans. Amer. Math. Soc. 342
  (1994), 729–752. The discriminant `2^{4g} disc(f + h²/4)`, its transformation law, and global
  minimal models.
- J.-F. Mestre, *Construction de courbes de genre 2 à partir de leurs modules*, Effective Methods
  in Algebraic Geometry (MEGA 1990), Progr. Math. 94, Birkhäuser, 1991, 313–334. The conic and
  cubic, and the obstruction.
- G. Cardona, J. Quer, *Field of moduli and field of definition for curves of genus 2*,
  Computational Aspects of Algebraic Curves, Lecture Notes Ser. Comput. 13, World Scientific,
  2005, 71–83 (arXiv:math/0207015). Field of moduli is a field of definition when `Aut ≠ C₂`.
- O. Bolza, *On binary sextics with linear transformations into themselves*, Amer. J. Math. 10
  (1887), 47–70. The characteristic-zero automorphism classification.
- A. R. Booker, J. Sijsling, A. V. Sutherland, J. Voight, D. Yasaki, *A database of genus-2
  curves over the rational numbers*, LMS J. Comput. Math. 19 (2016), suppl. A, 235–254
  (arXiv:1602.03715). The LMFDB's conventions; the stored values quoted above.
- J. W. S. Cassels, E. V. Flynn, *Prolegomena to a Middlebrow Arithmetic of Curves of Genus 2*,
  LMS Lecture Note Series 230, Cambridge, 1996. The 2-torsion of a genus-2 Jacobian, Kummer
  surface, descent.
- D. Mumford, *Tata Lectures on Theta II*, Progr. Math. 43, Birkhäuser, 1984, Chapter IIIa
  (the 2-torsion of hyperelliptic Jacobians as even subsets of the branch set).
- E. F. Schaefer, *2-descent on the Jacobians of hyperelliptic curves*, J. Number Theory 51
  (1995), 219–232; E. V. Flynn, B. Poonen, E. F. Schaefer, *Cycles of quadratic polynomials and
  rational points on a genus-2 curve*, Duke Math. J. 90 (1997), 435–463 (Propositions 2, 3, 5 and
  Lemma 3, as the effective Diophantine methods roadmap cites them); B. Poonen, E. F. Schaefer,
  *Explicit descent for Jacobians of cyclic covers of the projective line*, J. reine angew. Math.
  488 (1997), 141–188; M. Stoll, *Implementing 2-descent for Jacobians of hyperelliptic curves*,
  Acta Arith. 98 (2001), 245–277.
- B. Poonen, M. Stoll, *The Cassels–Tate pairing on polarized abelian varieties*, Ann. of Math.
  150 (1999), 1109–1149, §8 (deficiency and the order of `Ш`).
- A. Brumer, K. Kramer, *The conductor of an abelian variety*, Compositio Math. 92 (1994),
  227–248. The conductor bounds.
- A. J. Best, L. A. Betts, M. Bisatt, R. van Bommel, V. Dokchitser, O. Faraggi, S. Kunzweiler,
  C. Maistret, A. Morgan, S. Muselli, S. Nowell, *A user's guide to the local arithmetic of
  hyperelliptic curves*, Bull. London Math. Soc. 54 (2022), 825–867 (arXiv:2007.01749); L. A.
  Betts, *On the computation of Tamagawa numbers and the component group of Jacobians*
  (arXiv:1808.05479). The cluster-picture notation the LMFDB's `cluster_pictures` table follows,
  and Tamagawa numbers from clusters.
- Y. Namikawa, K. Ueno, *The complete classification of fibres in pencils of curves of genus two*,
  Manuscripta Math. 9 (1973), 143–186. The types named in 3.7 and Table 7.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*, Oxford GTM 6, 2002. Chapters 7 (hyperelliptic
  curves, §7.4.3), 9 (regular and minimal models) and 10 (reduction of curves).
- J. H. Silverman, *The Arithmetic of Elliptic Curves*, 2nd ed., GTM 106, 2009, Chapters VII and
  VIII.8 (the genus-1 case every Layer-3 statement specialises to).
- S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models*, Ergebnisse (3) 21, Springer, 1990. The
  Néron model and component group that Layer 4 computes (consumed, not redone).
- H. Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254, Springer, 2009, §VI.2
  (hyperelliptic function fields; the source of Tau Ceti's pinned material).
