# Roadmap: hyperelliptic curves — Weierstrass models, genus-2 invariants, minimal models and cluster pictures

**Summary.** This roadmap builds the equation theory of hyperelliptic curves from polynomial
discriminants, algebraic function fields, and the supplied curve and Jacobian geometry. Its
end theorems classify genus-two curves by Igusa invariants, identify coordinate-change orbits
with isomorphism classes, establish minimal models, and recover reduction and arithmetic
invariants from equations and cluster pictures.

## Scope and ownership

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
the same thing. Mathlib's `WeierstrassCurve` is the genus-`1` sub-case with `f` monic cubic and
`deg h ≤ 1` (`ofWeierstrass`), and Layer 0 proves the two discriminants agree on it, so nothing
here forks the elliptic theory; general genus-1 models (quartic double covers, possibly without
rational points) need not be elliptic curves and stay outside that bridge.

Suggested home: `TauCeti/AlgebraicGeometry/HyperellipticCurve/`, with files `Model.lean` (the
carrier, the binary-form discriminant, smoothness), `FunctionField.lean` (the bridge to Tau Ceti's
`IsHyperellipticFunctionField`), `VariableChange.lean` (the group `𝒢_g` and the transformation
law), `Involution.lean`, `Twist.lean`, `Aut.lean`, `Genus2/Invariants.lean`, `Genus2/Igusa.lean`
(the isomorphism theorem), `Genus2/Automorphisms.lean`, `Genus2/Mestre.lean`,
`MinimalModel/Local.lean`, `MinimalModel/Global.lean`, `MinimalModel/Genus2.lean` (Liu),
ClusterPicture/Basic.lean, ClusterPicture/Semistability.lean, ClusterPicture/SpecialFibre.lean,
ClusterPicture/Invariants.lean (Tamagawa, conductor, root number, deficiency),
ClusterPicture/Genus2.lean (the classification table), `Jacobian/TwoTorsion.lean`,
`Jacobian/EulerFactor.lean`, `LocalSolvability.lean`, and `Examples/` for the worked suite.

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
  counts and the `L`-polynomial are the function field arithmetic roadmap's (§§5.1, 5.3, 5.6), consumed
  in Layer 5.3 here; the Weil bound is the scheme, stack, cohomology and intersection foundations
  roadmap's §5.11, consumed in 5.5; the Weil polynomial of the reduction is the sibling
  `CurvesOverFiniteFields` roadmap's, and the `av.fq` labels the LMFDB prints beside each good
  Euler factor are that sibling's and `AbelianVarietiesOverFiniteFields`'.
- **Labels, the choice of a reduced minimal equation among all minimal equations, the ordering of
  curves in an isogeny class, completeness of the database**: not targets. In
  particular the *set* of minimal equations (in genus `≥ 2` not a single `𝒢_g(ℤ)`-orbit) is
  Layer 3's; which representative the LMFDB prints is not.
- **Families of hyperelliptic curves with group actions** (the `hgcwa` `hyperelliptic` column —
  whether a generating vector gives a hyperelliptic curve): the sibling
  `GroupActionsOnRiemannSurfaces` roadmap; the equation-level criterion it needs (in characteristic `≠ 2`, a curve of genus
  `g ≥ 2` is hyperelliptic iff it has an involution with `2g + 2` fixed points, Layer 1.4) is
  supplied here.
- **The Artin conductor and local root number of a general Weil–Deligne representation**: the
  [arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) (§3 for
  the conductor, §2.7 `WeilDeligneRep.epsilon` for the local constant over finite extensions of ℚₚ),
  and AutomorphicLFunctionsAndLocalFactors §AL.3.10.3 for equal-characteristic local constants, on the
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
| `locally_solvable`, `non_solvable_places` | `C(ℚ_v) ≠ ∅` for all `v` | predicate: heights roadmap §6.1; hyperelliptic criteria: here 5.5 |
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
| `analytic_rank`, `leading_coeff`, `real_period`, `analytic_sha` | the order and leading coefficient of `L(J, s)` at `s = 1`, the real period, the BSD quotient | `L(J, s)`, its order and leading coefficient: periods roadmap PS.1.8, PS.3.3, with the local factors identified here in 5.7; `real_period` unconditionally and `analytic_sha` as an implication from `SerreC9 J 1` and holomorphy at 1: here 5.7 |
| `st_group`, `st_label`, `real_geom_end_alg`, `end_alg`, `geom_end_alg`, `is_gl2_type`, `is_simple_geom`, `ring_base`, `ring_geom`, `lattice`, `fod_*`, `spl_*` | endomorphisms, decomposition, Sato–Tate | `SatoTateGroups` |
| `non_maximal_primes`, `modell_image` | Galois images in `GSp₄(𝔽_ℓ)` | `AdelicImagesAndModularCurves` |
| `label`, `class`, `Lhash` | enumerative data beyond the prefix `(N, D)` | not a target (database convention) |

### Additional AlgebraicCurves ownership

AlgebraicCurves Layer 10 supplies squarefree and Artin–Schreier models, Weierstrass gaps and
the regular-differential basis; Layer 12 supplies the regular-proper curve/function-field
dictionary and its two-chart construction. These are consumed as roadmap targets, independently
of whether their implementations are available at the pins.

### Additional scope boundaries

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

## Conventions

1. **The carrier.** `Model R g` is a pair `(f, h)` of polynomials over a commutative ring `R`
   with `natDegree f ≤ 2g + 2` and `natDegree h ≤ g + 1`, for `g : ℕ` (the equation of a curve of
   genus `g`; `g = 0` and `g = 1` are allowed, and Mathlib's `WeierstrassCurve` is the genus-1
   sub-case `f` monic cubic, `deg h ≤ 1`, embedded by `ofWeierstrass` (0.5); a general genus-1
   model is a double cover of `ℙ¹` that need not have a rational point, e.g. `y² = −(x⁴ + 1)` over
   `ℝ`, smooth of genus 1 with no real point at all, which is no elliptic curve). The affine equation is `y² + h(x) y = f(x)`; the **weighted-projective
   model** is the curve `y² + h(x, z) y = f(x, z)` in `ℙ(1, g+1, 1)` with `h(x, z) = z^{g+1} h(x/z)`
   and `f(x, z) = z^{2g+2} f(x/z)`; the points at infinity are the points with `z = 0`, of which
   there are two, one or zero according as the quadratic `T² + h_{g+1} T − f_{2g+2}` has two,
   one or no roots in `k`. There is no second carrier for “curves with a rational
   Weierstrass point” (`deg f = 2g + 1`): that is the sub-case `f_{2g+2} = 0`, `h_{g+1} = 0`.
2. **The binary-form discriminant.** For `n ≥ 1`, `disc_n` is the universal discriminant of a
   binary form of degree `n`: the polynomial `universalDiscr n ∈ ℤ[a_0, …, a_n]` equal to
   Mathlib's `Polynomial.discr` of `a_n X^n + ⋯ + a_0` over `ℤ[a_0, …, a_n]`, evaluated at the
   coefficients of a polynomial `G` of degree `≤ n`. It is **not** `Polynomial.discr G`: for
   `n ≥ 2`, when `deg G = n − 1` the two differ by the square of the leading coefficient, and when
   `deg G ≤ n − 2` the form has a double root at infinity and `disc_n G = 0` while
   `Polynomial.discr G` need not vanish. At `n = 1` the convention is `disc_1 = 1` (Mathlib's
   `discr_of_degree_eq_one`), so `disc_1 G = 1` for every `G`, including constants, where
   `lc(G)² · discr G = lc(G)²`. `disc_n` is `GL₂`-covariant with weight `n(n−1)` and
   homogeneous of degree `2n − 2` in the coefficients (Layer 0.1).
3. **The discriminant of a model** is
   `Δ(f, h) = 2^{-4(g+1)} · disc_{2g+2}(4f + h²)`, which is a polynomial with **integer**
   coefficients in the coefficients of `f` and `h` (Layer 0.3); over a ring of characteristic 2
   it is this integral polynomial, not a division. This is Liu's normalisation in genus 2
   (`Δ = 2^{-12} disc(4P + Q²)` for `y² + Qy = P`, Liu 1994, *Conducteur et discriminant minimal*, §1.2, pp. 54–55), Lockhart's
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
   Both representatives are normal forms, which are not targets. What is here: the invariants
   themselves; primitive integral vectors in a rational weighted-scaling orbit, unique up to
   `λ = −1`, distinguished from rational points of the weighted projective scheme; and the vector `J(W_min)`, which is an invariant of the `ℚ`-isomorphism class
   (3.4) but **not** a function of the Igusa point, so neither is the stored `igusa_inv`:
   3125.a.3125.1 and its quadratic twist by 3 have the same Igusa point, while
   `v₃(J₁₀(W_min))` is `0` for the first and `10` for the second (the twist multiplies `J_{2k}` by
   a `k`-th power of `3²`, and no sign or scaling normalisation removes `3^{10}` from `J₁₀`).
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
12. **Cluster pictures** follow DDMM Definitions 1.1–1.7, 1.9, 1.11, 1.12 and 1.26: the
    roots `ℛ ⊂ K̄` of `G = 4f + h²` (of `f` when `h = 0`), a cluster is `ℛ ∩ D` for a disc
    `D = {x : v(x − z) ≥ d}`, its depth for `|𝔰| > 1` is `d_𝔰 = min_{r ≠ r' ∈ 𝔰} v(r − r')`.
    For proper clusters `𝔱 ⊊ 𝔰`, `d_𝔱 > d_𝔰`; relative depth is
    `δ_𝔰 = d_𝔰 − d_{P(𝔰)} > 0` for a proper non-root cluster. Set
    `ν_𝔰 = v(c_f) + Σ_{r ∈ ℛ} d_{r ∧ 𝔰}`, with the vocabulary twin, cotwin,
    even, odd, übereven, principal, `𝔰^*`, `𝔰 ∧ 𝔰'`, and, for `𝔰` even or a cotwin, the sign
    `ε_𝔰(σ) ≡ σ(θ_{𝔰^*})/θ_{(σ𝔰)^*} mod 𝔪 ∈ {±1}` for `θ_𝔰 = √(c_f ∏_{r ∉ 𝔰}(z_𝔰 − r))`, which
    restricts to a character of the stabiliser `G_𝔰`; for every other cluster `ε_𝔰 = 0` (the
    zero representation). The term `⊖ ε_ℛ` of 4.7 is present only when `ℛ` is übereven: a
    cotwin `ℛ` has `ε_ℛ = ε_{ℛ^*} ≠ 0` (its `ℛ^*` is the child of size `2g`, which is
    `G_K`-stable and has `(ℛ^*)^* = ℛ^*`) but nothing is subtracted for it, and a good quintic
    has `H¹_t = 0` (not of dimension `−1`). The sign of `θ_𝔰` is a choice; the invariants
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
16. **Targets.** This README contains every construction, API and Check.
    `Suggested.lean` states the headline theorems whose objects exist at the pins
    or need only the simple definitions retained there. Its module docstring names
    the remaining headlines and the missing constructions, including the geometric
    models, Igusa moduli and Mestre obstruction, cluster reduction dictionary and Jacobian.

## Exact supplier contracts

### From Mathlib

- Polynomials: `Polynomial` with `natDegree`, `coeff`, `eval`, `aeval`, `comp`, map,
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
  and action, `IsIntegral R W`, `IsMinimal R W`, `minimal`, `reduction`, HasGoodReduction,
  `HasMultiplicativeReduction`, `HasAdditiveReduction`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,Reduction}.lean`).
- `IsDiscreteValuationRing`, `IsDedekindDomain.HeightOneSpectrum`, `Localization.AtPrime`,
  `IsFractionRing`, `AddValuation`, `Valued`, `HenselianLocalRing`, `ClassGroup`,
  `IsAlgClosed`, `AlgebraicClosure`, `IsGalois`, `IntermediateField.fixingSubgroup`,
  `Module.finrank`, `ZMod`, `Submodule.torsionBy`.
- `Finset` combinatorics (`powerset`, `offDiag`, `inf'`) for the cluster-picture carrier, and
  `Nat.card`, `Fintype.card` for counts.

### From Tau Ceti

At the pin (`.lake/packages/TauCeti`):

- `TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.genus` (both arguments explicit, `genus k F`),
  exactness of constants as Mathlib's `IsIntegrallyClosedIn k F`, divisors, Riemann–Roch spaces, the different, Weierstrass gaps and weights
  (`TauCeti/FieldTheory/FunctionField/*`).
- `TauCeti.IsHyperellipticFunctionField` and its intrinsic characterisation
  `TauCeti.isHyperellipticFunctionField_iff_two_le_genus_and_exists_degree_eq_two_and_two_le_dim`;
  genus two is hyperelliptic away from characteristic 2 (`TauCeti.isHyperellipticFunctionField_of_genus_eq_two`,
  hypothesis `(2 : k) ≠ 0`)
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
- `TauCeti.AlgebraicGeometry.AbelianVariety` with baseChange, `dim`, isogenies
  (`TauCeti/AlgebraicGeometry/AbelianVariety/*`); `TauCeti.Model` over a discrete valuation ring,
  nodes and numerical types (`TauCeti/AlgebraicGeometry/Curves/*`).
- Binary forms of degree `w` as `homogeneousSubmodule (Fin 2) R w` with the substitution action
  `TauCeti.binaryFormRep` / `linearSubstRep (Fin 2) R w`
  (`TauCeti/NumberTheory/ModularForms/BinaryForms.lean`): the homogeneous substitution of 0.1 and
  1.1 is this action written on `R[X]_{≤ w}`.

### From named Tau Ceti roadmaps

- From [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md)
  §2.7: local epsilon constants over finite extensions of ℚₚ. From
  [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md)
  §AL.3.10.3, “Function-field local factors, multiplicity one and converse theorem”:
  the equal-characteristic Galois-to-Weil–Deligne adapter and local epsilon constants,
  with finite wild image, quasi-unipotent inertia, geometric Frobenius, a fixed nontrivial
  residue additive character and its self-dual measure. Layer 4.12 applies these to 4.7;
  the Artin conductor in either characteristic is ArithmeticGaloisRepresentations Layer 3's.

