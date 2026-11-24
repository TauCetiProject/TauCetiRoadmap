# Riemann hypothesis for Dirichlet L-functions

A family of roadmaps whose end theorem is the generalized Riemann hypothesis (GRH), that is, the
Riemann hypothesis for Dirichlet L-functions: for
every modulus `N ≥ 1`, every Dirichlet character `χ` modulo `N` and every `s` with `Re s > 1/2`,
`L(s, χ) ≠ 0` unless `χ` is principal and `s = 1`. For the trivial character this is the Riemann
hypothesis for the Riemann zeta function, Mathlib's `RiemannHypothesis`; through the factorisation
of the Dedekind zeta function of an abelian number field into Dirichlet L-functions, it is also the
Riemann hypothesis for the Dedekind zeta function of every number field abelian over `ℚ`. The last
roadmap of the family states the theorems for Dirichlet L-functions and for the Riemann zeta
function; the statement for Dedekind zeta functions, and the forms that these theorems give of
conditional theorems of other roadmaps, are those of the roadmap
[ConsequencesOfTheRiemannHypothesisForDirichletLFunctions](../ConsequencesOfTheRiemannHypothesisForDirichletLFunctions/README.md).
The results that the family states are those of the
formal Lean proof, by Levent Alpöge, of the Riemann hypothesis and of the Riemann hypothesis for
Dirichlet L-functions, announced on 20 November 2026 ([announcement](https://alpo.ge/remark.pdf);
[the Lean source as published](https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005),
which is the first commit of a
[repository with a public verification setup](https://github.com/leanprover-community/riemann-hypothesis)).
That repository says of the proof that it belongs to its author and was published without a license,
and that it is mirrored there for verification only: unmodified at that first commit, and changed
since, as its notes describe. The files the roadmaps of this family name are files of the
source as published, so they are to be looked up at that first commit, under its directory `src/`.
The theorems of that proof are the two statements for Dirichlet L-functions and for the Riemann
zeta function; the statement for Dedekind zeta functions and the further consequences are drawn
from them by published theorems and are not statements of the formal proof. Each roadmap of the
family states as targets what that proof establishes and what its route needs, and labels each
statement with its origin and with the method of the formal proof (see the section on labels
below). The published theory on which the proof rests is stated, in the generality of its sources,
in the general roadmaps of the library, and the family cites it there by section; where a statement
of the family is a case of a general theorem stated there, its section says so.

The route is analytic at both ends. For a positively weighted family of characters, a one-sided
bound for the weighted sum of the Riesz-smoothed prime sums of its members, less their main terms,
on windows `[Y, Y^λ]` at arbitrarily large scales `Y`, is equivalent to the Riemann hypothesis for
every member of the family: this is a windowed form of Landau's theorem. For the cyclic family of a
primitive Dirichlet character `ψ`, the primitive characters that induce the powers of `ψ`, such
window bounds follow from an inequality between prime sums restricted by Frobenius over an abelian
CM field and their main terms. That inequality is proved with chains of theta lifts between
definite unitary groups, through the slopes of lattices of automorphic forms along the chain, the
congruence modules of the lifts, and uniform bounds for wild kernels. The general roadmaps of the
family supply the theory on which the chain rests: analytic number theory of Riesz sums and
zero-free boxes, Hermitian lattices, slopes and metrics, theta kernels and local factors, Galois
representations and Selmer groups, and integral models of unitary Shimura varieties.

Each subdirectory is a roadmap of its own, with a definitive `README.md` and a `Suggested.lean` of
target signatures; this page is the index of the family. The roadmaps are listed in merge order:
within the family, each roadmap cites only roadmaps listed above it. Citations between the roadmaps
are by section number, `<Roadmap> §k.n`, so the number of a section is part of its statement: a
section keeps its number.

## The proof in outline

**What the theorem says.** A Dirichlet character `χ` is a periodic, multiplicative function on the integers, and its L-function is `L(s, χ) = Σ χ(n)·n^{−s}`; for the trivial character this is the Riemann zeta function. The Riemann hypothesis for `L(s, χ)` says that its zeros in the strip `0 < Re s < 1` all lie on the line `Re s = 1/2`. It is classical that this is a statement about primes: a zero with real part `β` contributes a term of size about `x^β` to the sum of `χ` over the primes up to `x`, so the hypothesis amounts to square-root cancellation in such sums, once the main term is removed for the trivial character. The proof goes through that door. It bounds a sum over primes.

**How the proof is organised.** It has an analytic part and a geometric part.

The analytic part reduces the hypothesis for a given character to an upper bound for a real, smoothed sum over prime powers. Write `G(x)` for this sum at a real number `x`. It is built from the character and finitely many related characters, with positive weights. It suffices to prove, for every small `ε > 0`, that `G(x) ≤ x^{1/2+ε}` for all `x` in intervals `[Y, Y^{3/2}]` with `Y` arbitrarily large. Two features matter. Only an upper bound is asked for, not a bound for the absolute value. And the bound is asked for only on some long intervals, not for all large `x`.

The geometric part proves this bound at each `x` of suitable intervals. For such an `x` it chooses a CM field `E` containing an imaginary quadratic field `K`, and composes about `√x` theta lifts between definite unitary groups. The lifted forms are restricted to a subgroup and integrated against other automorphic forms; these integrals are the periods of the construction. For integral forms, the periods are divisible by high powers of primes inert in `K`. A form of Bost's slope inequality, for a family of maps between lattices with archimedean norms, limits how divisible such maps can be in terms of their norms and of the slopes of the lattices. In that comparison the divisibility contributes a sum over the primes inert in `K`, and the norms and slopes contribute its main term and an error. So the bound for the prime sum is not obtained by estimating the sum; it is read off from an inequality between sizes of arithmetic objects.

The author's announcement compares the argument with Stepanov's proof of the Riemann hypothesis for curves over finite fields, which uses a divisor with multiplicity, and says that multiplicity is hard to find over the integers. Here each further theta lift adds to the divisibility.

### The argument at a glance

1. **A criterion.** Let `Λ` be the von Mangoldt function, which is `log p` at the powers of a prime `p` and zero elsewhere. The smoothed prime sum of a character `χ` is `Σ_{n ≤ x} Λ(n)χ(n)(x/n − 1)`, a weighted count of the prime powers up to `x`. Take finitely many primitive Dirichlet characters, and let `G` be a combination, with positive weights, of the real parts of their smoothed prime sums with the main terms removed (the exact definition is in step 2 of the details). Fix a small `ε > 0`. If `G(x) ≤ x^{1/2+ε}` for all `x` in intervals `[Y, Y^{3/2}]` with `Y` arbitrarily large, then none of their L-functions has a zero with `Re s > 1/2 + ε`. If this holds for every small `ε`, there is no zero to the right of the critical line. The reason an upper bound suffices is positivity: with positive weights a zero of one of the L-functions cannot be cancelled by the others, and a real zero contributes with a positive sign. For a bound valid for all large `x` this is Landau's theorem, applied to the difference between the bound and `G`; the proof extends it to bounds on such intervals.
2. **A prime sum in a CM field.** Fix a large `x` at which `G(x)` is to be bounded. Choose two primes `q` and `d` and, from them and the character, a CM field `E` that is abelian over `ℚ` and contains `K = ℚ(√−d)`. Because `E` is abelian, the Frobenius of a prime in `E` is given by congruence conditions, and the characters of its Galois group are Dirichlet characters, among them the ones of point 1. Let `ℛ` be a smoothed sum of `log p` over the odd powers of the primes `p` that are inert in `K`, that is, remain prime there, with a term for the ramified prime `d`. In `ℛ` a prime power is counted up to a cut-off that depends on its Frobenius in `E`. Let `𝔐` be its main term. By orthogonality of characters, an upper bound of the right size for suitable averages of `ℛ − 𝔐` gives the bound of point 1 at this `x`. This needs estimates for some quadratic twists of the characters, and `q` and `d` are chosen so that these hold, by a mean-square argument over the possible `q` and a zero-density estimate.
3. **Divisibility.** Let `p ≥ 5` be inert in `K`. An elliptic curve with complex multiplication by `𝒪_K` has supersingular reduction above `p`, and its formal group there has height two. A product of `n` such curves is a complex torus `ℂ^n/L`, and a theta function on it is a holomorphic function of `n` complex variables, one for each curve, that changes by an explicit factor under translation by the lattice `L`; in one variable the Jacobi theta function and the Weierstrass sigma function are the classical examples. Its partial derivatives at the origin are numbers. Take the derivative of a large order `a` in one variable and of order at most `w` in the variables paired with it. Divided by the corresponding power of the CM period, this number is algebraic, and it is divisible by `p` to the exponent `Σ_{i odd} (a/p^i − w)_+`, up to a small loss. This is about `a/p` when `p` is well below `a/w`, and zero when `p` exceeds `a/w`. The gain comes from the formal group: in the logarithmic coordinate of a height-two Lubin–Tate group, high derivatives of power series with integral coefficients are divisible by high powers of `p`. It is obtained at the inert primes, which is why the sum `ℛ` runs over them.
4. **A chain of theta lifts.** A theta lift carries automorphic forms from one group to another by integrating them against a theta function. For unitary groups that are definite at every real place the forms are functions on a finite set with values in an algebraic representation, so they have integral structures and one can ask how divisible a lift is. Such a lift, over the totally real subfield of `E`, can be written with the derivatives of point 3. There `a` is a large entry of the weight of the forms, and `w` comes from the Hecke character used in the lift. The entry `a` survives the lift. So in a chain of `m` lifts each lift contributes an exponent of this kind. On a sublattice of controlled index, the periods of the chain are divisible, at the inert primes allowed, by the sum of the `m` contributions, less controlled losses. Summed over `p` with weights `log p` these give the sums `ℛ`: the bound `p ≤ a/w` is the cut-off of point 2, and `w` depends on Frobenius through the embedding of `E` at which it is read.
5. **The slope inequality.** The slope of a lattice with a metric is, up to normalisation, minus the logarithm of its covolume divided by its rank: it measures how dense the lattice is. The periods define maps from lattices of integral forms on the first group of the chain into the dual of one lattice of cusp forms. Divisibility allows each source lattice to be enlarged while its map stays integral, and this raises its slope by the sums of point 4. A version of Bost's slope inequality for a family of maps, which needs the maps to be nonzero and in general position, bounds the slopes of the enlarged sources by the slope of the target plus the logarithms of the archimedean norms of the maps. It plays the part that the product formula plays for a single number: a nonzero integer that is divisible by many primes cannot be small. The norms, the slopes and the level are then computed, with the Chowla–Selberg formula for periods of CM elliptic curves, the mass formula, Weyl's dimension formula and Stirling's formula. Their leading terms cancel and leave exactly the main term `𝔐`. The result is `ℛ ≤ 𝔐 + error`, on average.
6. **Errors, and why intervals.** The errors are of relative size `x^{O(ε)}·(x/m + m)`: some are incurred once and some at every lift. They are smallest when `m` is about `√x`, which gives the exponent `1/2 + O(ε)`; a shorter chain gives a worse exponent. One error comes from congruences between automorphic forms and is controlled by Galois cohomology groups that are dual to wild kernels in K-theory. Over cyclotomic fields these groups are related to the parts of class groups that Vandiver's conjecture predicts to vanish. The proof does not need them to vanish. It needs their total size to be small, as `E` grows with `x`, and it proves this, by Iwasawa theory and by congruences between Galois representations, only for `x` in long intervals. That is why point 1 is stated on intervals.

The folded section below gives each step with its hypotheses. The table after it lists the published results used, the steps where they enter and the roadmaps that carry each step.

<details>
<summary><b>The steps in more detail</b></summary>

Notation used throughout the steps:

- `x` is the real number at which the prime sum `G` is to be bounded, and `ε > 0` is small. Everything below is constructed for this `x`.
- `E` is an abelian CM field, `K` an imaginary quadratic subfield, `F` the maximal totally real subfield of `E`, and `Φ = Gal(E/K)`, which is a CM type of `E`.
- `m` is the number of theta lifts in the chain; `k` is the rank of the first unitary group and `t + 1` the increase of the rank at each lift.
- `a_τ` is a large first entry of the highest weight of the forms at an embedding `τ ∈ Φ`. It is also the order of the derivatives of theta functions that occur.
- `w_j(τ)` is the exponent of the infinity type at `τ` of the Hecke character `μ_j` used in lift `j`. The quotient `a_τ/w_j` is the point up to which a prime contributes.
- "Period" has two meanings, kept apart below: the CM period `Ω` of an elliptic curve, and an automorphic period, the integral of a form over a subgroup against another form.

**1. What is proved.** For every Dirichlet character `χ` and every `s` with `Re s > 1/2`, `L(s, χ) ≠ 0`, unless `χ` is principal and `s = 1`; and every zero with `0 < Re s < 1` has `Re s = 1/2`. The trivial character gives the Riemann hypothesis for the Riemann zeta function (Mathlib's `RiemannHypothesis`). These are the theorems of the formal proof. Factorisation into Dirichlet L-functions gives the corresponding statements for Dedekind zeta functions of abelian number fields, and for Hecke characters of such a field whose class field is abelian over `ℚ`; these are corollaries by published theorems, not statements of the formal proof. A character satisfies the hypothesis exactly when the primitive character inducing it does. So one fixes a primitive character `ψ`, of order `o`, and treats together the primitive characters that induce the powers of `ψ`. (Roadmaps: `GeneralizedRiemannHypothesisFromWindowBounds`, `RiemannHypothesisStatementsAndConsequences`.)

**2. Landau's theorem on long intervals.** Let `Λ` be the von Mangoldt function, `γ` Euler's constant and `y ≥ 1` a real variable; the functions below are later evaluated at `y = x`. For a primitive character `χ ≠ 1` put `G_χ(y) = Σ_{n ≤ y} Λ(n)χ(n)(y/n − 1) + y·(L′/L)(1, χ)`, and put `G_1(y) = Σ_{n ≤ y} Λ(n)(y/n − 1) − y log y + (1 + γ)y`. This is `y` times the first Riesz mean of `Σ Λ(n)χ(n)/n`, corrected so that its Mellin transform `∫_1^∞ G_χ(y) y^{−s−1} dy` has no pole at `s = 1`. In `Re s > 0` the transform has simple poles exactly at the zeros `ρ` of `L(s, χ)`, with residue `m_ρ/(ρ(1 − ρ))`, where `m_ρ` is the multiplicity; the residue is positive at a real zero.

Landau's theorem says that the Mellin transform of an eventually nonnegative function, with finite abscissa of convergence, is singular at the real point of that abscissa. Let `G = Σ w(χ)·Re G_χ` be a finite sum with weights `w(χ) > 0`, and suppose `G(y) ≤ C·y^θ` for all large `y`, where `0 < θ < 1`. Applying Landau's theorem to `C·y^θ − G(y)` shows that a pole of the transform of `G` in `Re s > θ` would force a real one, and at a real pole the positive residue has the wrong sign. So no `L(s, χ)` in the sum vanishes in `Re s > θ`. Only an upper bound for `G` is used.

The proof needs an extension of this, established for these transforms: the conclusion holds if `G(y) ≤ C·y^θ` only on intervals `[Y, Y^λ]`, for a fixed `λ > 1` and arbitrarily large `Y`. After the substitution `y = e^u`, the Taylor coefficients of the transform at a point far to the right are integrals against Gamma densities, and the density of order proportional to `U` is concentrated on `[U, λU]`. The bound on one interval therefore controls one coefficient, by positivity, while a pole to the right of `θ` would force the coefficients to grow geometrically. Intervals of bounded length in `u` would not suffice.

What remains is to prove, for every primitive `ψ` and every sufficiently small `ε > 0`, that `G_1(y) + (3o + 1)^{−1}·Σ Re G_χ(y) ≤ y^{1/2+9ε}` on intervals `[Y, Y^{3/2}]` with `Y` arbitrarily large, the sum over the other primitive characters that induce powers of `ψ`.

**3. Prime sums in a CM field.** Fix a large real number `x`. The aim is the bound of step 2 at the point `y = x`. Everything built from here on is built for this `x`: the field `E` below, and later the length `m` of the chain and the weights. Choose primes `q ≡ 3 (mod 8)` and `d ≡ 7 (mod 16)`, prime to the conductor of `ψ` and subject to further splitting conditions, and put `K = ℚ(√−d)`. Let `E` be the compositum of the field cut out by `ψ`, the fields `ℚ(√−q)` and `K`, and the `n`-th layer of the cyclotomic `ℤ_2`-extension of `ℚ`, for an `n` that depends on `x`. Then `E` is an abelian CM field, unramified at every finite place over its maximal totally real subfield `F`, and its degree grows like a power of `x`. Write `Φ = Gal(E/K)`, a CM type of `E`, and `c` for complex conjugation.

For `a > 0`, `τ ∈ Φ` and a positive function `w` on `Φ`, let `ℛ(a, τ, w)` be the sum of `2 log p·(a/p^i − w(c·Frob_p^i·τ))_+` over the primes `p` inert in `K` and the odd `i ≥ 1`, together with analogous terms at the powers of the ramified prime `d`; here `z_+ = max(z, 0)`. It is a sum of the same kind as in step 2, with `Λ(n)(1 − χ_K(n))` in place of `Λ(n)χ(n)`, where `χ_K` is the quadratic character of `K`, and with a length `a/w` that depends on the Frobenius class in `E`. Its main term is `𝔐(a, w) = a·(log a − 1 − γ + (L′/L)(1, χ_K) − mean log w)`, the mean over `Φ`. By orthogonality of characters, `ℛ − 𝔐` is an explicit combination of values `G_{χ*}(a/w)`, over the characters `χ` of `Gal(E/ℚ)`, where `χ*` is the primitive Dirichlet character inducing `χ`.

The function `w` is chosen so that the length `a/w` is about `x` on a chosen set of elements of `Φ` and much longer elsewhere, and the construction is averaged over the kernel of `ψ` on `Gal(E/ℚ(√−q, √−d))`. The chosen set is a translate of the image of a set of integers with no linear relation with small coefficients among three of its elements, obtained by Behrend's construction; along the orbit of any element of the Galois group it is sparse. The elements `τ` are taken with unequal frequencies on the cosets of that kernel; this produces the positive weights `1` and `1/(3o + 1)` of step 2, and other positive ratios would serve as well. The result is a reduction: an upper bound of the right size for sums of `ℛ − 𝔐` gives the bound of step 2 at `y = x`, provided two things hold. For `0 ≤ l < o` and `i, j ∈ {0, 1}` with `(i, j) ≠ (0, 0)`, the primitive character `χ` inducing `ψ^l·(·/q)^i·(·/d)^j`, where the last two factors are the quadratic characters of `q` and `d`, must satisfy `|G_χ(x)| ≤ x^{1/2+ε}` and `|(L′/L)(1, χ)| ≤ C′ log x`. And every character of `E` must satisfy the prime number theorem with a saving at the longer lengths.

The primes `q` and `d` are selected so that these conditions hold for all `x` in a long range. The selection uses a mean-square estimate for prime sums twisted by `(·/q)`, as `q` varies over primes in a residue class, proved with quadratic reciprocity and the prime number theorem in arithmetic progressions, without a large sieve; and a log-free zero-density estimate. A possible exceptional zero is kept as an explicit term and handled by Page's theorem and the Deuring–Heilbronn phenomenon.

**4. Divisibility at supersingular primes.** Let `p ≥ 5` be a prime inert in `K`. An elliptic curve with complex multiplication by `𝒪_K` has supersingular reduction at the places above `p`, and its formal group there is a Lubin–Tate formal group of height two. If a power series with integral coefficients on this group is written in the logarithmic coordinate, its `n`-th derivative at the origin is divisible by `p` to the power `n·p/(p² − 1) − O(log n)`, and `p/(p² − 1) = 1/p + 1/p³ + ⋯`: the factorial contributes `n/(p − 1)`, and the inverse of the logarithm loses at most `n/(p² − 1)`.

A theta function of a product of such curves is, near the origin, such a series times `exp(−β)`, where `β` is a cocycle given by the theorem of the cube and Hermitian for the action of `𝒪_K`. The exponential gives back part of the divisibility: for a single curve the rate drops to `1/(p² − 1)`, and this is sharp. The full rate survives when `β` pairs a variable in which one differentiates to a large order `a` only with variables in which the order is at most `w`. The derivative, normalised by the CM period, is then divisible by `p` to the exponent `Σ_{i odd} (a/p^i − w)_+`, up to `O(log² a)`. This is about `a/p` for large `p`, and it is zero once `p` exceeds `a/w`. Summed over `p` with weights `log p`, these exponents have the shape of `ℛ`.

**5. A chain of theta lifts.** The aim is to obtain the divisibility of step 4 again and again, once at each lift, without losing the large entry of the weight. Let `X_j = E^{k + j(t+1)}` for `0 ≤ j ≤ m`, with the standard Hermitian form. The unitary groups `U(X_j)` over `F` are definite at every real place, so their automorphic forms are algebraic modular forms in the sense of Gross: functions on a finite class set with values in an algebraic representation, integral when the values lie in a Weyl lattice. Step `j` of the chain is the theta lift for the dual pair `U(X_{j−1}) × U(X_j)`, realised on `Hom_E(X_{j−1}, X_j)`, with a unitary Hecke character `μ_j` of `E`, trivial on the ideles of `F`, as splitting character. On base change it adds the segment `μ_j|·|^{t/2}, …, μ_j|·|^{−t/2}`.

The weights considered have a very large first entry `a_τ` at chosen embeddings `τ ∈ Φ`. Because the lift is realised on `Hom` rather than on a tensor product, no contragredient intervenes and this entry is kept by every step. For lattice test functions, the kernel of a step is a finite sum over the class set of derivatives at the origin of theta functions of products of elliptic curves with multiplication by `𝒪_K`, of order about `a_τ` and normalised by CM periods. Step 4 applies, with `w` the exponent `w_j` of the infinity type of `μ_j` at the embedding `c·Frob_p^i·τ`.

After the `m` lifts the resulting form is restricted to a subgroup and integrated against a form there (the automorphic period of step 6). The conclusion is a lower bound for the valuations of these periods, valid when the form one starts from lies in a sublattice, of controlled index, of the lattice of integral forms on `U(X_0)`; the sublattice is cut out by Hecke operators at `p`. Its main part is the sum, over the `m` steps and the chosen `τ`, of `Σ_{i odd} (a_τ/p^i − w_j(c·Frob_p^i·τ))_+`. There are explicit losses, and restrictions on the primes `p`, which are accounted for when the sums are assembled. Each step contributes its own term; this is the reason for iterating the lift.

**6. The slope inequality.** The aim is to compare the divisibility of step 5 with slopes of lattices. The `m`-fold lift of a form on `U(X_0)` is restricted to the unitary group of a hyperplane of `X_m` and integrated against a form there: a period of Gan–Gross–Prasad type in codimension one. By an iterated seesaw argument it equals, up to a nonzero scalar, a Bessel period of a cusp form on an indefinite unitary group `U(Y_0)` of rank `r = k + m − 1`, obtained from the second form by a second chain of `m` theta lifts. So each source weight gives a map `B` from a lattice `N` of integral algebraic modular forms on `U(X_0)` to the dual `R^∨` of a lattice `R` of cusp forms on `U(Y_0)`, with Petersson metrics on both.

Bost's slope inequality says that a nonzero map `φ : N → M` of Hermitian lattices over a ring of integers cannot lower slopes by more than its height: the image satisfies `μ_min(φ(N)) ≥ μ_min(N) − h(φ)`, and if `φ` is injective, `μ_max(N) ≤ μ_max(M) + h(φ)`. Here the slope `μ` is the Arakelov degree divided by the rank and by the degree of the field, `μ_max` and `μ_min` are the largest slope of a sublattice and the smallest slope of a quotient, and the height `h(φ)` is the normalised sum over all places of the logarithms of the operator norms. The proof uses a version for a family of maps into one lattice, which bounds the mean of the slopes of the sources, less the heights of the maps, by the slope of the target (step 7). In the rest of this step slopes and heights are doubled, so that heights are logarithms of squared norms.

If the values of `B` on `N` and `R` are divisible to order `σ_𝔭` at each finite place `𝔭` of the coefficient field, then `B` is still integral on the larger lattice `N′ = (∏ 𝔭^{−σ_𝔭})·N`, and the slope of `N′` exceeds that of `N` by a normalised sum of the `σ_𝔭·log N𝔭`. With the exponents of step 5 this increase is the sum of the `ℛ` over the steps and the chosen embeddings, up to a controlled error. This is how divisibility enters the inequality as a sum over primes.

The other terms are computed. The archimedean height of `B` contains, for each step and each `τ`, the term `a_τ log a_τ − a_τ − a_τ log Ω`: Stirling's formula for a derivative of order `a_τ`, and the CM period `Ω`, for which the Chowla–Selberg formula gives `log Ω = γ + log(2π/rd_E) − (L′/L)(1, χ_K)`, with `rd_E` the root discriminant of `E`. The ranks of source and target are made comparable by imposing a level at an auxiliary prime on the source; the mass formula, Harish-Chandra's formal degrees and Weyl's dimension formula determine the level required, and the factorials in these formulas cancel exactly. Combining the heights, the slope of the target, the level and the norms of the lifts leaves exactly `Σ 𝔐` as main term. In `𝔐`, the `−1` comes from Stirling's formula, `−γ` and `(L′/L)(1, χ_K)` from the Chowla–Selberg formula, and `−mean log w` from the level. One uncancelled term of size `a_τ` per lift would make the inequality trivial.

The outcome is `Σ(ℛ − 𝔐) ≤ error`. After normalisation, errors incurred once contribute `x/m` and errors incurred at every lift contribute `m`, up to factors `x^{O(ε)}`. A chain of length `m` about `√x` balances them and gives the exponent `1/2 + O(ε)`.

**7. What the slope inequality needs.** Step 6 uses three estimates. Each is a substantial part of the proof.

*A family of maps in general position.* This supplies the hypothesis of the family form of the slope inequality, so that the slope of the whole target, and not only its largest slope, bounds the sources. A single map `B` reaches only part of the target. The proof uses a large family of source lattices, of different weights indexed by binary words, whose total rank is a large multiple of the rank of the target, and a slope inequality for such a family. For each word `u`, the period map is represented by a Poincaré series of Bessel type on `U(Y_0)`; write `P_u` for the corresponding operator. The inequality requires that, at one archimedean place, each map be nearly a scaled isometry, and that for two different words `u` and `u′` the Gram operator `P_u^* P_{u′}` have squared Hilbert–Schmidt norm at most slightly more than its mean value for random subspaces of the same dimensions. The Gram operators are estimated through the geometric side of a relative trace formula: Siegel's main theorem counts the terms on average over a genus, the local terms are Kloosterman sums, bounded by stationary phase over `p`-adic fields, and the archimedean orbital integrals are treated by stationary phase over `ℂ^n`. The same estimates show that each map is nonzero on forms that are new at the auxiliary prime. For the second chain of lifts, the Rallis inner product formula expresses the Gram operator, on each Hecke eigenspace, as a nonzero scalar times a product of partial standard L-values at `(t + 1)/2`, twisted by the `μ_j`; these Euler products converge absolutely because `t > r`.

*The slope of the target.* This supplies the upper bound for the slope of `R^∨` in step 6, with its exact main term. For auxiliary unitary groups `U(W_j)` of signature `(k + j − 1, m − j)` at every place of the CM type, the lattices of integral holomorphic cusp forms on the associated Shimura varieties have slopes bounded below. Through theta lifts from definite groups to `U(W_j)` this gives the upper bound for the slope of `R^∨`, once the norms of the lifts and the congruence terms below are included. The main term comes from the line bundle `det Lie_τ ⊗ (det Lie_{cτ})^{−1}`, whose Hodge metric has zero curvature; its arithmetic degree is computed at a CM point by the Chowla–Selberg formula and is a multiple of `log Ω`. The remainder is bounded by new quantitative results: a lower bound for arithmetic volumes on flag bundles over these varieties, averaged over connected components, proved by an arithmetic form of Hirzebruch–Mumford proportionality with Zhang's inequality; and an explicit arithmetic Hilbert–Samuel inequality, with the comparison by Bost, Gillet and Soulé of the height of a projective variety with the height of its Chow form, to pass from volumes to forms of a single weight. The Hodge metrics have logarithmic singularities along the boundary, so arithmetic intersection numbers are defined by regularisation; Hörmander's `L²` estimates, Nadel vanishing and the point-separation theorems of Angehrn–Siu and Kollár supply the sections these arguments need.

*Congruences.* This bounds one error term in the slope of the target. The bound for the slope of the target involves Hida's congruence modules between theta lifts and the other automorphic forms on a definite unitary group. To bound them at a prime `ℓ`, the Hecke characters `μ_j` are twisted, for the places above `ℓ`, by an anticyclotomic character of `ℓ`-power order. No single twist serves all primes, since a twisted period is integral only away from the primes where the twist ramifies. Under these twists the period pairing changes only by a factor that is a unit at the place where the twist is used, but the integral forms change. So the target lattice `R` is defined place by place: at each finite place of the coefficient field it is spanned by the integral forms for the twist used there. The Galois representation attached to a lift is the sum of an irreducible representation and Tate twists of a character, and depth-zero types imposed at two auxiliary split primes make the irreducible part residually irreducible for every `ℓ`. A quantitative form of Ribet's lattice argument, with lengths in place of nonvanishing, bounds the congruence module by the length of a Selmer group of a twist of the irreducible part, the `ℓ`-part of the class group of `E`, the groups `Ш¹(E, ℓ, e)` of step 8 for `0 < e < t`, and local terms. The anticyclotomic twist makes the first Selmer group small. The local conditions above `ℓ` concern Hodge–Tate weights far outside the Fontaine–Laffaille range: for large `ℓ` they are verified by reduction of Wach lattices, and for small `ℓ` classes are lifted with an explicit loss.

**8. Wild kernels, and why the bound holds only on long intervals.** For `e > 0` let `Ш¹(E, ℓ, e)` be the group of classes in `H¹(𝒪_E[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))` whose restrictions to the completions of `E` at the places above `ℓ` vanish. These groups come from the Tate twists of a character in the Galois representation of a lift. They do not depend on the Hecke characters, so no twist removes them. Each is dual to the étale wild kernel in `H²(𝒪_E[1/ℓ], ℤ_ℓ(e + 1))`, which for odd `ℓ` is the `ℓ`-primary part of the wild kernel in `K_{2e}(𝒪_E)`. Over `ℚ(μ_ℓ)` the dual group maps onto a twist of the class group modulo `ℓ`, whose invariants form the eigenspace that Vandiver's conjecture predicts to vanish when `e` is even.

The proof does not need such vanishing. It needs a bound for the total `V(E, t) = Σ_ℓ log ℓ·Σ_{0<e<t} length Ш¹(E, ℓ, e)`, for the fields `E` of the construction, whose degree and whose range `t` of twists grow with `x`. In a cyclotomic `ℤ_ℓ`-tower these lengths are governed by an Iwasawa module. The theorem of Ferrero and Washington, with the congruence conditions on `q` and `d`, bounds its number of generators independently of the auxiliary primes, and the lengths are then small except when `e` is `ℓ`-adically close to one of boundedly many centres. For those exceptional `e` only a bound of Soulé type, exponential in a power of `e`, is available. A pigeonhole argument over ranges of `x` produces long intervals on which every exceptional `e` is either beyond the range needed or small enough for the Soulé-type bound.

At odd primes, minus parts are bounded by generalized Bernoulli numbers, through an Euler system of Jacobi sums and Stickelberger elements. The prime `2`, and the plus parts at finitely many other primes, are treated by the Iwasawa argument above. At the remaining primes, plus parts are bounded by running Ribet's construction in reverse. A class is a tangent vector to a deformation ring of a residually reducible representation. A bound for the cotangent space of the deformation ring bounds its length by congruences between Eisenstein traces and the traces of the deformations that are not triangular. Automorphy lifting in the residually reducible case, developing methods of Skinner–Wiles, Thorne and Allen–Newton–Thorne, shows that those deformations come from cuspidal automorphic representations, and the product of the trace differences is a nonzero integer independent of `ℓ`.

The result is `V(E, t) ≤ e^{x^ε}` for `x` in intervals `[Y, Y^{3/2}]` with `Y` arbitrarily large, and only there. This is why the criterion of step 2 has to work on such intervals.

**9. Conclusion.** Fix a primitive `ψ` and a sufficiently small `ε > 0`. Beyond any given bound there are an interval `[Y, Y^{3/2}]` and a pair `q, d`, fixed on the interval, such that at every `x` in it a layer `n(x)` of the `ℤ_2`-extension gives a field `E` for which steps 3 and 8 hold, and the chain of length about `√x` gives the inequality of step 6. Step 3 then gives `G_1(x) + (3o + 1)^{−1}·Σ Re G_χ(x) ≤ x^{1/2+9ε}`. By step 2, no primitive character inducing a power of `ψ` has a zero with `Re s > 1/2 + 9ε`. Letting `ε` tend to zero excludes zeros with `Re s > 1/2`; the functional equation gives the statement in the critical strip, and passing to inducing primitive characters gives it for every Dirichlet character. (Roadmaps: `ThetaChainsAndFrobeniusPrimeSums`, `GeneralizedRiemannHypothesisFromWindowBounds`.)

The roadmaps give the precise statements. They distinguish what the formal proof states from wider forms that are the roadmaps' own, and they say where a derivation is not written out (as in `UniformWildKernelBounds` and `GluedTargetAndDivisionInequality`). Several statements above hold under size conditions on the data, which `ThetaChainsAndFrobeniusPrimeSums` verifies for the data it constructs.

</details>

## Published results, and where the proof uses them

The step numbers are those of the details above, and the third column names the roadmaps that carry each step. Several results are used only in a special case, and the first column says which. Besides these, the proof proves new results, several of them quantitative forms of these: the interval form of Landau's theorem, the bounds for derivatives of theta functions, the slope inequality for families, the Gram estimates for Bessel Poincaré series, an arithmetic proportionality theorem with an explicit arithmetic Hilbert–Samuel estimate, Ribet's lattice argument with lengths, and the uniform bound for wild kernels. Where a result is the subject of another Tau Ceti roadmap, the roadmaps named here take it from there.

| Result | Where it is used | Roadmaps |
|---|---|---|
| The explicit formula; Landau's theorem on Mellin transforms of functions of constant sign | Step 2: an upper bound for the prime sum excludes zeros | `RiemannHypothesisStatementsAndConsequences`, `GeneralizedRiemannHypothesisFromWindowBounds`, `PositivityOfDirichletSeriesWithKernels` |
| The prime number theorem for characters with the exceptional zero kept explicit; Page's theorem; Siegel's theorem; the Deuring–Heilbronn phenomenon; Turán's second main theorem on power sums; Gallagher's prime number theorem in Linnik's range; log-free zero-density estimates; Behrend's construction of large sets of integers without three-term arithmetic progressions | Step 3: the choice of `q` and `d`, the error terms of the prime sum, and the sparse set of places at which the length is about `x` | `RieszSumsOverPrimesAndExceptionalZeros`, `QuadraticTwistSelectionOverPrimes`, `FrobeniusRestrictedRieszSums` |
| Lubin–Tate formal groups and Dwork's lemma; universal extensions (Mazur–Messing) and biextensions of formal groups (Mumford) | Steps 4 and 7: divisibility of the derivatives of theta functions at supersingular primes, and of jets of forms at points of the unitary Shimura varieties | `TaylorBoundsAndDepthsOnHeightTwoFormalGroups`, `LocalGainOfThetaChains`, `HodgeTateLatticesAndLubinTateLogarithms` |
| The Weil representation and Howe duality; the Siegel–Weil formula; seesaw identities; Bessel models and periods | Steps 5, 6 and 7: the theta lifts of the chain, the identity of their period with a Bessel period, and the proof that they do not vanish, by Rallis inner product formulas in the forms needed here | `ThetaKernelsForUnitaryDualPairs`, `ThetaLiftsForDefiniteUnitaryGroups`, `ThetaChainsOnDefiniteUnitaryGroups`, `SeesawForThetaChains`, `RowTowerAndRallisIdentities`, `BesselPoincareSeriesAndGramBounds`, `TensorInductionAndFiniteGroupInputs` |
| Bost's slope inequality; the Harder–Narasimhan filtration of Stuhler and Grayson; Minkowski's second theorem, only its upper bound for a full lattice in a Euclidean space and the unit ball | Steps 6 and 7: the comparison of slopes along the chain, and maximal slopes from short vectors | `SlopesOfHermitianVectorBundles`, `AdelicHeightsAndSuccessiveMinima`, `GluedTargetAndDivisionInequality`, `ThetaChainsAndFrobeniusPrimeSums` |
| Siegel's main theorem and the mass formula; Harish-Chandra's formal degrees; integral Weyl modules; Deligne–Lusztig theory and Gelfand–Graev characters, for general linear groups over finite fields | Steps 6 and 7: ranks, volumes and counts of the lattices of forms; the average over a genus in the trace formula | `HermitianFormsAndLattices`, `OrbitMeasuresOnAdelicGroups`, `IntegralWeylModulesOfGeneralLinearGroups`, `DiscreteSeriesCoefficientsAndAutomorphicMetrics`, `FiniteReductiveGroups` |
| The Chowla–Selberg formula; the main theorem of complex multiplication and Shimura's reciprocity law; the Deligne–Ribet congruences for zeta values of totally real fields | Steps 6 and 7: the period `Ω`, and the denominators and Galois conjugates of the values at CM points that enter the slopes of the lattices of integral forms | `ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties`, `RowTowerAndRallisIdentities` |
| Toroidal compactifications of Shimura varieties of PEL type and semi-abelian degenerations (Faltings–Chai, Lan); Zarhin's trick; Fargues' theorems on the Hodge–Tate map of a `p`-divisible group | Step 7: projective integral models of the unitary Shimura varieties, their Hodge bundles at the boundary, and integral Hodge–Tate lattices | `ProjectiveModelsAndPeriodBoundsOnShimuraVarieties`, `HodgeTateLatticesAndLubinTateLogarithms` |
| Arithmetic intersection theory (Gillet–Soulé); the arithmetic Hilbert–Samuel theorem; Zhang's theorem of successive minima; Moriwaki's inequality for arithmetic volumes; heights of Chow forms (Bost–Gillet–Soulé); Hirzebruch–Mumford proportionality | Step 7: the lower bound for the slopes of the lattices of integral cusp forms | `ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties`, `HeightsForLogSingularMetrics`, `ChowFormsAndHeightsOfSubvarieties`, `DiscreteSeriesCoefficientsAndAutomorphicMetrics` |
| Resolution of singularities in characteristic zero; Kawamata–Viehweg vanishing; multiplier ideals and Nadel vanishing; the `L²` estimates of Hörmander and Ohsawa–Takegoshi; point separation after Angehrn–Siu and Kollár | Step 7: sections that separate points, and sections with controlled norms for Hodge metrics singular along the boundary | `MultiplierIdealsOfPairsAndPointSeparation`, `SingularHermitianMetricsAndL2Methods` |
| The local Langlands correspondence for `GL_n`, only in a restricted form: a map, constructed in the proof, from the irreducible smooth representations of `GL_n` over a `p`-adic field to Weil–Deligne representations, which has the dimension, the rank-one case and the segment rule of the correspondence, and its compatibility with twists by characters other than real powers of the absolute value, and with contragredients, only on the representations whose supercuspidal support consists of characters and, over `ℚ_p`, of twists of depth-zero supercuspidal representations; on inertia its values at the depth-zero supercuspidal representations of `GL_n(ℚ_p)` are given by the regular characters that label, in Green's character formula, the cuspidal representations of `GL_n(𝔽_p)`. The Bernstein–Zelevinsky classification | Steps 5 and 7: the local components of the lifts at the auxiliary primes, and the depth-zero types that make the Galois representations residually irreducible | `LocalFactorsOfTwistsAndTypes`, `FiniteReductiveGroups`, `BaseChangeAndGaloisRepresentationsForUnitaryGroups` |
| Galois representations of regular algebraic, polarized cuspidal automorphic representations of `GL_n` over CM fields, with local–global compatibility at the places not above `ℓ` only in restricted cases (the rank in general; the full comparison when the local component is an irreducible principal series of pairwise unlinked characters; the comparison on inertia, with trivial monodromy, at certain places of depth zero over `ℚ_p`), and, at the places above `ℓ`, crystallinity, with the Hodge–Tate weights given by the infinitesimal character at infinity, where the local component is unramified, and, where the local component is of one of the two kinds just named, that the representation is de Rham and potentially semistable with those weights, with the same comparison for its Weil–Deligne representation; base change (Arthur–Clozel, Labesse), that of Arthur and Clozel only in particular cases, among them cyclic base change of prime degree between totally complex fields; Clozel's purity lemma for infinity types; the Jacquet–Shalika bound | Steps 7 and 8: the Galois representations of the lifts and of the forms that automorphy lifting produces; the Jacquet–Shalika bound gives the sizes of their Frobenius eigenvalues | `BaseChangeAndGaloisRepresentationsForUnitaryGroups`, `CongruenceModulesOfThetaLifts`, `UniformWildKernelBounds`, `HeckeIdealsAndTaylorWilesRelations` |
| Ribet's lattice argument; Hida's congruence modules; Bloch–Kato Selmer groups and Poitou–Tate duality; Fontaine–Laffaille theory, Wach lattices and prismatic `F`-crystals | Step 7: the congruence modules are bounded by lengths of Selmer groups, with the local conditions above `ℓ` | `CongruenceModulesOfThetaLifts`, `LengthBoundsInPadicFamilies`, `SelmerLengthBoundsAndLocalLifting`, `WachLatticesOverTheCyclotomicTower` |
| The theorem of Ferrero and Washington; Stickelberger's theorem and generalized Bernoulli numbers; Kolyvagin's method of derivative classes, here for an Euler system of Jacobi sums; Kato's Euler system, over `ℚ` and for odd `ℓ`, for the twist with Hodge–Tate weights `e` and `−e` of newforms of odd weight `2e + 1` that are ordinary at `ℓ` and of level prime to `ℓ`; Soulé's torsion bounds; Taylor–Wiles patching and automorphy lifting in the residually reducible case (Skinner–Wiles, Thorne, Allen–Newton–Thorne) | Step 8: the bound for wild kernels, uniform in the field | `UniformWildKernelBounds`, `BernoulliBoundsForClassGroupEigenspaces`, `HeckeIdealsAndTaylorWilesRelations`, `ReducibilityIdealsAndUltrafilterPatching` |

The formal proof proves many of these results itself. In particular it constructs its Galois representations in the cohomology of Kuga–Sato varieties over compact unitary Shimura varieties, using a congruence relation of Eichler–Shimura type and the crystalline and Hodge–Tate comparison theorems. The roadmaps take them instead from the roadmap `AutomorphicGaloisRepresentationsPartII`.

## What the proof does not need

The source of the formal proof states each of the following published theorems, and its main theorems do not depend on those statements: the proof does not use the theorems as they are stated there. Where an item names a narrower statement, the proof has it; the items do not name all of them.

- **The local Langlands correspondence for `GL_n`** as a theorem (the existence and uniqueness of the correspondence over `p`-adic fields), and its explicit form at depth zero (the restriction to inertia of the parameter of a depth-zero supercuspidal representation of `GL_n(ℚ_p)`). In its place the proof constructs the map described in the table, which has that restriction to inertia by its definition.
- **Caraiani's theorems** on the Galois representations of cohomological, conjugate self-dual cuspidal automorphic representations of `GL_n` over CM fields: local–global compatibility at every finite place, and temperedness of every local component. For local–global compatibility the proof uses the restricted cases listed in the table.
- **Arthur and Clozel's base change and automorphic induction of prime degree in the form that covers totally real as well as totally complex fields**, automorphic induction for quadratic extensions of totally real fields, the local base change of supercuspidal representations, and the compatibility of base change with supercuspidal supports. What the proof does use includes: cyclic base change of prime degree between totally complex fields, in every rank, with descent and the description of the fibres (the lift is cuspidal for cuspidal representations that are not isomorphic to a twist of themselves by a non-trivial character of the norm class group); base change of regular algebraic cuspidal representations of `GL_2` from a totally real field to a totally complex quadratic extension, for those that are not isomorphic to their twist by the quadratic character of the extension (the lift is then cuspidal); and automorphic induction from `GL_2` to `GL_4` for a quadratic extension of totally complex fields, under conditions on the weights and at the places that do not split. For cyclic base change, at the places that do not split, it uses in place of the local base change of supercuspidal representations a twisted trace identity, up to a non-zero constant, between the local components of a representation and of its lift.
- **The simple stable twisted trace formula** for `GL_a × GL_b` over a CM field, and **the statement on the truncated trace formula of a unitary group after Labesse and Waldspurger** (convergence of the truncated kernel, with the terms of regular classes given by weighted orbital integrals). In place of the first, over a CM field that is unramified at every finite place over its totally real subfield, for base change from the definite unitary group to `GL_n` and for descent in the other direction (of regular algebraic, conjugate self-dual cuspidal representations that are unramified at the places that do not split), the proof compares the regular elliptic terms of the geometric sides, for matching test functions that it constructs, and reads the spectral information from the growth of these terms along the powers of Hecke operators; on the unitary group they are traces of Hecke operators.
- **Mœglin and Waldspurger's description of the discrete automorphic spectrum of `GL_n`.** In its place the proof uses that a discrete automorphic representation of `GL_n` over a totally complex field, whose infinitesimal character at one complex embedding is regular with integral differences, embeds in the automorphic forms induced from a Speh segment of a unitary cuspidal representation.
- **Scholze and Weinstein's classification of `p`-divisible groups** over `𝒪_C`, for `C` a complete algebraically closed extension of `ℚ_p`, by their Tate modules with the Hodge–Tate filtration. The proof has the passage from a `p`-divisible group over `𝒪_C` to its Tate module with the Hodge–Tate map, with Fargues' theorems on that map, and full faithfulness for the homomorphisms from `ℚ_p/ℤ_p` to `μ_{p^∞}`; no statement of full faithfulness in general, and none of the existence of a group with given data, was found among the statements on which its main theorems depend.
- **Kato's theorem on the Selmer groups of twists of modular forms**, in general. In its place the proof has, for odd `ℓ`, the vanishing of the Bloch–Kato Selmer group over `ℚ` of one twist `W` of the Galois representation of a newform of odd weight `2e + 1`: the twist with Hodge–Tate weights `e` and `−e` whose determinant is an odd character of order at most two. The hypotheses are that `W` is irreducible on the intersection of the kernels of the `ℓ`-adic cyclotomic character and of `det W`, that inertia at the primes other than `ℓ` acts diagonally through characters of finite order, that `W` is ordinary at `ℓ`, and that a twist of `W` by a character of conductor dividing `ℓ` comes from a newform of level prime to `ℓ` whose `ℓ`-th coefficient is an `ℓ`-adic unit.
- **The general vanishing theorem for adjoint Bloch–Kato Selmer groups**, for the Galois representation of a polarized regular algebraic cuspidal automorphic representation over a CM field that stays irreducible on the Galois group of the field generated by all `ℓ`-power roots of unity. In its place the proof uses a vanishing theorem for the same adjoint Selmer group, in ranks two to four, at the arithmetic points of universal ordinary determinant rings of residual sums of pairwise distinct characters, for the points whose representation comes from a conjugate self-dual cuspidal automorphic representation, is irreducible on the kernel of the cyclotomic character and is generic at the places above `ℓ`; the CM field has no primitive `ℓ`-th root of unity, and there are further conditions on the field and on `ℓ`.
- **Borel's computation of the ranks of the K-groups of rings of integers, and bounds for the kernel of the Hurewicz map** from algebraic K-groups to the homology of general linear groups. For the ranks the proof uses instead an upper bound: for a totally complex field `L`, for `n` large enough, the image of the homology of `GL_n(𝒪_L)` in an odd degree below the number `r₂(L)` of complex places of `L`, under an explicit map, has rank at most `r₂(L)`.

What was checked for each item is that the formal proof's own statement of the theorem is not in the list that Lean produces of the constants on which the main theorems depend; that list contains every one of them. The sentences on what the proof has in the place of a theorem summarise statements on which the main theorems do depend. Where one of these theorems is stated in a general roadmap of the library, it is proved there: a section of the family that is a case of it names it, with the section of the general roadmap that states it, on a `*Corollary of:*` line, and what that line covers is deduced from the general theorem. This list records only that the proof of the Riemann hypothesis for Dirichlet L-functions does not need these theorems in that generality.

## Origin and method of each statement

Every section of a roadmap of the family that states something to prove carries two labels under
its heading.

- `*Origin:*` says where the statement comes from, in one of five forms: `published:`, with the
  source; `adapted from` a published result, with what is changed; `particular to this proof:`, for
  a statement that the formal proof introduces, with the nearest published result where one is
  known; `this roadmap's own formulation:`, for a statement that is neither published nor a
  statement of the formal proof; and `definitions and conventions.`
- `*Method of the formal proof:*` says how the formal proof proves the statement, and for which
  form of it when that proof has a narrower one; it says `none` where the formal proof has no such
  statement.

A section may carry a third line, `*Corollary of:*`, which names a general theorem, the section of a
general roadmap that states it, and the clauses it covers. The general theorem is proved in that
roadmap, and what the line covers is deduced from it. The proof of the Riemann hypothesis for
Dirichlet L-functions needs only that case, not the general theorem in full; the method label says
how the formal proof proves it, and for which form of the statement when that proof has a narrower
one. Each roadmap states these conventions in its own Conventions.

## When a roadmap is wrong

The purpose of this family is to bring the mathematics of the formal Lean proof into Tau Ceti as
library mathematics. That does not mean copying the formal proof. The roadmaps are the plan and they
are followed, as in any other area. A contribution is free, as everywhere in Tau Ceti, to state a
result in greater generality, to arrange it differently and to prove it by another route.

The roadmaps were written from the formal proof, and they may contain mistakes. This section is
about one situation only: a roadmap of this family is demonstrably wrong at some point, in its
`README.md` or its `Suggested.lean` (a statement is false or inconsistent as written, a hypothesis
or a convention does not fit, or a step that the argument needs is missing), and the formal proof
shows what is right.

For those who write and those who review pull requests that carry out these roadmaps:

- In that situation a contribution may correct the statement, or supply the missing step, in a
  form consistent with the formal proof. Its description says what is wrong with the roadmap (the
  reason, or a counterexample) and names the file and declaration of the formal proof that settles
  it. The corrected statement may still be more general than the one in the formal proof.
- A review does not block or delay such a contribution on the ground that it departs from the
  roadmap, or that it proves something the roadmap does not list. What it checks is that the roadmap
  is indeed wrong or incomplete at that point, that the correction agrees with the formal proof
  there (the declaration named exists in the source as published and supports it), and the usual
  standards of the library.
- The roadmap is then corrected. The correction may follow the contribution; it need not come
  first.

This is not a licence to replace a roadmap's statement by the formal proof's wherever the two
differ in form: where the roadmap is right, it is followed. It does not cover a departure that
agrees with neither the roadmap nor the formal proof, and it does not change the roadmaps of other
areas that this family cites.

## The roadmaps

- [**Tensor induction and finite-group inputs**](TensorInductionAndFiniteGroupInputs/README.md):
  tensor induction in prime index, virtual characters of norm one on a coset, the decomposition of
  polynomial functions on matrices under two general linear groups, and identities of minors of the
  Capelli matrix.
- [**Positivity of Dirichlet series with kernels**](PositivityOfDirichletSeriesWithKernels/README.md):
  positivity arguments for Laplace transforms and Dirichlet series with kernels, a windowed form of
  Landau's theorem, Laplace's method with non-vanishing, and stationary phase over the complex
  numbers and over products of p-adic fields.
- [**Statements of the Riemann hypotheses and their consequences**](RiemannHypothesisStatementsAndConsequences/README.md):
  Riesz sums and explicit formulas, the Riemann-hypothesis predicates for Dirichlet characters,
  Dedekind zeta functions and ray-class characters, and their consequences.
- [**Riesz sums over primes and exceptional zeros**](RieszSumsOverPrimesAndExceptionalZeros/README.md):
  Riesz-smoothed sums over primes, exceptional zeros and zero-free boxes, and class numbers.
- [**Quadratic twists selected over primes**](QuadraticTwistSelectionOverPrimes/README.md):
  quadratic twists over primes in a progression, and the selection of auxiliary primes with
  zero-free boxes.
- [**Frobenius-restricted Riesz sums**](FrobeniusRestrictedRieszSums/README.md):
  abelian CM hosts and their Frobenius data, cyclic hosts and the cyclic family of a primitive
  Dirichlet character, tops, thick sets and admissible pairs; Riesz sums restricted by Frobenius,
  and the square-root bound for the cyclic family from the averaged inequality on a host.
- [**Adelic heights and successive minima**](AdelicHeightsAndSuccessiveMinima/README.md):
  adelic heights of vectors and subspaces over every finite extension of a number field; the
  subspace height of a lattice with a frame over a CM field, with its independence of the lattice
  vectors and its invariance under automorphisms of the lattice; and successive minima over number
  fields for balanced bodies.
- [**Orbit measures on adelic groups**](OrbitMeasuresOnAdelicGroups/README.md):
  measures of top forms over local fields and Tamagawa measures on homogeneous spaces of adelic
  groups, the Tamagawa numbers of `G_m`, of groups with a unipotent radical and of quotients by
  central induced tori, and centralisers of elements with separable characteristic polynomial.
- [**Hodge–Tate lattices and Lubin–Tate logarithms**](HodgeTateLatticesAndLubinTateLogarithms/README.md):
  Hodge–Tate lattices and flag sequences with explicit cokernel bounds, and logarithms of Lubin–Tate
  formal group laws with sharp radii.
- [**Wach lattices over the cyclotomic tower**](WachLatticesOverTheCyclotomicTower/README.md):
  Wach lattices and crystalline lattices over the cyclotomic tower, with explicit exponents.
- [**Selmer length bounds and local lifting**](SelmerLengthBoundsAndLocalLifting/README.md):
  Selmer presentations over group rings, length bounds, local theorems at the places above the
  prime with explicit constants, and lifting with loss.
- [**Length bounds in p-adic families**](LengthBoundsInPadicFamilies/README.md):
  length bounds and eigensystems in `p`-adic families.
- [**Reducibility ideals and ultrafilter patching**](ReducibilityIdealsAndUltrafilterPatching/README.md):
  the order of an element on a module over a discrete valuation ring, graded cotangent bounds at
  smooth points, determinantal presentations and their reducibility ideals, and patching with an
  ultrafilter up to an element.
- [**Multiplier ideals of pairs and point separation**](MultiplierIdealsOfPairsAndPointSeparation/README.md):
  discrepancies and klt and lc pairs, multiplier ideals of pairs, Nadel vanishing for pairs,
  isolated non-klt centres, global generation and separation of points for adjoint bundles, Kollár's
  two-point separation, and statements on common zeros of sections of a birational linear system.
- [**Singular Hermitian metrics and L² methods**](SingularHermitianMetricsAndL2Methods/README.md):
  plurisubharmonic functions and Lelong numbers, singular Hermitian metrics, L² estimates and the
  Ohsawa–Takegoshi extension theorem, good metrics along a boundary, multiplier ideals,
  regularisation, and Bergman kernels.
- [**Discrete series coefficients and automorphic metrics**](DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md):
  matrix coefficients of discrete series, Poincaré series and trace-class statements, and invariant
  metrics on automorphic bundles with proportionality.
- [**Hermitian forms and lattices**](HermitianFormsAndLattices/README.md):
  unitary groups and Hermitian forms over quadratic étale algebras with their local and global
  classification; Hermitian lattices, genera and masses, Siegel's main theorem, and Hermitian theta
  series.
- [**Local factors of twists and types**](LocalFactorsOfTwistsAndTypes/README.md):
  local factors and epsilon factors of twists, converse theorems, and smooth representations with
  their types.
- [**Finite reductive groups and the characters of `GL_n(𝔽_q)`**](FiniteReductiveGroups/README.md):
  Harish-Chandra induction and Deligne–Lusztig theory for the general linear groups over finite
  fields, the characters of `GL_n(𝔽_q)`, and Shintani descent for `GL_n` in prime degree.
- [**Base change and Galois representations for unitary groups**](BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md):
  base change and inertial types of depth-zero representations, and the Galois representations
  attached to automorphic representations of definite unitary groups.
- [**Hecke ideals and Taylor–Wiles relations**](HeckeIdealsAndTaylorWilesRelations/README.md):
  Taylor–Wiles relations, Hecke ideals and their stability, and Tate–Shafarevich kernels with
  lattice coefficients.
- [**Bernoulli bounds for class group eigenspaces**](BernoulliBoundsForClassGroupEigenspaces/README.md):
  twisted Tate–Shafarevich groups and their bounds by generalized Bernoulli numbers and by explicit
  torsion bounds for the homology of general linear groups over rings of integers, for étale
  cohomology and for K-groups, and the vanishing of Bloch–Kato groups.
- [**Theta kernels for unitary dual pairs**](ThetaKernelsForUnitaryDualPairs/README.md):
  the Weil representation, splittings and theta kernels for unitary dual pairs, the local theta
  correspondence, convergence and unfolding.
- [**Slopes of Hermitian vector bundles**](SlopesOfHermitianVectorBundles/README.md):
  degrees, maximal and minimal slopes and the Harder–Narasimhan filtration of Hermitian vector
  bundles over rings of integers, Bost's slope inequality, the comparison of slopes with successive
  minima, and a slope inequality for families of maps whose images form a nearly tight frame at one
  archimedean place; also the maximal slopes of lattices of sections of an ample line bundle and an
  explicit arithmetic Hilbert–Samuel inequality.
- [**Chow forms and heights of subvarieties**](ChowFormsAndHeightsOfSubvarieties/README.md):
  the change of metric in arithmetic intersection numbers, the comparison of the Fubini–Study height
  of a projective cycle with the spherical height of its Chow form, and heights of cycles in the
  projective space of a Hermitian vector bundle.
- [**Heights for log-singular metrics**](HeightsForLogSingularMetrics/README.md):
  heights for log-singular metrics, heights on projective spaces and flag varieties, and slopes of
  Lie algebras of abelian schemes.
- [**Projective models and period bounds on Shimura varieties**](ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md):
  seminegativity of Hodge bundles over curves with a growth bound, logarithmic periods over a
  polydisc, conjugate data on a curve and their extension over global models, ampleness of twisted
  Hodge lines, global normal projective models of PEL type with their cubical line bundle, and the
  descent of a linearised line bundle to a quotient by a finite group.
- [**Integral Weyl modules of general linear groups**](IntegralWeylModulesOfGeneralLinearGroups/README.md):
  the integral theory of `GL_N`: the bideterminant basis of the integral dual Weyl module with
  saturation, Weyl and dual Weyl modules below the upper wall of the lowest alcove, the exponent
  comparing their integral forms, integral branching to `GL_{N−1}`, the linkage principle in
  multiset form and a graded Pieri bound, Fischer norms of products of minors, and slopes of Weyl
  and dual Weyl lattices.
- [**Theta lifts for definite unitary groups**](ThetaLiftsForDefiniteUnitaryGroups/README.md):
  one theta lift between definite unitary groups: Weil representations, lifts as operators on class
  sets, weights and Satake parameters, the Rallis inner product formula, nonvanishing, the lift of
  the trivial representation, and complementary spaces.
- [**Theta chains on definite unitary groups**](ThetaChainsOnDefiniteUnitaryGroups/README.md):
  the data of a chain of theta lifts (ranks, scales and size conditions, Hermitian spaces, weights
  and words, Hecke, twisting and splitting characters, the coefficient field, type, auxiliary and
  level primes, level structures and integral forms); the normal form of a step, the chain lift, the
  operators at the level prime, the source lattices and the top period.
- [**Taylor bounds and depths on height-two formal groups**](TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md):
  Gauss norms of power series and quantisation, the biextension cocycle with its weight and
  classification, weighted Taylor bounds in several variables, jet bounds and Gaussian jets; the
  depth of a weight from character flags, and the row datum of an integral chart.
- [**Local gain of theta chains**](LocalGainOfThetaChains/README.md):
  the gain of a step and of the chain lift at a prime inert in the CM field; the local model of the
  Hecke operators, Hecke commutation and refinement, the depth of Hecke images; the gain sublattice,
  the operators at the level prime and the gain inequality.
- [**The row tower and Rallis identities**](RowTowerAndRallisIdentities/README.md):
  rows, the row step and its descent, target rows, Rallis steps and model lifts, the rational
  structure of the grid with its determinant identities, multiplicity comparison and the
  surjectivity of the descent.
- [**Bessel–Poincaré series and Gram bounds**](BesselPoincareSeriesAndGramBounds/README.md):
  Bessel models of discrete series of `U(p, q)`, Bessel–Poincaré series and their expansion, limit
  multiplicity with a uniform error, local kernels, archimedean Gram forms and the tower inequality,
  and their instances for the chain.
- [**The seesaw for theta chains**](SeesawForThetaChains/README.md):
  periods of unitary pairs (unfolding of Fourier–Jacobi periods and the passage between Bessel and
  Fourier–Jacobi periods); the period pairing of the chain, its unfolding, the local laws, the
  seesaw identity and its rationality.
- [**Uniform wild kernel bounds**](UniformWildKernelBounds/README.md):
  bounds, uniform in the field, for the logarithmic total of the groups `Ш¹(F, ℓ, e)` over families
  of host fields, with the windowed form consumed by the congruence modules.
- [**Congruence modules of theta lifts**](CongruenceModulesOfThetaLifts/README.md):
  congruence lengths of a step, Hecke–Galois families on definite unitary groups, lifted
  eigensystems and the local condition at `ℓ`, the congruence module bounded by a Selmer group,
  class groups, wild kernels and local defects, good twists, the total congruence bound, and weight
  elimination modulo `ℓ`.
- [**Arithmetic volumes and integral forms on unitary Shimura varieties**](ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md):
  CM periods and values (the class-mean Chowla–Selberg statement, denominators of CM values, toric
  ratios and Hecke's toric sums); the flat line and slopes under change of weight; arithmetic
  proportionality for flag bundles and the average volume; lattices of forms on deep covers, their
  slopes, and the generation of integral forms by theta series.
- [**The glued target and the division inequality**](GluedTargetAndDivisionInequality/README.md):
  the pairing integral, the divided source and the target glued place by place; heights along the
  chain, the step operator norm, the transported mean CM period, the Rallis eigenvalue and hook
  bound; the theta conditions, the depth table, the slope of the target, the division inequality and
  the cost of the type primes.
- [**Theta chains and Frobenius prime sums**](ThetaChainsAndFrobeniusPrimeSums/README.md):
  slopes of the source lattices, rank matching, the word code and the slope inequality of the chain;
  chain data, the loss bound, the key identity, the Frobenius-restricted inequality and its budget,
  and the windowed bound for the cyclic family of every primitive Dirichlet character.
- [**The generalized Riemann hypothesis from window bounds**](GeneralizedRiemannHypothesisFromWindowBounds/README.md):
  weighted families of characters and their Riesz remainders, Landau's theorem for families and its
  windowed form, window bounds as a form of the generalized Riemann hypothesis, cyclic families, and
  the Riemann hypothesis for Dirichlet L-functions in its standard forms.
