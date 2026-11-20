# Roadmap: Heun's equation and its confluent forms

**Summary.** This roadmap builds the theory of Heun's equation as a library: the Fuchsian equation
of the second order with four regular singular points, in the normal form

```text
w″ + (γ/z + δ/(z − 1) + ε/(z − a)) w′ + (αβz − q)/(z(z − 1)(z − a)) w = 0,
α + β + 1 = γ + δ + ε,
```

its local solutions, the eigenvalue problems for the accessory parameter `q` that single out the
Heun functions and the Heun polynomials, their orthogonality and integral equations, and the
confluent equations obtained when singular points merge. Its organization follows the structure of
the subject rather than any one text. Fuchsian equations come first: the partial-fraction form
forced by regular singularities, the Fuchs relation, the rigidity of three singular points
(Riemann's equation) and the one free accessory parameter of four. The transformations that preserve
Heun's form come next, then the local solutions, which they move between the singular points. The
polynomial problem is finite and precedes the transcendental eigenvalue problem for solutions
analytic at two singular points; orthogonality and integral equations rest on both. The confluent
forms and the reductions to the hypergeometric function close the roadmap. The content is drawn from
Ronveaux (ed.), *Heun's Differential Equations* (Part A by Arscott and others, and the confluent
parts), Kristensson (*Second Order Differential Equations*, Chs. 3, 4 and 8), Haraoka (*Linear
Differential Equations in the Complex Domain*, Chs. 4 and 7), Iwasaki–Kimura– Shimomura–Yoshida
(*From Gauss to Painlevé*, Chs. 1–2), Olver (*Asymptotics and Special Functions*, Ch. 5),
Whittaker–Watson (§§10.6–10.8 and Ch. XXIII), Maier's papers on the automorphisms and the
hypergeometric reductions, and the NIST *Digital Library of Mathematical Functions* (DLMF), and each
headline cites its sources; see [References](#references).

Neither Mathlib nor Tau Ceti has any of this theory. Mathlib has power series and their radii
(`FormalMultilinearSeries.ofScalars`, `HasFPowerSeriesOnBall`), the identity theorem, meromorphic
orders (`meromorphicOrderAt`), the Gauss series `ordinaryHypergeometric` with its radius,
determinants and characteristic polynomials (`Matrix.det`, `Matrix.charpoly`), the spectral theorem
for Hermitian matrices, principal powers (`Complex.cpow`, `Complex.slitPlane`) and the Weierstrass
function `PeriodPair.weierstrassP`. Tau Ceti has the analyticity of the Gauss series on the unit
disc, a real Wronskian lemma and the Jacobian elliptic functions of real argument.

The roadmap covers:
- Fuchsian equations of the second order: Fuchs' theorem in partial-fraction form, the Fuchs
  relation, the rigidity of three singular points and Heun's equation with its accessory parameter
  as the general equation with four, and the normal form (Layer 1);
- the transformations of Heun's equation: the F-homotopic transformations, the homographies of the
  four singular points, the group of 192 automorphisms, and the trigonometric, Jacobi and
  Weierstrass forms with Lamé's equation as a special case (Layer 2);
- local solutions: `Hl(a, q; α, β, γ, δ; z)` with its three-term recurrence and radius, the
  solutions at `1`, `a` and `∞`, the equivalent expressions, convergence on the boundary circle, and
  the connection coefficients (Layer 3);
- Heun polynomials: the criterion `α = −n` with the vanishing of a tridiagonal determinant, the
  reality and simplicity of the eigenvalues under sign conditions, and the eight classes (Layer 4);
- Heun functions: the eigenvalue problem for `q` as the zero set of an entire function, the real
  Sturm–Liouville picture with its oscillation count, the continued fraction, and the expansions in
  hypergeometric and Jacobi functions (Layer 5);
- orthogonality and integral equations: single orthogonality on a segment and on a Pochhammer loop,
  double orthogonality of Heun polynomials, and integral transforms with kernels solving
  `(D_z − D_t)K = 0`, with the hypergeometric kernels (Layer 6);
- the confluent, doubly confluent, biconfluent and triconfluent equations, the confluence limits
  that produce them, and the irregular singularity of rank one of the confluent equation (Layer 7);
- the reductions of `Hl` to the Gauss function (Layer 8).

The roadmap rests on Mathlib, Tau Ceti and five roadmaps:
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) for the Gauss
function, Riemann's equation and Kummer's solutions,
[AsymptoticExpansions](../AsymptoticExpansions/README.md) for linear equations in the complex
domain, three-term recurrences and Darboux's method,
[SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) for Sturm comparison,
[LaguerreJacobi](../LaguerreJacobi/README.md) for the Jacobi polynomials, and
[SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md) for
Pincherle's theorem.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Heun/`, with Layer 1 in
`TauCeti/Analysis/ODE/Fuchsian.lean`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Fuchsian equations and Heun's equation** (1.1–1.4).
2. **Transformations of Heun's equation** (2.1–2.4).
3. **Local solutions** (3.1–3.5).
4. **Heun polynomials** (4.1–4.3).
5. **Heun functions** (5.1–5.4).
6. **Orthogonality and integral equations** (6.1–6.4).
7. **Confluent forms** (7.1–7.4).
8. **Reductions to the Gauss function** (8.1–8.2).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the README
attaches to it; it is not an exhaustive acceptance test, and the other headlines are targets of the
same standing, stated in prose. The `**Checks.**` and `### Examples` of each layer are statements to
prove; they test the conventions on explicit values.

**Inputs.** Cases of the targets that Mathlib, Tau Ceti or a roadmap on main already proves are
inputs, not targets:
- the Gauss series on the unit disc: Mathlib's `ordinaryHypergeometric` with
  `ordinaryHypergeometricSeries_radius_eq_one`, and Tau Ceti's
  `TauCeti.analyticOnNhd_ordinaryHypergeometric`, consumed in Layer 8;
- the ordinary-point theorem, the Frobenius solutions at a regular singular point and the rank-one
  theory at an irregular singular point: AsymptoticExpansions §§10.2–10.4, consumed in Layers 3, 5
  and 7;
- Riemann's equation, its invariance under homographies and its reduction to the hypergeometric
  equation: SpecialFunctionsHypergeometric 3.4, consumed in 1.2;
- Sturm comparison on an open interval: SpecialFunctionsBessel (an auxiliary result of its 10.1),
  consumed in 5.2;
- the solutions of a three-term recurrence with distinct characteristic roots and the recessive
  solution (Perron's theorem in the form of DLMF 2.9.3–2.9.8): AsymptoticExpansions §12.1, consumed
  in 3.1, 5.3 and 5.4;
- Darboux's method: AsymptoticExpansions §13.6, consumed in 3.4;
- Pincherle's theorem with complex coefficients: SpecialFunctionsEiLiErfIncompleteGamma 4.1,
  consumed in 5.3.

**Auxiliary results owned here**, which the layers need and which neither Mathlib, Tau Ceti nor a
consumed roadmap provides in this form:
- a meromorphic function on `ℂ` with finitely many poles and polynomial growth at `∞` is a rational
  function, in the partial-fraction form that 1.1 uses;
- tridiagonal matrices with real diagonal and positive products of opposite off-diagonal entries are
  similar to real symmetric ones, so their eigenvalues are real and simple (4.2);
- the Lagrange identity for Heun's operator with the weight `ρ` of [Conventions](#conventions), and
  its two-variable form for products `w(s) w(t)` (6.1–6.3);
- holomorphic dependence on `q` of solutions of Heun's equation normalized at a regular singular
  point, and the continuity of local solutions under locally uniform convergence of the coefficients
  (3.5, 7.2);
- the outer asymptotics of Jacobi polynomials off `[0, 1]` that the convergence of the series of
  Type II needs (5.4).

**What it does not own:**
- *The Gauss function and Riemann's equation.* `F(a, b; c; z)` on the cut plane, Riemann's equation,
  the P-symbol, Kummer's 24 solutions and the connection formulas belong to
  SpecialFunctionsHypergeometric (its Layers 1, 3 and 5). This roadmap applies them in 1.2, 5.4, 6.4
  and Layer 8 and restates none of them.
- *The local theory of linear equations.* Ordinary points, regular singularities (with the
  logarithmic cases) and the irregular singularity of rank one at `∞` belong to AsymptoticExpansions
  §§10.2–10.4. This roadmap applies them with their hypotheses.
- *Lamé functions.* Lamé's equation appears in 2.4 as a special case of Heun's equation under a
  change of variable; Lamé functions, Lamé polynomials and ellipsoidal harmonics are outside (see
  [Beyond](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement)).
- *Painlevé VI and isomonodromy.* Heun's equation with an additional apparent singular point, its
  isomonodromic deformations and the Painlevé VI equation belong to
  [PainleveEquations](../PainleveEquations/README.md) (its Layers 2–3 and its 7.4); this roadmap
  treats Heun's equation for fixed parameters only.
- *Jacobi polynomials.* The Jacobi polynomials and their orthogonality are LaguerreJacobi's (its
  Layers 3–4); 5.4 consumes them.
- *Recurrences and continued fractions.* The asymptotic solutions of three-term recurrences and
  Darboux's method belong to AsymptoticExpansions (its §12.1 and §13.6), and Pincherle's theorem to
  SpecialFunctionsEiLiErfIncompleteGamma (its 4.1); 3.1, 3.4, 5.3 and 5.4 apply them.

**The boundary in one sentence:** this roadmap owns second-order Fuchsian equations as far as Layer
1 states them, Heun's equation with its transformations, local solutions, Heun polynomials, Heun
functions, their orthogonality and integral transforms, the four confluent equations as equations
with their confluence limits and the local theory of the confluent equation at `∞`, and the
reductions of `Hl` to the Gauss function; it consumes the Gauss function and Riemann's equation of
SpecialFunctionsHypergeometric, the local theory, the recurrences and Darboux's method of
AsymptoticExpansions, Sturm comparison of SpecialFunctionsBessel, the Jacobi polynomials of
LaguerreJacobi and Pincherle's theorem of SpecialFunctionsEiLiErfIncompleteGamma.

## Conventions

- **Names.** Everything lives in the namespace TauCeti. Functions take their parameters first and
  their variable last, in DLMF's order:

```text
heunEps α β γ δ                       : ℂ → ℂ → ℂ → ℂ → ℂ        ε = α + β + 1 − γ − δ
IsHeunSolutionOn a q α β γ δ w U      : Prop                      w solves 31.2.1 on U
heunP α β j, heunQ a α β γ δ j, heunR a γ j : ℂ                   P_j, Q_j, R_j of 31.3.4
heunLocalCoeff a q α β γ δ j          : ℂ                         c_j of Hl
heunLocal a q α β γ δ z               : ℂ                         Hl(a, q; α, β, γ, δ; z)
heunPolyMatrix a α β γ δ n            : Matrix (Fin (n+1)) (Fin (n+1)) ℂ    M_n of 31.5.1
IsHeunEigenvalue01 a α β γ δ q        : Prop                      q is a (0, 1)-eigenvalue
IsConfluentHeunSolutionOn ε α q γ δ w U : Prop                    w solves 31.12.1 on U
confluentHeunLocalCoeff ε α q γ δ j, confluentHeunLocal ε α q γ δ z : ℂ
```

  Derivatives are Mathlib's `deriv`; no derivative functions are introduced.
- **The parameters.** `a ∉ {0, 1}` is the singularity parameter, `α, β, γ, δ` are free exponent
  parameters and `ε` is fixed by the Fuchs relation, `ε = heunEps α β γ δ`; `q` is the accessory
  parameter. All are complex unless a statement says real. DLMF assumes `|a| ≥ 1` throughout; here
  each statement carries its own hypothesis on `a`. Heun's equation depends on `α, β` only through
  `α + β` and `αβ`, so `α` and `β` are interchangeable everywhere.
- **Heun's equation as a predicate.** `IsHeunSolutionOn a q α β γ δ w U` says that `w` is complex
  differentiable on `U` and satisfies 31.2.1 at each point of `U`, with `deriv`. It is used for open
  `U` avoiding `0`, `1`, `a`; at those points Lean's `x / 0 = 0` would make the equation
  meaningless. Heun's operator is
  `D_z = z(z − 1)(z − a) ∂_z² + (γ(z − 1)(z − a) + δz(z − a) + εz(z − 1)) ∂_z + αβz` (31.10.4), so
  that 31.2.1 off the singular points is `D_z w = q w`.
- **The weight.** On `(0, 1)` with real `a > 1` put `p(t) = t^γ (1 − t)^δ (a − t)^ε` and
  `ρ(t) = p(t)/(t(1 − t)(a − t)) = t^{γ−1}(1 − t)^{δ−1}(a − t)^{ε−1}`, with principal powers of
  positive bases. Then `ρ D_t f = (p f′)′ + αβ t ρ f` (the Lagrange form). DLMF writes
  `(1 − t)^{δ−1}(t − a)^{ε−1}` in 31.9.2 and `(t − 1)^{δ−1}(t − a)^{ε−1}` in 31.10.2; on a segment
  these differ from `ρ` by a constant factor.
  For complex `a` with `|a| > 1` the factor `(a − t)^{ε−1}` is principal and continuous on `[0, 1]`,
  since `a − t` does not cross the negative real axis there.
- **Exponents.** The exponents at a finite regular singular point `c` are the roots of the indicial
  polynomial `X(X − 1) + f₀X + g₀`, `f₀ = lim (z − c) f(z)`, `g₀ = lim (z − c)² g(z)`, as in
  AsymptoticExpansions §10.3; the exponents `{ρ, ρ′}` at `∞` are those for which solutions behave
  like `z^{−ρ}`, the roots of `X(X + 1) − f₀X + g₀` with `f₀ = lim z f(z)`, `g₀ = lim z² g(z)`
  (Olver Ch. 5, §4.1, p. 148, for the definition of regular singularity). Heun's equation has
  exponents `{0, 1 − γ}`, `{0, 1 − δ}`, `{0, 1 − ε}`, `{α, β}` at `0, 1, a, ∞` (31.2.1).
- **The local solution.** `heunLocalCoeff` is the recurrence 31.3.2–31.3.4: `c₀ = 1`, `aγ c₁ = q`,
  `R_j c_{j+1} = (Q_j + q) c_j − P_j c_{j−1}` for `j ≥ 1`, with `P_j = (j − 1 + α)(j − 1 + β)`,
  `Q_j = j((j − 1 + γ)(1 + a) + aδ + ε)`, `R_j = a(j + 1)(j + γ)`. When `a = 0` or
  `γ ∈ {0, −1, −2, …}` some `R_j` vanishes and the values are junk; every theorem that uses them
  assumes `a ≠ 0` and `γ ∉ {0, −1, −2, …}`. `heunLocal` is the `tsum`, junk outside the disc where
  3.1 proves convergence. DLMF's `Hl(0, 0; …)` in 31.7.1 is the local solution of the hypergeometric
  equation that Heun's equation becomes at `a = q = 0`, and is not a value of `heunLocal` (see 8.1).
- **Branches.** Powers are principal (`Complex.cpow`). Each statement with a power names the open
  set on which the base lies in `Complex.slitPlane`; a product of principal powers is not combined
  into one power.