- From the [algebraic curves roadmap](../AlgebraicCurves/README.md): the function-field
  vocabulary at the pin (`TauCeti.IsFunctionField`, `TauCeti.Place`, `TauCeti.genus`,
  Mathlib's `IsIntegrallyClosedIn`, divisors, Riemann–Roch); its Layer 10 model class
  `TauCeti.IsHyperellipticFunctionField` with the intrinsic characterisation, the genus formula
  `TauCeti.genus_eq_of_sq_eq`, the ramified places `TauCeti.Place.one_lt_ramificationIdx_iff_of_sq_eq`,
  the branch places `TauCeti.branchPlaces` with `TauCeti.card_branchPlaces`, the uniqueness of the
  index-2 subfield `TauCeti.adjoin_eq_adjoin_of_finrank_adjoin_eq_two`, and its Layer 11
  finiteness `TauCeti.finite_algEquiv_of_finrank_adjoin_eq_two` (under `NeZero (2 : k)`) with the restriction
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
  types and the dual graph (its Layers 0–6), and the finiteness of the automorphism group of a
  stable geometric fibre (its Layer 3), which 1.4 applies to a smooth curve of genus `≥ 2` over
  `k̄` in every characteristic. Layer 4's special-fibre theorem identifies the
  minimal regular model of a semistable hyperelliptic curve; it does not construct regular models.
  Layers 7–8 supply a finite separable semistabilizing extension, compatibility with further
  extension and stable-model uniqueness; taking a Galois closure supplies the extension in §4.6.
- From the [Jacobian challenge](../JacobianChallenge/README.md): the Jacobian
  `JacobianVariety X hdim : AbelianVariety k` (Layers D–E; `Pic⁰` is representable with no
  `k`-point), the Abel–Jacobi map `abelJacobi X hdim x₀` of Layer F, which alone needs a rational
  point `x₀`, and the abelian variety carrier `TauCeti.AlgebraicGeometry.AbelianVariety` at the
  pin. Every statement about “the Jacobian of `C`” is about that object applied to the curve of a
  smooth model.
- From the [Néron models and semistable abelian varieties roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md):
  the Néron model and its component group `Φ_A` with rational and geometric points (its §2.2), the
  semistable reduction predicate (§3.1), the Picard–Néron identity comparison for semistable curves
  (§3.8–3.9), including the unpointed smooth-family abelian scheme (`smooth_case` in §3.8)
  and its Néron identification (§1.8), the monodromy pairing and the component group as its cokernel with the
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
  the local doubling indices `#(A(F)/2A(F))` at finite, real and complex places (§1.17),
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
  with `zeta_rationality` (§5.3), and Newton recovery of that numerator from the first g
  point counts with reciprocal symmetry (§5.6). Layer 5.3 applies them to the function field of a smooth genus-2
  model.
- From the [scheme, stack, cohomology and intersection foundations roadmap](../SchemeAndStackFoundations/README.md):
  the Weil bound `weil_bound_via_surfaces`, `|#C(𝔽_q) − (q + 1)| ≤ 2g√q` for a smooth projective
  geometrically irreducible curve of genus `g` over `𝔽_q` (§5.11), which 5.5 applies to the
  reduction.
- From the completed [number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md):
  the completions `v.adicCompletion K` as local fields and the local–global dictionary (Layer 5),
  which is how a global curve over `ℚ` is handed to the local layers at each prime.


## How to read the build

Layer 0 connects equations to function fields. Layer 1 supplies coordinate changes and
isomorphisms. Layer 2 develops genus-two invariant theory, while Layer 3 develops minimal
models and then uses those invariants for Liu's criterion. Layer 4 connects valued root
configurations to the supplied geometric reduction theory. Layer 5 connects these results
to Jacobian torsion, descent, local factors, local solubility, periods and the BSD quotient.
Each *Needs* line gives the statement's inputs and the inputs of the indicated proof route.

## Layer 0: Weierstrass models, the discriminant and the function field

### 0.1 The binary-form discriminant

Define `universalDiscr n : MvPolynomial (Fin (n+1)) ℤ` as `Polynomial.discr` of the universal
polynomial `Σ_i X_i · T^i` over `MvPolynomial (Fin (n+1)) ℤ`, and
`formDiscr n (G : R[X]) : R := aeval (fun i => G.coeff i) (universalDiscr n)` for any commutative
ring `R`. Prove: `formDiscr n G = Polynomial.discr G` when `natDegree G = n`;
`formDiscr n G = (G.leadingCoeff)² · Polynomial.discr G` when `natDegree G = n − 1` and `n ≥ 2`
(at `n = 1` the constant `G = 2` gives `formDiscr 1 2 = 1` but `2² · discr 2 = 4`, since Mathlib's
`discr_C` is `1`);
`formDiscr n G = 0` when `natDegree G ≤ n − 2` and `n ≥ 2`; `formDiscr n` is homogeneous of
degree `2n − 2` in the coefficients (`formDiscr n (C λ * G) = λ^{2n−2} formDiscr n G`); the
`GL₂`-covariance `formDiscr_homogSubst` `formDiscr n (G ∘ M) = det(M)^{n(n−1)} formDiscr n G` for the homogeneous
substitution `(G ∘ M)(X) = (cX + d)^n G((aX + b)/(cX + d))` (defined without division as
`Σ_i G_i (aX + b)^i (cX + d)^{n−i}`, which is Tau Ceti's `linearSubstRep (Fin 2) R n` acting on the
binary form with these coefficients, transported to `R[X]` by dehomogenisation — state this
comparison as a theorem); compatibility with ring homomorphisms; and over an
algebraically closed field the root formula `formDiscr n G = lc^{2n−2} ∏_{i<j}(r_i − r_j)²` when
`deg G = n`, with the `n − 1` case reading the root at infinity. Acceptance: `formDiscr 4` of the
cubic `4X³ + b₂X² + 2b₄X + b₆` is `16 · disc` of that cubic (the quartic form has a root at
infinity).
(Source: Mathlib `Polynomial.discr`, `Polynomial.resultant_eq_prod_roots_sub`,
`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`; expansion of the universal root product.)
*Needs:* Mathlib `Polynomial.discr`, `resultant_eq_prod_roots_sub`, `MvPolynomial.aeval`.


The API includes:

- Covariance has determinant weight n(n−1); coefficient scaling has weight 2n−2.
- Degree drop distinguishes a simple infinite root from a double infinite root and respects the n≥2 guard.

**Checks.**

- For the binary quadratic `X²−1`, the discriminant is 4; multiplying the form by 2 gives 16, not 8.
- For n=2 and the constant 2, the form discriminant is 0; for n=1 it is 1, not the degree-drop expression 4.
- Substituting `X↦2X` into `X²−1` gives `4X²−1`, with discriminant 16=`2²·4`; the identity substitution gives 4.

### 0.2 The model and the weighted-projective curve

Define `Model R g` (convention 1) with its coefficient projections, map along ring
homomorphisms, baseChange, and the **Weierstrass form** `Model.weierstrassForm`, `G = 4f + h²` of degree `≤ 2g + 2`.
Define the weighted-projective scheme W.toScheme as the closed subscheme of `ℙ(1, g+1, 1)_R`
(Mathlib's `Proj` of the graded ring `R[x, y, z]` with weights `1, g+1, 1`) cut out by
`y² + h(x, z) y − f(x, z)`, with its two affine charts `z = 1` and `x = 1` glued along
`x = 1/x'`, `y = y'/x'^{g+1}` — the gluing is the change of coordinates
`([[0, 1], [1, 0]], 1, 0)` of convention 5. Prove the chart description, that `W.toScheme → Spec R`
is projective and flat with geometrically connected fibres of dimension 1, and that the points
over a field `k` are the affine solutions together with the points at infinity of convention 1.
Define the degree-2 morphism `π : W.toScheme → ℙ¹_R`, `(x : y : z) ↦ (x : z)`.
*Needs:* Mathlib `AlgebraicGeometry.Proj`, `ProjectiveSpectrum`; the
[Jacobian challenge](../JacobianChallenge/README.md) Layer A for the curve vocabulary.


The API includes:

- Coefficient projections and ring maps respect the degree bounds and compose functorially.
- The two charts identify the affine and infinite fibres of the finite flat degree-two map.

**Checks.**

- At g=2, `(f,h)=(X⁵,1)` has degrees (5,0) within (6,3); `f=X⁷` fails the degree bound.
- At infinity the quintic model `y²+y=x⁵` has equation `Y²=0`, hence one geometric point; `y²=x⁶+1` has two over ℚ.
- Over ℝ, `y²=−x⁶−1` has infinity equation `Y²=−1`, hence no infinite point; counting two points for every sextic is incorrect.

### 0.3 The discriminant and smoothness

Define `Model.Δ := universalΔ g` evaluated at the coefficients, where `universalΔ g` is the unique
integer polynomial in the coefficients of the universal model `Model.universal` with
`2^{4(g+1)} · universalΔ g = universalDiscr (2g+2) ∘ (coefficients of 4f + h²)`; existence of this
integral quotient is `two_pow_mul_universalΔ` (it is Igusa's integrality of `J₁₀` in genus 2 and
Lockhart's in general, proved by showing `disc_{2g+2}(4f + h²) ≡ 0 mod 2^{4(g+1)}` in
`ℤ[f_i, h_j]`). Prove `Δ(f, 0) = 2^{4g} formDiscr (2g+2) f`, `Δ` is compatible with map, and the
**smoothness criterion** (`isSmooth_iff_separable` for its odd-characteristic algebraic form): over a field `k`, W.toScheme is smooth over `k` iff `Δ ≠ 0`, iff (when
`char k ≠ 2`) the binary form `4f + h²` of degree `2g + 2` has `2g + 2` distinct roots in `ℙ¹(k̄)`,
i.e. is separable of degree `≥ 2g + 1` (not merely squarefree: over `𝔽₅(t)` the form `x⁵ − t` is
squarefree with `Δ(y² = x⁵ − t) = 2⁸ · 5⁵ t⁴ = 0`),
iff (when `char k = 2`) the system `h(x, z) = 0`, `h'(x, z) y = f'(x, z)` (partials in `x` and in
`z`) has no solution on the curve over `k̄`. State `IsSmooth W := IsUnit W.Δ` and prove it is the
right notion over a Dedekind base (fibrewise smoothness). Geometric integrality of a smooth model
and `g ≥ 1 ⇒` the curve is not rational follow.
*Needs:* 0.1, 0.2; Mathlib `AlgebraicGeometry.Smooth`, the Jacobian criterion.


The API includes:

- The universal integral discriminant specialises under every coefficient-ring homomorphism.
- Its unit locus is exactly the smooth locus of the family; over fields the odd-characteristic criterion uses separability.

**Checks.**

- For `y²=x³−x`, Δ=64 and `disc₄(4x³−4x)=16384=2⁸·64`; reducing modulo 2 gives Δ=0.
- For `y²+y=x³`, Δ=−27, hence Δ=1 modulo 2; the characteristic-two definition must not divide by 2.
- For `y²=x⁵−t` over `𝔽₅(t)`, Δ=0 although `x⁵−t` is squarefree; separability excludes this example.

### 0.4 The function field and the bridge to the algebraic curves roadmap

For a field `k` define `W.equationPolynomial := X² + C(h) X − C(f) ∈ (RatFunc k)[X]` (with
`f, h` mapped into `RatFunc k`) and `W.FunctionField := AdjoinRoot W.equationPolynomial`. Prove:
for a smooth `W` with `g ≥ 1`, `irreducible_equationPolynomial` states irreducibility (so `FunctionField` is a field
with `[FunctionField : k(x)] = 2`), `isFunctionField_functionField` gives `TauCeti.IsFunctionField k W.FunctionField` and the constant field
is exact (Mathlib's `IsIntegrallyClosedIn k W.FunctionField`), and **`TauCeti.genus k W.FunctionField = g`**
(`genus_functionField`); the exact-constants and genus conclusions also apply at g=0
when irreducibility is supplied explicitly, as in their Lean signatures. The genus formula is proved
in characteristic `≠ 2` by `TauCeti.genus_eq_of_sq_eq` applied to the squarefree part of
`4f + h²` after completing the square, in characteristic 2 by the Artin–Schreier genus formula of
the [algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 10 (Artin–Schreier genus formula). Hence for `g ≥ 2`,
`isHyperellipticFunctionField` gives `TauCeti.IsHyperellipticFunctionField k W.FunctionField`. Prove the projective model of W is isomorphic to the supplied regular proper model of `W.FunctionField` for smooth `W` (both are
the regular proper model of the function field, AlgebraicCurves Layer 12; the two
charts `z = 1`, `x = 1` are the two holomorphy rings), so that the dictionary between the closed
points of W.toScheme and `TauCeti.Place k W.FunctionField` is the supplied closed-point/place equivalence (the
[algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 12 dictionary) transported, not
re-proved, and that the branch places of `x` are the Weierstrass points of convention 6.

The converse has two forms, and only the second produces a smooth model. (a) *Regular models.*
Every hyperelliptic function field `F` over `k` (Tau Ceti's predicate, which imposes no
geometric condition) is `W.FunctionField` for a model `W` whose weighted-projective model is
regular, though not necessarily smooth over `k`: away from characteristic 2 this is AlgebraicCurves Layer 10’s squarefree-model theorem (`h = 0`, `f` squarefree), in
characteristic 2 the Artin–Schreier model. (b) *Smooth models.* `F` is `W.FunctionField` for a
smooth model `W` iff the supplied regular proper model of `F` is smooth over `k`; since a
regular curve over a perfect field is smooth, over a perfect field every hyperelliptic function
field comes from a smooth model. Over an imperfect field (b) needs its hypothesis: over
`k = 𝔽₅(t)` the field of `y² = x⁵ − t` is hyperelliptic of genus 2 in Tau Ceti's sense
(`x⁵ − t` is squarefree, so `genus_eq_of_sq_eq` gives `2`), but over `k̄` the substitution
`x − t^{1/5} = z²`, `y = z⁵` shows it has genus 0, and a smooth model of genus 2 would keep genus 2
after base change (negative control; the model `y² = x⁵ − t` itself has `Δ = 0` by 0.3). Two
smooth models with g≥2 give `k`-isomorphic function fields iff they are in the same `𝒢_g(k)`-orbit (proved in
1.3).
*Needs:* 0.2, 0.3; Tau Ceti `IsHyperellipticFunctionField`, `genus_eq_of_sq_eq`,
`isIntegrallyClosedIn_of_sq_eq`; [algebraic curves roadmap](../AlgebraicCurves/README.md)
Layers 10, 12.


The API includes:

- The quadratic equation supplies a field for smooth positive-genus models and has exact constants.
- The supplied function-field genus equals g, and the regular-proper model comparison transports places and branch points.

**Checks.**

- The smooth model `y²+y=x⁵` in characteristic two has a separable degree-two function field and genus 2.
- The smooth cubic `y²=x³−x` over ℚ has genus 1; it fails the genus-at-least-two hyperelliptic predicate.
- Over `𝔽₅(t)`, `y²=x⁵−t` has arithmetic genus 2, but geometric normalisation `x−t^{1/5}=z²`, `y=z⁵` has genus 0; it fails the smooth-model converse.

### 0.5 Genus 1 is Mathlib's Weierstrass curve

Define `ofWeierstrass : WeierstrassCurve R → Model R 1`, `W ↦ (X³ + a₂X² + a₄X + a₆, a₁X + a₃)`,
and toWeierstrass on models with `f` monic of degree 3 and `deg h ≤ 1`. Prove
**`(ofWeierstrass W).Δ = W.Δ`** (`Δ_ofWeierstrass`) (an identity of integer polynomials in `a₁, …, a₆`, verified
symbolically), `IsSmooth (ofWeierstrass W) ↔ W.IsElliptic`, and that the embedding
`VariableChange R → 𝒢_1(R)` of convention 5 is a group homomorphism intertwining the two actions.
Every elliptic statement of Layers 1 and 3 restricted along `ofWeierstrass` must agree with the
[elliptic curves roadmap](../EllipticCurves/README.md); this milestone is the contract.
(Source: Mathlib `WeierstrassCurve.twoTorsionPolynomial_discr`,
`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:311`, with the binary degree-drop formula;
`WeierstrassCurve.variableChange_Δ`, `VariableChange.lean:218`.)
*Needs:* 0.3; Mathlib `WeierstrassCurve.Δ`, `VariableChange`.


The API includes:

- The monic-cubic embedding and its inverse identify the indicated subcase, including the mixed term.
- Discriminants agree and variable changes intertwine the two actions.

**Checks.**

- The cubic `y²=x³−x` gives Δ=64 in both definitions.
- The mixed cubic `y²+y=x³` gives Δ=−27 in both definitions, including after reduction modulo 2.
- The quartic `y²=−x⁴−1` has no real point, so it cannot be an image of a Weierstrass cubic with its rational point at infinity.

### 0.6 Points, the involution and Weierstrass points

Define W.AffinePoint (pairs `(x, y)` with `y² + h(x) y = f(x)`), the points at infinity, and
W.Point k as the `k`-points of W.toScheme; the involution `ι` of convention 6 on points and
on the scheme, with `ι ∘ ι = id` and `π ∘ ι = π`; `ι` acts on `W.FunctionField` as the nontrivial
element of `Gal(FunctionField / k(x))`, i.e. the generator of `ker restrictAdjoinHom`. Define
weierstrassPoints W ⊆ W.Point k̄ as the fixed points of `ι`, prove the description of
convention 6, `#weierstrassPoints = 2g + 2` in characteristic `≠ 2` (and `≤ g + 1` in
characteristic 2), the identification with Tau Ceti's `branchPlaces` through 0.4, and define
numRationalWeierstrassPoints W k. Prove: when `2 ≠ 0` in `k`, `deg(4f + h²) = 2g + 1` iff the
point at infinity is a rational Weierstrass point; when `2 = 0` in `k`, where `4f + h² = h²` carries
no information about `f`, a point at infinity is a Weierstrass point iff `h_{g+1} = 0` (the binary
form `h` vanishes at infinity), it is then the unique point at infinity, `T = √f_{2g+2}`, and it is
rational iff `f_{2g+2}` is a square in `k` (for `y² + y = x⁵` over `𝔽₂`, `h₃ = f₆ = 0`, so
infinity is a rational Weierstrass point while `4f + h² = 1` has degree 0, the negative control
for using the degree criterion in characteristic 2); and a model with a rational Weierstrass point is `𝒢_g(k)`-equivalent
to one with `f_{2g+2} = h_{g+1} = 0`.
*Needs:* 0.2, 0.4; Tau Ceti `branchPlaces`, `card_branchPlaces`, `restrictAdjoinHom`.


The API includes:

- The involution is of order two and preserves the degree-two map.
- Its fixed points are the geometric branch points; the rational count includes the infinity quadratic.

**Checks.**

- For `y²=x⁵−x` over ℚ, the rational branch points are −1,0,1 and infinity: the count is 4.
- For `y²+y=x⁵` over `𝔽₂`, there are no affine fixed points and one fixed point at infinity; total 1.
- At `(0,0)` on `y²+y=x⁵`, the involution gives `(0,−1)` and then `(0,0)`; in characteristic two it exchanges y=0 and y=1, so it is not the identity.

### Examples

The models `y²=x³−x` and `y²+y=x⁵` have discriminants 64 and 3125.
The latter remains smooth modulo 2, where its Weierstrass form becomes 1.

### Dependencies

Mathlib polynomial discriminants and scheme charts; AlgebraicCurves Layers 10–12;
JacobianChallenge Layer A. The elliptic bridge uses Mathlib’s Weierstrass curve.

## Layer 1: changes of coordinates, isomorphisms, automorphisms and twists

### 1.1 The group `𝒢_g`

Define `CoordChange R g`, the triples `(M, e, t)` with `M ∈ GL₂(R)`, `e ∈ R^×` and `t ∈ R[X]` of
degree `≤ g + 1`, with the multiplication of convention 5,
`(M₁, e₁, t₁) · (M₂, e₂, t₂) = (M₂M₁, e₁e₂, e₂ t₁ + t₂ ∘_{g+1} M₁)`, identity `(1, 1, 0)` and the
inverse this forces, and prove it is a group, that `(M, e, t) ↦ M` is an anti-homomorphism onto
`GL₂(R)` (so `(M, e, t) ↦ M⁻¹` is a homomorphism) with kernel the triples `(1, e, t)` (a
semidirect product `R[X]_{≤ g+1} ⋊ R^×`), that the scalar triples `Λ_g(R)` are central, and map
along ring homomorphisms. The degree-bound theorem `natDegree_homogSubst_le` supports the action. The **homogeneous substitution** `p ∘_n M := Σ_i p_i (aX + b)^i (cX + d)^{n−i}`
of 0.1 is the building block. The law is derived by composing the two coordinate substitutions
of convention 5, giving the opposite-composition convention. The coordinate shape for hyperelliptic and elliptic Weierstrass models is
Liu, *Global Weierstrass equations*, arXiv:2109.07318v3, Remark 3.6(a), p. 8
(over a field the Picard-group condition there is automatic); the division-free homogeneous
formulas define the group over any commutative ring and for every admitted g.
*Needs:* 0.1; Mathlib `Matrix.GeneralLinearGroup`; Tau Ceti `linearSubstRep`.

The API includes:

- Multiplication, inverse and identity satisfy the group laws, with the specified reversed matrix multiplication.
- Scalar triples are central and act trivially; matrix inversion converts the projection into a homomorphism.

**Checks.**

- Over ℚ, for `g=2`, `t₁=t₂=0`, `e₁=e₂=1`, take x-translation `M₁=[[1,1],[0,1]]`
  and x-dilation `M₂=[[2,0],[0,1]]`. On `f=x⁵−1`, both the product and successive
  model actions give `(2x+2)⁵−1`; reversing the matrices gives `(2x+1)⁵−1`.
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

Define `CoordChange.act`, written `C • W`, by the formulas of convention 5, prove it is a left action of `𝒢_g(R)` on
`Model R g` (degree bounds included), that it commutes with map, that `(C • W).toScheme ≅
W.toScheme` over `R` by the coordinate formulas, and the **transformation law** `Δ_smul`
`Δ(C • W) = e^{−4(2g+1)} det(M)^{(2g+1)(2g+2)} Δ(W)`; in particular `IsSmooth` is invariant. Prove
that the simplified equation `y² = 4f + h²` of a model over a ring in which 2 is a unit is
`(1, 1/2, −h/2) • W` (convention 5 with `M = 1`, `e = 1/2`, `t = −h/2`), and that over `ℤ` it is
**not** obtained by an element of `𝒢_g(ℤ)`: its discriminant is `2^{4(2g+1)} Δ(W)` (`2^{20} Δ(W)` at
`g = 2`), which is why the simplified model is never minimal at 2 (acceptance: 169.a.169.1 below).
*Needs:* 0.3, 1.1.


The API includes:

- The action commutes with coefficient maps and induces an isomorphism of the projective curves.
- The discriminant transformation law makes the unit-discriminant predicate invariant.

**Checks.**

- At g=2, `(M,e,t)=(1,2,0)` gives discriminant ratio `2^{-20}`.
- For `(M,e,t)=(2·1,8,0)`, the ratio is `8^{-20}·4^{30}=1`; a missing determinant power fails this test.
- Completing the square on `y²+y=x⁵` gives `y²=4x⁵+1`, whose discriminant is `2²⁰·3125`; this transformation is not integral at 2.

### 1.3 Isomorphisms are changes of coordinates

For smooth models `W₁, W₂` of genus `g ≥ 2` over a field `k`, prove that every `k`-isomorphism
`W₁.toScheme ≅ W₂.toScheme` is induced by some `C ∈ 𝒢_g(k)` with `C • W₁ = W₂`, unique up to the
scalar triples `Λ_g(k)` of convention 5: the
isomorphism carries the unique degree-2 rational subfield to the unique degree-2 rational
subfield (Tau Ceti `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`), so it covers an automorphism
`M ∈ PGL₂(k)` of `ℙ¹`, and the remaining freedom is `(e, t)`. Hence convention 7, and the
corollary `nonempty_algEquiv_functionField_iff` that the `𝒢_g(k)`-orbit of a smooth model is the `k`-isomorphism class of its curve.
For `g = 1` prove the analogue for isomorphisms fixing the points at infinity, agreeing with
Mathlib's `VariableChange` through 0.5. Define numRationalWeierstrassPoints as an isomorphism
invariant (consequence).
(Sources: Liu 1994, *Conducteur et discriminant minimal*, §1.3, p. 55, for genus two;
Liu 2002, §7.4.3, for the general hyperelliptic coordinate description.)
*Needs:* 0.4, 0.6, 1.2; Tau Ceti `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`; the
[algebraic curves roadmap](../AlgebraicCurves/README.md) Layer 11 (`Aut(k(x)/k) ≅ PGL₂(k)`, on its
Layer 1 `ℙ¹` API).

### 1.4 Automorphism groups

Define automorphismGroup W as the quotient of `MulAction.stabilizer (𝒢_g k) W` by the scalar
triples `Λ_g(k)` (convention 9; the stabiliser contains `Λ_g(k)`, so it is infinite over an
infinite field and the quotient is the right object), and prove it is the automorphism
group of the curve (1.3), that it is **finite** for `g ≥ 2` in every characteristic: the curve
over `k̄` is smooth of genus `≥ 2`, hence a stable curve, and a stable geometric fibre has a
finite automorphism group (the [stable reduction roadmap](../StableReduction/README.md) Layer 3),
which contains `Aut(C)`; away from characteristic 2 this is also Tau Ceti's
`finite_algEquiv_of_finrank_adjoin_eq_two` through 0.4, whose hypothesis `NeZero (2 : k)` excludes
characteristic 2 (for `y² + y = x⁵` over `𝔽̄₂` the only branch point is `∞`, and the stabiliser
of one point of `ℙ¹` in `PGL₂` is infinite, so the branch-permutation argument gives nothing there); that `ι` is central and
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
*Needs:* 0.6, 1.3; the [stable reduction roadmap](../StableReduction/README.md) Layer 3
(finiteness of the automorphism group of a stable geometric fibre); Tau Ceti
`finite_algEquiv_of_finrank_adjoin_eq_two`, `branchPermHom` (characteristic `≠ 2`).

The API includes:

- The scalar quotient identifies with curve automorphisms, is finite for g≥2, and contains the central hyperelliptic involution.
- The reduced group acts faithfully on the quotient line, with the stated lift restriction over a general field.

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

Define the twist of a smooth model by a 1-cocycle of `Gal(k^{sep}/k)` in `Aut(C_{k^{sep}})` as a
smooth projective curve `C'` over `k` (Galois descent for quasi-projective varieties), with a
degree-2 map to the twisted quotient `C'/ι`, a smooth curve of genus 0 over `k`, and prove that
this induces a bijection between `H¹(k, Aut(C_{k^{sep}}))` and `k`-isomorphism classes of twists
(with the 1.3 description of isomorphisms). The twist is the curve of a smooth model
`W' : Model k g` iff `C'/ι ≅ ℙ¹_k`, iff the image of the cocycle under `Aut(C_{k^{sep}}) → PGL₂(k^{sep})`
(the reduced group of 1.4) is trivial in `H¹(k, PGL₂)`. Not every twist has a model: on
`y² = x⁸ + 1` over `ℝ` (`g = 3`), `a(x, y) = (−1/x, y/x⁴)` is a real automorphism with `a² = 1`,
so complex conjugation `↦ a` is a cocycle, and the twisted real structure on the quotient is
`x ↦ −1/x̄`, which has no fixed point: the twisted quotient is the conic without real points
(negative control). Define
the **quadratic twist** `Model.quadraticTwist` `W_{t,n} = (D f − n h², t h)` of convention 15 over any ring, prove
`Δ_quadraticTwist`: `Δ(W_{t,n}) = D^{2(2g+1)} Δ(W)` (an identity of integer polynomials, through `4f' + h'² = D · G`
and the homogeneity of 0.1), that over a field with `θ² − tθ + n` separable irreducible `W_{t,n}`
is the twist by the cocycle `σ ↦ ι^{[σ(θ) ≠ θ]}` (the isomorphism over `k(θ)` is
`(x, y) ↦ (x, (t − 2θ) y − θ h(x))`, the substitution of Tau Ceti's `quadraticTwistOf`
docstring), and the exact `g = 1` bridge `exists_smul_quadraticTwist_ofWeierstrass`
`ofWeierstrass (E.quadraticTwistOf t n) = ([[1, 0], [0, D]], D, 0) • (ofWeierstrass E)_{t,n}`,
with `Δ_quadraticTwistOf` (`D⁶ Δ`) as its discriminant check. Prove that if the **geometric**
automorphism group `Aut(C_{k^{sep}})` is `⟨ι⟩`, the twists of `C` are exactly its quadratic twists
(then `H¹(k, ⟨ι⟩)` is the whole cohomology set, and its classes are the quadratic twists of
convention 15). The rational group `Aut(C)` does not suffice: over `ℚ`, `y² = x⁵ − 1` has
`Aut(C) = C₂` and `Aut(C_{ℚ̄}) = C₁₀`, and `y² = x⁵ − 2` is a twist (via `x ↦ 2^{1/5} x`,
`y ↦ √2 y`) that is not quadratic: over `𝔽₁₁` the two curves have `16` and `3` points, so
`a₁ = 4` and `a₁ = −9`, while a quadratic twist has `a₁` replaced by `±a₁`.
*Needs:* 1.3, 1.4; Tau Ceti `quadraticTwistOf`; Mathlib `groupCohomology` `H¹` or the
explicit cocycle description.


The API includes:

- Cocycle descent classifies twists, and triviality of the quotient-conic class characterises those admitting a model.
- The quadratic formula commutes with scalar extension and gives the stated discriminant and genus-one comparisons.

**Checks.**

- In characteristic two, `(t,n)=(1,1)` sends `(x⁵,1)` to `(x⁵+1,1)` and D=1, so Δ is unchanged.
- At `(t,n)=(1,0)`, the formula gives `(f,h)` and D=1; the split quadratic algebra yields the trivial twist.
- At D=0 the twist discriminant is 0 for every genus; this boundary is excluded by the separable quadratic-algebra hypothesis.

### Examples

For g=2, a scalar triple `(5·1,125,0)` acts trivially, while `(1,2,0)`
multiplies the discriminant by `2^{-20}`. These distinguish the scalar kernel from y-scaling.

### Dependencies

Layer 0; AlgebraicCurves Layer 11; StableReduction Layer 3;
Tau Ceti’s quadratic-twist construction and Mathlib Galois cohomology.

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
LMFDB, `g2c.igusa_clebsch_invariants`, four displayed root-product formulas;
Liu 1994 §2.2, pp. 139–140, instead gives coefficient formulas for the J-invariants), define
them as such over any ring in which 2 is a unit, with `I_{2k}(W) := I_{2k}(4f + h²)` for a
model, and prove **covariance**: `I_{2k}` is a projective invariant of degree `2k` of binary
sextics in the sense of Liu 1993 §1, i.e. homogeneous of degree `2k` in the coefficients
(`I_{2k}(λG) = λ^{2k} I_{2k}(G)`) with `I_{2k}(G ∘ M) = det(M)^{6k} I_{2k}(G)` for the homogeneous
substitution of 0.1; since `C = (M, e, t) ∈ 𝒢_2` sends `G` to `e^{-2}(G ∘ M)` (1.2),
`I_{2k}(C • W) = e^{-4k} det(M)^{6k} I_{2k}(W)`. Acceptance: at `k = 5` this is
`I₁₀(C • W) = e^{-20} det(M)^{30} I₁₀(W)`, the law of 1.2 through `I₁₀ = 2^{12} Δ`; and
`I₂(4G) = 16 I₂(G)`.
*Needs:* 0.1, 1.2; Mathlib symmetric polynomials (`MvPolynomial.symmetricSubalgebra`).

The API includes:

- Root sums descend to coefficient polynomials and obey the coefficient and determinant weights.
- The degree-ten invariant is the binary sextic discriminant, including at a simple root at infinity.

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
*Needs:* 0.3, 1.2, 2.1; Mathlib `WittVector` for the characteristic-2 construction, or
the direct integral formulas.

The API includes:

- The integral J-polynomials specialise in every characteristic and satisfy the displayed relation.
- Their covariance preserves the Igusa point; the auxiliary invariants supply Liu’s criterion.

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
primitive integral I-vectors are invariant only under rational weighted scaling, up to
the sign action. They need not agree for equal geometric Igusa points. The
stored `igusa_inv`, the sign-normalised `J(W_min)` of 3.4, is a function of the `ℚ`-isomorphism
class and not of the point (convention 8: 3125.a.3125.1 and its quadratic twist by 3 share the
point and differ in `v₃(J₁₀(W_min))`, `0` against `10`). The normal-form rules themselves are not
targets.

The API identifies equal points under coordinate changes and geometric base extension;
it distinguishes this equality from equality of rational weighted-scaling orbits
(Liu 1993, §0, pp. 201–202, and §1, p. 203).

The API includes:

- Coordinate changes preserve the weighted projective point; geometric equality is tested after algebraic closure.
- Rational weighted-scaling orbits distinguish primitive vectors that the coarse geometric point identifies.

**Checks.**

- A change with `e = 2`, `M = 1` scales `J_{2k}` by `2^{-4k}` and leaves the Igusa point fixed.
- A quadratic twist by 3 has the same point, whereas the minimal J-vectors of
  `y²+y=x⁵` and its twist have `v₃(J₁₀) = 0` and `10`.
- For `y²+y=a x⁵`, `a=1,2`, the I-vectors are `(0,0,0,12800000)` and
  `(0,0,0,819200000)`. Dividing by weighted powers of 20 and 40 gives
  `(0,0,0,4)` and `(0,0,0,8)`: `20⁵·4=12800000`, `40⁵·8=819200000`.
  Both curves have absolute invariants `(0,0,0)` and become isomorphic after scaling
  x by a fifth root of 2, so equality of geometric points cannot force primitive-vector equality.

*Needs:* 1.3, 2.2.

### 2.4 Igusa's theorem: invariants classify geometric isomorphism classes

Over an algebraically closed field `k` of any characteristic: two smooth genus-2 models have the
same Igusa point iff their curves are isomorphic (Igusa 1960, Theorem 2 together with §3–§4: the
coarse moduli scheme of genus-2 curves over `ℤ` is the open subscheme `J₁₀ ≠ 0` of
`Proj ℤ[J₂, J₄, J₆, J₈, J₁₀]/(J₂J₆ − J₄² − 4J₈)`; Liu 1993 §0, pp. 201–202,
identifies this smooth moduli locus). State the comparison with the function-field side:
`W₁.FunctionField ≅ W₂.FunctionField` over `k̄` iff equal Igusa points.
*Needs:* 1.3, 2.2, 2.3.

### 2.5 Absolute invariants

Define absoluteInvariants W : Fin 3 → k by the case split of convention 8, prove it is a
`k̄`-isomorphism invariant, and that when `char k ≠ 2` it determines the Igusa point in each of
the three branches (normalise `J₂ = 1`, `J₄ = 1` or `J₆ = 1` respectively, or the point is
`[0 : 0 : 0 : 0 : 1]`; `J₈ = (J₂J₆ − J₄²)/4` is then forced). In characteristic 2 it does not:
`J₂J₆ − J₄² = 4J₈` reads `J₂J₆ = J₄²` and leaves `J₈` free, so the distinct moduli points
`[0 : 0 : 0 : 0 : 1]` and `[0 : 0 : 0 : 1 : 1]` (both satisfy the relation with `J₁₀ ≠ 0`, so
both are moduli points by 2.4 and 2.7) both give `(g₁, g₂, g₃) = (0, 0, 0)`
(negative control); there the classifying invariant is the Igusa point itself (2.4). The LMFDB's `Twists` link searches on these three
numbers; the theorem that curves with the same `(g₁, g₂, g₃)` are `ℚ̄`-isomorphic, hence twists of
one another, is 1.5 with 2.4.
*Needs:* 1.5, 2.4.

The API includes:

- Each branch has nonzero denominator J₁₀ on smooth curves and is invariant under geometric coordinate changes.
- The triple classifies the point away from characteristic two; the full J-point is needed in characteristic two.

**Checks.**

- (first branch, `J₂ ≠ 0`) — 169.a.169.1 gives `(g₁, g₂, g₃) = (−1/169, 33/169, 43/169)`.
- (first branch) — 4096.b.65536.1 gives `(50000, 3750, −125)`; 249.a.249.1 gives
  `(−4782969/83, −183708/83, −7776/83)`.
- (third branch, `J₂ = J₄ = 0`) — 3125.a.3125.1 gives `(0, 0, J₆⁵/J₁₀³) = (0, 0, 0)`.
- (characteristic 2) — `[0 : 0 : 0 : 0 : 1]` and `[0 : 0 : 0 : 1 : 1]` both give `(0, 0, 0)`; a
  theorem that the triple determines the Igusa point without `char k ≠ 2` must be rejected.
- (geometric only) — `y² = x⁶ + 1` and 2916.b.11664.1 have the same Igusa point, hence the same
  absolute invariants, and are not `ℚ`-isomorphic (Boundary checks).

### 2.6 Automorphism groups of genus-2 curves

Over an algebraically closed field `k`, prove the classification of `Aut(C)` for a smooth genus-2
curve, using the reduced group acting on the branch divisor in odd characteristic and
on the Artin–Schreier cover in characteristic two (Igusa 1960 §8, the six cases (1)–(6) with their Rosenhain normal forms; Bolza
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
twisted action. In characteristic different from two, recognise the reduced group through
branch permutations and retain exactly the transformations whose lift satisfies the
coordinate-change equations of 1.2. In characteristic two write the function field as
`Y²+Y=F(x)`, with `F=f/h²` (smoothness ensures `h ≠ 0`). A base transformation
`A ∈ PGL₂(k)` lifts precisely when there is `B ∈ k(x)` with
`B²+B=F∘A−F`; its two lifts send `(x,Y)` to `(A(x),Y+B(x))` and
`(A(x),Y+B(x)+1)`. Prove this as the roadmap's own lemma: a lift sends `Y` to `u + vY` with
`u, v ∈ k(x)`, and `(u + vY)² + (u + vY) = F∘A` reads `(u² + u + v²F) + (v² + v)·Y = F∘A` in the
basis `1, Y` of `k(x)(Y)` over `k(x)`, so `v² + v = 0`; `v = 0` would put the image of `Y` into
`k(x)`, hence `v = 1` and `B = u` satisfies `B² + B = F∘A − F`; two solutions `B, B'` over the
same `A` have `(B − B')² + (B − B') = 0`, so `B' ∈ {B, B + 1}` and the two lifts differ by the
hyperelliptic involution `Y ↦ Y + 1`. Liu 1993 §4.1 (pp. 211–212) treats only `char k ≠ 2` and
supplies the `J`-conditions of `C₀`, `C₁` quoted above.

**Checks.**

- In characteristic two, `y²+y=x⁵` and `y²+y=x⁵+x³` both have `4f+h²=1`.
- For a primitive fifth root ζ, `A(x)=ζx` has obstruction 0 for the first model,
  so `B=0` gives a lift. For the second it has obstruction `(ζ³−1)x³ ≠ 0`.
- A rational B with polynomial `B²+B` has no finite pole, hence is polynomial;
  if B is nonconstant, `deg(B²+B)=2 deg B`. Thus the cubic obstruction has no lift.
  The identity A has obstruction 0 for both models and has the two lifts `B=0,1`.
*Needs:* 1.4, 2.2, 2.4.

### 2.7 Field of moduli and Mestre's obstruction

For a perfect field `k` and a smooth genus-2 curve over `k̄` with field of moduli `k` (the fixed field of the stabiliser
of its Igusa point) and `char k ∉ {2, 3, 5}`, construct Mestre's conic `L` and cubic `M` in
`ℙ²_k` with coefficients polynomial in `I₂, I₄, I₆, I₁₀` (Mestre
1991, as presented in Cardona–Quer, arXiv:math/0207015v1, §2, Table 1 and the
conic/cubic equations, pp. 6–7), and prove: if
`Aut(C) = C₂`, then `C` has a model over `k` iff `L` has a `k`-point, and when it does the double
cover of `L ≅ ℙ¹` branched along `L ∩ M` is such a model (Cardona–Quer v1,
Theorem 3 and Remark 4, p. 7); if `Aut(C) ≠ C₂` and
`char k ≠ 2`, the field of moduli is a field of definition (Cardona–Quer v1,
Theorem 2(2), p. 5, with the perfect-field hypothesis of §1, p. 1). Package this as the descent equivalence and its model construction. Over a finite field every
curve is defined over its field of moduli (Wedderburn); over `ℚ` the obstruction is a quaternion
algebra class, and the worked suite includes a curve for which it vanishes. Prove from the
construction the surjectivity half of the moduli description of 2.4: every point of
`ℙ(2,4,6,8,10)(k̄)` with `J₁₀ ≠ 0` satisfying the `J₈` relation is the Igusa point of a smooth model
(Mestre's conic and cubic in characteristic `∉ {2, 3, 5}`, Igusa's normal forms of §8 otherwise).
*Needs:* 2.1, 2.4, 2.6; Mathlib conics (`Mathlib/NumberTheory/...` quadratic forms in
three variables) or the explicit Legendre criterion over `ℚ`.


The API includes:

- The conic and cubic are defined over the field of moduli with the indicated exceptional-characteristic guard.
- For geometric automorphism group C₂, conic solubility is equivalent to descent; extra-automorphism cases use the stated separate theorem.

**Checks.**

- A conic `X²+Y²=Z²` has the rational point `(1:0:1)`, while `X²+Y²+Z²=0` has no real, hence no rational point; a conic carrier that forgets the field fails the obstruction test.
- Over an algebraic closure both conics have points; descent obstruction is arithmetic, not an obstruction to geometric realisation.
- The curve `y²=x⁵−1` in characteristic zero has geometric automorphism order 10, so it fails
  the generic order-two automorphism hypothesis in Mestre’s criterion and is covered by the
  extra-automorphism descent theorem.
- The perfect-field convention agrees with the fixed-field definition: over `𝔽₇(t)`,
  every automorphism of its algebraic closure fixing t also fixes the unique root `t^{1/7}`.
  Thus its fixed field contains `t^{1/7}` and is not `𝔽₇(t)` itself.

### Examples

The fifth-power twists `y²+y=x⁵` and `y²+y=2x⁵` share the Igusa point
and absolute invariants, but have primitive I-vectors ending in 4 and 8.

### Dependencies

Layers 0–1; symmetric polynomials and weighted projective geometry;
AlgebraicCurves Layer 12 for the geometric curve dictionary.

## Layer 3: integral and minimal models

### 3.1 Integral models over a discrete valuation ring

Over a DVR `R` with fraction field `K` (convention 10 without completeness where not needed),
define `Model.IsIntegral R W` (coefficients in `R`), prove every model over `K` is
`𝒢_g(K)`-equivalent to an integral one (apply `(1, π^{−m}, 0)`, which gives `f' = π^{2m} f`,
`h' = π^m h`, with `m` large enough for every coefficient; for `h = 0`, `f = x⁵ + π^{−1}`,
`m = 1` gives `π² x⁵ + π`, whereas the diagonal `(diag(1, π^{−m}), π^{−m(g+1)}, 0)` gives
`f(π^m x)` and leaves the constant coefficient `π^{−1}` alone), that
`Δ` of an integral model lies in `R`, that an integral change of coordinates (`C ∈ 𝒢_g(R)`)
preserves integrality and leaves `v(Δ)` unchanged (`det M` and `e` are units), and that an element
of `𝒢_g(K)` changes `v(Δ)` by a multiple of
`N_g := gcd(4(2g+1), (2g+1)(2g+2)) = 2(2g+1) · gcd(2, g+1)`, every multiple occurring (by 1.2,
`v(Δ)` changes by `−4(2g+1) v(e) + (2g+1)(2g+2) v(det M)`, and `v(e)`, `v(det M)` are
independent); `N_1 = 12` (the elliptic step), `N_2 = 10`, `N_3 = 28`.
*Needs:* 1.2; Mathlib `IsDiscreteValuationRing`.


The API includes:

- Integral coordinate changes preserve integral coefficients and discriminant valuation.
- All smooth coordinate orbits contain integral representatives; valuation changes are multiples of N_g.

**Checks.**

- For `f=x⁵+π^{-1}`, h=0, the scaling e=π⁻¹ gives `π²x⁵+π`, all coefficients integral; x-scaling alone leaves the nonintegral constant.
- The identity coordinate change gives valuation difference 0. The genus-two y-scaling e=π gives difference −20, divisible by 10.
- The valuation steps at g=1,2,3 are respectively 12,10,28; the proposed step `2(2g+1)` would incorrectly give 6 and 14 in odd genus.

### 3.2 Minimal models exist

Define `Model.IsMinimal R W` as: integral, and for every `C ∈ 𝒢_g(K)` with `C • W` integral,
`v(Δ(W)) ≤ v(Δ(C • W))` (written division-free as `∃ r ∈ R, Δ(C • W) = r · Δ(W)`). Prove
`exists_isMinimal`, existence of a minimal model in every `𝒢_g(K)`-orbit of smooth models (the valuations of `Δ` on
integral models form a nonempty set of naturals), and `isMinimal_ofWeierstrass_iff`, that `IsMinimal` at `g = 1` agrees with
Mathlib's `WeierstrassCurve.IsMinimal` through 0.5 (Mathlib minimises over `VariableChange`,
which is a proper subgroup of `𝒢_1(K)`; prove the two minima coincide because every element of
`𝒢_1(K)` preserving the point at infinity and integrality is a `VariableChange` up to `𝒢_1(R)`).
*Needs:* 0.5, 3.1; Mathlib `WeierstrassCurve.exists_isMinimal`.


The API includes:

- The integral discriminant valuations have a minimum, attained by a coordinate change.
- Minimality agrees with elliptic minimality on the Weierstrass subcase.

**Checks.**

- For `y²=x³−x` at 5, v(Δ)=0 is minimal because integral models have nonnegative discriminant valuation.
- For `y²=x³−5⁴x` at 5, v(Δ)=12 drops to 0 by x=5²x′, y=5³y′, so the model is not minimal.
- In the division-free predicate the latter change would require an integral scalar of valuation −12; no such scalar exists, while the identity requires r=1.

### 3.3 The minimal discriminant; uniqueness of minimal models

Any two minimal models of one curve have the same `v(Δ)` (both realise the minimum of 3.2), so
their discriminants differ by a unit of `R` by 3.1: define minimalDiscriminantValuation R W : ℕ
and localMinimalDiscriminant R W : Ideal R, prove independence of the model and invariance under
isomorphism, and the comparison `v(Δ(W)) = v(Δ_min) + N_g · m` for every integral `W`, with
`N_g` the step of 3.1 and `m ∈ ℕ` the obstruction exponent. At `g = 1`, `N_1 = 12` and through 0.5
this is exactly Tau Ceti's `localMinimalDiscriminant` and `obstructionExponentAt`
(`v(Δ) − v(Δ_min) = 12 fᵥ`): for `y² = x³ − 5⁴x` at 5, `v(Δ) = 12`, `v(Δ_min) = 0` and
`m = fᵥ = 1` (a step `2(2g+1) = 6` would give `m = 2`, the negative control). Prove the
**uniqueness theorem** at `g = 1`: two minimal models are related by an element of `𝒢_1(R)`
(Silverman VII.1.3 (d) through 0.5). In genus `≥ 2` minimal models are **not** unique up to
`𝒢_g(R)`, only their discriminant valuation is: over `ℤ₁₁`,
`f = x(x − 11²)(x − 2·11²)(x − 1)(x − 2)(x − 3)` and
`f' = x(x − 1)(x − 2)(11²x − 1)(11²x − 2)(11²x − 3)` define the same curve (`x = 11² x'`,
`y = 11³ y'`), both have `v(Δ) = 12` and both are minimal (DDMM Corollary 1.24, after the
integral inversion `x ↦ 1/x` for `f'`, which makes the leading coefficient `−12` a unit), but the
reductions of their branch loci, a triple point with `{1, 2, 3}` and `{0, 1, 2}` with a triple
point at `∞`, are not related by any element of `PGL₂(𝔽₁₁)` (sending the triple point `0` to `∞`
and `{1, 2, 3}` onto `{0, 1, 2}`), which an element of `𝒢_2(ℤ₁₁)` would induce. The invariants
built on minimal models (`v(Δ_min)` here; the sign and absolute value of `Δ_min` and the vector
`J(W_min)` in 3.4) are shown intrinsic without uniqueness; the uniqueness of the minimal regular
model is the [stable reduction roadmap](../StableReduction/README.md)'s Layer 5.
*Needs:* 3.1, 3.2; the [elliptic curves roadmap](../EllipticCurves/README.md) Layer 4
(local minimal discriminant) for the `g = 1` comparison.


The API includes:

- The minimum valuation and its ideal are invariant under coordinate isomorphisms.
- The excess valuation of an integral model is a nonnegative multiple of N_g.

**Checks.**

- At 5, `y²=x³−5⁴x` has local minimal discriminant ideal (1) and obstruction exponent `(12−0)/12=1`.
- At 5, `y²+y=x⁵` has v(Δ)=5; every decrease has step 10 and would become negative, so its minimal valuation is 5.
- Two genus-two equations in §3.3 have minimal valuation 12 at 11 but inequivalent reduced branch configurations; uniqueness of the valuation does not assert uniqueness of the equation.

### 3.4 Global minimal models over `ℤ` and the obstruction class over a Dedekind domain

Over the fraction field `K` of a Dedekind domain `O`: define `IsGlobalMinimal O W` as minimality
(3.2) over `Localization.AtPrime v.asIdeal` at every height-one prime `v`, the shape of Tau Ceti's
`WeierstrassCurve.IsGlobalMinimal` (the localisation instances are Tau Ceti's
`TauCeti/RingTheory/Localization/AtPrime.lean` and
`TauCeti/RingTheory/DedekindDomain/LocalizationAtPrime.lean`), and prove it implies integrality
over `O`. Define
the **minimal discriminant ideal** `∏_v 𝔭_v^{v(Δ_min,v)}` and the **defect ideal**
`𝔍_W = ∏_v 𝔭_v^{m_v}` of an integral model, with the identity
`(Δ(W)) = 𝔇_{C/K} · 𝔍_W^{N_g}` for the step `N_g` of 3.1, and the defect class
`[𝔍_W] ∈ ClassGroup O`. Prove it is independent of the integral model: for `W' = (M, e, t) • W`,
`𝔍_{W'} = 𝔍_W · (e)^{−2}(det M)^{g+1}` when `g` is even and `𝔍_{W'} = 𝔍_W · (e)^{−1}(det M)^{(g+1)/2}`
when `g` is odd, both principal. Prove: if a global minimal model exists the defect class is
trivial; global minimal models **always exist over a principal ideal domain**, in particular over
`ℤ` (`exists_isGlobalMinimal`; patch the local minimal changes of coordinates `(M_v, e_v, t_v)` at the finitely many primes
where the model is not minimal: `e` with the prescribed valuations exists because the ideal is
principal, `M` because the lattice with the prescribed localisations `M_v O_v²` is free, and `t`
by approximation, as the [elliptic curves roadmap](../EllipticCurves/README.md) Layer 4.5b does
for `VariableChange`, with `𝒢_g(O_v)` in place of `VariableChange O_v`;
Liu, *Global Weierstrass equations*, arXiv:2109.07318v3, Lemma 2.3 and Remark 2.5,
p. 5, give the geometric patching route for hyperelliptic curves of genus at least two
and elliptic curves; the coordinate-lattice argument here also covers the admitted low-genus models). Over a Dedekind domain prove the converse for even `g`: if `[𝔍_W] = 0`, the
local changes can be rescaled by the scalar triples `Λ_g(K_v)` (which move `(v(e_v), v(det M_v))`
by `(g + 1, 2)` times an integer) so that both the ideal of `e` and the Steinitz class of the
lattice are trivial, and the patching above applies; at `g = 1` the converse is Tau Ceti's
theorem for `weierstrassDefectClass` through 0.5. For odd `g ≥ 3` the scalar triples move
`v(det M_v)` only by even amounts, and the converse is proved under the additional hypothesis that
the Steinitz class `[∏_v 𝔭_v^{v(det M_v)}]` of some choice of local minimal changes lies in
`2 · ClassGroup O`. Derive these defect-class converses from the
coordinate law and patching as follows: in additive class-group
notation put `E=[∏ 𝔭_v^{v(e_v)}]` and `D=[∏ 𝔭_v^{v(det M_v)}]`. For even `g`,
vanishing defect gives `2E=(g+1)D`; the scalar-ideal class `L=−E+(g/2)D` satisfies
`E+(g+1)L=0` and `D+2L=0`. For odd `g`, it gives `E=((g+1)/2)D`;
choose `L` with `2L=−D` under the stated extra hypothesis, and the same two classes vanish.
Liu v3, Lemma 1.2(3), Proposition 1.4, pp. 3–4, and Lemmas 3.7–3.9, pp. 8–9,
supply the projective-bundle, approximation and ideal identities used in this derivation. Over `ℚ`
define minimalDiscriminant W : ℤ (with sign) and absDiscriminant, and prove that the sign
and absolute value of `Δ_min` are intrinsic (`Δ_eq_of_isGlobalMinimal`): two global minimal models have discriminants whose
ratio is a `p`-adic unit at every prime (3.3), hence `±1`, and the law of 1.2 writes the ratio as
the positive rational `e^{−4(2g+1)} det(M)^{(2g+1)(2g+2)}` (both exponents are even), so the
discriminants are equal. Prove likewise
in genus 2 that `(J₂, …, J₁₀)` of a global minimal model is independent of the model: the
covariance factor `μ = e^{−4} det(M)^6` of 2.2 is a positive rational with `μ⁵ = J₁₀'/J₁₀ = 1`.
This is the vector behind the LMFDB's `igusa_inv` (convention 8). At `g = 1` the defect class is
Tau Ceti's `weierstrassDefectClass`.
*Needs:* 2.2, 3.3; Tau Ceti `IsGlobalMinimal`, `weierstrassDefectClass`; the
[elliptic curves roadmap](../EllipticCurves/README.md) Layers 4.5a–4.5b; Mathlib
`Ideal.quotientInfRingEquivPiQuotient` (the Chinese remainder theorem).


The API includes:

- The local minima define a global discriminant ideal; the defect ideal satisfies the displayed factorisation.
- A principal ideal domain admits a global minimal model, and over ℚ its signed discriminant is intrinsic.

**Checks.**

- For `y²+y=x⁵` over ℚ, Δ=3125 and the minimal discriminant ideal is `(5⁵)`; all local obstruction exponents are zero.
- For its simplified equation, the difference at 2 is 20, hence the defect exponent is `20/10=2` and the defect ideal is (4).
- At g=2, e=2, det M=1 changes the defect ideal by `(2)^{-2}` and discriminant by `2^{-20}`; over ℚ the discriminant multiplier is positive, ruling out a sign change between minimal models.

### 3.5 Reduction of a minimal model and good reduction

Over a DVR `R` with residue field `k`, define the coefficientwise reduction
`W̃ : Model k g` of an integral model. For every admitted genus, prove that `W̃` is
smooth iff `v(Δ(W)) = 0`; this is specialization of the integral discriminant of §0.3.
For `g ≥ 1`, define HasGoodReduction R W by `v(Δ_min) = 0` and prove equivalence
with existence of a smooth proper model with the given generic fibre. A minimal equation
with unit discriminant supplies one. Conversely, extend the degree-two involution to the
unique smooth proper model (uniqueness in positive genus: StableReduction Layer 5),
prove that its quotient is a smooth model of ℙ¹, trivialize this rank-two projective
bundle over the local ring R, and express the double cover by an integral equation.
This is the local argument in the proof of Liu, *Global Weierstrass equations*,
arXiv:2109.07318v3, Corollary 3.12, p. 11, together with Lemma 2.3 and Definition 2.4,
p. 5; the class-number condition of that corollary belongs to its global conclusion,
not to this local argument. The genus-one case uses the given degree-two involution,
without assuming a point on the genus-one curve. No uniqueness or equivalence with
unmarked geometric good reduction is asserted at genus zero: its discriminant minimum
belongs to the coordinate orbit of the degree-two presentation.

For the smooth proper geometrically connected curve model over R attached to a
positive-genus equation with unit discriminant, identify its Jacobian with the generic
fibre of the supplied abelian scheme, without choosing a curve section. Consume
NeronModelsAndSemistableAbelianVarieties §3.8's smooth-family Picard construction
and `smooth_case`, §3.9's Picard–Néron identity comparison, and §1.8's abelian-scheme
Néron identification. This implication applies in particular to every positive-genus
model with HasGoodReduction. Its converse fails, as §4.5 and the compact-type Check show.
*Needs:* 0.3, 3.3; StableReduction Layers 2 and 5; NeronModelsAndSemistableAbelianVarieties
§§1.8, 3.8–3.9; the degree-two quotient and equation construction in this subsection.


The API includes:

- Reduction is coefficientwise and respects integral coordinate changes.
- For positive genus, geometric good reduction is equivalent to the unit-minimal-discriminant condition.
- Every smooth proper geometrically connected family has an abelian-scheme Jacobian; no curve section is required.

**Checks.**

- The reduction of `y²+y=x⁵` at 2 has Δ=1 and is smooth.
- At 5 its Δ vanishes and the minimal valuation is 5, so the curve has bad reduction.
- Two odd clusters of size 3 with positive even relative depths give a compact-type degeneration: the curve is bad and the Jacobian good, excluding the converse.
- Over ℝ[[t]], `y²=−x⁶−1` has unit discriminant `−2¹⁴3⁶` and no section:
  its real special fibre has no affine point, and the infinity equation is `Y²=−1`.
  Its relative Jacobian is nevertheless an abelian scheme of dimension 2.
- For `y²=x` over ℚ₅, Δ=1 and both marked ℙ¹ models with generic coordinates u and 5u
  are smooth. Their prescribed generic identification has matrix `diag(5,1)`;
  a scalar of valuation m would give determinant valuation `2m+1 ≠ 0`, so it does not extend.
- At genus zero, `y²=x²+5` is a smooth conic with a rational infinity point, hence is ℙ¹
  and has geometric good reduction over ℤ₅. Its equation discriminant is −20, of valuation 1;
  coordinate changes alter that valuation by an even integer, so its minimum is 1, not 0.

### 3.6 Bad primes of the curve and of the Jacobian

Over `ℚ`: badPrimes W := {p : p ∣ Δ_min}, which by 3.5 are exactly the primes of bad reduction of
the curve;
`conductor J` (the [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§5.4 at each `p`, assembled into a positive integer) has support contained in `badPrimes`, and
`p ∤ N` with `p ∣ Δ_min` happens exactly when the curve has bad but the Jacobian good reduction
(acceptance in 4.5). Prove Liu's **conductor–discriminant inequality in genus 2**: for every
prime `p`, `v_p(N) ≤ v_p(Δ_min)` (Liu 1994, *Conducteur et discriminant minimal de courbes de
genre 2*, §1.1, Proposition 1 and its footnote, p. 53; §4, Théorème 1, p. 70;
§6.1, Théorème 2, pp. 75–77). More precisely, after strict henselization, let n be the
number of geometric components of the minimal regular model X, and let
`c(X)=(d−1)/2 ≥ 0`, where d is the number of components of the desingularized
quotient of the canonical model in Liu's Théorème 1. The three results give
`−Art(X)=n−1+v_p(N)` and `v_p(Δ_min)=v_p(N)+n−1+11c(X)`.
Here Δ_min is the minimum among integral equations (Liu's Δ₀), not his
regular-model discriminant (Liu's Δ_min); the latter differs by `10c(X)`.
The inequality is the consequence `n ≥ 1`, `c(X) ≥ 0`, hence `N ∣ Δ_min`.
The **Ogg-type formula fails** when `c(X)>0`: the difference is then larger
than the component count minus one.
*Needs:* 3.4, 3.5; Néron models §5.4; the regular models of the
[stable reduction roadmap](../StableReduction/README.md) Layer 5 (Liu's proof compares `Δ_min`
with the Artin conductor of the minimal regular model).


The API includes:

- The finite bad-prime set is the prime support of the minimal discriminant.
- The Jacobian conductor support is contained in it, with the genus-two divisibility inequality.

**Checks.**

- For `y²+y=x⁵`, Δ_min=3125 and N=3125 have the same prime support {5}.
- For `y²+y=x⁶` (2916.b.11664.1), Δ_min=−11664 and N=2916; the quotient of absolute discriminant by conductor is 4.
- At 11, `f=x(x−11²)(x−2·11²)(x−1)(x−2)(x−3)` has one triple of depth 2
  and three singleton children of the depth-zero root. There are two elliptic
  components and one separating node: `n=2`, `v(N)=0`, `v(Δ_min)=12`, `c(X)=1`.
  Thus `12=0+2−1+11`, whereas Ogg's genus-one expression would give 1; the curve
  discriminant support can strictly contain the conductor support.

### 3.7 Liu's reduction types from the Igusa invariants

Over a DVR `R` with fraction field `K` (any residue characteristic), define the **stable
reduction type** of a smooth genus-2 curve as the type (I)–(VII) of the geometric special fibre of
a stable model over any finite extension and valuation ring where stable reduction exists (existence and uniqueness of the
stable model: the [stable reduction roadmap](../StableReduction/README.md) Layers 7–8; the seven
types are defined here, the seven combinatorial types of stable curves of arithmetic genus 2,
which Liu numbers (I)–(VII): smooth of genus 2; irreducible with one node (normalisation of
genus 1); irreducible with two nodes (normalisation `ℙ¹`); two smooth rational curves meeting
at three nodes (arithmetic genus `3 − 2 + 1 = 2`; three lines in a triangle would have genus
`3 − 3 + 1 = 1`, the negative control); and, meeting at one node, two smooth genus-1 curves, a
smooth genus-1 curve and a rational curve with one node, or two rational curves with one node
each (each of genus 2)), and prove Liu's
**Théorème 1** (Liu 1993): with `ε = 1, 3, 4` according as `char k ∉ {2, 3}`, `= 3`, `= 2`,
put `A=I₄'=J₂²−24J₄`, `B=I₁₂`, `D=J₁₀`, and put `C=J₂/12`, `J₆`, or `J₈`
according as ε is 1, 3, or 4. For a scalar z, “integral”, “positive” and “unit”
mean respectively `v(z)≥0`, `v(z)>0`, and `v(z)=0`, with `v(0)=+∞`.
A clause containing a quotient requires each displayed denominator to be nonzero;
in particular D is nonzero by smoothness. The seven mutually exclusive clauses are
(Liu 1993, Théorème 1, p. 204):

- Type I: every `J_{2i}⁵/D^i` is integral, `1≤i≤5`.
- Type II: B is nonzero, every `J_{2i}⁶/B^i` is integral, and `D⁶/B⁵` is positive.
  Its elliptic normalisation has `j=overline(A³/B)`.
- Type III: A is nonzero, every `J_{2i}²/A^i` is integral, both `D²/A⁵` and
  `B/A³` are positive, and at least one of `J₄/A`, `J₆²/A³` is a unit.
- Type IV: A is nonzero and `J_{2i}²/A^i` is positive for `2≤i≤5`.
- Types V–VII share the separating-node condition: C is nonzero and
  `A^ε/C²`, `D^ε/C⁵`, `B^ε/C⁶` are all positive.
  Type V requires both `A^{3ε}/(D^ε C)` and `B^ε/(D^ε C)` integral.
  The two elliptic j-invariants satisfy
  `(j₁j₂)^ε=overline(A^{3ε}/(D^ε C))` and
  `(j₁+j₂)^ε=2⁶·3³+overline(B^ε/(D^ε C))`.
- Type VI has the separating-node condition, B nonzero, `A³/B` integral and
  `D^ε C/B^ε` positive. Its smooth component has `j=overline(A³/B)`.
- Type VII has the separating-node condition, A nonzero, and both `B/A³` and
  `D^ε C/A^{3ε}` positive.

Corollary (the knowl `g2c.g2_invariants`): the absolute invariants of 2.5 are `p`-integral at every
prime `p` where the curve has potentially good reduction, since clause (I) gives
`v_p(J_{2k}) ≥ k · v_p(J₁₀)/5` and the denominators of `g₁, g₂, g₃` are powers of `J₁₀`.
The geometric stable type is independent of the extension (Liu 1993, Definition 1, p. 204).
Prove also, over a henselian DVR with algebraically closed residue field of characteristic
different from two (Liu 1994, hypotheses, p. 138), Liu's determination of the degree
of the minimal extension `[L : K]` and, when `L/K` is tame, the Namikawa–Ueno type of the minimal
regular model and the geometric component group `Φ` from the
tables of Liu 1994 §8 (Tables 2.1–3.4, pp. 158–163), using the smallest stable-reduction
extension in this strict-local setting (§3.1, p. 140). The inputs include the equation,
node thicknesses and Galois action, and the outputs are the Namikawa–Ueno type and geometric
component group. Use the author's errata, items 7–10: the asymmetric type in Table 2.2
requires the equation to order its parameters, Table 2.3 interchanges e₁ and e₂ in rows 4–5,
Table 3.2 starts with `[2I₀−r]`, and Table 3.4 uses `d₁/n` in place of d₁ and q.
For perfect residue fields of odd characteristic, strict henselisation identifies the
geometric special fibre; rational components are its Galois invariants. In residue
characteristic two use StableReduction Layers 5–8 and NeronModelsAndSemistableAbelianVarieties
§2.2 for regular models and component groups; Liu 1993's stable-type criterion still applies.

The API includes:

- Geometric stable type is independent of the chosen stable-reduction extension.
- The seven valuation clauses classify that type; the odd-characteristic strict-local tables refine it to regular-model data.

**Checks.**

- The table guard is false over `𝔽̄₂[[t]]` and true over `𝔽̄₃[[t]]`.
- For residue characteristic 7, `J₂=1`, `J₄=−2`, `J₆=5/4`, `J₈=−11/16`, `D=7⁷` give `A=49`, `B=0`, `v(C)=0`: the separating valuations are `(2,7,+∞)` and type VII has `(v(B/A³),v(DC/A³))=(+∞,1)`. A definition dividing by B would wrongly exclude this case.
- A smooth genus-two special fibre stays type I after a further finite extension.
- Two rational components meeting at three nodes have genus `0+0+3−2+1=2`;
  a triangle of three rational components has genus `3−3+1=1` and is excluded.
*Needs:* 2.2, 3.3; the [stable reduction roadmap](../StableReduction/README.md)
Layers 5–8; the [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.2 for `Φ`.

### Examples

At p=5, `y²=x³−5⁴x` has discriminant valuation 12 and minimal valuation 0;
the obstruction exponent is 1. At g=2 the valuation step is 10, not 12.

### Dependencies

Layers 0–2, with §3.7 using Layer 2; EllipticCurves Layers 4–4.5b;
StableReduction Layers 2, 5–8;
NeronModelsAndSemistableAbelianVarieties §§1.8, 2.2, 3.8–3.9, 5.4.

## Layer 4: cluster pictures (odd residue characteristic)

Throughout, `K` is as in convention 10 with `p` odd, `C : y² = f(x)` is a smooth model with
`h = 0` (every model is `𝒢_g(K)`-equivalent to one, as 2 is a unit; the invariants below are
isomorphism invariants by 4.3 so nothing depends on this choice), `ℛ` its root set, `c_f` its
leading coefficient, `g ≥ 2`.

### 4.1 Abstract cluster pictures and the cluster picture of a polynomial

Define ClusterPicture X for a finite type `X` (DDMM Definition 1.26): a set `Σ` of nonempty
subsets of `X` containing the singletons and `X`, pairwise nested or disjoint, with a depth
`d_𝔰 ∈ ℚ` for each cluster of size `> 1`, satisfying `d_𝔱 > d_𝔰` whenever
proper clusters satisfy `𝔱 ⊊ 𝔰`; and isomorphism of
cluster pictures. Define, for a separable `f ∈ K[X]` of positive degree (so that `ℛ` is nonempty;
the constant `1` is separable with `ℛ = ∅`, and `ℛ ∈ Σ` would contradict nonemptiness of
clusters) with splitting field `L` and the extended
valuation `w` on `L`, clusterPicture f : ClusterPicture ℛ by convention 12: its clusters are
the nonempty sets `ℛ ∩ D` for the discs `D = {x ∈ L : w(x − z) ≥ d}` with `z ∈ L` and `d ∈ ℚ`, and
the depth of a cluster `𝔰` of size `> 1` is `d_𝔰 = min w(r − r')` over distinct `r, r' ∈ 𝔰`. Prove
it is a cluster picture. Prove the Galois action of `G_K` (and of `I_K`) on
`ℛ` permutes clusters preserving depth.
*Needs:* Mathlib `Finset`, `Polynomial.rootSet`, `SplittingField`; the
[local fields and ramification roadmap](../LocalFieldsRamification/README.md) Layer 0 (the unique
extension of `v`), Layer 3 (inertia).

The API includes:

- Clusters form a nonempty laminar family containing all singleton subsets and the root set.
- For proper clusters `𝔱 ⊊ 𝔰`, `d_𝔱 > d_𝔰`; Galois permutations preserve the family and depths.

**Checks.**

- Over ℚ₇ the roots `{0,7,1,2,3}` have root depth 0 and twin `{0,7}` of depth 1:
  the strict-inclusion law reads `1 > 0`, with relative depth `1−0=1`.
  For the twin of depth 1/2 below it reads `1/2 > 0`; reversing either inequality fails.
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
`ε_𝔰 : G_K → {±1}` for `𝔰` even or a cotwin, `ε_𝔰 = 0` for every other cluster, with
independence of the centre, the transport `ε_𝔰(σ)` between `𝔰` and the conjugate `σ𝔰`, and its
restriction to a character of the stabiliser `G_𝔰` (Definition 1.12, Remark 1.13), the character
`γ̃_𝔰` of the inertia stabiliser `I_𝔰` of order the prime-to-`p` part of the denominator of
`|I_K/I_𝔰| · λ̃_𝔰` (Theorem 1.19; any such character), and
`ξ_𝔰(a) = ord₂(denominator of |I_K / I_𝔰| · a)`. Prove the elementary identities the rest of the layer uses: the
number of odd and even children, and, for every proper cluster 𝔰,
`Σ_{r∈ℛ} d_{r∧𝔰} = |ℛ| d_ℛ + Σ_{𝔰⊆𝔲⊊ℛ} |𝔲| δ_𝔲`.
The second sum follows the ancestors of 𝔰, including 𝔰 when it is not ℛ:
each increment δ_𝔲 is counted once for each root in 𝔲 (DDMM Definition 1.6
and §16, proof of Theorem 16.2, pp. 66–67), and the integrality criterion for `y² = f(x − z)` (Theorem 13.3), which refines 3.1's
integrality for `h = 0` in odd residue characteristic.
*Needs:* 4.1.


The API includes:

- Children partition a cluster, parent is unique away from the root, and meet is the least common containing cluster.
- Depths, ν, λ̃ and sign characters satisfy the displayed transport and ancestor identities.

**Checks.**

- For six singletons under a depth-zero root, there are six odd children and no proper subcluster: ν_ℛ=0, λ̃_ℛ=0 for unit leading coefficient, and ξ_ℛ(0)=0.
- For three depth-one twins under a depth-zero root, each twin is even, proper and non-übereven, the root is übereven, and each star is ℛ. A twin has ν=2, λ̃=1; the ancestor sum is `6·0+2·1=2`.
- For two size-three children at depth 2 under a depth-zero root, each child is odd and principal with three odd children. Each has ν=6 and λ̃=3; the root is nonprincipal. For a child and a root in the other child the meet is ℛ.

### 4.3 Isomorphic curves have equivalent cluster pictures

Define the equivalence of cluster pictures of DDMM Definition 14.1 (the moves induced by `𝒢_g`:
adding or removing a root at infinity, shifting all depths, redistributing the depth of a child
of `ℛ` of size `≥ g + 1`) and prove Theorem 1.27 (= Theorem 14.4, Corollary 14.7): `K`-isomorphic
curves have equivalent cluster pictures, and every abstract cluster picture equivalent to a
`Σ_C` is `Σ_{C'}` for a curve `C'/K̄` that is `K̄`-isomorphic to `C`. The bare equivalence class
does not carry the arithmetic: `y² = f(x)` and `y² = 7f(x)` over `ℚ₇`, `f = x⁵ − x + 1`, have the
same roots and depths, but `ν_ℛ = 0` and `1`, and the first has good reduction while the second
fails the semistability criterion. So prove two separate statements: (a) a change of coordinates
in `𝒢_g(K)` carries the **arithmetic data** — the picture with its `G_K`-action, `v(c_f)` (hence
every `ν_𝔰`) and the signs `ε_𝔰` — to the arithmetic data of the new equation, with the
transformed leading coefficient, so that each invariant of 4.4–4.12 is an invariant of the curve;
(b) the purely geometric quantities, those of Theorem 1.8 (3), (6), (7), (8) (potentially good
reduction of `C` and of `Jac C`, the potential toric rank, potentially totally toric reduction),
are constant on bare equivalence classes. Prove also the balanced representative of Lemma 15.1.
*Needs:* 1.2, 1.3, 4.2.


The API includes:

- Coordinate changes preserve arithmetic invariants after transforming the leading coefficient and sign data.
- Bare equivalence preserves the potential geometric reduction data, without determining arithmetic semistability.

**Checks.**

- The identity change preserves every depth, sign and leading coefficient.
- Over ℚ₇, `x⁵−x+1` and `7(x⁵−x+1)` have identical bare pictures, but ν_ℛ=0 and 1; only the former satisfies the even-ν condition.
- The same two pictures have potential toric rank 0; bare equivalence preserves the geometric invariant even though semistability differs.

### 4.4 The semistability criterion

Define SemistabilityCriterion C (DDMM Definition 1.7): (1) `K(ℛ)/K` has ramification degree
`≤ 2`; (2) every proper cluster is `I_K`-invariant; (3) every principal cluster has `d_𝔰 ∈ ℤ` and
`ν_𝔰 ∈ 2ℤ`. Prove **Theorem 1.8 (1)** (= Theorem 10.3, via §7): `C` is semistable iff `Jac C` is
semistable iff the criterion holds, where semistability of the curve is the
[stable reduction roadmap](../StableReduction/README.md)'s `HasNodalReduction C 𝒪_K` (its Layer 7:
some proper flat model has a geometrically reduced nodal special fibre) and of the Jacobian the
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §3.1; the equivalent
formulations of Appendix C are proved as corollaries. Prove Theorem 1.8 (4): `C` is tame
(semistable over a tamely ramified extension) iff `K(ℛ)/K` is tame, and that this is automatic
for `p > 2g + 1`; this is `tame_reduction`.
*Needs:* 4.2, 4.3; [stable reduction roadmap](../StableReduction/README.md) Layers 3, 7;
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §3.1, §3.10;
[local fields and ramification roadmap](../LocalFieldsRamification/README.md) Layer 3.


The API includes:

- The three conditions are equivalent to semistability of the curve and its Jacobian.
- Tameness of the root extension is equivalent to potential semistability over a tame extension.

**Checks.**

- A degree-six unramified root set at depth 0 with unit leading coefficient has ramification index 1, integral principal depth 0 and ν=0; the criterion holds.
- Multiplying this polynomial by a uniformiser changes ν to 1 and fails the criterion, while leaving all clusters unchanged.
- At g=2 the automatic tameness guard `p>2g+1` is false at p=5 and true at p=7; it cannot be used at p=2.

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
*Needs:* 3.5, 4.4; [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.3, §3.1, §5.1.


The API includes:

- The displayed iff criteria distinguish good curve reduction from good Jacobian reduction.
- The even-cluster count gives potential toric rank, and the odd-child condition characterises potential total toric reduction.

**Checks.**

- A flat sextic picture with unit leading coefficient has no proper subcluster, toric rank 0 and good curve reduction.
- Three twins have three even non-übereven clusters and an übereven root, hence rank `3−1=2`; neither curve nor Jacobian is potentially good.
- Two triples give no even proper subcluster, so the Jacobian is potentially good, but each size-three proper cluster prevents potentially good curve reduction.

### 4.6 The special fibre of the minimal regular model and its dual graph

Choose a finite Galois extension F/K over which C becomes semistable, using
StableReduction Layers 7–8 and then a Galois closure. Write `e=e(F/K)` and
`v_F=e v_K`; thus `d_𝔰^F=e d_𝔰`, `δ_𝔰^F=e δ_𝔰` and `ν_𝔰^F=e ν_𝔰`.
Construct the geometric special fibre over `𝒪_{F^{nr}}`, with its semilinear G_K
**descent** action, by DDMM Notation 8.1 and Theorems 8.5–8.7, pp. 48–51.
The following component equations, edge counts, pairing and component-count formula
use v_F, so every depth and ν in those formulas is the F-normalized value.
When C is semistable over K, take F=K to obtain Theorem 1.10.
The special fibre has one component for each non-übereven principal
cluster and two for each übereven principal cluster. Set `v_𝔰⁺=v_𝔰⁻=v_𝔰`
in the former case. For chosen centres define
`red_𝔰(𝔬)=overline((z_𝔬−z_𝔰)/π_F^{d_𝔰})` and
`c_𝔰=overline((c_f/π_F^{v_F(c_f)}) ∏_{r∉𝔰}(z_𝔰−r)/π_F^{d_{𝔰∧r}})`;
compatible fractional powers can be chosen in a finite extension. The normalisation
is `y²=c_𝔰∏_{odd 𝔬<𝔰}(x−red_𝔰(𝔬))`. This choice of sign in red is the
x-coordinate `(x−z_𝔰)/π_F^{d_𝔰}`. For an übereven cluster the product is empty
and this equation has two geometric components (DDMM Theorem 8.7, p. 51).
The edge chains have the following endpoints and numbers of edges (Theorem 8.5(1), p. 50);
a chain of n edges inserts n−1 rational components, with n=1 a direct node.

| Configuration | Endpoints | Edge count |
| --- | --- | --- |
| principal child 𝔰′ of principal 𝔰, 𝔰′ odd | v_𝔰′ to v_𝔰 | δ_𝔰′/2 |
| principal child 𝔰′ of principal 𝔰, 𝔰′ even | v_𝔰′⁺ to v_𝔰⁺ and v_𝔰′⁻ to v_𝔰⁻ | δ_𝔰′ each |
| twin 𝔱 child of principal 𝔰 | v_𝔰⁻ to v_𝔰⁺ | 2δ_𝔱 |
| principal 𝔰 child of cotwin 𝔱 | v_𝔰⁻ to v_𝔰⁺ | 2δ_𝔰 |
| nonprincipal ℛ=𝔰₁⊔𝔰₂, both principal odd | v_𝔰₁ to v_𝔰₂ | (δ_𝔰₁+δ_𝔰₂)/2 |
| nonprincipal ℛ=𝔰₁⊔𝔰₂, both principal even | v_𝔰₁⁺ to v_𝔰₂⁺ and v_𝔰₁⁻ to v_𝔰₂⁻ | δ_𝔰₁+δ_𝔰₂ each |
| nonprincipal ℛ=𝔰⊔𝔱, 𝔰 principal even, 𝔱 twin | v_𝔰⁻ to v_𝔰⁺ | 2(δ_𝔰+δ_𝔱) |

Let A be the even non-übereven clusters other than ℛ and
`B={𝔰∈A : 𝔰*=ℛ}`. The lattice is the sublattice
`{Σ_{𝔰∈A} a_𝔰 ℓ_𝔰 : a_𝔰∈ℤ, Σ_{𝔰∈B} a_𝔰=0}` of the free group on the
formal symbols ℓ_𝔰 (DDMM Theorem 1.14(3)–(5), pp. 5–6). When B is nonempty,
choose b in B: a basis consists of ℓ_𝔰 for 𝔰 outside B and ℓ_𝔰−ℓ_b
for 𝔰 in B other than b. Its rank is `#A−[ℛ übereven]`.
The pairing on the ambient symbols, restricted to this sublattice, is zero if
`𝔰₁*≠𝔰₂*`; otherwise it is `2(d_{𝔰₁∧𝔰₂}−d_{P(𝔰₁*)})` when
the common star is not ℛ, and `2(d_{𝔰₁∧𝔰₂}−d_ℛ)` when it is ℛ.
Galois acts by `σ(ℓ_𝔰)=ε_𝔰(σ)ℓ_{σ𝔰}`. The number of components is
`m_C=Σ_{odd proper 𝔰≠ℛ} δ_𝔰/2 + Σ_{even 𝔰≠ℛ} 2δ_𝔰 +1−rk H₁`.

For the action, return to K-normalized depths and set
`t_𝔰=π_F^{e d_𝔰}`, `u_𝔰=π_F^{e λ̃_𝔰}`, where
`λ̃_𝔰=ν_𝔰/2−d_𝔰 Σ_{𝔬<𝔰} floor(|𝔬|/2)`.
For principal 𝔰 the exponents are integers by semistability over F. Choose centres
`z_𝔰 ∈ F^{nr}` as in DDMM Notation 8.1. For `σ ∈ G_K` construct the map
`a_{σ,𝔰}: Γ̃_𝔰 → Γ̃_{σ𝔰}` by
`(x,y) ↦ (α_𝔰(σ) σ̄(x)+β_𝔰(σ), γ_𝔰(σ) σ̄(y))`, where
`α_𝔰(σ)=overline(σ(t_𝔰)/t_{σ𝔰})`,
`β_𝔰(σ)=overline((σ(z_𝔰)−z_{σ𝔰})/t_{σ𝔰})`, and
`γ_𝔰(σ)=overline(σ(u_𝔰)/u_{σ𝔰})`.
The ratios defining α and γ are units; the numerator defining β has valuation at
least d_𝔰, so all reductions are defined (DDMM Definition 8.2 and Theorem 8.7(i),
pp. 49, 51). Extend these maps over infinity and prove
`a_{1,𝔰}=id` and `a_{στ,𝔰}=a_{σ,τ𝔰} ∘ a_{τ,𝔰}`. The maps on Γ_𝔰 and its
normalization agree, and on the graph σ sends `v_𝔰^±` to `v_{σ𝔰}^{±ε_𝔰(σ)}`,
with the corresponding signed edge permutation (Theorem 8.5(2)–(3), p. 50).

Prove that changing centres and uniformizer conjugates these maps by the induced
component isomorphisms. After enlarging F, use StableReduction Layer 8's stable-model
base-change comparison: the regular graph may acquire subdivisions, but the H¹ of
its positive-genus normalizations and its graph representation give isomorphic G_K
representations. Consequently §4.7's induced abelian and toric representations are
independent, up to G_K-isomorphism, of the chosen finite Galois semistable extension
(DDMM §2.3, equations (2.16)–(2.18), pp. 18–19, and §10, Theorem 10.1, p. 54).

The API includes:

- Extension multiplies depths and integral edge lengths by the ramification index; the component equations use the extended valuation.
- Component descent maps are semilinear, satisfy the composition law and induce the signed graph action.
- Choices and further semistable extension preserve the resulting G_K representations, without asserting that the regular graphs themselves remain identical.

**Checks.**

- Over ℚ₇, `y²=x⁵−7` has `d_ℛ=1/5`, `ν_ℛ=1`, and root ramification index 5,
  so it is not semistable over K. In `F=ℚ₇(ζ₅,π)` with `π¹⁰=7`, e=10;
  x=π²X, y=π⁵Y gives `Y²=X⁵−1`, a smooth genus-two fibre. For a tame generator
  with σ(π)/π=ζ₁₀, the descent map is `(X,Y) ↦ (ζ₅X,−Y)`.
  Its H¹ eigenvalues are `−ζ₅,−ζ₅²,−ζ₅³,−ζ₅⁴`, invariant dimension 0 and conductor 4;
  trivial descent would give dimension 4 and conductor 0.
- For the same map, composing twice gives `(ζ₅²X,Y)` and composing ten times gives
  `(X,Y)`. Taking the inverse convention permutes the four eigenvalues but leaves
  the invariant dimension 0; dropping the y-sign gives the wrong order, 5 instead of 10.
- An unramified enlargement has e=1 and leaves depths unchanged. A further extension
  of ramification index 2 sends a twin depth 1/2 and its one loop edge to depth 1
  and two edges; graph H¹ still has rank 1, and its pairing changes from [1] to [2].
- Three split twins of relative depth 1 give the constraint `a₁+a₂+a₃=0`,
  basis `(ℓ₁−ℓ₃,ℓ₂−ℓ₃)`, Gram matrix `[[4,2],[2,4]]`, rank 2,
  determinant 12, and component count `6+1−2=5`.
- Two odd principal halves with relative depths 1 and 1 give one edge and
  no inserted component; counting chains by δ−1 separately would miss the edge.
- A twin of relative depth 1/2 gives one loop edge and no inserted component;
  relative depth 1 gives two edges and one inserted component.
- With centres `z_𝔰=0`, `z_𝔬=π^{d_𝔰}`, the reduction coordinate is +1,
  and substitution sends the branch root to x=1, not x=−1.
The minimal regular model is the [stable reduction roadmap](../StableReduction/README.md)
Layer 5's; the dual graph is its Layer 1's and `TauCeti.NumericalType` its Layer 6's; the
identification of
`H₁(Υ_C)` with the toric character lattice is the
[Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md) §4.2.
*Needs:* 4.1–4.2, 4.4; [stable reduction roadmap](../StableReduction/README.md) Layers 1, 5–8;
Néron models §4.1–4.2 and §3.5 for the cohomological comparison;
LocalFieldsRamification Layers 0 and 3 for valuation conversion and descent.

### 4.7 The Galois representation

For arbitrary C/K in Layer 4, use §4.6's components over a finite Galois semistable
extension, equipped with their G_K descent action. Prove DDMM Theorem 1.19 (= Theorem 10.1) in
the form `H¹_{ét}(C) = H¹_{ab} ⊕ H¹_t ⊗ Sp₂` with
`H¹_t = ⊕_{𝔰 ∈ A/G_K} Ind_{G_𝔰}^{G_K} ε_𝔰 ⊖ [ℛ übereven] · ε_ℛ`, the sum over orbit
representatives of the set `A` of even non-übereven clusters other than `ℛ` (the set of 4.5,
4.6, 4.9 and 5.4) and the term `ε_ℛ` subtracted only when `ℛ` is übereven, and
`H¹_{ab} = ⊕_𝔰 Ind_{G_𝔰}^{G_K} H¹(Γ̃_𝔰)` over principal non-übereven clusters, with
the `I_𝔰`-module structure `H¹(Γ̃_𝔰) ≅ γ̃_𝔰 ⊗ (ℚ_ℓ[𝔰̃] ⊖ 1) ⊖ ε_𝔰`. The toric–abelian decomposition
is the Néron models roadmap's toric–finite filtration of the Tate module (§3.5) with the Raynaud
extension (§3.13); the étale cohomology of the components is Tau Ceti's and the
`EtaleCohomologyFoundations` roadmap's. The toric formula is the one the proof of DDMM
Corollary 9.6(2) (p. 54) obtains from the lattice of 4.6: `H¹_t = H₁(Υ_C, ℤ) ⊗ ℚ_ℓ` (DDMM (2.18),
p. 19), and the relation `Σ_{𝔰 ∈ B} a_𝔰 = 0` removes one copy of `ε_ℛ` exactly when `B ≠ ∅`,
that is, when `ℛ` is übereven. The statements of DDMM Theorem 10.1 and Corollary 9.6(2) print
`⊖ ε_ℛ` unconditionally after a sum over all even non-übereven clusters; for an even
non-übereven `ℛ` the two forms agree (the sum then contains `ε_ℛ` once), but for a cotwin `ℛ`
the unconditional term subtracts the nonzero `ε_ℛ = ε_{ℛ^*}` of convention 12 and gives the
wrong dimension, so the formula here follows the proof. In every case `dim H¹_t` is the
potential toric rank of 4.5(7).
*Needs:* 4.6; Néron models §3.5, §3.13.

**Checks.**

- Over `ℚ_p` with `p ≥ 5`, `y² = (x − 1)(x − p)(x − 2p)(x − 3p)(x − 4p)` has the clusters `ℛ`
  (depth 0, odd, not übereven, a cotwin with `ℛ^* = 𝔰₀`) and `𝔰₀ = {p, 2p, 3p, 4p}` (depth 1,
  `ν_{𝔰₀} = 4`, principal), so `C` is semistable with `A = {𝔰₀}`, `B = ∅`, potential toric
  rank 1 (4.5(7)), `n_C = 1` (4.9(iii)) and special fibre `Γ_{𝔰₀}` of genus 1 (normalisation
  `y² = −(x + 1)(x + 2)(x + 3)(x + 4)`) carrying one loop of `2δ_{𝔰₀} = 2` edges (the cotwin
  row of 4.6, two components in all). Here `θ_{𝔰₀} = √(−1)`, so `ε_ℛ = ε_{𝔰₀}` is the unramified
  character with `ε_{𝔰₀}(Frob) = (−1/p)`, `H¹_t = ε_{𝔰₀}` has dimension 1 and the toric factor of
  5.4 is `1 − (−1/p)·T`. Subtracting `ε_ℛ` unconditionally would give `ε_{𝔰₀} ⊖ ε_{𝔰₀} = 0`, of
  dimension 0, against 4.5(7), 4.9(iii) and the loop of 4.6.
- A good quintic has `A = ∅` and odd `ℛ`, so `H¹_t = 0`. Three `G_K`-stable depth-one twins
  under a depth-zero root (`ℛ` übereven) give `ε_{𝔱₁} ⊕ ε_{𝔱₂} ⊕ ε_{𝔱₃} ⊖ ε_ℛ`, of dimension
  `3 − 1 = 2`. A sextic whose root has the children `𝔰₀` of size 4 and two singletons (`ℛ` even,
  a cotwin, not übereven) gives `ε_{𝔰₀}`, of dimension 1, which is also what DDMM's sum over all
  even non-übereven clusters including `ℛ` followed by `⊖ ε_ℛ` gives; a formula subtracting
  `ε_ℛ` for every even `ℛ` would give 0 there.
- (`g = 1`, outside Layer 4's standing hypothesis) `y² = x(x − 1)(x − p)` has the single even
  cluster `{0, p}` under an odd cotwin root; `θ_{{0,p}} = √(−1)`, so the formula gives
  `H¹_t = ε_{{0,p}}` of dimension 1, split iff `p ≡ 1 mod 4`, which is the multiplicative
  reduction `y² = x²(x − 1)` of the elliptic curve, with tangent slopes `±√(−1)` at the node;
  the unconditional subtraction would give 0.

### 4.8 Tamagawa numbers

For semistable `C`, prove that the Tamagawa number `c = #Φ_{Jac C}(k)` is determined by the
lattice `H₁(Υ_C, ℤ)` with its length pairing and Frobenius action (DDMM Lemma 2.22 with the
Néron models roadmap's §4.5 cokernel description and the relative Jacobians roadmap's §4.1
rational-component map), give the general formula
`c = #(coker(H₁(Υ_C, ℤ) → Hom(H₁(Υ_C, ℤ), ℤ), ℓ ↦ ⟨ℓ, ·⟩))^{Frob}`, the Frobenius invariants of
the cokernel, not the cokernel of the map on Frobenius-invariant lattices (DDMM Lemma 2.22 and
Remark 2.23; for the pairing `[2]` on `ℤ` with `Frob = −1` the first is `#(ℤ/2) = 2`, the second
`1`, the negative control) (Betts, *On the computation of Tamagawa numbers and the component group
of Jacobians*, specialised through 4.6), and in genus 2 the closed values of DDMM Table 8 column `c`
(`n`, `ñ`, `nm`, `nm̃`, `ñm̃`, `t = nm + nk + mk`, `t/d · d̃`, `n + 2k`, `3`, `1`, …, with
`ñ = 2` if `2 ∣ n` and `1` otherwise, `d = gcd(m, n, k)`) as a theorem proved from the lattice
types (DDMM Theorem 18.8 and its proof). The one-component case has `c = 1`.
*Needs:* 4.6; [Néron models roadmap](../NeronModelsAndSemistableAbelianVarieties/README.md)
§2.2, §4.5, §4.7; [relative Jacobians roadmap](../RelativeJacobiansAndIntegralCurveModels/README.md)
§4.1, §4.4.


**Checks.**

- A zero lattice has trivial cokernel and Tamagawa number 1.
- The lattice ℤ with pairing [2] and Frobenius −1 has invariant cokernel of order 2; the cokernel on invariant lattices has order 1 and is wrong.
- For three split depth-one twins the Gram matrix `[[4,2],[2,4]]` has determinant 12; Frobenius is trivial and the Tamagawa number is 12.

### 4.9 Conductor exponents

Prove DDMM Theorem 1.20 (= Theorem 11.3, Corollary 9.4) for the conductor exponent
`n_C = n_{tame} + n_{wild}` of the Néron models roadmap §5.4: (i)
`n_{wild} = Σ_{r ∈ S} (v(Δ_{K(r)/K}) − [K(r) : K] + f_{K(r)/K})` over representatives of the `G_K`-orbits of `ℛ`, the
discriminant and residue degree being those of the [local fields roadmap](../LocalFieldsRamification/README.md)
Layers 0 and 3 and the completed number-field roadmap's Layer 5 for a global prime; (ii)
`n_{tame} = 2g − dim H¹(C)^{I_K}` with `dim H¹^{I_K} = #(I_K\U) − #(I_K\V) − [|ℛ| and v(c_f) even]`
where `U={𝔰⊊ℛ odd : ξ_{P(𝔰)}(λ̃_{P(𝔰)})≤ξ_{P(𝔰)}(d_{P(𝔰)})}`
and `V={𝔰 proper non-übereven : ξ_𝔰(λ̃_𝔰)=0}`. Here
`ξ_𝔰(a)=v₂(denominator([I_K:I_𝔰]a))`, using a reduced positive denominator
(and denominator 1 at zero). The index in V is 𝔰 itself, as obtained by
subtracting the invariant dimensions of γ̃_𝔰 in the proof of Theorem 11.3,
p. 58, rather than its parent;
(iii) for semistable `C`, `n_C = #A − [ℛ übereven]`, the potential toric rank of 4.5 (this is the
Néron models roadmap's §5.5 specialised). These are `ord(N)` in the local table; the wild term is
zero for `p > 2g + 1`.

**Checks.**

- A good genus-two sextic with unit leading coefficient has six unramified
  singleton orbits in U and only ℛ in V: `dim H¹^I=6−1−1=4`, `n_C=4−4=0`.
- A good quintic has `dim H¹^I=5−1−0=4`; an extra correction would give 3.
- Three split twins give `#A−1=3−1=2`; the root-number exponent is also 2, so w=+1.

*Needs:* 4.4, 4.5, 4.6; Néron models §5.4–5.5; local fields Layers 0, 3; the Galois
representation of 4.7.

### 4.10 Discriminant, integrality and minimality from the picture

Prove DDMM Theorem 1.25 (= Theorem 16.2):
`v(Δ_C) = v(c_f)(4g + 2) + Σ_{proper 𝔰} d_𝔰(|𝔰|² − Σ_{𝔰' < 𝔰} |𝔰'|²)`, and for semistable `C` with `|k| > 2g + 1` the valuation of the minimal
discriminant by
`v(Δ_C)−v(Δ_C^{min})=(4g+2)(v(c_f)−E+d_ℛ(|ℛ|−g−1)+Σ_{g+1<|𝔰|<|ℛ|} δ_𝔰(|𝔰|−g−1))`.
Here E=1 exactly when there are two size-(g+1) clusters exchanged by Frobenius
and `v(c_f)` is odd, and E=0 otherwise (Theorem 1.25, p. 8).
Theorem 1.23
(= Theorem 17.2) and Corollary 1.24, the criteria for `y² = f(x)` to be a minimal Weierstrass
equation (in particular: if `f mod 𝔪` has at least two distinct roots, none of multiplicity
`> g + 1`, and unit leading coefficient, the equation is minimal); and the comparison of these
with 3.3 (same minimal discriminant). The LMFDB's `ord(Δ)` column is `v_p(Δ_min)`.
*Needs:* 3.3, 4.2, 4.4.


**Checks.**

- For a good sextic at depth 0 with unit leading coefficient, the discriminant sum and minimal discriminant are both 0.
- Three depth-one twins contribute `3·(4−2)=6` to v(Δ); no cluster has size greater than 3, so E=0 and the minimal valuation is also 6 when q>5.
- For two size-three clusters exchanged by Frobenius with depths 1, root depth 0 and v(c_f)=1, E=1, v(Δ)=10+6+6=22 and the difference from minimal is 0; omitting E would give a false decrease of 10.

### 4.11 Deficiency and the parity of `Ш`

Define IsDeficient C (convention 13) and prove DDMM Theorem 1.15 (= Theorem 12.4): a semistable
`C` is deficient iff `g` is even and one of the three listed cluster configurations holds (two odd
conjugate halves with odd relative depth; `ℛ` übereven with `ε_ℛ(Frob) = −1` and the stated
condition that each non-übereven `𝔰` with `𝔰^* = ℛ` has nonintegral
`d_𝔰` or even Frobenius-orbit size; `ℛ` a cotwin with übereven principal child `𝔯`,
`ε_𝔯(Frob) = −1` and, for every `𝔰` with `𝔰*=𝔯`, nonintegral depth
or even Frobenius-orbit size). Over `ℝ`, prove that `C` is deficient iff `g` is
even and `C(ℝ) = ∅` (every real divisor class of a pointless real curve has even degree), which
for `y² = f(x)` means `f` has no real root and negative leading coefficient. Over `ℚ`, state the
Poonen–Stoll theorem as an
implication: if `Ш(J/ℚ)` is finite, its order is a square if the number of deficient places is
even and twice a square otherwise (Poonen–Stoll 1999 §8: the Cassels–Tate pairing of the
[heights roadmap](../HeightsRationalPointsAndObstructions/README.md) §3.17a and its parity
statement §3.18c); the LMFDB's
`has_square_sha` is the parity of the deficient-place count, defined here unconditionally.
*Needs:* 4.6; heights roadmap §3.17a, §3.18c.


The API includes:

- Deficiency is failure of a rational divisor of degree g−1, not merely failure of a point.
- The semistable cluster criterion and the real-place criterion identify the same predicate.

**Checks.**

- For g=2, a real model `y²=−x⁶−1` has no real point, so is deficient; all real closed points have even degree and cannot form degree 1.
- For g=3, degree g−1=2 is represented by a conjugate pair even on a pointless real curve; the even-genus guard is necessary.
- Three split twins have ε_ℛ=+1 and are not deficient; the übereven clause requires −1.

### 4.12 Root numbers

For semistable `C`, prove that the local root number of `Jac C` (the Néron models roadmap §5.4's
Weil–Deligne representation, with the local constant `WeilDeligneRep.epsilon` of the
[arithmetic Galois representations roadmap](../ArithmeticGaloisRepresentations/README.md) §2.7 for finite extensions of ℚₚ, and AutomorphicLFunctionsAndLocalFactors §AL.3.10.3
for equal-characteristic local fields)
is `w = (−1)^{a_+}` where `a_+` is the multiplicity of the eigenvalue `+1` of `Frob` on
`H₁(Υ_C, ℚ)` (DDMM Theorem 2.20); by 4.6 (5) and the relation of 4.7,
`a_+ = #{𝔰 ∈ A/Frob : ε_𝔰(Frob^{f_𝔰}) = +1} − [ℛ übereven and ε_ℛ(Frob) = +1]`, so for the split
genus-2 picture of three twins `a_+ = 3 − 1 = 2` and `w = +1`, whereas the product of `−ε` over
the three loops would give `−1`; in genus 2 the values are DDMM
Table 8 column `w` (`+` for good reduction and types `1 ⨯ 1`; `−` for `I_n^+`, `+` for `I_n^-`;
etc.). At an archimedean place `w = (−1)^g`. State the general (non-semistable, tame) root number
through the Galois representation of 4.7 as a milestone consuming the `ε`-factor of an induced
character from these same suppliers in their respective characteristics. The LMFDB marks root numbers at `2` and at wild primes as
conditional on modularity; those are not claimed here.
*Needs:* 4.6, 4.7; Néron models §3.5, §5.4; arithmetic Galois representations §2.7 (local
constants of Weil–Deligne representations over finite extensions of ℚₚ, including induced
finite-image characters); AutomorphicLFunctionsAndLocalFactors §AL.3.10.3 for the
equal-characteristic adapter and local constants. With the supplier normalizations, a zero
representation has conductor 0 and epsilon constant 1; the trivial unramified line has
conductor 0 and norm-twist exponent n(ψ), hence exponent 0 for a conductor-zero character.

### 4.13 The classification of semistable genus-2 reduction types

Define the reduction type of a semistable curve (DDMM Definition 18.1: the dual graph of the
special fibre of the minimal regular model with Frobenius action and genera), prove Lemma 18.2
(it determines `n`, deficiency, `c`, `w`) and Theorem 18.4 (the cluster picture with Frobenius
and `ε` determines it), and in genus 2 prove Theorem 18.7 and Theorem 18.8: the complete list of
cluster pictures of semistable genus-2 curves (Table 7, with the Namikawa–Ueno types) and the
table of invariants `(m_C, H₁, n, w, c, Def)` (Table 8), with the additional column
`v(Δ_min)` only when `|k|>5` (Theorem 18.8, p. 78). The integral representatives
listed in Table 7 likewise require `|k|>5` (Theorem 18.7(2), p. 73).
The general minimal-discriminant invariant remains 3.3; these tables do not specify
its values over smaller residue fields. Verify each applicable row against 4.6–4.12.
The discriminant-column and representative guards are false at q=3 and q=5, and true at q=7. The rows of Table 8 are few enough
to prove outright; no stored table is a theorem. Prove also the local constancy Theorem 1.29
(= Corollary 19.3): for `C_i : y² = c_i g_i(x)` with `c_i ∈ K^×` and `g_i ∈ 𝒪_K[x]` monic, if
`c_1 c_2 ∈ K^{×2}` and `g_1 ≡ g_2 mod π^{d+1}` for `d` the largest depth of a proper cluster of
`C_1`, then `H¹` (4.7) as a `G_K`-module, the conductor exponent and the root number agree; if
moreover `C_1` is semistable, so is `C_2`, the special fibres of the minimal regular models over
`𝒪_{K^{nr}}` agree with their Frobenius action, and so do the Tamagawa number and deficiency, and
when `|k| > deg g_1` the minimal discriminant valuation. The square condition is needed:
`f₁ = 49(x⁵ − x + 1)` and `f₂ = 147(x⁵ − x + 1)` over `ℚ₇` are congruent modulo 7 with `d = 0`,
but `49 · 147 = 7⁴ · 3` is not a square and the two curves (good reduction after rescaling,
quadratic twists by a non-square unit) have `7` and `9` points over `𝔽₇`, traces `1` and `−1`.
*Needs:* 4.6–4.12.


The API includes:

- The graph with genera and Frobenius determines conductor, deficiency, Tamagawa and root number.
- Minimal-discriminant values and representative equations from the tables carry their additional cardinality hypothesis.

**Checks.**

- At q=3 and q=5 the guard q>5 is false; at q=7 it is true.
- For three split depth-one twins the invariants are rank 2, conductor 2, root number +1, Tamagawa number 12, and v(Δ_min)=6 when q>5.
- For good reduction, the graph has one genus-two vertex and no edges; m_C=1, rank=0, conductor=0, w=+1 and c=1.

### Examples

A good sextic gives inertia-invariant dimension `6−1−1=4`. Three split twins
give toric rank 2, root number +1 and toric factor `(1−T)²`.

### Dependencies

Layers 1 and 3; LocalFieldsRamification Layers 0, 3; StableReduction
Layers 1, 3, 5–8; NeronModelsAndSemistableAbelianVarieties §§2–5;
RelativeJacobiansAndIntegralCurveModels §4; ArithmeticGaloisRepresentations §§2.7, 3;
HeightsRationalPointsAndObstructions §§3.17a, 3.18c.

## Layer 5: the Jacobian of a hyperelliptic curve

### 5.1 Two-torsion and the two-torsion field

For a smooth model of genus `g ≥ 2` over a field `k` of characteristic `≠ 2`, with `J = Jac C` (the
[Jacobian challenge](../JacobianChallenge/README.md)'s `JacobianVariety`, defined over `k` with no
rational-point hypothesis), define twoTorsionRank W as the `𝔽₂`-dimension `d` of `J(k)[2]`.
Prove the Galois-module isomorphism
`J[2](k^{sep}) ≅ {S ⊆ ℛ_∞ : |S| even}/{∅, ℛ_∞}` where `ℛ_∞` is the set of `2g + 2` Weierstrass
points (Poonen–Schaefer, author version, Proposition 6.2 and its ensuing torsion description,
pp. 10–11, specialised to p=2), the divisor `Σ_{P ∈ S} P − (|S|/2) H`
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
(and of `f` when `h = 0`), because for `g ≥ 2` the action of `S_{2g+2}` on the even subsets modulo
complement is faithful; in genus 1 it is not (the kernel is the Klein four subgroup of `S₄`), and
the smooth quartic `y² = x⁴ + 1` over `ℚ` has branch splitting field `ℚ(ζ₈)` of degree 4 while
its Jacobian `y² = x³ − 4x` has all 2-torsion rational, `ℚ(J[2]) = ℚ` (negative control; in genus
0 the Jacobian is trivial); its Galois group embeds in `S_{2g+2}` (in `S_6 ≅ Sp₄(𝔽₂)` for `g = 2`),
and `J[2](k)` is an elementary abelian 2-group of rank `d ≤ 2g`. The LMFDB's `two_torsion_field`
is this field, stored as a number field of least degree with that Galois closure (for 169.a.169.1
the sextic `x⁶ − x⁴ − 2x³ + 2x + 1`, whose Galois closure is the degree-18 splitting field of
`G`), and `torsion_order` is even iff `d ≥ 1`.
*Needs:* 0.6, 1.3; [Jacobian challenge](../JacobianChallenge/README.md) Layers D–F;
Mathlib `Polynomial.Gal`, `SplittingField`.

The API includes:

- Even subsets modulo complement identify the geometric two-torsion as a Galois module.
- Rational torsion is fixed classes, and for g≥2 its field of definition equals the branch splitting field.

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
rational Weierstrass point), and `L = K[T]/(f)`, set `a=lc(f) ≠ 0`.
Normalize by `X=a x`, `Y=a^g y`, so `Y²=F(X)` with
`F(X)=a^{2g} f(X/a)` monic of degree `2g+1`. Transport the monic descent through
`K[X]/(F) ≅ L`, `X ↦ aT`. Thus (a) the normalized descent
`J(K) → L^×/L^{×2}` has value `a(x(P)−T)` on `[P−∞]` away from branch points,
and extends by divisor evaluation to a homomorphism with kernel `2J(K)`
(Schaefer 1995, odd-degree descent; this normalization is derived from the displayed
coordinate change). On a degree-zero divisor away from infinity, the a-factors cancel,
recovering the usual x−T evaluation. (b) Its image is unramified outside any finite S
containing all archimedean places, places above 2, places where a coefficient of f is
nonintegral, places where a is not a unit, and places where disc(f) is not a unit.
For an integral monic equation this reduces to the places over `2∞ disc f`.
Indeed outside S the normalized monic model has unit discriminant and J has good
reduction; apply unramifiedness of the Kummer map and its descent comparison
(Poonen–Schaefer, author version, Proposition 12.4 and following remark, p. 25), (c) at a finite completion `K_v/ℚ_p` the image has order
`#J(K_v)[2]` for p odd and `2^{g[K_v:ℚ₂]} #J(K_v)[2]` for p=2;
over ℝ it has order `#J(ℝ)[2]/2^g`, and over ℂ it has order 1: the local descent map
has kernel `2J(K_v)`, so the image has order `#(J(K_v)/2J(K_v))`, which is the heights
roadmap's local doubling index (§1.17: `#(A(F)/2A(F)) = |2|_F^{−g}·#A(F)[2]` for `F/ℚ_p`
finite, `#A(ℝ)[2]/2^g` over `ℝ`, `1` over `ℂ`) applied to `A = J`
(Poonen–Schaefer, author version, Lemma 12.10, p. 29, as the source), (d) the resulting
bound `rank J(K) ≤ dim_{𝔽₂} Sel^{(x−T)} − dim_{𝔽₂} J(K)[2]`, with the comparison
`Sel^{(x−T)}(J/K) ≅ Sel₂(J/K)` when `f` has odd degree (Poonen–Schaefer 1997 for the general
cyclic-cover statement). Use the two-Selmer rank `dim_{𝔽₂} Sel₂(J/ℚ)`
as the heights roadmap's object (its §1.3) and prove `rank J(ℚ) ≤ twoSelmerRank − dim J(ℚ)[2]`, the
knowl `g2c.two_selmer_rank`. The `M = Aˣ/Aˣ²` and `normM` carriers of Tau Ceti's elliptic
`XSubT.lean` are the `g = 1` instance and the shape to follow.
*Needs:* 5.1; effective Diophantine methods §3.23; heights roadmap §1.3–1.5,
§1.12–1.14, §1.17; Tau Ceti `MordellWeil/XSubT.lean` (shape).


**Checks.**

- For `f=5x⁵+x⁴+3x`, `disc(f)=7773813 ≡ 3 mod 5`, yet a=5 is not a unit.
  The point `(1,3)` becomes `(5,75)` on `Y²=X⁵+X⁴+375X`, and `F(5)=5625=75²`.
  Its normalized descent value is `5(1−T)`, with norm `5⁴·9=5625`, a square;
  the unnormalized value has norm `9/5`, not a square. Four roots are 5-adically integral with
  reduction different from 1, and one has valuation −1; after unramified splitting the
  five valuations are `(1,1,1,1,0)`. The enlarged S contains 5, as ramification requires.
- For a monic integral f with unit discriminant at an odd place, a=1 and the local
  descent valuations are even; a factor a cannot be discarded when it has odd valuation.
- For `f=x⁵+1/3`, the prime 3 is included through a coefficient denominator even though
  a=1; at a place outside S both the integral-coefficient and unit conditions hold.
- For g=2 over ℚ₂ the image order is `4·#J(ℚ₂)[2]`; for an odd p it is `#J(ℚ_p)[2]`, not four times that order.
- Over a degree-two extension of ℚ₂ the factor is `2^{2·2}=16`, so the base field degree cannot be dropped.
- For g=2 over ℂ, torsion order 16 and the local analytic factor `2^{-4}` give image order 1; over ℝ, torsion order 4 gives image order `4/4=1`.

### 5.3 Good Euler factors in genus 2

For a smooth genus-2 model over `𝔽_q`, use FunctionFieldArithmetic §5.1 for
`N_i=#C(𝔽_{q^i})` and §§5.3, 5.6 for its zeta numerator and Newton recovery.
The imported theorem gives `L(T)=1+a₁T+a₂T²+qa₁T³+q²T⁴`,
`a₁=N₁−q−1` and `2a₂=a₁²+N₂−q²−1`; coefficient recovery is owned there.
Prove here the equation-level count, in every characteristic:
`N₁=Σ_{x∈𝔽_q} #{y∈𝔽_q : y²+h(x)y=f(x)} + #{y∈𝔽_q : y²+h₃y=f₆}`.
For odd q, with quadratic character χ extended by `χ(0)=0`, this becomes
`N₁=q+1+Σ_{x∈𝔽_q} χ(4f(x)+h(x)²)+χ(h₃²+4f₆)`.
Each fibre contributes `1+χ(discriminant)`, including the fibre at infinity
(convention 1; the quadratic formula). For a curve over ℚ with good reduction at p,
identify this polynomial with the Jacobian Euler factor of
NeronModelsAndSemistableAbelianVarieties §5.0c.

**Checks.**

- For q=3, N₁=6 and N₂=8 give `(a₁,a₂)=(2,1)` and `L(1)=1+2+1+6+9=19`.
- An odd-degree squarefree model `y²=f(x)` has infinity discriminant 0,
  hence one point at infinity, not two.
- A sextic with nonsquare leading coefficient has infinity contribution `1−1=0`;
  a square leading coefficient gives `1+1=2`. The mixed quadratic count also works at q=2.

*Needs:* 0.6, 3.5; FunctionFieldArithmetic §§5.1 (`pointCount_eq`), 5.3 (`L_F`),
5.6 (Newton identities and reciprocal symmetry); NeronModelsAndSemistableAbelianVarieties
§5.0b–5.0c.

### 5.4 Bad Euler factors at odd semistable primes

For `C` semistable over `K` (odd `p`), prove from 4.7 and the Néron models roadmap §5.6 that
`L_p(T) = det(1 − T·Frob | H¹^{I})` is the product of the toric factor
`det(1 − T·Frob | H¹_t) = ∏_{𝔰 ∈ A/Frob}(1 − ε_𝔰(Frob^{f_𝔰}) T^{f_𝔰}) / (1 − ε_ℛ(Frob) T)^{[ℛ übereven]}`
(`A` the even non-übereven clusters other than `ℛ`, `f_𝔰` the length of the Frobenius orbit, so
that `Frob^{f_𝔰}` stabilises `𝔰` and `ε_𝔰(Frob^{f_𝔰}) = ±1`; the denominator is the relation
`⊖ ε_ℛ` of 4.7 among the loops when `ℛ` is übereven) and the abelian factor
`∏_{𝔰} L(Γ̃_𝔰/k_𝔰, T^{f_𝔰})` over Frobenius orbits of principal non-übereven clusters. The toric
factor is a polynomial of degree the potential toric rank: for a split genus-2 picture of three
twins (`ℛ` übereven, all `ε = +1`) it is `(1 − T)³/(1 − T) = (1 − T)²`, of degree `3 − 1 = 2`,
while the unrestricted product `(1 − T)³` has the wrong degree (negative control). The abelian
factor being the `L`-polynomials of the normalised components over their fields
of definition (orbits of length `f_𝔰`), so that `deg L_p = 2g − n_C`; the LMFDB's “tame
reduction?” column is computed as `deg L_p = 4 − v_p(N)`, and this milestone proves that
equality is equivalent to tameness at a semistable prime (and gives the witnesses where it is
not at additive primes). In genus 2 for type `I_n^±` the factor is `(1 ∓ T) · L(E, T)` with `E`
the normalised genus-1 component.
*Needs:* 4.6, 4.7, 5.3; Néron models §5.6.

### 5.5 Local solvability of hyperelliptic models

For a smooth model over `ℚ`, define isLocallySolvable W := ∀ v, C(ℚ_v) ≠ ∅ as the
[heights roadmap](../HeightsRationalPointsAndObstructions/README.md) §6.1 predicate
`IsLocallySoluble` on the curve of 0.2, and prove the following criteria. Over ℝ, `C(ℝ) ≠ ∅` iff `4f+h²` takes a
nonnegative value, equivalently has a real root or positive leading coefficient.
At a prime of good reduction p with `p>4g²`, the Weil bound gives
`#C(𝔽_p) ≥ p+1−2g√p > 1`, so a smooth point lifts by Hensel's lemma.
Consequently the obstructed places form a finite set, contained in the real place,
the primes of bad reduction and the primes `p≤4g²`. This uses the proper smooth
model, and includes the prime 2 whenever the hypotheses hold; no search bound is asserted. Prove that a curve with a rational point, or a
rational Weierstrass point, or a rational point at infinity, is locally solvable.
*Needs:* 0.6, 3.5, 5.3; heights roadmap §2.5, §6.1;
[scheme, stack, cohomology and intersection foundations roadmap](../SchemeAndStackFoundations/README.md)
§5.11 (`weil_bound_via_surfaces`); Mathlib `HenselianLocalRing`.

The API includes:

- Local solubility is the supplied predicate on the projective curve and follows from a rational point.
- Obstructed places form a finite set with the stated containment and real-place criterion.

**Checks.**

- At a good genus-two prime 17, `18−4√17>1`, so the curve is locally soluble.
- The real model `y²=−x⁶−1` has no affine or infinite real point: its right side is
  at most −1 and its infinity equation is `Y²=−1`.
- For `y²+y=x⁵`, the rational point `(0,0)` supplies a point at every completion.

### 5.6 The conductor of a genus-2 Jacobian over `ℚ`

Assemble `conductor J := ∏_p p^{n_p}` from the Néron models roadmap §5.4 with 4.9 at odd
semistable primes and 4.9 (i)–(ii) at odd primes in general, prove `N ∣ Δ_min` (3.6), and the
Brumer–Kramer bounds for abelian surfaces `v₂(N) ≤ 20`, `v₃(N) ≤ 10`, `v₅(N) ≤ 9`, `v_p(N) ≤ 4`
for `p ≥ 7` (Brumer–Kramer, *The conductor of an abelian variety*, Compositio 92 (1994)), the
table of the knowl `g2c.conductor`, with the general bound `v_p(N) ≤ 2g + p·r + (p−1) λ_p(r)`
specialised to `g = 2`. Here `r=⌊2g/(p−1)⌋`; if
`r=Σ_i r_i p^i`, `0≤r_i<p`, set `λ_p(r)=Σ_i i r_i p^i`, including `λ_p(0)=0`
(Brumer–Kramer, §1, pp. 227–228, Theorem 6.2). Over a finite extension K of ℚ_p
the general bound is `f(J/K)≤2g+e_K(pr+(p−1)λ_p(r))`, where `e_K=v_K(p)`.
At g=2, p=2 gives r=4, λ=8 and bound 20; p=3 gives r=2, λ=0 and bound 10;
p=5 gives r=1, λ=0 and bound 9; p≥7 gives r=0 and bound 4. The `tamagawa_product` is `∏_p c_p` with `c_p` from §2.2 (4.8 at odd
semistable primes).
*Needs:* 3.6, 4.8, 4.9; Néron models §5.4.

**Checks.**

- At g=2, p=2, r=4 and λ₂(r)=8 give conductor bound 20.
- At p=3 and p=5 the values `(r,λ_p(r),bound)` are `(2,0,10)` and `(1,0,9)`.
- At p=7, r=0 and λ₇(0)=0 give bound 4; the digit sum is empty, not undefined.

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
`bad_lfactors` determine it. The weaker continuation input is `SerreC9 J 1`, with
`N_1 = conductor J` (5.6) and `w_1 = ∏_v w_v` (4.12). The Hasse–Weil assertion
also excludes poles in the critical strip (LMFDB, `g2c.hasse_weil_conjecture`, statement).
For analytic rank require in addition that `L(J,s)` is holomorphic at 1; then PS.3.3's
order is a nonnegative integer and its leading coefficient is `L^*`.
Paramodularity is a sufficient modularity assertion, not another name for meromorphic
continuation: for an abelian surface over ℚ with rational endomorphism ring ℤ it asserts
a corresponding weight-two paramodular newform of level its conductor with the same
L-function (LMFDB, `g2c.paramodular_conjecture`, statement). No modularity theorem is owned here.

The API includes:

- The equation-level Euler factors agree with the supplied L-function’s local factors.
- The real period is independent of the integral differential basis; the BSD quotient requires continuation and holomorphy at 1.

**Checks.**

- The germ `(s−1)^{-2}` is meromorphic, nonzero and invariant under `s↦2−s`,
  but its order is −2; holomorphy at 1 excludes it.
- The germ 1 has order 0 and leading coefficient 1.
- The germ `(s−1)²` has order 2 and leading coefficient 1; meromorphic order alone
  would not distinguish its admissibility as an analytic rank from the pole above.
- Swapping the two differential basis vectors gives determinant −1 and the same period;
  replacing ω₁ by 2ω₁ gives twice the period and is not a ℤ-basis change.
- Replacing `(ω₁,ω₂)` by `(ω₁+ω₂,ω₂)` has determinant 1 and leaves the volume unchanged.

Define unconditionally the real period `Ω_J=∫_{J(ℝ)} |ω₁∧ω₂|` for a `ℤ`-basis `ω₁, ω₂` of the
invariant-differential lattice of the Néron model of `J` over `ℤ` (the Néron models roadmap §1.9
for the global model and §1.11 for the lattice, free because `ℤ` is a principal ideal domain),
independent of the basis: changing by an integral matrix of determinant ±1
multiplies the top form by ±1 and leaves its absolute value unchanged. The period
is positive since a nonzero invariant top form gives positive Haar volume on the
nonempty compact Lie group J(ℝ); the regulator is positive (empty determinant 1 at
rank zero), and the Tamagawa numbers are positive integers, so the quotient denominator
is nonzero. Under `SerreC9 J 1` and holomorphy at 1, the **BSD quotient**
`analyticSha J := L^* · #J(ℚ)_tors² / (Ω_J · Reg(J) · ∏_p c_p)` as the real number this
formula defines from the heights roadmap's regulator and torsion (§1.7–1.8, §1.18) and the
Tamagawa product of 5.6. The LMFDB's `real_period` and `analytic_sha` are these numbers; which
curves have the hypothesis as a theorem (`hasse_weil_proved`) is data, not mathematics owned here.
*Needs:* 5.3, 5.4, 5.6; Néron models §1.9, §1.11, §5.6; heights roadmap §1.7–1.8, §1.18;
periods roadmap PS.1.1, PS.1.8, PS.3.3; Mathlib `LSeries`.

### Examples

For q=3, N₁=6 and N₂=8 give Euler polynomial `1+2T+T²+6T³+9T⁴` and
Jacobian order 19. A good genus-two prime 17 is locally soluble by the Weil bound.

### Dependencies

Layers 0–4; JacobianChallenge Layers D–F; EffectiveDiophantineMethods §3.23;
HeightsRationalPointsAndObstructions §§1–3, 6.1; FunctionFieldArithmetic §§5.1, 5.3, 5.6;
SchemeAndStackFoundations §5.11; NeronModelsAndSemistableAbelianVarieties §§1, 5;
PeriodsAndSpecialValues PS.1.1, PS.1.8, PS.3.3.

## Downstream consumers

CanonicalModelsAndGonality uses the equation/isomorphism dictionary;
GroupActionsOnRiemannSurfaces uses the involution criterion; CurvesOverFiniteFields
and AbelianVarietiesOverFiniteFields use the equation-level point counts and Jacobian
Euler-factor bridge. SatoTateGroups and AdelicImagesAndModularCurves consume the
genus-two equations and intrinsic invariants without supplying this roadmap.

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
`G > 0` on `ℝ` (`G = (x³ + 2x² − x − 1)² + 4x²(x + 1)²`, whose summands do not vanish together), so
`C(ℝ)` has **one** component (0.6, 5.5): in the chart at infinity `Y = y/x³` the sheet
`y = +√G` tends to `Y = +1` as `x → +∞` and to `Y = −1` as `x → −∞`, and the sheet `y = −√G`
closes the same circle. For a positive quartic in genus 1 (`Y = y/x²`) each sheet has the same
limit at both ends and `C(ℝ)` has two components; the parity of `g + 1` decides. `Aut(C) ≅ C₆` — the diamond operators
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
  `Aut(C_{𝔽̄₇}) = C₁₀` (`x ↦ ζ₅ x`, `y ↦ ±y`) but `Aut(C) = C₂`, since `5 ∤ 7 − 1` and `𝔽₇` has no
  primitive fifth root of unity; over `𝔽₁₁` (`11 ≡ 1 mod 5`) `Aut(C) = C₁₀` already over the
  ground field.

## References

- J.-I. Igusa, *Arithmetic variety of moduli for genus two*, Ann. of Math. 72 (1960), 612–649.
  §3 (the invariants `J₂, …, J₁₀`), Theorem 2 (the moduli scheme), §8 (automorphism groups,
  Lemmas 8–9, cases (1)–(6), (1′)–(6′), Theorem 7).
- Q. Liu, *Courbes stables de genre 2 et leur schéma de modules*, Math. Ann. 295 (1993), 201–222.
  §1 (invariants in every characteristic, the relation `J₂J₆ − J₄² = 4J₈`, `I₄`, `I₁₂`),
  Théorème 1 (stable reduction types from invariants), §0, pp. 201–202 (smooth moduli),
  Théorème 2, pp. 208–210, and Corollaires 3.1–3.3 (compactified stable moduli over `ℤ`), §4 (automorphism groups of stable genus-2 curves, 4.1.1–4.1.4 for the
  smooth case).
- Q. Liu, *Modèles minimaux des courbes de genre deux*, J. reine angew. Math. 453 (1994),
  137–164. §1 (the unmixed equation and hypotheses), §2 (affine and projective invariants, the explicit
  `J₂, J₄, J₆`, `J₁₀ = 2^{−12}disc`), §3 (the minimal extension), §4 (the tame case,
  Proposition 4.1.1), §8 Tables 2.1–3.4 (Namikawa–Ueno types and component groups),
  with the author’s errata, items 7–10.
- Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994),
  51–79. §1.1, Proposition 1 and footnote, p. 53; §4, Théorème 1, p. 70;
  §6.1, Théorème 2, pp. 75–77: regular-model and equation discriminants, the
  conductor inequality and the correction to the genus-one Ogg formula.
- Q. Liu, *Global Weierstrass equations of hyperelliptic curves*, arXiv:2109.07318v3 (2022).
  Lemma 1.2 and Proposition 1.4, pp. 3–4; Lemma 2.3 and Remark 2.5, p. 5;
  Remark 3.6 and Lemmas 3.7–3.9, pp. 8–9; proof of Corollary 3.12, p. 11.
- T. Dokchitser, V. Dokchitser, C. Maistret, A. Morgan, *Arithmetic of hyperelliptic curves over
  local fields*, arXiv:1808.02936v2 (2018); all DDMM numbering and pages here refer to this version. Definitions 1.1–1.7, 1.9,
  1.11, 1.12, 1.21, 1.26; Theorems 1.8, 1.10, 1.14, 1.15, 1.19, 1.20, 1.23, 1.25, 1.27, 1.28, 1.29;
  Lemma 2.22; Theorem 13.3; Lemma 15.1; Definition 18.1, Lemma 18.2, Theorems 18.4, 18.7, 18.8
  with Tables 7–8; Theorem 19.1. The toric part of Theorem 1.19 (= Theorem 10.1) and of
  Corollary 9.6(2) is printed with the term `⊖ ε_ℛ` unconditionally; the proof of Corollary
  9.6(2) (p. 54) subtracts it only for übereven `ℛ`, and 4.7 states that form, since a cotwin
  `ℛ` has `ε_ℛ = ε_{ℛ^*} ≠ 0` (Definitions 1.11–1.12).
- P. Lockhart, *On the discriminant of a hyperelliptic curve*, Trans. Amer. Math. Soc. 342
  (1994), 729–752. The discriminant `2^{4g} disc(f + h²/4)`, its transformation law, and global
  minimal models.
- J.-F. Mestre, *Construction de courbes de genre 2 à partir de leurs modules*, Effective Methods
  in Algebraic Geometry (MEGA 1990), Progr. Math. 94, Birkhäuser, 1991, 313–334. The conic and
  cubic, and the obstruction.
- G. Cardona, J. Quer, *Field of moduli and field of definition for curves of genus 2*,
  Computational Aspects of Algebraic Curves, Lecture Notes Ser. Comput. 13, World Scientific,
  2005, 71–83; locators here refer to arXiv:math/0207015v1 (2002), §1, Lemma 1,
  p. 4, Theorem 2, p. 5, and §2, Table 1, Theorem 3 and Remark 4, pp. 6–7.
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