- **Heun functions.** DLMF writes `(s₁, s₂)Hf_m(a, q_m; α, β, γ, δ; z)` for a solution analytic at
  two singular points `s₁, s₂`, with eigenvalues `q_m` of the accessory parameter (31.4.3). This
  roadmap names only the pair `(0, 1)`: `IsHeunEigenvalue01 a α β γ δ q` says that `Hl` continues
  analytically from the unit disc to the disc of radius `|a|`, for `|a| > 1`; the other pairs are
  reached by the transformations of Layer 2. The index `m` is defined only where 5.2 orders the
  eigenvalues: for real parameters, `q₀ > q₁ > ⋯`.
- **Heun polynomials.** DLMF's `Hp_{n,m}(a, q_{n,m}; −n, β, γ, δ; z)` is `Hl` at an eigenvalue
  `q_{n,m}` of `M_n` (31.5.2). This roadmap does not name `Hp`; it states the theorems for
  `heunLocal` with `α = −n` and `q` a root of the characteristic polynomial of
  `heunPolyMatrix a (−n) β γ δ n`. Ronveaux's "Heun polynomials" of classes II–VIII (4.3) are
  products of powers with such polynomials.
- **The confluent equations.** They are DLMF's normalizations 31.12.1–31.12.4, each with its own
  `α, γ, δ, ε, q` (not those of Heun's equation):

```text
confluent         w″ + (γ/z + δ/(z − 1) + ε) w′ + (αz − q)/(z(z − 1)) w = 0      (31.12.1)
doubly confluent  w″ + (δ/z² + γ/z + 1) w′ + (αz − q)/z² w = 0                  (31.12.2)
biconfluent       w″ − (γ/z + δ + z) w′ + (αz − q)/z w = 0                       (31.12.3)
triconfluent      w″ + (γ + z) z w′ + (αz − q) w = 0                             (31.12.4)
```

  The sign of the second term in 31.12.3 is that of the online DLMF; the 2010 print has `+`
  (see the corrections below). 7.3 also uses the biconfluent equation with a free coefficient
  `ε` of `z`, `w″ − (γ/z + δ + εz) w′ + (αz − q)/z w = 0`, which the substitution `z = ε^{−1/2} t`
  turns, for `ε ≠ 0`, into 31.12.3 in `t` with parameters `γ`, `ε^{−1/2}δ`, `α/ε`, `ε^{−1/2}q`.
  Ronveaux's parts on the confluent equations use other canonical forms (Part B, §1.1, for the
  confluent; the biconfluent canonical equation (1.2.5) of its Part D, p. 194; the triconfluent
  canonical form (1.2.1), p. 254), and Kristensson's reduced confluent equation (8.17), p. 159, is
  a further one.
- **Other normalizations of Heun's equation.** Kristensson (§4.4.1, (4.10), p. 56) writes the
  accessory parameter as `q = αβh`; Ronveaux Part A (1.1.1), p. 7, has DLMF's form, which goes back
  to Heun. Whittaker–Watson (§10.6, p. 203) write the general equation with five regular singular
  points; its confluent forms are their Lamé, Mathieu, Legendre, Bessel, Weber and Stokes equations
  (p. 204), not Heun's.
- **Corrections to DLMF.** Three statements of the 2010 print are false; the roadmap states the
  corrected forms and checks each in its section:
  - 31.3.10–31.3.11: the accessory parameter of the solution at `∞` belonging to `α` is
    `q/a − α(β − ε) − (α/a)(β − δ)`, the negative of the printed value, and likewise for `β` (3.2);
    corrected in the online DLMF (V1.1.7);
  - 31.12.3: the second term has the sign `−`, `w″ − (γ/z + δ + z) w′ + (αz − q)/z w = 0`; the
    print has `+`; corrected in the online DLMF (V1.0.7);
  - 31.10.8: the coefficient of `∂K/∂φ` is `(2δ − 1) cot φ − (2ε − 1) tan φ`, not
    `(1 − 2δ) cot φ − (1 − 2ε) tan φ` (6.4); uncorrected in the online DLMF as of version 1.2.8.

  Whittaker–Watson's recurrence (Ch. XXIII, Misc. Ex. 7, p. 576) has an error that Ronveaux Part A
  notes at (3.3.3), p. 35; the roadmap follows DLMF 31.3.3–31.3.4, which agrees with Ronveaux and
  Kristensson (8.4)–(8.6), pp. 143–144.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- **Riemann's equation** ([3.4](../SpecialFunctionsHypergeometric/README.md#34-riemanns-equation)):
  DLMF 15.11.1 with the condition 15.11.2 for three distinct finite singular points, its form with
  one point at `∞`, Möbius invariance 15.11.6, the reduction 15.11.7 to the hypergeometric equation
  and the multiplication rule 15.11.8, all stated for solutions; no P-symbol definition. 1.2
  identifies the Fuchsian equations of 1.1 with three singular points with Riemann's equation.
- **The hypergeometric equation and its solutions**
  ([3.1](../SpecialFunctionsHypergeometric/README.md#31-the-equation-and-abels-identity),
  [3.2](../SpecialFunctionsHypergeometric/README.md#32-fundamental-solutions)): 15.10.1, Abel's
  identity, the span criterion and the fundamental pairs at `0`, `1`, `∞`. Used in 5.4 and 6.4.
- **The series and the polynomial cases**
  ([1.3](../SpecialFunctionsHypergeometric/README.md#13-the-series-and-the-polynomial-cases)):
  Mathlib's `ordinaryHypergeometric` is `F(a, b; c; z)` on the unit disc for `c ∉ {0, −1, −2, …}`,
  and terminates when `a` or `b` is a nonpositive integer. Used in Layer 8.
- **Kummer's 24 solutions**
  ([5.3](../SpecialFunctionsHypergeometric/README.md#53-kummers-24-solutions)), the hypergeometric
  analogue of 2.3, used there only as a Check of the counting.

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- **Ordinary points** ([§10.2](../AsymptoticExpansions/README.md#102-ordinary-points)): for
  coefficients holomorphic on a disc, the initial-value problem has a unique solution holomorphic on
  the disc, with Taylor coefficients given by the recursion. Used for the continuation of local
  solutions along paths avoiding the singular points (3.1, 3.5, 5.2).
- **Regular singularities** ([§10.3](../AsymptoticExpansions/README.md#103-regular-singularities)):
  on the slit punctured disc of radius `r` around `z₀`, with indicial roots `α₁, α₂`,
  `Re α₁ ≥ Re α₂`, the Frobenius solution for each root `ρ` with `Q(ρ + s) ≠ 0` for `s ≥ 1`,
  convergent on the whole disc; the logarithmic solution when `α₁ − α₂ ∈ ℕ`; nonvanishing Wronskian.
  Used for the uniqueness in 3.1, for the solutions at the other singular points in 3.2 and for the
  analytic solutions at `1` in 5.1–5.2.
- **Irregular singularity of rank one**
  ([§10.4](../AsymptoticExpansions/README.md#104-irregular-singularity-of-rank-one-at-infinity)):
  for `f`, `g` convergent series in `z^{−1}` for `|z| > a₀` with unequal roots `λ₁ ≠ λ₂` of
  `λ² + f₀λ + g₀`, the unique solutions `W₁`, `W₂` in logarithmic coordinates with the formal
  behaviour `e^{λ_j z} z^{μ_j}`, `μ_j = −(f₁λ_j + g₁)/(f₀ + 2λ_j)`, in the sectors stated there, and
  their Stokes multipliers. 7.4 applies it to the confluent equation 31.12.1 at `∞` (`a₀ = 1`,
  `λ₁ = 0`, `λ₂ = −ε`, unequal exactly when `ε ≠ 0`) and to the doubly confluent equation at `∞`
  and, after `z ↦ 1/z`, at `0`.
- **Distinct characteristic roots**
  ([§12.1](../AsymptoticExpansions/README.md#121-distinct-characteristic-roots)): for
  `w(n + 2) + f(n) w(n + 1) + g(n) w(n) = 0` with `f`, `g` having Poincaré expansions in `n^{−1}`,
  `g₀ ≠ 0` and `f₀² ≠ 4g₀`, solutions `w_j(n) ∼ ρ_jⁿ n^{α_j}`, and when `|ρ₁| < |ρ₂|` the recessive
  solution `w₁`, unique up to a factor; in the tail form, without `g(n) ≠ 0` for every `n`. The
  recurrence of 3.1, `c_{j+1} − ((Q_j + q)/R_j) c_j + (P_j/R_j) c_{j−1} = 0`, has rational
  coefficients with `f₀ = −(1 + a)/a`, `g₀ = 1/a`, `f₀² − 4g₀ = (a − 1)²/a² ≠ 0` and roots `1`,
  `1/a`, of distinct moduli for `|a| ≠ 1`. Used in 3.1, 5.3 and 5.4 (the recurrences of 31.11).
- **Darboux's method**
  ([§13.6](../AsymptoticExpansions/README.md#136-darbouxs-method)): DLMF 2.10.29–2.10.32, including
  the form with finitely many exceptional points on the circle. Used in 3.4 with `r = 1` and the
  one exceptional point `z = 1`.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- **Pincherle's theorem**
  ([4.1](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#41-pincherles-theorem)): for complex
  `a n`, `b n` with every `a n ≠ 0`, the continued fraction `a₁/(b₁ + a₂/(b₂ + ⋯))` converges if
  and only if `y(n + 1) = b n · y(n) + a n · y(n − 1)` has a minimal solution `f` with `f(0) ≠ 0`,
  and its value is then `−f(1)/f(0)`. Used in 5.3 with `b n = (Q_n + q)/R_n` and
  `a n = −P_n/R_n`, nonzero for `α, β ∉ {0, −1, −2, …}`.

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- Sturm comparison (an auxiliary result of its 10.1): for `p > 0` of class `C¹` and continuous
  `q₁ ≤ q₂` on an open interval, between consecutive zeros of a nontrivial real solution of
  `(p u′)′ + q₁ u = 0` every real solution of `(p v′)′ + q₂ v = 0` vanishes, unless `q₁ = q₂` there
  and `v` is a multiple of `u`; and the zeros of a nontrivial real solution are simple and isolated.
  5.2 applies it on `(0, 1)` with `p(t) = t^γ(1 − t)^δ(a − t)^ε` and `q_i(t) = (αβt − q_i) ρ(t)` for
  two real values `q₂ < q₁` of the accessory parameter; `p` is positive and `C¹` on the open
  interval, which is all the theorem asks.

### From [LaguerreJacobi](../LaguerreJacobi/README.md)

- The Jacobi polynomials `P_n^{(α,β)}` over `ℝ` and `ℂ`, their degree and recurrences (its 3.2–3.3)
  and their orthogonality against the Jacobi weight (its Layer 4). Used for the series of Type II in
  5.4.

`Suggested.lean` imports none of these roadmaps; it needs no definition owned by them, since the
statements of Layer 8 use Mathlib's `ordinaryHypergeometric` on the unit disc.

### From Tau Ceti

- `TauCeti.analyticOnNhd_ordinaryHypergeometric` and
  `TauCeti.one_le_radius_ordinaryHypergeometricSeries`
  (`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`), for Layer 8.
- `TauCeti.wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean`), the real constancy
  of the Wronskian, used on `(0, 1)` in 5.2 for real parameters.
- `TauCeti.Real.jacobiSn` (`TauCeti/Analysis/SpecialFunctions/JacobiElliptic/Basic.lean`), the
  Jacobian `sn` of real argument, used for the Jacobi form of 2.4 on the real interval `(0, K)`.

### From Mathlib

- `FormalMultilinearSeries.ofScalars`, `HasFPowerSeriesOnBall`,
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, for Layers 3 and 8.
- `meromorphicOrderAt`, for 1.1.
- `Matrix.det`, `Matrix.charpoly` and `Matrix.IsHermitian.eigenvalues`, for Layer 4.
- `Complex.cpow` and `Complex.slitPlane`, throughout.
- `TendstoLocallyUniformlyOn` and `TendstoLocallyUniformlyOn.differentiableOn`, for 7.2.
- `_root_.hasDerivAt_integral_of_dominated_loc_of_deriv_le` and
  `intervalIntegral.integral_comp_mul_deriv`, for 6.3.
- `PeriodPair.weierstrassP`, for the Weierstrass form of 2.4.
- `ordinaryHypergeometric` and `ordinaryHypergeometricSeries_radius_eq_one`, for Layer 8.

## How to read the build

Layer 1 is about equations, not functions. A second-order equation whose singular points (with `∞`)
are all regular has coefficients of a rigid partial-fraction form (Fuchs' theorem); the exponents
then sum to the number of singular points minus two (the Fuchs relation). Three singular points
leave nothing free, which is why every such equation is Riemann's and reduces to the hypergeometric
one; four leave one constant, the accessory parameter `q`, and Heun's equation is the normal form of
that family. Layer 2 collects the transformations that preserve Heun's form: multiplication by
powers of `z`, `z − 1`, `z − a` and the homographies permuting `0, 1, a, ∞`; together they give 192
equations, and the trigonometric and elliptic substitutions give the classical forms, Lamé's
equation among them. Layer 3 builds the solution at `0` from the three-term recurrence and moves it
to the other singular points with Layer 2; the connection between the solutions at `0` and at `1`
has no closed form, and only its analytic structure in `q` is stated. Layers 4 and 5 are the two
eigenvalue problems for `q`. In Layer 4 the recurrence terminates and the problem is a finite
tridiagonal matrix; in Layer 5 it does not, and the eigenvalues are the zeros of an entire function,
real and ordered when the parameters are real and positive, by a Sturm–Liouville argument on
`(0, 1)`. Layer 6 is the analysis that the Lagrange identity gives: orthogonality on a segment and
on a loop, double orthogonality of the polynomials in two variables, and integral transforms whose
kernels solve `(D_z − D_t)K = 0`. Layer 7 lets singular points merge: the confluent equation is a
limit of Heun's, and the doubly confluent, biconfluent and triconfluent equations are limits of it;
the irregular singular point that appears is of rank one only for the confluent and doubly confluent
equations, where AsymptoticExpansions applies. Layer 8 is the few cases in which `Hl` is a Gauss
function.

The harder material is in 3.5 (holomorphy of the connection coefficients), 5.2 (the real eigenvalue
problem and its oscillation count), 5.4 (convergence of the hypergeometric expansions) and 7.2 (the
confluence limit for solutions, not only for coefficients).

## Layer 1: Fuchsian equations and Heun's equation

### 1.1 Fuchsian equations of the second order

Sources: Haraoka Theorem 4.3 (Fuchs' theorem), p. 31, and Theorem 7.1 (Fuchs relation), p. 124;
Kristensson Theorem 3.1, p. 32, with (3.4); IKSY Ch. 1, Propositions 4.2–4.3, pp. 10–11; Olver Ch.
5, §4.1, p. 148; Whittaker–Watson §10.6, p. 203; DLMF 31.14.1–31.14.2.

Consider `w″ + f w′ + g w = 0` with `f`, `g` analytic off a finite set `A ⊂ ℂ`. Prove:
- **Fuchs' theorem in partial fractions** (`fuchsian_partial_fractions`): if at each `c ∈ A` the
  functions `f`, `g` are meromorphic with order at least `−1`, respectively `−2`, and `z f(z)`,
  `z² g(z)` are bounded for large `|z|` (so `∞` is an ordinary or regular singular point), then
  there are `A₁, B₁, C₁` with `∑_{c∈A} C₁(c) = 0` and, for all `z ∉ A`,
  `f(z) = ∑_{c∈A} A₁(c)/(z − c)` and `g(z) = ∑_{c∈A} (B₁(c)/(z − c)² + C₁(c)/(z − c))`.
- **the Fuchs relation** (`fuchs_relation`): in the form of the previous bullet the exponents at
  `c ∈ A` are the roots `ρ(c), ρ′(c)` of `X² + (A₁(c) − 1)X + B₁(c)` and those at `∞` the roots
  `σ, σ′` of `X² + (1 − ∑ A₁)X + ∑ (B₁(c) + c C₁(c))`; then
  `∑_{c∈A} (ρ(c) + ρ′(c)) + σ + σ′ = #A − 1`, the number of singular points with `∞` minus `2`.
- the converse of Fuchs' theorem: every equation of the partial-fraction form with `∑ C₁(c) = 0` has
  regular singular points at the points of `A` and at `∞` (or `∞` is ordinary), and its exponents
  are as in the second bullet.

Fuchs' theorem: `f − ∑ A₁(c)/(z − c)` and `g − ∑ (B₁(c)/(z − c)² + C₁(c)/(z − c))` (principal parts)
are entire; the growth conditions at `∞` make them polynomials by Liouville's theorem, and then `0`;
the coefficient of `z` in `z² g(z)` at `∞` is `∑ C₁(c)`, which must vanish. The Fuchs relation is
Vieta's formula: the exponent sums are `1 − A₁(c)` and `∑ A₁ − 1`. As stated, `fuchs_relation` and
`heun_accessory_parameter` (1.3) are the algebraic steps of their headlines, about numbers given by
the partial-fraction data, and serve as checks of the conventions; the link to solutions is the
converse bullet, through AsymptoticExpansions §10.3. The exponents at `∞`:
`w(z) = u(1/z)` turns `f, g` into `2/t − f(1/t)/t²` and `g(1/t)/t⁴`, whose leading coefficients give
the indicial polynomial `X(X + 1) − (∑ A₁)X + ∑ (B₁(c) + cC₁(c))` in the convention `w ∼ z^{−ρ}`.

**Checks.**
- Heun's equation: `A = {0, 1, a}`, `A₁ = (γ, δ, ε)`, `B₁ = 0`, and the exponents
  `0 + (1 − γ) + 0 + (1 − δ) + 0 + (1 − ε) + α + β = 2 = #A − 1` by `α + β + 1 = γ + δ + ε`.
- The hypergeometric equation, `A = {0, 1}`, exponents `{0, 1 − c}`, `{0, c − a − b}`, `{a, b}`: the
  sum is `1 = #A − 1`.
- Negative control: `w″ + w′/z² = 0` has `f` of order `−2` at `0`, outside the hypotheses; its
  "indicial" data do not exist, and `0` is an irregular singular point (Olver Ch. 5, §4.1, p. 148).
- With `A = ∅`, the theorem forces `f = g = 0`: the only Fuchsian equation without finite singular
  points and with `∞` at worst regular singular is `w″ = 0`, whose exponents at `∞` are `{0, −1}`,
  with sum `−1 = #A − 1`.

*Needs:* Mathlib `meromorphicOrderAt` and Liouville's theorem.

### 1.2 Three singular points

Sources: Whittaker–Watson §10.7, p. 206; IKSY Ch. 2, Proposition 1.1.1, p. 28; Haraoka §7.2, p. 126;
SpecialFunctionsHypergeometric 3.4 (DLMF 15.11.1–15.11.8).

Prove:
- for distinct finite `c₁, c₂`, the Fuchsian equation of 1.1 with `A = {c₁, c₂}` is determined by
  its exponents: `A₁(c)`, `B₁(c)` by the exponents at `c`, and `C₁(c₁) = −C₁(c₂)` by
  `c₁C₁(c₁) + c₂C₁(c₂) = σσ′ − B₁(c₁) − B₁(c₂)`; with three finite singular points, the equation
  reached by a homography sending one of them to `∞` is determined in the same way;
- these equations are exactly Riemann's equations of SpecialFunctionsHypergeometric 3.4 (15.11.1
  with 15.11.2, and its form with `γ = ∞`), so every solution is, by its 15.11.7, a product of
  powers with a solution of the hypergeometric equation in a Möbius-transformed variable;
- with two singular points `c₁, ∞`, `σ, σ′` and `ρ(c₁), ρ′(c₁)` with `ρ + ρ′ + σ + σ′ = 0`, every
  solution is a combination of `(z − c₁)^{ρ}` and `(z − c₁)^{ρ′}` (or of `(z − c₁)^{ρ}` and
  `(z − c₁)^{ρ} log(z − c₁)` when `ρ = ρ′`) (Whittaker–Watson §10.8, p. 208).

The first bullet is linear algebra on the data of 1.1: two unknowns `C₁(c₁), C₁(c₂)`, two
independent equations because `c₁ ≠ c₂`. This rigidity is what fails with four points (1.3).

**Checks.**
- The hypergeometric equation `z(1 − z)w″ + (c − (a + b + 1)z)w′ − abw = 0` has `A₁(0) = c`,
  `A₁(1) = a + b + 1 − c`, `B₁ = 0`, `C₁(0) = −ab`, `C₁(1) = ab`, and
  `0·C₁(0) + 1·C₁(1) = ab = σσ′`.
- With `A = {0, 1}` and the exponents `{0, 1 − c}`, `{0, c − a − b}`, `{a, b}`, the reconstruction
  of the first bullet returns exactly these coefficients.

*Needs:* 1.1; SpecialFunctionsHypergeometric 3.4.

### 1.3 Four singular points: Heun's equation and the accessory parameter

Sources: Ronveaux Part A, §1.1, (1.1.1)–(1.1.3), p. 7, and §2.3, (2.3.3)–(2.3.5), p. 19; Kristensson
§4.4.1, (4.10), pp. 56–57; Haraoka, Introduction, pp. 4–5; Whittaker–Watson Ch. XXIII, p. 555; DLMF
31.2.1.

Prove:
- **the accessory parameter** (`heun_accessory_parameter`): for `a ∉ {0, 1}` and a Fuchsian equation
  with singular points `0, 1, a, ∞` and exponents `{0, 1 − γ}`, `{0, 1 − δ}`, `{0, 1 − ε}`,
  `{α, β}`, whose `w`-coefficient is `C₀/z + C₁/(z − 1) + C_a/(z − a)` with `C₀ + C₁ + C_a = 0` and
  `C₁ + aC_a = αβ` (by 1.1): that coefficient equals `(αβz − q)/(z(z − 1)(z − a))` with `q = −aC₀`
  at every `z ∉ {0, 1, a}`; and two such triples with the same `C₀` coincide;
- consequently the Fuchsian equations with these four singular points and these exponents form the
  one-parameter family of Heun's equations indexed by `q ∈ ℂ`, with `α + β + 1 = γ + δ + ε` by 1.1;
  the parameter count is six (`a, q, α, β, γ, δ`);
- every Fuchsian equation with four singular points is carried into a Heun equation by a homography
  sending three of them to `0, 1, ∞` and a multiplication by `z^{λ}(z − 1)^{μ}(z − a)^{ν}`, with
  `λ, μ, ν` one exponent at each finite point (Ronveaux Part A, (2.3.3)–(2.3.5), p. 19); the
  remaining point goes to `a`, determined up to the six values of 2.2.

The first bullet: the residue of `(αβz − q)/(z(z − 1)(z − a))` at `0` is `−q/a`, and the two linear
conditions fix `C₁, C_a` from `C₀`. The third: Möbius invariance of the class of Fuchsian equations
(by 1.1 in the transformed variable) and the rule that multiplication by `(z − c)^λ` shifts the
exponents at `c` by `λ` and those at `∞` by `−λ`.

**Checks.**
- At `(a, α, β, C₀) = (3, 0.3, 1.1, −0.7/3)`: `q = 0.7`, and `C₁ + C_a = 0.7/3`, `C₁ + 3C_a = 0.33`
  give `C₁ = 0.185` and `C_a = 0.04833…`, the residues of `(0.33z − 0.7)/(z(z − 1)(z − 3))` at `1`
  and `3`.
- The exponents at `∞` of Heun's equation: `z f(z) → γ + δ + ε`, `z² g(z) → αβ`, indicial polynomial
  `X² + (1 − γ − δ − ε)X + αβ = X² − (α + β)X + αβ` by the Fuchs relation, roots `α, β`.
- Negative control: without `C₀ + C₁ + C_a = 0` the point `∞` is irregular (`z² g(z)` grows like
  `z`), and no `q` makes the identity of the first bullet hold.

*Needs:* 1.1.

### 1.4 The normal form

Sources: DLMF 31.2.2–31.2.4; Ronveaux Part A, §2.3, p. 19; DLMF 31.14.3–31.14.5 for general `N`.

Prove:
- **the normal form** (`heun_normal_form`): for `a ∉ {0, 1}`, on an open `U` where `z`, `z − 1`,
  `z − a` lie in the slit plane and for `W` differentiable on `U`, the function
  `z^{−γ/2}(z − 1)^{−δ/2}(z − a)^{−ε/2} W(z)` solves Heun's equation on `U` if and only if
  `W″ = (A/z + B/(z − 1) + C/(z − a) + D/z² + E/(z − 1)² + F/(z − a)²) W` on `U`, with

```text
A = −γδ/2 − γε/(2a) + q/a,
B = γδ/2 − δε/(2(a − 1)) − (q − αβ)/(a − 1),
C = γε/(2a) + δε/(2(a − 1)) − (aαβ − q)/(a(a − 1)),
D = (γ/2)(γ/2 − 1),   E = (δ/2)(δ/2 − 1),   F = (ε/2)(ε/2 − 1);
```

  and `A + B + C = 0`;
- the same for the general Fuchsian equation 31.14.1 with `N` finite singular points, with the
  coefficients 31.14.4–31.14.5 and `∑ q̃_j = 0`.

The prefactor `φ` has `φ′/φ = −f/2`, so `w = φW` turns `w″ + f w′ + g w = 0` into
`W″ + (g − f′/2 − f²/4) W = 0`; the partial fractions of `g − f′/2 − f²/4` are the displayed ones.

**Checks.**
- `A + B + C = 0` identically in the parameters (a polynomial identity in `γ, δ, ε, α, β, q` over
  `a(a − 1)`), and `A`, `B`, `C`, `D`, `E`, `F` agree with 31.2.4 (verified symbolically).
- At `γ = δ = ε = 1`: `D = E = F = −¼`, the values for exponent difference `0`.
- Negative control: the prefactor `z^{−γ}(z − 1)^{−δ}(z − a)^{−ε}` (dropping the halves) leaves a
  first-derivative term `−f W′`, which vanishes only if `f = 0`.

*Needs:* 1.3.

### Examples

- Heun's equation with `a = 2`, `γ = δ = ε = ½` and `αβ = −ν(ν + 1)/4` is the algebraic form of
  Lamé's equation with modulus `k² = ½` (2.4); its exponents are `{0, ½}` at each finite point.
- Riemann's equation with singular points `0, 1, ∞` and exponents `{0, 1 − c}`, `{0, c − a − b}`,
  `{a, b}` is 15.10.1; adding a fourth singular point at `a` with exponents `{0, 1}` and `ε = 0`
  gives back Heun's equation with `q = aαβ`, which is 15.10.1 again (8.1).

### Dependencies

Mathlib only, and SpecialFunctionsHypergeometric 3.4 for 1.2.

## Layer 2: transformations of Heun's equation

### 2.1 F-homotopic transformations

Sources: Ronveaux Part A, §2.2, (2.2.1), p. 16, and the table (2.2.4) with the parameter formulas
(2.2.5), pp. 17–18; DLMF §31.2(v).

Prove, for open `U` that avoids `0`, `1` and `a` and on which the base of the power lies in the slit
plane, and `w` a solution of the transformed equation on `U`:
- **at `0`** (`heun_fHomotopic_zero`): `z^{1−γ} w(z)` solves Heun's equation with parameters
  `(a, q; α, β, γ, δ)` if `w` solves it with
  `(a, q + (aδ + ε)(1 − γ); α + 1 − γ, β + 1 − γ, 2 − γ, δ)`;
- **at `1`** (`heun_fHomotopic_one`): `(z − 1)^{1−δ} w(z)`, with
  `(a, q + aγ(1 − δ); α + 1 − δ, β + 1 − δ, γ, 2 − δ)`;
- **at `a`** (`heun_fHomotopic_a`): `(z − a)^{1−ε} w(z)`, with
  `(a, q + γ(1 − ε); α + 1 − ε, β + 1 − ε, γ, δ)`, for which the fifth parameter is `2 − ε`;
- the three commute up to the parameter changes and generate a group of order `8` acting on the
  parameters (Ronveaux's (TI)–(TVIII)).

The transformed `ε` is unchanged in the first two bullets:
`heunEps (α + 1 − γ) (β + 1 − γ) (2 − γ) δ = ε`. Each bullet is a direct computation with `deriv` of
a principal power on the slit plane. The hypothesis that `U` avoids the singular points is needed:
at `z = 1` the predicate is the equation with the terms of zero denominator dropped, and for
`w = z^{1−γ} v` the dropped equation of `w` at `1` is that of `v` plus `(1 − γ)ε v(1)/(1 − a)`.

**Checks.**
- The composite of the transformation at `0` with itself is the identity on parameters:
  `2 − (2 − γ) = γ`, and `q + (aδ + ε)(1 − γ) + (aδ + ε)(1 − (2 − γ)) = q`.
- At `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)`, `z^{1−γ} Hl(…)` with the transformed
  parameters (31.3.5) solves Heun's equation at `z = 0.3` with residual below `10⁻³⁰`.
- Negative control: the accessory parameter `q + aδ(1 − γ)` (dropping `ε`) leaves the residual
  `−0.349` at the same point.

*Needs:* 1.3.

### 2.2 Homographies of the singular points

Sources: Ronveaux Part A, §2.1, (2.1.2)–(2.1.3), pp. 14–15; Whittaker–Watson Ch. XXIII, Misc. Ex. 9,
p. 577; DLMF §31.2(v), 31.3.12–31.3.13.

Of the `24` homographies permuting `{0, 1, a, ∞}` onto `{0, 1, a′, ∞}`, `6` fix `∞`, and `a′` takes
the six values `a, 1/a, 1 − a, 1/(1 − a), a/(a − 1), (a − 1)/a`. Prove:
- **`z ↦ z/a`** (`heun_moebius_div`): for `a ≠ 0`, if `w` solves Heun's equation with
  `(1/a, q/a; α, β, γ, ε)` on the image of `U`, then `w(z/a)` solves it with `(a, q; α, β, γ, δ)` on
  `U` (the transformed `ε` is `δ`);
- **`z ↦ 1 − z`** (`heun_moebius_one_sub`): with `(1 − a, αβ − q; α, β, δ, γ)`;
- **`z ↦ z/(z − 1)`** (`heun_moebius_div_sub_one`): for `a ≠ 1`, on open `U` avoiding `0`, `1`,
  `a`, with `1 − z ∈ slitPlane`, `(1 − z)^{−α} w(z/(z − 1))` with
  `(a/(a − 1), −(q − aαγ)/(a − 1); α, α + 1 − δ, γ, α + 1 − β)`;
- the six homographies fixing `∞` are generated by the first two, and the other eighteen are these
  composed with `z ↦ z/(z − 1)` and its prefactor (Ronveaux (2.1.3) lists `a₂, …, a₆`).

**Checks.**
- The image of `a` under `z ↦ z/(z − 1)` is `a/(a − 1)`, and the image of `∞` is `1`: the prefactor
  `(1 − z)^{−α}` moves the exponent `α` from `∞` to `0` at the image point `1`, so the transformed
  `δ` is `α + 1 − β`, matching the third bullet.
- At `a = 2` the six values of `a′` are `2, ½, −1, −1, 2, ½`: the harmonic case, where the orbit has
  three elements; at `a = e^{iπ/3}` it has two (`a′ ∈ {e^{iπ/3}, e^{−iπ/3}}`).

*Needs:* 1.3.

### 2.3 The 192 automorphisms

Sources: Maier, "The 192 solutions of the Heun equation" (2007), §1 and Theorems 4.3 and 4.7;
Ronveaux Part A, §3.4, pp. 37–39;
Whittaker–Watson Ch. XXIII, Misc. Ex. 10, p. 577; DLMF §31.2(v) and §31.3(iii).

The transformations of 2.1 and 2.2 compose: an automorphism is a pair (prefactor, homography),
`w(z) = z^{λ}(z − 1)^{μ}(z − a)^{ν} w̃(z̃(z))`, mapping solutions of Heun's equation with one
parameter tuple to solutions with another. Prove:
- the automorphisms form a group of order `8 · 24 = 192` acting on parameter tuples
  `(a, q, {α, β}, γ, δ)`;
- for parameters off a proper algebraic subset, the `192` image tuples are pairwise distinct, so no
  nonidentity automorphism fixes the equation;
- applied to `Hl(a, q; α, β, γ, δ; z)` they give `192` local solutions, which fall into `8` classes
  of `24` equal functions, one class for each of the `8` local solutions of 3.2 (two exponents at
  each of four singular points).

The group statement is a composition table of the maps of 2.1–2.2; the second bullet reduces, by the
algebraic dependence of the image tuples on the parameters, to one parameter point where the `192`
tuples are computed and compared; the third follows from 3.1's uniqueness.

**Checks.**
- At `(a, q, α, β, γ, δ) = (7/2, 7/10, 3/10, 11/10, 4/5, 9/20)` the orbit of the parameter tuple
  under the maps of 2.1–2.2 has exactly `192` elements (with `{α, β}` unordered), and `a′` takes the
  six values `7/2, 2/7, −5/2, −2/5, 7/5, 5/7` (computed exactly over `ℚ`).
- With `α, β` ordered (counting the swap `α ↔ β`, which does not change the equation) the orbit has
  `384` elements: the swap is not one of the `192`.
- Kummer's `24` solutions of the hypergeometric equation (SpecialFunctionsHypergeometric 5.3) are
  `6` classes of `4`, the case `n = 3` of Maier's `2n` classes of `2^{n−2}(n − 1)!` (`8` classes of
  `24` for `n = 4`); Whittaker–Watson (Ex. 10, p. 577) count `192` and record that Heun's own list
  has `48`.

*Needs:* 2.1–2.2; 3.1.

### 2.4 Trigonometric and elliptic forms; Lamé's equation

Sources: Ronveaux Part A, §2.4, pp. 21–24, §2.6, pp. 25–26, and §1.4, (1.4.2)–(1.4.6), pp. 10–11;
Kristensson §8.6.1, p. 159; Whittaker–Watson Ch. XXIII, p. 555; DLMF 31.2.5–31.2.12, 31.7.5.

Prove:
- **the trigonometric form** (`heun_trigonometric_form`): if `w` solves Heun's equation on open `U`,
  then at every `θ` with `sin² θ ∈ U`, `sin θ ≠ 0`, `cos θ ≠ 0`, `sin² θ ≠ a`, the function
  `W(θ) = w(sin² θ)` satisfies

```text
W″ + ((2γ − 1) cot θ − (2δ − 1) tan θ − ε sin 2θ/(a − sin² θ)) W′
   + 4(αβ sin² θ − q)/(a − sin² θ) W = 0                                     (31.2.6)
```

- the Jacobi form 31.2.7–31.2.8: for real `0 < k < 1`, `a = k^{−2}` and `ζ ∈ (0, K(k))`,
  `W(ζ) = w(sn²(ζ, k))` with Tau Ceti's `TauCeti.Real.jacobiSn` satisfies 31.2.8 on `(0, K)`;
- the Weierstrass form 31.2.9–31.2.12: with Mathlib's `PeriodPair.weierstrassP` for a lattice with
  real `e₁ > e₂ > e₃`, the substitution 31.2.9–31.2.10 turns Heun's equation into
  `W″ + (H + b₀℘(ξ) + b₁℘(ξ + ω₁) + b₂℘(ξ + ω₂) + b₃℘(ξ + ω₃)) W = 0` with the constants 31.2.12, on
  a real interval of `ξ` where the bases of the powers in 31.2.10 are positive;
- Lamé's equation: with `a = k^{−2}`, `q = −ah/4`, `α = −ν/2`, `β = (ν + 1)/2`, `γ = δ = ε = ½`, the
  Jacobi form is `d²w/dζ² + (h − ν(ν + 1)k² sn²(ζ, k)) w = 0` (31.7.5, Ronveaux (1.4.2)–(1.4.6)).

Each bullet is the chain rule with the derivative of the substitution: `dz/dθ = sin 2θ`;
`dz/dζ = 2 sn cn dn` and `cn² = 1 − z`, `dn² = 1 − k²z`; for the Weierstrass form,
`℘′² = 4(℘ − e₁)(℘ − e₂)(℘ − e₃)` and the addition formula for `℘(ξ + ω_j) − e_j`.

**Checks.**
- At `θ = 0.3`, `(a, q, α, β, γ, δ) = (7/2, 7/10, 3/10, 11/10, 4/5, 9/20)`, 31.2.6 is Heun's
  equation multiplied by `(dz/dθ)² = sin² 2θ`, coefficient by coefficient (verified symbolically).
- Lamé at `ν = 0`, `h = 0`: `q = 0`, `αβ = 0`, and `w = 1` solves both forms.
- Negative control: the trigonometric form without the term `−ε sin 2θ/(a − sin² θ)` is the case
  `ε = 0`, which is the hypergeometric equation in `sin² θ` (8.1), not Heun's.

*Needs:* 1.3; Tau Ceti `TauCeti.Real.jacobiSn`; Mathlib `PeriodPair.weierstrassP`.

### Examples

- `Hl(a, q; α, β, γ, δ; z) = Hl(1/a, q/a; α, β, γ, ε; z/a)` is 2.2's first bullet applied to the
  solution `Hl` at `0` (3.3).
- The F-homotopic transformation at `1` applied to a Heun polynomial with `α = −n` gives a solution
  `(z − 1)^{1−δ} p(z)` of class III in Ronveaux's table (4.3).

### Dependencies

Layer 1.

## Layer 3: local solutions

### 3.1 The local solution at `0`

Sources: Ronveaux Part A, §3.3, (3.3.2)–(3.3.4), (3.3.7), (3.3.9), pp. 34–36; Kristensson
(8.4)–(8.6), pp. 143–144, and Theorem 8.1, p. 145; Olver Ch. 5, Theorem 4.1, p. 149; DLMF
31.3.1–31.3.4.

Prove:
- **the local Heun function** (`heunLocal_isHeunSolutionOn`): for `a ≠ 0` and `γ ∉ {0, −1, −2, …}`,
  the series `∑ c_j z^j` has sum `heunLocal a q α β γ δ z` at every `‖z‖ < min(1, ‖a‖)`; the sum is
  analytic on that disc, equals `1` at `0`, and solves Heun's equation on the disc minus `0`;
- **uniqueness** (`heunLocal_unique`): for `a ≠ 0`, `γ ∉ {0, −1, −2, …}`, a solution on a punctured
  disc `0 < ‖z‖ < r` that is analytic at `0` with value `1` agrees with `Hl` near `0`;
- **the radius** (`radius_heunLocalSeries`): for `‖a‖ > 1` and `γ ∉ {0, −1, −2, …}`, the radius of
  the series is `1` or at least `‖a‖`;
- the ratio `c_{j+1}/c_j` tends to `1` or to `1/a` when `‖a‖ ≠ 1` and the series does not terminate
  (Ronveaux (3.3.9), p. 35, and Appendix B, pp. 76–80): the characteristic equation of the
  recurrence divided by `j²` is `a t² − (1 + a) t + 1 = 0`, with roots `1`, `1/a`.

The first bullet is Olver's majorant argument (Theorem 4.1) for `f = γ/z + …`, `g = …/z` with the
exponent `0` and the other exponent `1 − γ` not a positive integer: equivalently,
AsymptoticExpansions §10.3 at `z₀ = 0` with `r = min(1, |a|)`, whose coefficients are the recurrence
31.3.3. Uniqueness: a second analytic solution with value `1` would differ from `Hl` by a solution
with exponent `≥ 1`, impossible as the other exponent is `1 − γ ∉ {1, 2, …}`. The radius: the sum
continues analytically along every path avoiding `1` and `a` (AsymptoticExpansions §10.2), so if the
radius exceeds `1` the sum is analytic at `1` and continues to the disc of radius `‖a‖`. The last
bullet is AsymptoticExpansions §12.1 for the recurrence 31.3.3 (roots `1`, `1/a`, see
[the supplier contracts](#from-asymptoticexpansions)): a solution with a nonzero component along
the dominant solution has ratio tending to the dominant root, and otherwise it is a multiple of
the recessive solution and its ratio tends to the recessive root.

**Checks.**
- `c₁ = q/(aγ)` and `c₂ = ((Q₁ + q)c₁ − P₁)/R₁` with `P₁ = αβ`, `Q₁ = γ(1 + a) + aδ + ε`,
  `R₁ = 2a(1 + γ)`.
- `Hl(3, 0.7; 0.3, 1.1, 0.8, 0.45; 0.3) = 1.10306 09539` (`ε = 1.15`), and the residual of Heun's
  equation at `z = 0.3` is below `10⁻³⁰`.
- Negative control: at `γ = 0` the relation `aγ c₁ = q` has no solution for `q ≠ 0`; in Lean
  `c₁ = q/0 = 0`, and the series does not solve the equation (the junk case excluded by the
  hypothesis).
- At `a = 1` and `q = αβ` the series is the Gauss series (8.1); its radius is `1 = min(1, |a|)`.

*Needs:* AsymptoticExpansions §§10.2–10.3 and §12.1; Mathlib `HasFPowerSeriesOnBall`,
`FormalMultilinearSeries.ofScalars`.

### 3.2 Solutions at the other singular points

Sources: DLMF 31.3.5–31.3.11 (31.3.10–31.3.11 in the corrected form); Ronveaux Part A, §3.4, pp.
37–39; Kristensson Table 8.1, p. 142; Whittaker–Watson Ch. XXIII, Misc. Ex. 8, p. 577.

Prove:
- **the second solution at `0`** (`heunLocal_second_at_zero`): for `a ≠ 0` and `γ ∉ {2, 3, 4, …}`,
  `z^{1−γ} Hl(a, (aδ + ε)(1 − γ) + q; α + 1 − γ, β + 1 − γ, 2 − γ, δ; z)` solves Heun's equation on
  `{‖z‖ < min(1, ‖a‖)} ∩ slitPlane` (at `γ = 1` it is `Hl`; for `γ ∈ ℤ` a second solution has a
  logarithm, by AsymptoticExpansions §10.3);
- **at `1`** (`heunLocal_at_one`): for `a ≠ 1`, on `{‖1 − z‖ < min(1, ‖1 − a‖), z ≠ 1}`, if
  `δ ∉ {0, −1, −2, …}` then `Hl(1 − a, αβ − q; α, β, δ, γ; 1 − z)` is a solution; and on the part of
  that disc with `1 − z ∈ slitPlane`, if `δ ∉ {2, 3, 4, …}` then
  `(1 − z)^{1−δ} Hl(1 − a, ((1 − a)γ + ε)(1 − δ) + αβ − q; α + 1 − δ, β + 1 − δ, 2 − δ, γ; 1 − z)`
  is a solution (31.3.6–31.3.7);
- **at `a`** (`heunLocal_at_a`): for `a ∉ {0, 1}`, in the variable `(a − z)/(a − 1)` on the disc
  where it has modulus less than `min(1, ‖a/(a − 1)‖)`, if `ε ∉ {0, −1, −2, …}` then
  `Hl(a/(a − 1), (αβa − q)/(a − 1); α, β, ε, δ; (a − z)/(a − 1))` is a solution, and where the
  variable lies in the slit plane, if `ε ∉ {2, 3, 4, …}`, then 31.3.9 is a solution;
- **at `∞`** (`heunLocal_at_infty`): for `a ≠ 0`, on `{‖z‖ > max(1, ‖a‖)} ∩ slitPlane`, if
  `β − α ∉ {1, 2, 3, …}` then
  `z^{−α} Hl(1/a, q/a − α(β − ε) − (α/a)(β − δ); α, α − γ + 1, α − β + 1, δ; 1/z)` is a solution,
  and if `α − β ∉ {1, 2, 3, …}` then the same with `α` and `β` exchanged.

Each bullet is a composite of 2.1–2.2 applied to 3.1: the solutions at `1` by `z ↦ 1 − z`, at `a` by
`z ↦ (a − z)/(a − 1)` (which sends `a, 1, 0` to `0, 1, a/(a − 1)`), at `∞` by `z ↦ 1/z` with the
prefactor `z^{−α}`.

**Checks.**
- At `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)` each of 31.3.5–31.3.9 solves Heun's
  equation (at `z = 0.3`, `0.8`, `2.6`) with residual below `10⁻³⁰`, and so do both solutions at `∞`
  at `z = 5` and `z = 6` in the corrected form, also at
  `(a, q, α, β, γ, δ) = (−2.5, −0.4, 0.6, −0.2, 1.3, 0.25)`.
- Negative control: with the accessory parameter printed in the 2010 Handbook,
  `α(β − ε) + (α/a)(β − δ) − q/a`, the first solution at `∞` leaves the residual `−1.63 · 10⁻³` at
  `z = 5` in the first parameter set, and the second `−1.19 · 10⁻²`.
- The exponents: the solution at `1` belonging to `1 − δ` vanishes at `1` like `(1 − z)^{1−δ}`, the
  exponent listed by Kristensson (Table 8.1, p. 142).

*Needs:* 2.1–2.2, 3.1; AsymptoticExpansions §10.3.

### 3.3 Equivalent expressions

Sources: DLMF 31.3.12–31.3.13; Ronveaux Part A, (3.4.3), p. 37, and (3.4.5)–(3.4.11), pp. 38–39;
Maier (2007).

Prove:
- **`z ↦ z/a`** (`heunLocal_eq_div`): for `a ≠ 0`, `γ ∉ {0, −1, −2, …}` and `‖z‖ < min(1, ‖a‖)`,
  `Hl(a, q; α, β, γ, δ; z) = Hl(1/a, q/a; α, β, γ, ε; z/a)`;
- **`z ↦ z/(z − 1)`** (`heunLocal_eq_div_sub_one`): for `a ∉ {0, 1}`, `γ ∉ {0, −1, −2, …}`,
  `‖z‖ < min(1, ‖a‖)` and `‖z/(z − 1)‖ < min(1, ‖a/(a − 1)‖)`, `Hl(a, q; α, β, γ, δ; z)` equals
  `(1 − z)^{−α} Hl(a/(a − 1), −(q − aαγ)/(a − 1); α, α + 1 − δ, γ, α + 1 − β; z/(z − 1))`;
- each of the `24` homographies, with the matching prefactor, gives an expression of `Hl` (the class
  of `Hl` in 2.3).

Both sides of each identity are solutions analytic at `0` with value `1`, so they agree near `0` by
3.1's uniqueness, and on the stated set (an intersection of two discs, hence connected) by the
identity theorem.

**Checks.**
- At `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)` and `z = 0.3` both identities hold to
  `10⁻³⁰`.
- The first identity at `a = 1` is the symmetry of 31.3.12 under `δ ↔ ε` with `a` fixed.
- Negative control: `Hl(1/a, q/a; α, β, γ, δ; z/a)` (keeping `δ`) differs from `Hl(a, q; …; z)` by
  `−5.35 · 10⁻³` at the same point.

*Needs:* 3.1, 2.2.

### 3.4 The boundary circle

Sources: Kristensson Theorem 8.1, p. 145.

Prove:
- **absolute convergence on the circle** (`summable_norm_heunLocalCoeff`): for `‖a‖ > 1`,
  `γ ∉ {0, −1, −2, …}` and `Re δ < 1`, `∑ |c_j| < ∞`, so the series converges absolutely and
  uniformly on the closed unit disc;
- for `‖a‖ > 1` and `Re δ ≥ 1`, the series converges absolutely on the unit circle only if `Hl` is
  analytic at `1` (a Heun function, 5.1);
- if `‖a‖ < 1` the same two statements hold on the circle `‖z‖ = ‖a‖` with `ε` in place of `δ`, by
  3.3's first identity.

Proof: near `z = 1`, `Hl = A f₀ + B (1 − z)^{1−δ} f₁` with `f₀, f₁` analytic at `1` (3.2), and there
is no other singular point in `‖z‖ < ‖a‖`; Darboux's method (AsymptoticExpansions §13.6, 2.10.30
and 2.10.32 with the one exceptional point `z = 1` on the circle `r = 1`, the comparison function
being the leading terms of the expansion at `1`) gives `c_j = O(j^{Re δ − 2})` (with
`j^{−m−1} log j` in the logarithmic case `δ = 1 − m`), summable when `Re δ < 1`.

**Checks.**
- At `(a, q, α, β, γ) = (3, 0.7, 0.3, 1.1, 0.8)` and `δ = 0.45`, the slope of `log |c_j|` against
  `log j` between `j = 1000` and `j = 4000` is `−1.5501`, against `δ − 2 = −1.55`.
- Negative control: at `δ = 1.5` the slope is `−0.50004`, against `δ − 2 = −0.5`, and the series of
  `|c_j|` diverges.

*Needs:* 3.1–3.2; AsymptoticExpansions §13.6.

### 3.5 Connection coefficients

Sources: Ronveaux Part A, §3.4, p. 39 (the connection problem); DLMF 31.9.3–31.9.4.

For `1 < |a|`, `γ ∉ {0, −1, −2, …}` and `δ ∉ ℤ`, let `f₁(q, ·)` and `f₂(q, ·)` be the two solutions
at `1` of 3.2, given there for `|1 − x| < min(1, |1 − a|)` and continued along `(0, 1)` by
AsymptoticExpansions §10.2. Prove:
- on `(0, 1)`, `Hl(a, q; …; x) = A(q) f₁(q, x) + B(q) f₂(q, x)` with `A`, `B` entire functions of
  `q`, given by Wronskians: `B(q) = 𝒲{f₁, Hl}/𝒲{f₁, f₂}` and `A(q) = 𝒲{Hl, f₂}/𝒲{f₁, f₂}`;
- `𝒲{f₁, f₂}` is a constant multiple of `x^{−γ}(1 − x)^{−δ}(a − x)^{−ε}` on `(0, 1)` (Abel's
  identity), with a constant that is nonzero for `δ ∉ ℤ` and does not depend on `q`, read off from
  the leading terms at `x = 1`;
- `q` is a `(0, 1)`-eigenvalue (5.1) if and only if `B(q) = 0`.

Holomorphy in `q`: the recurrence coefficients are polynomials in `q`, so the solutions normalized
at a regular singular point depend holomorphically on `q` locally uniformly in `x`; the Wronskian
quotients inherit it. DLMF states no closed form for `A`, `B`, and none is a target.

**Checks.**
- For a Heun polynomial (4.1), `Hl` is analytic at `1`, so `B(q) = 0`.
- Negative control: at `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)`, `B(q) ≠ 0`, since the
  coefficients of `Hl` decay like `j^{δ−2}` (3.4) and not like `3^{−j}`.

*Needs:* 3.1–3.2; AsymptoticExpansions §10.2.

### Examples

- `Hl(1, αβ; α, β, γ, δ; z) = F(α, β; γ; z)`: at `(α, β, γ, z) = (0.3, 1.1, 0.8, 0.3)` both are
  `1.16171 52329` for every `δ` (8.1).
- The eight local solutions of 3.1–3.2 at `(3, 0.7; 0.3, 1.1, 0.8, 0.45)` are pairwise independent:
  no two exponents at the same point differ by an integer.

### Dependencies

Layers 1–2; AsymptoticExpansions §§10.2–10.3.

## Layer 4: Heun polynomials

### 4.1 The polynomial criterion

Sources: Ronveaux Part A, §3.3, (3.3.10)–(3.3.11), p. 36, and §3.6, (3.6.1)–(3.6.5), pp. 41–43;
Kristensson (8.7) and §8.3, p. 146; DLMF 31.5.1–31.5.2.

Let `M_n = heunPolyMatrix a α β γ δ n`, the `(n + 1) × (n + 1)` tridiagonal matrix with diagonal
`−Q₀, …, −Q_n`, superdiagonal `R₀, …, R_{n−1}` and subdiagonal `P₁, …, P_n` (31.5.1; `Q₀ = 0`).
Prove:
- **the coefficients as determinants** (`prod_heunR_mul_heunLocalCoeff`): for `a ≠ 0` and
  `γ ∉ {0, −1, −2, …}`, `R₀R₁⋯R_n c_{n+1} = det(q − M_n)`, the characteristic polynomial of `M_n` at
  `q`;
- **the polynomial criterion** (`heunLocal_polynomial_iff`): for `a ≠ 0` and `γ ∉ {0, −1, −2, …}`,
  the coefficients `c_j` vanish from some index on if and only if there is `n ∈ ℕ` with `α = −n` or
  `β = −n` and `det(q − M_n) = 0`;
- in that case `Hl` is a polynomial of degree at most `n`, of degree exactly `n` unless also `α` or
  `β` is in `{0, −1, …, −(n − 1)}`; for each `n` there are at most `n + 1` such `q`, the roots of a
  polynomial of degree `n + 1` (Ronveaux (3.6.5), p. 43).

The determinant: expansion of `det(q − M_n)` along its last row is the recurrence for `c_{n+1}`
multiplied by `R₀ ⋯ R_n`. The criterion: if `α = −n` then `P_{n+1} = 0`, so `c_{n+1} = 0` forces
`c_{n+2} = 0` and all subsequent ones; conversely two consecutive vanishing coefficients force,
through the recurrence run backwards, some `P_j = 0` (else `c₀ = 0`).

**Checks.**
- `n = 0`: `M₀ = (0)`, `det(q − M₀) = q = R₀ c₁ = aγ · q/(aγ)`.
- At `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)`, `R₀ ⋯ R_{j−1} c_j − det(q − M_{j−1})` is
  below `10⁻²⁷` for `j = 1, …, 4`.
- `n = 1`, `α = −1`: `det(q − M₁) = q² + Q₁q + aγβ` with `Q₁ = γ(1 + a) + aδ + ε`, whose
  discriminant is Ronveaux's (3.6.6), p. 43, `[γ(1 + a) + aδ + ε]² + 4aαβγ`.
- Kristensson's Example 8.1 (pp. 146–147): the polynomial `z − h` solves Heun's equation with
  `α = −1` if and only if `γ/h + δ/(h − 1) + ε/(h − a) = 0`, and then `q = −aγ/h`. At
  `(a, γ, δ, ε) = (3, 0.8, 0.45, 1.15)` the two roots `q = −1.31295 73851`, `−4.38704 26149` of
  `det(q − M₁)` give `h = 1.82793 44229`, `0.54706 55771`, and the equation for `h` holds to
  `10⁻³⁰`.

*Needs:* 3.1; Mathlib `Matrix.det`, `Matrix.charpoly`.

### 4.2 Reality and simplicity of the eigenvalues

Sources: Ronveaux Part A, §3.6, p. 43 (the general case: no assertion is possible), and (3.6.6);
Kristensson §8.3, p. 146.

Ronveaux observes that in general nothing can be said about the roots of `det(q − M_n)`. Under sign
conditions the matrix is symmetrizable. Prove:
- **`a < 0`** (`heunPolyMatrix_eigenvalues_real_of_neg`): for real `a < 0`, `γ > 0`, `β > 0` and
  real `δ`, the characteristic polynomial of `M_n` with `α = −n` has `n + 1` real simple roots
  `e₀ < ⋯ < e_n`, and no other complex roots;
- **`a > 1`** (`heunPolyMatrix_eigenvalues_real_of_one_lt`): the same for real `a > 1`, `δ > 0`,
  `β > 0` and real `γ ∉ {0, −1, −2, …}`.

For `a < 0`: the products of opposite off-diagonal entries are
`R_{j−1}P_j = a j(j − 1 + γ)(j − 1 − n)(j − 1 + β) > 0` for `1 ≤ j ≤ n`, so a diagonal similarity
makes `M_n` real symmetric (Mathlib's `Matrix.IsHermitian.eigenvalues`), and a real symmetric
tridiagonal matrix with nonzero off-diagonal entries has simple eigenvalues. For `a > 1`:
`z ↦ 1 − z` (2.2) maps the polynomial solutions with `(a, q; −n, β, γ, δ)` bijectively to those with
`(1 − a, αβ − q; −n, β, δ, γ)`, and `1 − a < 0`, so the first bullet applies with `δ` in the role of
`γ`; the two characteristic polynomials of degree `n + 1` have the same root sets.

**Checks.**
- `a = −1`, `γ = δ = ε = 1`, `n = 1` (`β = 3`): `det(q − M₁) = q² − 3`, roots `±√3`; the polynomials
  `1 ∓ √3 z` vanish at `±1/√3`, one zero in `(0, 1)` and one in `(a, 0) = (−1, 0)`.
- `a = 2`, `γ = 1`, `δ = 1`, `ε = −1`, `n = 1` (`β = 1`): roots `−2 ± √2`, real as the second bullet
  asserts.
- Negative control: `a = 2`, `γ = 1`, `δ = −1`, `ε = 1`, `n = 1` (`β = 1`, `δ < 0`): the roots are
  `−1 ± i`.
- For random parameters with `a ∈ (−5, −0.2)`, `γ ∈ (0.1, 3)` (first bullet) or `a ∈ (1.1, 6)`,
  `δ ∈ (0.1, 3)` (second), `n = 4`, all five eigenvalues are real to `10⁻²⁶`.

*Needs:* 4.1, 2.2; Mathlib `Matrix.IsHermitian.eigenvalues`.

### 4.3 The eight classes

Sources: Ronveaux Part A, §3.6, (3.6.1)–(3.6.2), pp. 41–42, and (3.6.9), p. 44.

Prove:
- a solution that is a Frobenius solution at each of `0, 1, a` has the form
  `z^{σ₁}(z − 1)^{σ₂}(z − a)^{σ₃} p(z)` with `σ_i` one of the two exponents at the respective point
  and `p` a polynomial; its exponent at `∞` is `−(σ₁ + σ₂ + σ₃ + n)`;
- for each of the eight choices of `(σ₁, σ₂, σ₃)` the F-homotopic transformations of 2.1 carry the
  problem to the polynomial problem of 4.1 with transformed parameters, and the necessary conditions
  on `α` are those of Ronveaux's table (3.6.9): `α ∈ {0, −1, …}` (class I), `γ − α ∈ {1, 2, …}`
  (class II), and the six others.

**Checks.**
- Class I with `n = 0` is `Hl ≡ 1`, which needs `q = 0` and `αβ = 0`.
- A class II solution `z^{1−γ}p(z)` for `γ = 1/2`, `α = −1/2` has `γ − α = 1`, as (3.6.9) requires.

*Needs:* 2.1, 4.1.

### Examples

- With `a = 2`, `γ = δ = ε = ½`, `α = −1` (so `β = 3/2`): `Q₁ = 3`, `aγβ = 3/2`, and
  `det(q − M₁) = q² + 3q + 3/2` has the real roots `(−3 ± √3)/2`, as 4.2 requires (`a > 1`, `δ > 0`,
  `β > 0`); the polynomials are Lamé polynomials of degree `1` in `z = sn²(ζ, 1/√2)`.
- The Heun polynomials at `(a, γ, δ, ε) = (3, 0.8, 0.45, 1.15)`, `n = 1`, are `1 − z/h` with
  `h ∈ {1.82793 44229, 0.54706 55771}`; the first has no zero in `(0, 1)`, the second one (5.2).

### Dependencies

Layers 1–3.

## Layer 5: Heun functions

### 5.1 Solutions analytic at two singular points

Sources: Ronveaux Part A, §3.5, (3.5.1)–(3.5.2), pp. 39–41; DLMF 31.4.1, 31.4.3.

Prove:
- for `1 < |a|`, `γ, δ ∉ {0, −1, −2, …}`, the following are equivalent:
  `IsHeunEigenvalue01 a α β γ δ q`; the radius of the series of `Hl` is at least `|a|`; `Hl`
  continued along `(0, 1)` is a multiple of the solution `Hl(1 − a, αβ − q; α, β, δ, γ; 1 − z)` at
  `1`; `B(q) = 0` (3.5);
- a solution analytic at two of the singular points `{s₁, s₂}` is carried by a transformation of
  Layer 2 to one analytic at `{0, 1}`, with Ronveaux's four classes (3.5.2) according to the
  exponents chosen at `s₁, s₂`;
- every Heun polynomial is a Heun function relative to each pair of finite singular points.

**Checks.**
- The two polynomial eigenvalues of 4.1 at `(3, 0.8, 0.45, 1.15)`, `α = −1`, are
  `(0, 1)`-eigenvalues.
- Negative control: at `(a, q, α, β, γ, δ) = (3, 0.7, 0.3, 1.1, 0.8, 0.45)` the coefficients decay
  like `j^{δ−2}` (3.4), not like `|a|^{−j}`, so `q = 0.7` is not an eigenvalue.

*Needs:* 3.1–3.5.

### 5.2 The eigenvalues

Sources: Ronveaux Part A, §3.5, pp. 39–41, and (5.2.8)–(5.2.9), p. 61; DLMF §31.4.

Prove:
- **zeros of an entire function** (`exists_entire_heunEigenvalue01_iff`): for `1 < ‖a‖`,
  `γ, δ ∉ {0, −1, −2, …}`, there is an entire function `F` with
  `IsHeunEigenvalue01 a α β γ δ q ↔ F q = 0` for all `q`; so the eigenvalues form a closed set;
- **the real problem** (`heunEigenvalue01_real`): for real `a > 1`, `α`, `β` and `γ, δ > 0`, the
  eigenvalues are real, form a strictly decreasing sequence `q₀ > q₁ > ⋯` tending to `−∞`, every
  eigenvalue is one of them, and `Hl(a, q_m; …)` has exactly `m` zeros in `(0, 1)`;
- in the real problem each `q_m` is a simple zero of `F`.

`F` is `B` of 3.5 multiplied by a nonvanishing entire factor removing the hypothesis `δ ∉ ℤ` (for
`δ ∈ {1, 2, …}` the analytic solution at `1` is the one with the larger exponent `0`, and `F` is the
Wronskian of `Hl` with it at a point of `(0, 1)`). Under the hypotheses of the real problem
`F ≢ 0`, since its zeros are the real `q_m`, so there the eigenvalues are discrete. For complex
parameters `F ≢ 0` is not a target: the argument below is real, and DLMF §31.4 and Ronveaux §3.5,
p. 40, give no other (see [Beyond](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement)).
The real problem is a Sturm–Liouville problem on
`(0, 1)`: `(p w′)′ + αβ t ρ w = q ρ w` with `p, ρ > 0` (Conventions), and the eigenvalue condition
is analyticity at both ends. Reality: the Lagrange identity with `w̄`, whose boundary terms vanish
because `p → 0` at both ends (`γ, δ > 0`) and `w, w′` are bounded there. Ordering and the zero
count: as `q` decreases the zeros of `Hl(q)` in `(0, 1)` move to the left and further zeros enter at
`1`, by Sturm comparison (SpecialFunctionsBessel, 10.1) with `q₁(t) = (αβt − q₁)ρ(t)` and
`q₂(t) = (αβt − q₂)ρ(t)`, `q₂ < q₁`; `q` is an eigenvalue exactly when the zero count jumps. The
count tends to `∞` as `q → −∞` because then `−q ρ` dominates. Simplicity:
`F′(q_m) = c ∫₀¹ ρ Hl(q_m)² ≠ 0` (31.9.3).

**Checks.**
- At `(a, α, β, γ, δ) = (3, −1, 2.4, 0.8, 0.45)` (`ε = 1.15`) the Heun polynomials of 4.1 give
  `q₀ = −1.31295 73851`, with the zero `h = 1.82793` outside `(0, 1)`, and `q₁ = −4.38704 26149`,
  with one zero `0.54707` in `(0, 1)`: they are the first two eigenvalues, as the zero count
  requires.
- Negative control: at `(a, α, γ, δ, ε) = (2, −1, 1, −1, 1)` (`δ < 0`, `β = 1`) the Heun polynomials
  of 4.2 have `q = −1 ± i`; they are analytic at `1`, so these are non-real `(0, 1)`-eigenvalues of
  a real equation.

*Needs:* 5.1, 3.5; SpecialFunctionsBessel (Sturm comparison); Tau Ceti
`TauCeti.wronskian_eq_of_hasDerivAt`.

### 5.3 The continued fraction

Sources: DLMF 31.4.2; Ronveaux Part A, Appendix B, (B.22), p. 79, and §3.5, p. 40.

Prove, for `1 < |a|` and `γ, δ ∉ {0, −1, −2, …}`:
- the recurrence 31.3.3 has a minimal solution `(c*_j)` (one with `c*_j/c_j → 0` for every
  independent solution `c_j`), unique up to a factor, with `c*_{j+1}/c*_j → 1/a`;
- `q` is an `(0, 1)`-eigenvalue if and only if the coefficients of `Hl` are the minimal solution;
- for `α, β ∉ {0, −1, −2, …}` and at `q` with `Q_j + q ≠ 0` for all `j ≥ 1` and nonvanishing
  partial denominators, that holds if and only if the continued fraction of 31.4.2 converges and
  `q = aγP₁/(Q₁ + q − R₁P₂/(Q₂ + q − R₂P₃/(Q₃ + q − ⋯)))`.

The first bullet: AsymptoticExpansions §12.1 for the recurrence of 3.1 (roots `1`, `1/a` of
distinct moduli), whose recessive solution is the minimal one.
The second: by 3.4's proof the coefficients are `O(j^{Re δ−2})` or decay like `|a|^{−j}`; the second
happens exactly for the minimal solution and exactly when `Hl` is analytic in `‖z‖ < ‖a‖`. The third
is Pincherle's theorem (SpecialFunctionsEiLiErfIncompleteGamma 4.1) for `b n = (Q_n + q)/R_n` and
`a n = −P_n/R_n`, which asks `a n ≠ 0`, that is `α, β ∉ {0, −1, −2, …}`: the fraction converges if
and only if a minimal solution with `f(0) ≠ 0` exists, its value is `−f(1)/f(0)`, and the ratios
`c*_j/c*_{j−1}` are its tails; an equivalence transformation brings it to the form 31.4.2.

**Checks.**
- With `α = −1` the fraction terminates (`P₂ = 0`) and the equation is `q(Q₁ + q) = aγP₁`, which is
  `q² + Q₁q + aγβ = 0`, the characteristic polynomial of 4.1. It finds the two polynomial
  eigenvalues (`−1.31295 73851` and `−4.38704 26149` at the parameters of the Examples) and none of
  the infinitely many others of 5.2, which is why the third bullet assumes
  `α, β ∉ {0, −1, −2, …}`.
- Negative control: dropping the term `q` from the partial denominators (writing `Q_j` for
  `Q_j + q`) gives `q = aγP₁/Q₁` at `α = −1`, which is not the polynomial condition.

*Needs:* 3.1, 3.4, 5.1; AsymptoticExpansions §12.1; SpecialFunctionsEiLiErfIncompleteGamma 4.1.

### 5.4 Hypergeometric and Jacobi series

Sources: Ronveaux Part A, Ch. 4, (4.1.2), p. 46, (4.2.1), (4.2.7), (4.2.17)–(4.2.21), pp. 47–50,
(4.3.1)–(4.3.8), pp. 51–53; Kristensson §8.4, (8.8), p. 147, and Theorem 8.2, p. 156; DLMF
31.11.1–31.11.17.

Let `E` be the ellipse with foci `0`, `1` through `a` (Ronveaux (4.1.2)). Prove:
- **Type I** (31.11.10–31.11.12): every Fuchs–Frobenius solution of 3.2 at `∞` is the sum of a
  series `∑ c_j P_j(z)` with `P_j` the solutions of Riemann's equations with exponents `{0, 1 − γ}`,
  `{0, 1 − δ}`, `{λ + j, μ − j}` (31.11.2; `λ = α`, `μ = β − ε`), with the coefficients satisfying
  the three-term recurrence 31.11.4–31.11.8; the series converges outside `E`;
- a solution analytic at `a` with exponent `α` at `∞` (a Heun function for the pair `(a, ∞)`) is
  such a series converging in the plane cut along `[0, 1]`, the segment joining its two singular
  points, with `q` a root of 31.11.13;
- **Type II** (31.11.14–31.11.17; Kristensson Theorem 8.2, p. 156): every `(0, 1)`-Heun function is
  a series of Jacobi polynomials `P_j^{(γ−1, δ−1)}(1 − 2z)` (in the case 31.11.14), converging
  inside `E` and absolutely on `E` if `Re ε < 1`; for a Fuchs–Frobenius solution that is not a Heun
  function the series diverges.

The coefficient recurrences come from Heun's operator acting on the `P_j` (Riemann's equation,
SpecialFunctionsHypergeometric 3.4); convergence from the asymptotics of the recurrence
(AsymptoticExpansions §12.1, roots determined by the conformal map of the exterior of `[0, 1]` to
the exterior of the disc, whose level curves are the ellipses with foci `0, 1`) and of `P_j`
(Laplace–Heine type asymptotics for Jacobi polynomials off `[0, 1]`, which LaguerreJacobi does not
provide and which are owned here for the needed case).

**Checks.**
- At `a = 1/2 + i` the ellipse through `a` with foci `0, 1` has semi-major axis
  `(|a| + |a − 1|)/2 = √5/2 = 1.11803 39887`.
- Negative control: Type II series for `Hl` itself (not a Heun function) diverge, as Ronveaux states
  before (4.3.8): the coefficients grow at the rate set by the singularity of `Hl` at `1`.

*Needs:* 5.1–5.3; SpecialFunctionsHypergeometric 3.1–3.4; LaguerreJacobi Layers 3–4;
AsymptoticExpansions §12.1.

### Examples

- The `(0, 1)`-eigenvalues at `(a, α, β, γ, δ) = (3, −1, 2.4, 0.8, 0.45)` begin
  `q₀ = −1.31295 73851 > q₁ = −4.38704 26149`; the corresponding Heun functions are the Heun
  polynomials.
- For Lamé's equation (`γ = δ = ε = ½`, 2.4) the `(0, 1)`-Heun functions are the Lamé functions of
  period `2K` in `ζ`: `w(sn²(ζ, k))` is even about `0` and about `K`, since `sn²` is (Ronveaux §3.5,
  p. 41, on periodic solutions of the trigonometric form). Period `4K` and not `2K` belongs to the
  Heun functions with exponents `(½, 0)` or `(0, ½)` at `(0, 1)`.

### Dependencies

Layers 3–4; SpecialFunctionsBessel; LaguerreJacobi.

## Layer 6: orthogonality and integral equations

### 6.1 Orthogonality of Heun functions on a segment

Sources: Ronveaux Part A, §5.2, (5.2.1)–(5.2.12), pp. 60–61; DLMF 31.9.1–31.9.4.

Prove:
- the Lagrange identity: for `f, g` twice differentiable on an interval in `(0, 1)`,
  `ρ(g D f − f D g) = (p(g f′ − f g′))′` (Ronveaux (5.2.8), p. 61);
- **orthogonality on `[0, 1]`** (`heun_orthogonal_Icc`): for `1 < ‖a‖`, `Re γ > 0`, `Re δ > 0` and
  two distinct `(0, 1)`-eigenvalues `q ≠ q′`,
  `∫₀¹ t^{γ−1}(1 − t)^{δ−1}(a − t)^{ε−1} Hl(a, q; …; t) Hl(a, q′; …; t) dt = 0`;
- on the Pochhammer double loop `(1+, 0+, 1−, 0−)` based at `ζ ∈ (0, 1)`, the same orthogonality
  holds for all `γ, δ` (31.9.2), and the loop integral equals `(1 − e^{2πiγ})(1 − e^{2πiδ})` times
  the segment integral when `Re γ, Re δ > 0`;
- the normalization: for `q = q′` the loop integral is the constant `θ_m` of 31.9.3, expressed by
  `∂/∂q` of the Wronskian of the solutions at `0` and at `1`, and is independent of `ζ`.

The segment: the Lagrange identity integrated over `[x₀, x₁] ⊂ (0, 1)` with `x₀ → 0`, `x₁ → 1`; the
boundary terms vanish because `p(t) = O(t^{Re γ})`, `O((1 − t)^{Re δ})` and both functions are
analytic at `0` and `1`. The loop: the boundary terms cancel on a closed loop around `0` and `1`,
and the integrand returns to its starting branch. The factor is that of the Beta integral.

**Checks.**
- The Heun polynomials of degree `3` at `(a, γ, δ, ε) = (3, 0.8, 0.45, 1.15)` (four eigenvalues from
  `M₃`): the segment integrals of products of distinct ones vanish to the quadrature accuracy
  `10⁻¹²`.
- Negative control: the polynomial of degree `3` against one of degree `2` (different equations:
  `α = −3`, `−2` and different `β`) gives the integral `0.56695`, not `0`.
- The loop factor at `γ = δ = 1` is `0`, consistent with a single-valued integrand.

*Needs:* 5.1–5.2.

### 6.2 Double orthogonality of Heun polynomials

Sources: Ronveaux Part A, §5.3, (5.3.1)–(5.3.7), pp. 63–64; DLMF 31.9.5–31.9.6.

Fix real `a > 1` and `γ, δ, ε > 0`; for `n ∈ ℕ` put `β_n = γ + δ + ε + n − 1`, so that
`Hl(a, q; −n, β_n, γ, δ; ·)` belongs to the equation with these `γ, δ, ε`. Prove:
- **double orthogonality** (`heunPoly_double_orthogonal`): if `q₁`, `q₂` are eigenvalues of
  `M_{n₁}`, `M_{n₂}` (4.1) with `(n₁, q₁) ≠ (n₂, q₂)`, and
  `w_k = Hl(a, q_k; −n_k, β_{n_k}, γ, δ; ·)`, then
  `∫₀¹ ∫₁^a (t − s) ρ(s) ρ(t) w₁(s) w₁(t) w₂(s) w₂(t) dt ds = 0` with
  `ρ(x) = x^{γ−1}|1 − x|^{δ−1}|a − x|^{ε−1}`;
- the same on Pochhammer loops `L₁`, `L₂` around distinct pairs of singular points, for complex
  parameters (31.9.5).

`u(s, t) = w(s) w(t)` is a joint eigenfunction of the two operators `(L_s − L_t)/(s − t)` and
`(t L_s − s L_t)/(t − s)` (with `L_x = D_x − αβx`), with eigenvalues `−α_nβ_n = n β_n` and `q`; both
are symmetric for the weight `(t − s)ρ(s)ρ(t)` on `(0, 1) × (1, a)` by the Lagrange identity in each
variable. Distinct pairs `(n, q)` give distinct pairs of eigenvalues because `nβ_n` is strictly
increasing in `n`.

**Checks.**
- At `(a, γ, δ, ε) = (3, 0.8, 0.45, 1.15)`: two Heun polynomials with `n = 3` and distinct `q`, and
  one with `n = 3` against one with `n = 2`, give double integrals below `10⁻¹²`.
- Negative control: a polynomial against itself gives `1.334 · 10⁻³`, not `0`.

*Needs:* 4.1–4.2, 6.1.

### 6.3 Integral transforms with Heun kernels

Sources: Ronveaux Part A, §6.2, (6.2.1)–(6.2.7), pp. 66–67; DLMF 31.10.1–31.10.6.

Prove:
- **integral equations** (`heun_integral_equation`): for real parameters with `a > 1`, a segment
  `[x₀, x₁] ⊂ (0, 1)`, open sets `U`, `V` with the segment in `V`, a solution `w` of Heun's equation
  on `V` minus the singular points and `K` analytic on `U × V` with `D_z K(z, t) = D_t K(z, t)`
  (31.10.3): if the bracket `p(x)(∂_t K(z, x) w(x) − K(z, x) w′(x))` takes equal values at `x₀` and
  `x₁` for every `z ∈ U`, then `W(z) = ∫_{x₀}^{x₁} K(z, x) w(x) ρ(x) dx` solves Heun's equation on
  `U` (with the same `q`);
- the same with the segment replaced by `[0, 1]` and the bracket required to vanish in the limit at
  both ends, and by a Pochhammer loop, on which the bracket returns to its value;
- when `w = w_m` is a `(0, 1)`-Heun function and `W` is again analytic at `0` and `1`, `W = κ w_m`
  (an integral equation with eigenvalue `κ`), by 5.2's simplicity.

`D_z W = ∫ D_z K w ρ = ∫ D_t K w ρ = ∫ K (D_t w) ρ + [p(∂_tK w − K w′)]`, by the Lagrange identity,
and `D_t w = q w`; differentiation under the integral sign on the compact segment
(`_root_.hasDerivAt_integral_of_dominated_loc_of_deriv_le`).

**Checks.**
- `K ≡ 1` gives `(D_z − D_t)K = αβ(z − t)`, not `0`: it is not a kernel unless `αβ = 0`; at `αβ = 0`
  the transform `∫ w ρ` is a constant, a solution exactly when `q = 0`.
- Negative control: dropping the bracket hypothesis, `K ≡ 1` with `αβ = 0` and `q ≠ 0` gives the
  nonzero constant `W = ∫ wρ` (for `w > 0` on the segment), which does not solve `D W = qW`.

*Needs:* 6.1; Mathlib differentiation under the integral sign.

### 6.4 Kernels

Sources: Ronveaux Part A, §6.2, (6.2.11)–(6.2.16), pp. 68–70; DLMF 31.10.7–31.10.11, with the
correction to 31.10.8.

With `cos² θ = zt/a`, `sin² θ cos² φ = −(z − a)(t − a)/(a(1 − a))`,
`sin² θ sin² φ = (z − 1)(t − 1)/(1 − a)` (31.10.7). Prove:
- `(D_z − D_t)K = 0` if and only if, as a function of `(θ, φ)`, `K` satisfies

```text
sin² θ (K_θθ + ((1 − 2γ) tan θ + 2(δ + ε − ½) cot θ) K_θ − 4αβ K)
    + K_φφ + ((2δ − 1) cot φ − (2ε − 1) tan φ) K_φ = 0;
```

- the separated solutions are products of a solution of Riemann's equation in `cos² θ` with
  exponents `{0, 1 − γ}`, `{½ − δ − σ, ½ − ε + σ}`, `{α, β}` and one in `cos² φ` with exponents
  `{0, 1 − ε}`, `{0, 1 − δ}`, `{−½ + δ + σ, −½ + ε − σ}` (31.10.9), `σ` a separation constant; for
  Heun polynomials of degree `n`, `σ = ½ − δ − j`, `j = 0, …, n`;
- the kernel 31.10.10, for `Re γ > 0`, `Re δ > 0` and the Pochhammer loop about `0` and `1`, gives
  integral equations `κ_m w_m = ∫ K w_m ρ` for the `(0, 1)`-Heun functions.

The first bullet is the chain rule: `(D_z − D_t)K` equals a nonvanishing factor depending only on
`(z, t)` times the displayed operator, the identity of the variables 31.10.7 being
`cos² θ + sin² θ = 1`. The second is separation of variables with the Riemann equations of
SpecialFunctionsHypergeometric 3.4.

**Checks.**
- For `K = G(cos² θ, cos² φ)` with `G(X, Y) = X²Y + 3Y²` and `G = XY³ + X³`, at
  `(a, α, β, γ, δ) = (7/2, 3/10, 11/10, 4/5, 9/20)` and three points `(z, t)`, the ratio of
  `(D_z − D_t)K` to the displayed operator is the same for both `G` (`−0.03398`, `0.09570`,
  `0.12369`): a factor independent of `K`.
- Negative control: with DLMF's printed coefficient `(1 − 2δ) cot φ − (1 − 2ε) tan φ` the ratios
  differ between the two `G` (`−0.03924` against `−0.03361` at the first point), so the printed
  equation is not equivalent to `(D_z − D_t)K = 0`.
- The six exponents of each factor sum to `1`, as Riemann's equation requires:
  `(1 − γ) + (½ − δ − σ) + (½ − ε + σ) + α + β = 1` and
  `(1 − ε) + (1 − δ) + (−½ + δ + σ) + (−½ + ε − σ) = 1`, by `α + β + 1 = γ + δ + ε`.
- Negative control: the exponents `{0, ½ − δ − σ}` at `cos² θ = 1` give the sum
  `3/2 − γ − δ − σ + α + β`, which is `1` only for `σ = ε − ½`, so they do not belong to a
  Riemann equation for a free separation constant.

*Needs:* 6.3; SpecialFunctionsHypergeometric 3.4.

### Examples

- The `(0, 1)`-Heun functions at `(a, γ, δ, ε) = (3, 0.8, 0.45, 1.15)` with `α = −3` are
  polynomials, and the Gram matrix of the four of them with the weight `ρ` on `[0, 1]` is diagonal.

### Dependencies

Layers 4–5; SpecialFunctionsHypergeometric 3.4.

## Layer 7: confluent forms

### 7.1 The four confluent equations

Sources: Ronveaux Part A, §2.7, (2.7.1)–(2.7.9), pp. 27–29; Ronveaux Part B, §1.1, pp. 89–93;
Kristensson §8.5, pp. 158–159; DLMF 31.12.1–31.12.4.

Prove:
- the confluent equation 31.12.1 has regular singular points `0`, `1` with exponents `{0, 1 − γ}`,
  `{0, 1 − δ}` and, for `ε ≠ 0`, an irregular singular point of rank one at `∞`;
- the doubly confluent equation 31.12.2 has, for `δ ≠ 0`, irregular singular points of rank one at
  `0` and `∞`;
- the biconfluent equation has a regular singular point at `0` with exponents `{0, 1 + γ}` and an
  irregular singular point of rank two at `∞`;
- the triconfluent equation 31.12.4 has no finite singular point and an irregular singular point of
  rank three at `∞`.

The rank is Olver's (Ch. 5, §4.1, p. 148): a singular point `z₀` has rank `l − 1` for the least `l`
with `(z − z₀)^l f` and `(z − z₀)^{2l} g` analytic at `z₀`; the rank at `∞` is that of `t = 0` after
`w(z) = u(1/z)`, whose coefficients are `2/t − f(1/t)/t²` and `g(1/t)/t⁴`.

**Checks.**
- The confluent equation at `∞`: `f = ε + (γ + δ)/z + O(z^{−2})`, `g = α/z + O(z^{−2})`; the
  transformed coefficients are `−ε/t² + O(1/t)` and `α/t³ + O(1/t²)`, so `l = 2` and the rank is one
  when `ε ≠ 0`.
- Negative control: at `ε = 0` and `α ≠ 0` the point `∞` is still irregular (`z² g(z) ∼ αz`), not
  regular; it is regular only when also `α = 0`, and then the equation is hypergeometric.
- The triconfluent equation: `f = γz + z²`, of degree `2`, gives rank `3`.

*Needs:* 1.1.

### 7.2 The confluent equation as a limit of Heun's

Sources: Ronveaux Part A, §2.7, (2.7.1)–(2.7.3), pp. 27–28; Kristensson §8.5, p. 158; DLMF §31.12
(introduction).

Prove:
- the coefficients: with `ε_H = −εa + o(a)`, `(αβ)_H = −αa + o(a)`, `q_H = −qa + o(a)` and `γ, δ`
  fixed, as `|a| → ∞` the coefficients of Heun's equation tend to those of 31.12.1 locally uniformly
  on `ℂ \ {0, 1}`;
- **the local solution** (`confluentHeunLocal_isSolution`): for `γ ∉ {0, −1, −2, …}` the series
  `∑ c_j z^j` with `c₀ = 1`, `γc₁ = −q`,
  `(j + 2)(j + 1 + γ)c_{j+2} = ((j + 1)(j + γ + δ − ε) − q)c_{j+1} + (εj + α)c_j` converges on the
  unit disc to `confluentHeunLocal ε α q γ δ`, which is `1` at `0` and solves 31.12.1 on the
  punctured disc;
- **the confluence limit** (`tendstoLocallyUniformlyOn_heunLocal_confluent`): for
  `γ ∉ {0, −1, −2, …}` and sequences with `‖aₙ‖ → ∞`, `εₙ/aₙ → −ε`, `αₙβₙ/aₙ → −α`, `qₙ/aₙ → −q`
  (`εₙ = heunEps αₙ βₙ γ δ`), `Hl(aₙ, qₙ; αₙ, βₙ, γ, δ; ·)` tends to `confluentHeunLocal ε α q γ δ`
  locally uniformly on the unit disc.

The coefficients: `ε_H/(z − a) → ε` and `(αβz − q)_H/(z − a) → αz − q`. The recurrence of 3.1
divided by `a` tends to that of the second bullet (`R_j/a → (j + 1)(j + γ)`,
`(Q_j + q_H)/a → j(j − 1 + γ + δ − ε) − q`, `P_j/a → −((j − 1)ε + α)`), and a majorant uniform in
`n` (Olver's for 3.1, with constants uniform for large `|aₙ|`) gives locally uniform convergence of
the sums.

**Checks.**
- At `(ε, α, q, γ, δ) = (0.6, 0.35, −0.4, 0.8, 0.45)`, `confluentHeunLocal` at `z = 0.5` is
  `1.34287 69372` and solves 31.12.1 there to `10⁻³⁰`; with `aₙ = 10, 10², 10³, 10⁴`,
  `εₙ = −0.6 aₙ`, `αₙβₙ = −0.35 aₙ`, `qₙ = 0.4 aₙ`, the differences at `z = 0.5` are `4.64 · 10⁻³`,
  `4.55 · 10⁻⁴`, `4.54 · 10⁻⁵`, `4.54 · 10⁻⁶`, of order `1/aₙ`.
- Negative control: with `qₙ = −0.4 aₙ` (the sign of `q` not reversed) the limit is the confluent
  local solution with `q = +0.4`, a different function: its coefficient `c₁ = −q/γ` changes sign.
- Kristensson's second confluence (§8.5, (8.17), pp. 158–159): `α, β = k₁a^{1/2}, k₂a^{1/2}`,
  `q = αβh`, `a → ∞` gives `u″ + (γ/z + δ/(z − 1))u′ − k₁k₂(z − h)/(z(z − 1)) u = 0`; this is the
  third bullet with limits `ε = 0`, `α = −k₁k₂`, `q = −k₁k₂h`, since `εₙ` grows only like `a^{1/2}`.

*Needs:* 3.1, 7.1; Mathlib `TendstoLocallyUniformlyOn`.

### 7.3 Further confluences

Sources: Ronveaux Part A, §2.7, pp. 27–29 (the confluence scheme); Ronveaux Part D, (1.1.1), p. 193
(the biconfluent equation from Heun's by coalescence), and Part E, §1.1, p. 253 (the triconfluent
equation as a limit); DLMF 31.12.2–31.12.4.

Prove, as convergence of coefficients locally uniformly off the singular points and, by 7.2's
argument, of solutions normalized at a regular singular point or an ordinary point:
- confluent to doubly confluent: in 31.12.1 put `z = t/μ`, `γ_C = γ − δ/μ`, `δ_C = δ/μ`, `ε_C = μ`,
  `α_C = μα`, `q_C = q`; as `μ → 0` the equation tends to 31.12.2 in `t` with parameters
  `(α, γ, δ, q)`;
- confluent to biconfluent: put `z = μt`, `γ_C = −γ`, `δ_C = 1/μ²`, `ε_C = 1/μ² − δ/μ`,
  `α_C = −α/μ²`, `q_C = −q/μ`; as `μ → 0` the equation tends to 31.12.3 in `t`,
  `w″ − (γ/t + δ + t) w′ + (αt − q)/t w = 0`;
- biconfluent to triconfluent: in `w″ − (γ_B/z + δ_B + ε_B z) w′ + (α_B z − q_B)/z w = 0` (the form
  with free `ε_B` of [Conventions](#conventions)) put `z = λ + t`, `γ_B = −λ³`,
  `δ_B = 2λ² + γλ`, `ε_B = −(λ + γ)`, `α_B = αλ − q`, `q_B = αλ²`; as `λ → ∞` it tends to
  `w″ + (γ + t) t w′ + (αt − q) w = 0` (31.12.4).

Each is a series expansion of the coefficients in the small parameter, uniformly on compact sets
avoiding the moving singular points.

**Checks.**
- The three limits of the coefficients, computed symbolically: `(δ + γt + t²)/t²` and `(αt − q)/t²`
  (doubly confluent), `−(γ/t + δ + t)` and `(αt − q)/t` (biconfluent), `t(γ + t)` and `αt − q`
  (triconfluent).
- Negative control: the parameters of the second bullet with `γ_C = γ`, `δ_C = −1/μ²`,
  `ε_C = δ/μ − 1/μ²` give the `w′`-coefficient `γ/t + δ + t`, the sign of the 2010 print, which is
  not 31.12.3.
- Negative control: in the first bullet with `ε_C` fixed (instead of `ε_C = μ`) the coefficient of
  `w′` in `t` tends to `∞` like `ε_C/μ`.

*Needs:* 7.1–7.2.

### 7.4 The irregular singular point of the confluent equation

Sources: AsymptoticExpansions §10.4 (DLMF 2.7.7–2.7.18); DLMF 31.12.1; Ronveaux Part B, pp. 89–93.

Prove, for the confluent equation 31.12.1 with `ε ≠ 0`:
- `f(z) = γ/z + δ/(z − 1) + ε = ε + (γ + δ)/z + ∑_{s≥2} δ z^{−s}` and
  `g(z) = (αz − q)/(z(z − 1)) = α/z + ∑_{s≥2} (α − q) z^{−s}` converge for `|z| > 1`, with `f₀ = ε`,
  `f₁ = γ + δ`, `g₀ = 0`, `g₁ = α`, and `λ² + ελ = 0` has the unequal roots `λ₁ = 0`, `λ₂ = −ε`;
- by AsymptoticExpansions §10.4, in the logarithmic coordinates and the sectors stated there, there
  are unique solutions with the behaviour `z^{−α/ε}(1 + O(1/z))` and
  `e^{−εz} z^{α/ε − γ − δ}(1 + O(1/z))`, linearly independent, with Stokes multipliers as there;
- for the doubly confluent equation 31.12.2 with `δ ≠ 0` the same at `∞` (`λ ∈ {0, −1}`, `μ₁ = −α`,
  `μ₂ = α − γ`) and, after `z ↦ 1/z`, at `0`.

The exponents are `μ_j = −(f₁λ_j + g₁)/(f₀ + 2λ_j)` (2.7.10): `μ₁ = −α/ε`,
`μ₂ = −(−(γ + δ)ε + α)/(−ε) = α/ε − γ − δ`.

**Checks.**
- The formula for `μ_j` on Kummer's equation `zw″ + (b − z)w′ − aw = 0` (`f₀ = −1`, `f₁ = b`,
  `g₁ = −a`) gives `μ₁ = −a` for `λ₁ = 0` and `μ₂ = a − b` for `λ₂ = 1`: the behaviours `z^{−a}` and
  `e^z z^{a−b}` of `U(a, b, z)` and `M(a, b, z)`.
- Negative control: at `ε = 0` the roots coincide (`f₀² = 4g₀ = 0`) and §10.4 does not apply; that
  is the case of Fabry's transformation (AsymptoticExpansions §10.5), and `∞` is regular only when
  also `α = 0` (7.1).

*Needs:* 7.1; AsymptoticExpansions §10.4.

### Examples

- Mathieu's equation `w″ + (a − 2q cos 2x)w = 0` is a confluent Heun equation in `z = cos² x`
  (Ronveaux Part A, (2.4.13), p. 23; Kristensson §8.6.3, p. 161), and the spheroidal wave equation
  is one in `z = (1 + x)/2` (Kristensson §8.6.2, pp. 160–161).
- The confluent equation with `δ = 0` and `q = α` is `zw″ + (γ + εz)w′ + αw = 0`, for `ε ≠ 0`
  Kummer's equation `ζu″ + (b − ζ)u′ − a′u = 0` in `ζ = −εz` with `b = γ`, `a′ = α/ε` (for
  `ε = −1`, `ζ = z` and `a′ = −α`). With `δ = 0` alone it is not: the coefficient
  `(αz − q)/(z(z − 1))` keeps a simple pole of residue `α − q` at `z = 1`.

### Dependencies

Layers 1, 3; AsymptoticExpansions §10.4.

## Layer 8: reductions to the Gauss function

### 8.1 The degenerate cases

Sources: Ronveaux Part A, §1.3, (1.3.2), (1.3.5)–(1.3.7), pp. 8–9; Kristensson Comment 8.1, p. 143;
DLMF 31.7.1.

Prove:
- **`a = 1`** (`heunLocal_one_eq_ordinaryHypergeometric`): for `γ ∉ {0, −1, −2, …}` and `|z| < 1`,
  `Hl(1, αβ; α, β, γ, δ; z) = F(α, β; γ; z)`, for every `δ`;
- **`ε = 0`** (`heunLocal_eps_zero_eq_ordinaryHypergeometric`): for `a ≠ 0`, `γ ∉ {0, −1, −2, …}`
  and `|z| < min(1, |a|)`, `Hl(a, aαβ; α, β, γ, α + β + 1 − γ; z) = F(α, β; γ; z)`;
- at `a = 0`, `q = 0`, `δ = α + β + 1 − γ` Heun's equation is itself the hypergeometric equation
  (the points `0` and `a` merge into a regular singular point with exponents `{0, 1 − γ}`), and
  DLMF's `Hl(0, 0; α, β, γ, α + β + 1 − γ; z)` means its local solution `F(α, β; γ; z)`; it is not a
  value of `heunLocal`, and not the limit of `Hl(a, 0; …)` as `a → 0`.

In the first two cases the coefficients of Heun's equation reduce to those of the hypergeometric
equation (the factor `z − a` cancels against `z − 1`, respectively against `αβz − aαβ`), and both
sides are the analytic solutions with value `1` at `0` (3.1's uniqueness and
SpecialFunctionsHypergeometric 1.3); at `a = 1` the recurrence depends on `δ, ε` only through
`δ + ε = α + β + 1 − γ`.

**Checks.**
- At `(α, β, γ, z) = (0.3, 1.1, 0.8, 0.3)`: `Hl(1, 0.33; …; 0.3) = 1.16171 52329`, which is
  `F(0.3, 1.1; 0.8; 0.3)`, and the second bullet at `a = 3` gives the same value.
- Negative control: `Hl(1, 0.43; 0.3, 1.1, 0.8, δ; 0.3) = 1.21700 49392` (for every `δ`), not
  `F(0.3, 1.1; 0.8; 0.3)`: the accessory parameter must be `αβ = 0.33`.
- Negative control: for `a ≠ 0`, `Hl(a, 0; α, β, γ, α + β + 1 − γ; z)` has `c₁ = 0`, while
  `F(α, β; γ; z)` has `c₁ = αβ/γ`; so `Hl(a, 0; …)` does not tend to `F` as `a → 0`.

*Needs:* 3.1; Mathlib `ordinaryHypergeometric`.

### 8.2 Quadratic and cubic reductions

Sources: Maier, "On reducing the Heun equation to the hypergeometric equation" (2005), Theorems
3.7–3.8; DLMF 31.7.2–31.7.4.

Prove:
- **the quadratic reduction** (`heunLocal_two_eq_ordinaryHypergeometric`): for `γ ∉ {0, −1, −2, …}`
  and `|z| < √2 − 1`, `Hl(2, αβ; α, β, γ, α + β − 2γ + 1; z) = F(α/2, β/2; γ; 1 − (1 − z)²)`;
- **the cubic reduction** (`heunLocal_four_eq_ordinaryHypergeometric`): for `|z| < 1/3`,
  `Hl(4, αβ; α, β, ½, 2(α + β)/3; z) = F(α/3, β/3; ½; 1 − (1 − z)²(1 − z/4))`;
- 31.7.4: near `0`, `Hl(½ + i√3/2, αβ(½ + i√3/6); α, β, (α + β + 1)/3, (α + β + 1)/3; z)` equals
  `F(α/3, β/3; (α + β + 1)/3; 1 − (1 − (3/2 − i√3/2)z)³)`;
- each identity extends, by the identity theorem, to the connected component of `0` in the set where
  both sides are defined by 3.1 and by the Gauss series.

The radii keep the arguments in the unit disc: `|2z − z²| ≤ 2r + r² < 1` for `r < √2 − 1`, and
`|(9/4)z − (3/2)z² + z³/4| < 1` for `|z| < 1/3`. Both sides solve Heun's equation (the right side by
pulling back the hypergeometric equation along the polynomial map, which sends the singular points
of Heun's equation to `0, 1, ∞` with the right ramification) and are `1` at `0`.

**Checks.**
- At `(α, β, γ, z) = (0.3, 1.1, 0.8, 0.3)` each of 31.7.2–31.7.4 holds to `10⁻³⁰`.
- Negative control: in 31.7.2 with `δ = α + β − γ + 1` (one `γ` instead of `2γ`) the two sides
  differ by `3.42 · 10⁻³` at the same point.

*Needs:* 8.1; SpecialFunctionsHypergeometric 1.3.

### Examples

- `Hl(2, 0; 0, β, γ, β − 2γ + 1; z) = 1` (α = 0) and `F(0, β/2; γ; ·) = 1`.

### Dependencies

Layer 3; SpecialFunctionsHypergeometric.

## Downstream consumers

- Lamé functions and ellipsoidal harmonics, whose equation is the case `γ = δ = ε = ½` of 2.4
  (Whittaker–Watson Ch. XXIII).
- Mathieu and spheroidal wave functions, solutions of confluent Heun equations (7.4, Examples).
- PainleveEquations, whose classification of the Painlevé III and V equations in its 7.2 cites
  Heun-class equations; the isomonodromic side stays there.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Discreteness of the `(0, 1)`-eigenvalues for complex parameters**: that the function `F` of
  5.2 is not identically zero outside the hypotheses of its real problem. DLMF §31.4 asserts a
  discrete set of eigenvalues; Ronveaux §3.5, p. 40, bases it on the real Sturm–Liouville problem.
- **Path-multiplicative solutions** and their doubly infinite hypergeometric expansions (DLMF §31.6,
  §31.11(v); Ronveaux Part A, (4.5.1)–(4.5.2)): Schmidt's theory.
- **Finite-gap and Liouvillian solutions**: the Hermite–Darboux construction for half-odd-integer
  exponents (DLMF §31.8) and Kovacic's algorithm (DLMF §31.14(ii)).
- **Integral equations of the second type** (DLMF §31.10(ii)), with the cylinder-function and
  spherical kernels 31.10.17–31.10.23, for which lean-DLMF records further corrections to DLMF.
- **The classification of reductions to the hypergeometric function** (Maier 2005; DLMF §31.7(i),
  "finite number of values" of `(a, p)`) and Joyce's algebraic reduction: 8.2 owns the three printed
  reductions only.
- **Heine–Stieltjes theory**: for real `0, 1, a` and `γ, δ, ε > 0` there are exactly `n + 1` Heun
  polynomials, one for each distribution of the `n` zeros between `(0, 1)` and `(1, a)`; Stieltjes
  and Van Vleck polynomials of the general Fuchsian equation (DLMF §31.15). 4.2 proves reality and
  simplicity of the eigenvalues by symmetrization only.
- **Lamé function theory**: Lamé functions and polynomials, their eigenvalues and ellipsoidal
  harmonics (DLMF Ch. 29; Whittaker–Watson Ch. XXIII), beyond the change of variable of 2.4.
- **Asymptotics** of the eigenvalues `q_m` and of solutions with two coalescing singular points
  (DLMF §31.13).
- **The local theory of the biconfluent and triconfluent equations at `∞`**: ranks two and three,
  outside AsymptoticExpansions §10.4, which treats rank one; connection formulas of the confluent
  equations (Ronveaux Parts B–E) beyond the Stokes multipliers of 7.4.
- **Isomonodromy and Painlevé VI**: Heun's equation with an apparent singular point and its
  isomonodromic deformations, the Garnier systems (IKSY Ch. 3, §4.1, p. 169) and Painlevé VI, which
  PainleveEquations owns (its Layers 2–3 and 7.4).
- **The coexistence problem** for Heun functions (two Heun functions for the same pair of singular
  points; Ronveaux Part A, p. 41), open there.
- **Applications** (DLMF §§31.16–31.17): black-hole perturbations (Teukolsky), the quantum Rabi
  model, crystalline materials and others.

## Prior formalization

[`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes this chapter in
`DLMF/Heun/` (17 files, about 8,900 lines). It is the same author's work, and this roadmap reuses
its design where that fits: Heun's equation as a solution predicate on a set, `Hl` as the `tsum` of
the recurrence with junk values at the excluded parameters, the polynomial matrix of 31.5.1, the
eigenvalue property relative to `{0, 1}` as analytic continuation to the disc of radius `|a|`, and
the kernel equations in angular variables. This roadmap differs in organizing the material by
Fuchsian theory, transformations, the two eigenvalue problems and confluence rather than by DLMF
section, in proving the reality of the polynomial eigenvalues by symmetrization, in stating the real
eigenvalue problem with its oscillation count, and in stating the confluence limit for solutions.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting guidance.
The source serves as a reference, not as a specification. The following secondary provenance map
records source counterparts; the mathematical targets and dependencies are specified by the layers.

| lean-DLMF | Here | Status there |
|---|---|---|
| `Heun/Basic/Definitions.lean`, `Heun/Basic/Equation.lean` | 1.3–1.4, 2.1–2.2, 2.4 | proved |
| `Heun/Fuchsian.lean` | 1.1, 1.4; Stieltjes polynomials (beyond this roadmap) | the Fuchsian form proved; the Stieltjes and Van Vleck counts, orthogonality and completeness admitted |
| `Heun/Classification.lean` | 1.3 | one statement admitted |
| `Heun/LocalSolutions.lean` | 3.1–3.3 | proved |
| `Heun/SeriesBoundary.lean` | 3.4 | admitted (six statements) |
| `Heun/PolynomialCriterion.lean` | 4.1 | three statements admitted |
| `Heun/HeunFunctions.lean` | 5.1–5.3, 6.1 | eigenvalue analyticity, the infinite discrete eigenvalue set, the continued fraction and orthogonality for distinct eigenvalues admitted; Heun polynomials and the double orthogonality proved |
| `Heun/Hypergeometric.lean`, `Heun/JacobiExpansion.lean` | 5.4, Layer 8 | 31.7.1–31.7.4 proved; the series of Types I and II and the Jacobi expansion admitted |
| `Heun/DoublyPeriodic.lean` | 2.4 | proved |
| `Heun/Integral.lean`, `Heun/IntegralPath.lean`, `Heun/KernelAngles.lean`, `Heun/KernelExamples.lean`, `Heun/Integral/` | 6.3–6.4; Type II (beyond this roadmap) | proved, with the corrected 31.10.8 |
| `Heun/Confluent.lean`, `Heun/ConfluenceLimits.lean` | 7.1–7.3 | the classification proved; three confluence limits admitted |

The admitted statements there are proof work here. 4.2, 5.2's real problem, 7.2's limit of solutions
and 7.4 have no counterpart there. A theorem with a proof there may still rest on admitted
prerequisites; the table does not certify the transitive closure.

## References

- Y. Haraoka, *Linear Differential Equations in the Complex Domain: From Classical Theory to
  Forefront*, Lecture Notes in Mathematics 2271, Springer, 2020, Introduction, pp. 4–5, Theorem 4.3,
  p. 31, Theorem 7.1, p. 124, §7.2, p. 126.
- K. Iwasaki, H. Kimura, S. Shimomura and M. Yoshida, *From Gauss to Painlevé: A Modern Theory of
  Special Functions*, Vieweg, 1991, Ch. 1, Propositions 4.2–4.3, pp. 10–11; Ch. 2, Proposition
  1.1.1, p. 28; Ch. 3, §4.1, p. 169.
- G. Kristensson, *Second Order Differential Equations: Special Functions and Their Classification*,
  Springer, 2010, Theorem 3.1, p. 32; §4.4.1, pp. 56–57; Ch. 8, pp. 141–161.
- R. S. Maier, "On reducing the Heun equation to the hypergeometric equation", *J. Differential
  Equations* 213 (2005).
- R. S. Maier, "The 192 solutions of the Heun equation", *Math. Comp.* 76 (2007).
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 (2026-09-15), Chapter 31,
  <https://dlmf.nist.gov/31>, and from Chapter 2 the equations 2.7.7–2.7.18. Equation numbers refer
  to this release; the 2010 printed Handbook (F. W. J. Olver, D. W. Lozier, R. F. Boisvert and C. W.
  Clark, eds., Cambridge University Press), Chapter 31, pp. 709–721, has the same numbering.
- F. W. J. Olver, *Asymptotics and Special Functions*, A K Peters, 1997, Ch. 5, §4.1, p. 148, and
  Theorem 4.1, p. 149.
- A. Ronveaux (ed.), *Heun's Differential Equations*, Oxford University Press, 1995: Part A (Heun's
  equation), pp. 3–80; Part B (the confluent equation), pp. 89–93; Part D (the biconfluent
  equation), pp. 193–195; Part E (the triconfluent equation), pp. 253–254.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, §§10.6–10.8, pp. 203–208; Chapter XXIII, p. 555, and Miscellaneous Examples 7–10, pp.
  576–577.
